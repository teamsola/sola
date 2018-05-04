package board2.controller;

import java.util.ArrayList;

import board2.bean.BoarddDTO;



public interface BoarddService
{
	public int boardDelete(int seq);
	public BoarddDTO boardView(int seq);
	public int boardWrite(BoarddDTO boarddDTO);
	public ArrayList<BoarddDTO> boardList(int startNum, int endNum);
	public void updateHit(int seq);
	public int getTotalA();
	public ArrayList<BoarddDTO> boardsearchList(int startNum, int endNum,String keyword);
}
