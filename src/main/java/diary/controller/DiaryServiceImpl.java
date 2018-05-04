package diary.controller;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import diary.bean.DiaryDTO;
import diary.dao.DiaryDAO;

@Service
public class DiaryServiceImpl implements DiaryService{
	
	@Autowired
	private DiaryDAO diaryDAO;

	//글 작성
	@Override
	public int diaryWrite(DiaryDTO diaryDTO) {
		return diaryDAO.diaryWrite(diaryDTO);
	}
	
	//글 수정
	@Override
	public int diaryModify(DiaryDTO diaryDTO) {
		return diaryDAO.diaryModify(diaryDTO);
	}
	
	//글 삭제
	@Override
	public int diaryDelete(Date date) {
		return diaryDAO.diaryDelete(date);
	}
	
	//글 불러오기(수정시)
	@Override
	public ArrayList<DiaryDTO> diaryView(Date date) {
		return (ArrayList<DiaryDTO>) diaryDAO.diaryView(date);
	}

	//글 목록 조회
	@Override
	public ArrayList<DiaryDTO> diaryList(String id) {
		return (ArrayList<DiaryDTO>) diaryDAO.diaryList(id);
	}

}
