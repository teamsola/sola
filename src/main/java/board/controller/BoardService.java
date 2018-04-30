package board.controller;

import java.util.ArrayList;

import board.bean.BoardDTO;

public interface BoardService
{
	
	//글등록
	int boardWrite(BoardDTO boardDTO);
		
	//글수정
	int boardModify(BoardDTO boardDTO);
		
	//글삭제
	int boardDelete(int board_seq);
		
	//글상세조회
	BoardDTO boardView(int board_seq);
		
	//글목록조회
	ArrayList<BoardDTO> boardList(int startNum,int endNum);
	
	//글목록 키워드검색
	ArrayList<BoardDTO> boardListSearch(String category, String keyword, int startNum, int endNum);
		
	//조회수증가
	void updateHit(int board_seq);
		
	//전체 게시판 글 갯수 조회
	int getTotalA();
		
}
