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
public class FreeBoardController implements BoarddController{
	@Autowired
	private FreeBoardServiceImpl freeBoardServiceImpl;

	HttpSession session = null;
	
	@RequestMapping(value="board.do")
	public ModelAndView boardmain() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("content", "/boardMain/square.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="FreeBoardList.do")
	@Override
	public ModelAndView boardList(HttpServletRequest request) {
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
		
		ArrayList<BoarddDTO> list = freeBoardServiceImpl.boardsearchList(startNum, endNum, keyword);
		
		int totalA =freeBoardServiceImpl.getTotalA();
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
		
		ArrayList<BoarddDTO> list = freeBoardServiceImpl.boardList(startNum, endNum);
		
		int totalA =freeBoardServiceImpl.getTotalA();
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
			
		modelAndView.addObject("content", "/FreeBoard/FreeBoardList.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}

	@Override
	@RequestMapping(value="FreeBoardView.do")
	public ModelAndView boardView(int seq, int pg,HttpServletRequest request) {
		BoarddDTO boarddDTO=freeBoardServiceImpl.boardView(seq);
		session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		System.out.println("view.do에서 세션 아이디값확인:"+memId);
		freeBoardServiceImpl.updateHit(seq);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memId", memId);
		modelAndView.addObject("seq", seq);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("boardDTO", boarddDTO);
		modelAndView.addObject("content","/FreeBoard/FreeBoardView.jsp" );
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}

	@RequestMapping(value="FreeBoardWriteForm.do")
	@Override
	public ModelAndView boardWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("content", "/FreeBoard/FreeBoardWriteForm.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}

	@RequestMapping(value="FreeBoardWrite.do")
	@Override
	public ModelAndView boardWrite(BoarddDTO boarddDTO,HttpServletRequest request) {
			session = request.getSession();
			
			String memId = (String) session.getAttribute("memId");
			String memName = (String) session.getAttribute("memName");
			
			boarddDTO.setId(memId);
			boarddDTO.setNickname(memName);
			int su=freeBoardServiceImpl.boardWrite(boarddDTO);
//			redirect:../FreeBoard/FreeBoardList.do
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("su", su);
			modelAndView.addObject("cmd", "write");
			modelAndView.addObject("content", "/FreeBoard/FreeBoardMessage.jsp");
			modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}

	@RequestMapping(value="FreeBoardDelete.do")
	@Override
	public ModelAndView boardDelete(int seq) {
		int su=freeBoardServiceImpl.boardDelete(seq);
//			new ModelAndView("redirect:../FreeBoard/FreeBoardList.do")
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.addObject("cmd", "delete");
		modelAndView.addObject("content", "/FreeBoard/FreeBoardMessage.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}

	@RequestMapping(value="FreeBoardModify.do")
	@Override
	public ModelAndView boardModify(BoarddDTO boarddDTO,int pg) {
		System.out.println("modify.do의 boarddDTO.toString()"+boarddDTO.toString());
		int su=freeBoardServiceImpl.boardModify(boarddDTO);
		
		ModelAndView modelAndView = new ModelAndView();

		modelAndView.addObject("seq", boarddDTO.getSeq());
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("su", su);
		modelAndView.addObject("cmd", "modify");
		modelAndView.addObject("content","/FreeBoard/FreeBoardMessage.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}

	@RequestMapping(value="FreeBoardModifyForm.do")
	@Override
	public ModelAndView boardModifyForm(int seq,int pg) {
		BoarddDTO boarddDTO =freeBoardServiceImpl.boardView(seq);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("boardDTO", boarddDTO);
		modelAndView.addObject("seq", seq);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("content", "/FreeBoard/FreeBoardModifyForm.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}
	 
	 
	 @RequestMapping(value="FreeBoardAddComment.do")
	 public String addreply(BoarddDTO boarddDTO,HttpServletRequest request) {
	
		 session=request.getSession();
		 String memName = (String) session.getAttribute("memName");
		 String memId = (String) session.getAttribute("memId");
		 
		 boarddDTO.setId(memId);
		 boarddDTO.setNickname(memName);
		 int re_seq=0;
		 try {
		  re_seq =freeBoardServiceImpl.replycount(boarddDTO);
		 }catch(Exception e) { 
		 }
	
		boarddDTO.setRe_seq(re_seq+1);
		freeBoardServiceImpl.addComment(boarddDTO);
		 return "success";
	 }
	 
	  @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="FreeBoardCommentList.do", produces="application/json; charset=utf8")
	    @ResponseBody
	    public ResponseEntity ajax_commentList(int seq, HttpServletRequest request) throws Exception{
		 	System.out.println("/FreeBoard/FreeBoardCommentList.do들어옴");
		 	
	        HttpHeaders responseHeaders = new HttpHeaders();
	        ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
	        
	       
	        List<BoarddDTO> commentDTO = freeBoardServiceImpl.selectBoardCommentByCode(seq);
	        
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
	                hm.put("id", commentDTO.get(i).getId());
	                
	                
	                hmlist.add(hm);
	            }
	            
	        }
	        
	        for(int i=0;i<hmlist.size();i++) {
	        	System.out.println("hmlist : "+hmlist.get(i));
	        }
	        
	        JSONArray json = new JSONArray(hmlist);  
	        System.out.println("json : "+json);
	        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
	        
	    }
	  
	  @RequestMapping(value="FreeBoardDeleteComment.do",method=RequestMethod.POST)
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
	         
		  freeBoardServiceImpl.deleteComment(boarddDTO);
		  return "success";
	  }
	  
	  @RequestMapping(value="FreeBoardModifyComment.do")
		 public String replymodify(BoarddDTO boarddDTO,HttpServletRequest request) {
		  System.out.println("lev : "+boarddDTO.getRe_lev());
		  System.out.println("ref : "+boarddDTO.getRe_ref());
		  System.out.println("seq : "+boarddDTO.getRe_seq());
		  
		  System.out.println("re-content : "+request.getParameter("modifycontent"));
		  System.out.println("content : "+boarddDTO.getContent());
			 System.out.println("ModifyComment 들어옴");
			 System.out.println("modifycomment boardDTO.getRe_lev값:"+boarddDTO.getRe_lev());
			freeBoardServiceImpl.replymodify(boarddDTO);
			 
			 return "success";
		 }
}
