package diary.controller;

import java.sql.Date;
import java.util.ArrayList;

import diary.bean.DiaryDTO;

public interface DiaryService {

	//글 등록
	int diaryWrite(DiaryDTO diaryDTO);
	
	//글 수정
	int diaryModify(DiaryDTO diaryDTO);
	
	//글 삭제
	int diaryDelete(Date date);
	
	//글 상세조회(수정시)
	ArrayList<DiaryDTO> diaryView(Date date);
	
	//글 목록 조회
	ArrayList<DiaryDTO> diaryList(String id);

	
}
