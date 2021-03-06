package diary.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import diary.bean.DiaryDTO;

@Controller
public class DiaryController {
	
	@Autowired
	private DiaryService diaryService;
	
	@RequestMapping(value="diaryWrite.do")
	public ModelAndView diaryWrite(HttpServletRequest request) {
		
		System.out.println("--------------");
		System.out.println("일기 작성 처리");
	
		ModelAndView modelAndView=new ModelAndView();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		String diary_date=request.getParameter("result");
		String diary_content=request.getParameter("content");
		
		System.out.println("1:"+diary_date);
		System.out.println("2:"+diary_content);
		
		//Date.valueOf(diary_date);  string으로 받은 날짜 date.sql로 변경
		
		DiaryDTO diaryDTO=new DiaryDTO();
		diaryDTO.setId(id);
		diaryDTO.setDiary_date(Date.valueOf(diary_date));
		diaryDTO.setDiary_content(diary_content);
		
		int su=diaryService.diaryWrite(diaryDTO);
		System.out.println("su:"+su);
		
		modelAndView.addObject("su",su);
		modelAndView.addObject("content","/diary/diaryWrite.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		
		return modelAndView;
	}

	@RequestMapping(value="diaryIndex.do")
	public ModelAndView diaryIndex(HttpServletRequest request) {
		
		ModelAndView modelAndView=new ModelAndView();
		
		System.out.println("--------------");
		System.out.println("인덱스 들어옴");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		ArrayList<DiaryDTO> list=diaryService.diaryList(id);

		System.out.println("모든 데이터 출력");
		for(DiaryDTO data:list) {
		System.out.println("db에 있는 날짜:"+data.getDiary_date());
		}
		
		modelAndView.addObject("list",list);
		//System.out.println(list.get(0).getDiary_content());
		modelAndView.addObject("content","/diary/diaryMain.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="diaryDelete.do")
	public ModelAndView diaryDelete(HttpServletRequest request) {
		
		System.out.println("--------------");
		System.out.println("글삭제처리");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		ModelAndView modelAndView=new ModelAndView();
		
		String diary_date=request.getParameter("diary_date");
		
		int su=diaryService.diaryDelete(Date.valueOf(diary_date));
		
		modelAndView.addObject("su",su);
		modelAndView.addObject("content","/diary/diaryDelete.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		
		return modelAndView;
		
	}
	
	//수정시 기존값 불러오기
	@RequestMapping(value="diaryModifyForm.do")
	public ModelAndView diaryModifyForm(HttpServletRequest request) {
		
		System.out.println("--------------");
		System.out.println("기존값 불러오기 처리");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		ModelAndView modelAndView=new ModelAndView();
		
		String diary_date=request.getParameter("diary_date");
		
		ArrayList<DiaryDTO> list=new ArrayList<DiaryDTO>();
		
		list=diaryService.diaryView(Date.valueOf(diary_date));
	
		DiaryDTO diaryDTO =new DiaryDTO();
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getId().equals(id)) {
				diaryDTO=list.get(i);
			}
		}
		
		int diary_seq=diaryDTO.getDiary_seq();
		
		modelAndView.addObject("diary_seq",diary_seq);
		modelAndView.addObject("diaryDTO",diaryDTO);
		modelAndView.addObject("content","/diary/diaryModifyForm.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		
		return modelAndView;
	}
	
	//수정한내용 db에 저장
	@RequestMapping(value="diaryModify.do")
	public ModelAndView diaryModify(HttpServletRequest request) {
		
		System.out.println("--------------");
		System.out.println("글수정처리");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		String diary_date=request.getParameter("diary_date");
		String diary_content=request.getParameter("diary_content");
		int diary_seq=Integer.parseInt(request.getParameter("diary_seq"));
		System.out.println("seq확인:"+diary_seq);
		
		ModelAndView modelAndView=new ModelAndView();
		
		DiaryDTO diaryDTO=new DiaryDTO();
		diaryDTO.setDiary_seq(diary_seq);
		diaryDTO.setId(id);
		diaryDTO.setDiary_date(Date.valueOf(diary_date));
		diaryDTO.setDiary_content(diary_content);
		
		System.out.println("dto에 넣기 성공");
		
		int su=diaryService.diaryModify(diaryDTO);
		
		modelAndView.addObject("su",su);
		modelAndView.addObject("content","/diary/diaryModify.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		
		
		return modelAndView;
	}
	
	//모아보기
	@RequestMapping(value="diaryList.do")
	public ModelAndView diaryList(HttpServletRequest request) {
	
		System.out.println("--------------");
		System.out.println("모아보기처리");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		ModelAndView modelAndView=new ModelAndView();
		
		
		ArrayList<DiaryDTO> list=diaryService.diaryList(id);
		
		modelAndView.addObject("list",list);
		modelAndView.addObject("content","/diary/diaryList.jsp");
		modelAndView.setViewName("/mainFrame.jsp");
		
		
		return modelAndView;
	}
}