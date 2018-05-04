package board2.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import board2.bean.BoarddDTO;
import board2.dao.QNABoardDAO;



@Service
public class QnABoardServiceImpl implements BoarddService{
	@Autowired
	QNABoardDAO qnaboardDAO;
	
	@Override
	public int boardDelete(int seq) {
		// TODO Auto-generated method stub
		return qnaboardDAO.boardDelete(seq);
	}

	@Override
	public BoarddDTO boardView(int seq) {
		
		return qnaboardDAO.boardView(seq);
	}

	@Override
	public int boardWrite(BoarddDTO boarddDTO) {
		// TODO Auto-generated method stub
		return qnaboardDAO.boardWrite(boarddDTO);
	}

	@Override
	public ArrayList<BoarddDTO> boardList(int startNum, int endNum) {
		// TODO Auto-generated method stub
		return (ArrayList<BoarddDTO>) qnaboardDAO.boardList(startNum, endNum);
	}
	
	@Override
	public ArrayList<BoarddDTO> boardsearchList(int startNum, int endNum, String keyword) {
		// TODO Auto-generated method stub
		return (ArrayList<BoarddDTO>) qnaboardDAO.boardsearchList(startNum,endNum,keyword);
	}

	@Override
	public void updateHit(int seq) {
		// TODO Auto-generated method stub
		qnaboardDAO.updateHit(seq);
	}

	@Override
	public int getTotalA() {
		// TODO Auto-generated method stub
		return qnaboardDAO.getTotalA();
	}
	
	public int boardModify(BoarddDTO boarddDTO) {
		return qnaboardDAO.boardModify(boarddDTO);
	}

	

}
