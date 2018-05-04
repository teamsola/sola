package board2.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import board2.bean.BoarddDTO;
import board2.dao.NoticeBoardDAO;



@Service
public class NoticeBoardServiceImpl implements BoarddService{
@Autowired
NoticeBoardDAO noticeboardDAO;
	
	@Override
	public int boardDelete(int seq) {
		return noticeboardDAO.boardDelete(seq);
	}

	@Override
	public BoarddDTO boardView(int seq) {
		return noticeboardDAO.boardView(seq);
	}

	@Override
	public int boardWrite(BoarddDTO boarddDTO) {
		return noticeboardDAO.boardWrite(boarddDTO);
	}

	@Override
	public ArrayList<BoarddDTO> boardList(int startNum, int endNum) {
		return (ArrayList<BoarddDTO>)noticeboardDAO.boardList(startNum, endNum);
	}
	@Override
	public ArrayList<BoarddDTO> boardsearchList(int startNum, int endNum, String keyword) {
		// TODO Auto-generated method stub
		return (ArrayList<BoarddDTO>) noticeboardDAO.boardsearchList(startNum,endNum,keyword);
	}
	
	@Override
	public void updateHit(int seq) {
		noticeboardDAO.updateHit(seq);
	}

	@Override
	public int getTotalA() {
		return noticeboardDAO.getTotalA();
	}

	public int replycount(BoarddDTO boarddDTO) {
		// TODO Auto-generated method stub
		return noticeboardDAO.replycount(boarddDTO);
	}
	
	public int addComment(BoarddDTO boarddDTO) {
		return noticeboardDAO.addreply(boarddDTO);
	}
	
	public List<BoarddDTO> selectBoardCommentByCode(int seq) {
		// TODO Auto-generated method stub
		return (List<BoarddDTO>) noticeboardDAO.ajax_commentList(seq);
	}
	
	public int boardModify(BoarddDTO boarddDTO) {
		return noticeboardDAO.boardModify(boarddDTO);
	}
	public int replymodify(BoarddDTO boarddDTO) {
		return noticeboardDAO.replymodify(boarddDTO);
	}
	public int deleteComment(BoarddDTO boarddDTO) {
		// TODO Auto-generated method stub
		return noticeboardDAO.deletereply(boarddDTO);
	}

	
}
