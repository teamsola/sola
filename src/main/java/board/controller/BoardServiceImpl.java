package board.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDAO boardDAO;
	
	//글등록
	@Override
	public int boardWrite(BoardDTO boardDTO) {
		return boardDAO.boardWrite(boardDTO);
	}

	//글수정
	@Override
	public int boardModify(BoardDTO boardDTO) {
		return boardDAO.boardModify(boardDTO);
	}

	//글삭제
	@Override
	public int boardDelete(int board_seq) {
		return boardDAO.boardDelete(board_seq);
	}

	//글상세보기
	@Override
	public BoardDTO boardView(int board_seq) {
		return boardDAO.boardView(board_seq);
	}

	//글목록보기
	@Override
	public ArrayList<BoardDTO> boardList(int startNum, int endNum) {
		return (ArrayList<BoardDTO>) boardDAO.boardList(startNum, endNum);
	}

	//조회수
	@Override
	public void updateHit(int board_seq) {
		boardDAO.updateHit(board_seq);
	}

	//총 게시글 수
	@Override
	public int getTotalA() {
		return boardDAO.getTotalA();
	}

}
