package proinfo.controller;

import java.util.ArrayList;

import proinfo.bean.ProinfoDTO;

public interface ProinfoService {
	
	// 전문 지식 입력
	public int insertProinfo(ProinfoDTO proinfoDTO);

	// 전문 지식 보기
	public ProinfoDTO viewProinfo(int seq);
	
	// 전문 지식 수정
	public int modifyProinfo(ProinfoDTO proinfoDTO);
	
	// 전문 지식 삭제
	public int deleteProinfo(int seq);
	
	// 전문 지식 검색 (검색창)
	public ArrayList<ProinfoDTO> searchList(int startNum, int endNum, String searchOp, String keyword);
	
	// 전문 지식 검색 (카테고리별)
	public ArrayList<ProinfoDTO> search_c(String keyword_c);
	
	// 게시물 개수
	int getTotalS(String searchOp,String keyword);
	
}
