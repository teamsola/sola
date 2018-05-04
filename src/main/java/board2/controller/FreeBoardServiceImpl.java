package board2.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board2.bean.BoarddDTO;
import board2.dao.FreeBoardDAO;

@Service
public class FreeBoardServiceImpl implements BoarddService{
	@Autowired
	FreeBoardDAO freeboardDAO;
	
	@Override
	public int boardDelete(int seq) {
		// TODO Auto-generated method stub
		return freeboardDAO.boardDelete(seq);
	}

	public int boardModify(BoarddDTO boarddDTO) {
		return freeboardDAO.boardModify(boarddDTO);
	}
	
	@Override
	public BoarddDTO boardView(int seq) {
		// TODO Auto-generated method stub
		return freeboardDAO.boardView(seq);
	}

	@Override
	public int boardWrite(BoarddDTO boarddDTO) {
		// TODO Auto-generated method stub
		return freeboardDAO.boardWrite(boarddDTO);
	}

	@Override
	public ArrayList<BoarddDTO> boardList(int startNum, int endNum) {
		// TODO Auto-generated method stub
		return (ArrayList<BoarddDTO>) freeboardDAO.boardList(startNum, endNum);
	}
	@Override
	public ArrayList<BoarddDTO> boardsearchList(int startNum, int endNum, String keyword) {
		// TODO Auto-generated method stub
		return (ArrayList<BoarddDTO>) freeboardDAO.boardsearchList(startNum,endNum,keyword);
	}

	@Override
	public void updateHit(int seq) {
		// TODO Auto-generated method stub
		freeboardDAO.updateHit(seq);
	}

	@Override
	public int getTotalA() {
		// TODO Auto-generated method stub
		return freeboardDAO.getTotalA();
	}

	
	public List<BoarddDTO> selectBoardCommentByCode(int seq) {
		// TODO Auto-generated method stub
		return (List<BoarddDTO>) freeboardDAO.ajax_commentList(seq);
	}
	
	public int addComment(BoarddDTO boarddDTO) {
		return freeboardDAO.addreply(boarddDTO);
	}

	public int deleteComment(BoarddDTO boarddDTO) {
		// TODO Auto-generated method stub
		return freeboardDAO.deletereply(boarddDTO);
	}
	
	public int replycount(BoarddDTO boarddDTO) {
		return freeboardDAO.replycount(boarddDTO);
	}
	public int replymodify(BoarddDTO boarddDTO) {
		return freeboardDAO.replymodify(boarddDTO);
	}

	
	

	
}
