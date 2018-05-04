package board2.controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import board2.bean.BoarddDTO;



public interface BoarddController
{
		public ModelAndView boardList(HttpServletRequest request);
		public ModelAndView boardView(int seq, int pg,HttpServletRequest request);
		public ModelAndView boardWriteForm();
		public ModelAndView boardWrite(BoarddDTO boarddDTO,HttpServletRequest request);
		public ModelAndView boardDelete(int seq);
		public ModelAndView boardModify(BoarddDTO boarddDTO,int pg);
		public ModelAndView boardModifyForm(int seq,int pg);
}
