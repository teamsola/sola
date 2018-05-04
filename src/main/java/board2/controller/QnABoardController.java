package board2.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import board2.bean.BoarddDTO;



@Controller
public class QnABoardController implements BoarddController{
	@Autowired
	private QnABoardServiceImpl qnaBoardServiceImpl;
	
	HttpSession session;
	
	@RequestMapping(value="QnABoardList.do")
	@Override
	public ModelAndView boardList(HttpServletRequest request) {
		System.out.println("qnaboardlist 들어옴");
		
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
		
		ArrayList<BoarddDTO> list = qnaBoardServiceImpl.boardsearchList(startNum, endNum, keyword);
		
		int totalA =qnaBoardServiceImpl.getTotalA();
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
		
		ArrayList<BoarddDTO> list = qnaBoardServiceImpl.boardList(startNum, endNum);
		
		int totalA =qnaBoardServiceImpl.getTotalA();
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
			
		modelAndView.addObject("content", "/QnABoard/QnABoardList.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}

	@RequestMapping(value="QnABoardView.do")
	@Override
	public ModelAndView boardView(int seq, int pg,HttpServletRequest request) {
		System.out.println("QnA 보드 뷰로 이동");
		session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		String memNick= (String) session.getAttribute("memNick");
		
		BoarddDTO boarddDTO=qnaBoardServiceImpl.boardView(seq);
		qnaBoardServiceImpl.updateHit(seq);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("memId", memId);
		modelAndView.addObject("memNick", memNick);
		modelAndView.addObject("boardDTO", boarddDTO);
		modelAndView.addObject("seq", seq);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("content", "/QnABoard/QnABoardView.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}

	@RequestMapping(value="QnABoardWriteForm.do")
	@Override
	public ModelAndView boardWriteForm() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("content", "/QnABoard/QnABoardWriteForm.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}
	@RequestMapping(value="QnABoardWrite.do")
	@Override
	public ModelAndView boardWrite(BoarddDTO boarddDTO,HttpServletRequest request) {
	
		session = request.getSession();
		
		String memId = (String) session.getAttribute("memId");
		String memName = (String) session.getAttribute("memName");
		
		boarddDTO.setId(memId);
		boarddDTO.setNickname(memName);
		
		int su=qnaBoardServiceImpl.boardWrite(boarddDTO);
//		new ModelAndView("redirect:../QnABoard/QnABoardList.do")
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("su", su);
		modelAndView.addObject("cmd", "write");
		modelAndView.addObject("content", "/QnABoard/QnABoardMessage.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}
	@RequestMapping(value="QnABoardDelete.do")
	@Override
	public ModelAndView boardDelete(int seq) {
		int su=qnaBoardServiceImpl.boardDelete(seq);
//		 new ModelAndView("redirect:../QnABoard/QnABoardList.do");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("cmd", "delete");
		modelAndView.addObject("su", su);
		modelAndView.addObject("content", "/QnABoardMessage.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}

	@RequestMapping(value="QnABoardModify.do")
	@Override
	public ModelAndView boardModify(BoarddDTO boarddDTO,int pg) {
		int su=qnaBoardServiceImpl.boardModify(boarddDTO);
		System.out.println("qnaboard수정완료");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("seq", boarddDTO.getSeq());
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("su", su);
		modelAndView.addObject("cmd", "modify");
		modelAndView.addObject("content", "/QnABoardMessage.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
//		modelAndView.setViewName("redirect:../QnABoard/QnABoardView.do");
		return modelAndView;
	}
	@RequestMapping(value="QnABoardModifyForm.do")
	@Override
	public ModelAndView boardModifyForm(int seq,int pg) {
		BoarddDTO boarddDTO =qnaBoardServiceImpl.boardView(seq);
		System.out.println("qnaboardmodifyform들어옴");
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("boardDTO", boarddDTO);
		modelAndView.addObject("seq", seq);
		modelAndView.addObject("pg", pg);
		modelAndView.addObject("content", "/QnABoard/QnABoardModifyForm.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		return modelAndView;
	}

}
