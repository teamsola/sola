package board2.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import board2.bean.BoarddDTO;




@Controller
public class NoticeBoardController implements BoarddController{
	@Autowired
	NoticeBoardServiceImpl noticeBoardServiceImpl;
	
	HttpSession session = null;
	
	@RequestMapping(value="NoticeBoardList.do")
	@Override
	public ModelAndView boardList(HttpServletRequest request) {
		System.out.println("NoticeBoard/NoticeBoardList.do 매서드접속-----");
		
		ModelAndView modelAndView = new ModelAndView();
	
		session=request.getSession();
		String memId = (String) session.getAttribute("memId");
		
		String keyword = request.getParameter("keyword");
		System.out.println("작성한 키워드:"+keyword);
		
		if(keyword!=null) {
			
		System.out.println("검색한 키워드:"+keyword);
		
		int pg=1;
		try {
		 pg=Integer.parseInt(request.getParameter("pg"));
		}catch(Exception e) {}
		
		int endNum=pg*20;
		int startNum=endNum-19;
		
		ArrayList<BoarddDTO> list = noticeBoardServiceImpl.boardsearchList(startNum, endNum, keyword);
		
		int totalA =noticeBoardServiceImpl.getTotalA();
		int totalP =(totalA+19)/20;
		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		
		if(totalP < endPage) endPage = totalP;
		
		modelAndView.addObject("keyword",keyword);
		modelAndView.addObject("memId", memId);
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("pg", pg);
			
		}
		
		else if(keyword==null){
			
		System.out.println("키워드 검색안했음");
		
		int pg=1;
		try {
		 pg=Integer.parseInt(request.getParameter("pg"));
		}catch(Exception e) {}
		
		int endNum=pg*20;
		int startNum=endNum-19;
		
		ArrayList<BoarddDTO> list = noticeBoardServiceImpl.boardList(startNum, endNum);
		
		int totalA =noticeBoardServiceImpl.getTotalA();
		int totalP =(totalA+19)/20;
		
		int startPage = (pg-1)/3*3+1;
		int endPage = startPage + 2;
		
		if(totalP < endPage) endPage = totalP;
		
		modelAndView.addObject("keyword",keyword);
		modelAndView.addObject("memId", memId);
		modelAndView.addObject("list", list);
		modelAndView.addObject("startPage", startPage);
		modelAndView.addObject("endPage", endPage);
		modelAndView.addObject("totalP", totalP);
		modelAndView.addObject("pg", pg);
		}
			
		modelAndView.addObject("content", "/NoticeBoard/NoticeBoardList.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}

	@RequestMapping(value="NoticeBoardView.do")
	@Override
	public ModelAndView boardView(int seq, int pg,HttpServletRequest request) {
		System.out.println("noticeboardview 메서드접속---------");
		session=request.getSession();
		String memId = (String) session.getAttribute("memId");
		BoarddDTO boarddDTO=noticeBoardServiceImpl.boardView(seq);
		noticeBoardServiceImpl.updateHit(seq);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memId", memId);
		modelAndView.addObject("seq", seq);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("boardDTO", boarddDTO);
		modelAndView.addObject("content", "/NoticeBoard/NoticeBoardView.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}

	@RequestMapping(value="NoticeBoardWriteForm.do")
	@Override
	public ModelAndView boardWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("content", "/NoticeBoard/NoticeBoardWriteForm.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}
	
	
	@RequestMapping(value="NoticeBoardWrite.do")
	public ModelAndView boardWrite(BoarddDTO boarddDTO ,HttpServletRequest request) {
		session = request.getSession();
		
		String memId = (String) session.getAttribute("memId");
		String memName = (String) session.getAttribute("memName");
		
		boarddDTO.setId(memId);
		boarddDTO.setNickname(memName);
		
		int su=noticeBoardServiceImpl.boardWrite(boarddDTO);
		
//		 new ModelAndView("redirect:../NoticeBoard/NoticeBoardList.do")
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("su", su);
			modelAndView.addObject("cmd", "write");
			modelAndView.addObject("content", "/NoticeBoard/NoticeBoardMessage.jsp");
			modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}
	

	@RequestMapping(value="NoticeBoardDelete.do")
	@Override
	public ModelAndView boardDelete(int seq) {
		System.out.println("/NoticeBoard/NoticeBoardDelete.do 매서드접속-----");
		int su=noticeBoardServiceImpl.boardDelete(seq);
//		 new ModelAndView("redirect:../NoticeBoard/NoticeBoardList.do")
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.addObject("cmd", "delete");
		modelAndView.addObject("content", "/NoticeBoard/NoticeBoardMessage.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}
	@RequestMapping(value="NoticeBoardModify.do")
	@Override
	public ModelAndView boardModify(BoarddDTO boarddDTO,int pg) {
		int su=noticeBoardServiceImpl.boardModify(boarddDTO);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("seq", boarddDTO.getSeq());
		modelAndView.addObject("pg", pg);
//		modelAndView.setViewName("redirect:../NoticeBoard/NoticeBoardView.do");
		modelAndView.addObject("su", su);
		modelAndView.addObject("cmd", "modify");
		modelAndView.addObject("content", "/NoticeBoard/NoticeBoardMessage.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}

	@RequestMapping(value="NoticeBoardModifyForm.do")
	@Override
	public ModelAndView boardModifyForm(int seq,int pg) {
		BoarddDTO boarddDTO =noticeBoardServiceImpl.boardView(seq);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("boardDTO", boarddDTO);
		modelAndView.addObject("seq", seq);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("content", "/NoticeBoard/NoticeBoardModifyForm.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}

	@RequestMapping(value="NoticeBoardAddComment.do")
	public String noticeaddreply(BoarddDTO boarddDTO , HttpServletRequest request) {
		System.out.println("AddComment 들어옴");
		
		 session=request.getSession();
		 String memName = (String) session.getAttribute("memName");
		 String memId = (String) session.getAttribute("memId");
		 
		 boarddDTO.setId(memId);
		 boarddDTO.setNickname(memName);
			
			int re_seq=0;
			try {
			 re_seq=noticeBoardServiceImpl.replycount(boarddDTO);
			}catch(Exception e) {
			}
		
			boarddDTO.setRe_seq(re_seq+1);
			System.out.println("댓글등록boardDTO.getRe_seq"+boarddDTO.getRe_seq());
			noticeBoardServiceImpl.addComment(boarddDTO);
		return "success";
	}
	
	 @SuppressWarnings({ "rawtypes", "unchecked" })
		@RequestMapping(value="NoticeBoardCommentList.do", produces="application/json; charset=utf8")
		    @ResponseBody
		    public ResponseEntity ajax_commentList(int seq, HttpServletRequest request) throws Exception{
			 	System.out.println("noticeboard 댓글목록");
			 	
		        HttpHeaders responseHeaders = new HttpHeaders();
		        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		        //
		        // 해당 게시물 댓글
		        List<BoarddDTO> commentDTO = noticeBoardServiceImpl.selectBoardCommentByCode(seq);
		        
		        for(int i=0;i<commentDTO.size();i++) {
		        	System.out.println("commentDTO.get("+i+").getRe_ref() : "+commentDTO.get(i).getRe_ref());
		        	System.out.println("commentDTO.get("+i+").getRe_lev() : "+commentDTO.get(i).getRe_lev());
		        	System.out.println("commentDTO.get("+i+").getRe_seq() : "+commentDTO.get(i).getRe_seq());
		        }
		        
		        if(commentDTO.size() > 0){
		            for(int i=0; i<commentDTO.size(); i++){
		                HashMap hm = new HashMap();
		                hm.put("nickname", commentDTO.get(i).getNickname());
		                hm.put("content", commentDTO.get(i).getContent());
		                hm.put("logtime", commentDTO.get(i).getLogtime());
		                hm.put("re_lev", commentDTO.get(i).getRe_lev());
		                hm.put("re_ref", commentDTO.get(i).getRe_ref());
		                hm.put("re_seq",commentDTO.get(i).getRe_seq());
		                hm.put("id",commentDTO.get(i).getId() );
		                
		                
		                hmlist.add(hm);
		            }
		            
		        }
		        for(int i=0;i<hmlist.size();i++) {
		        	System.out.println("hmlist : "+hmlist.get(i));
		        }
		        
		        JSONArray json = new JSONArray(hmlist);        
		        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
		        
		    }
	 @RequestMapping(value="NoticeBoardDeleteComment.do",method=RequestMethod.POST)
	  public String deletereply(HttpServletRequest request, @RequestBody String paramData)throws Exception {
		  System.out.println("deleteComment들어옴");
		  BoarddDTO boarddDTO = new BoarddDTO();
		System.out.println(paramData);
		
		String Test = paramData;

	      JSONArray arr = null ;
	      try {
	             arr = new JSONArray(Test);
	       } catch (JSONException e) {
	           e.printStackTrace();
	       }
	         JSONObject dataObj = (JSONObject) arr.get(0);

//	         System.out.println(dataObj.get("re_ref"));
	         int re_ref =Integer.parseInt(dataObj.get("re_ref").toString());
	         int re_lev =Integer.parseInt(dataObj.get("re_lev").toString());
	         int re_seq =Integer.parseInt(dataObj.get("re_seq").toString());
	         boarddDTO.setRe_ref(re_ref);
	         boarddDTO.setRe_lev(re_lev);
	         boarddDTO.setRe_seq(re_seq);

	         System.out.println("re_lev : "+re_lev);
	         System.out.println("re_ref : "+re_ref);
	         System.out.println("re_seq : "+re_seq);
	         
	         


		
		  noticeBoardServiceImpl.deleteComment(boarddDTO);
		  return "success";
	  }
	  
	  @RequestMapping(value="NoticeBoardModifyComment.do")
		 public String replymodify(BoarddDTO boarddDTO,HttpServletRequest request) {
			 System.out.println("ModifyComment 들어옴");
			 System.out.println("modifycomment boardDTO.getRe_lev값:"+boarddDTO.getRe_lev());
			noticeBoardServiceImpl.replymodify(boarddDTO);
			 
			 return "success";
		 }
}
