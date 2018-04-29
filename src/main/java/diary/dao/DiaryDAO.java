package diary.dao;

import java.sql.Date;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import diary.bean.DiaryDTO;

@Repository
public class DiaryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//글등록
	public int diaryWrite(DiaryDTO diaryDTO) {
		return sqlSession.insert("mybatis.diaryMapper.diaryWrite",diaryDTO);
	}

	//글목록
	public List<DiaryDTO> diaryList(String id){
		return sqlSession.selectList("mybatis.diaryMapper.diaryList",id);
	}
	
	//글 불러오기(수정시)
	public DiaryDTO diaryView(Date date) {
		return sqlSession.selectOne("mybatis.diaryMapper.diaryView",date);
	}
	
	//글 삭제
	public int diaryDelete(Date date) {
		return sqlSession.delete("mybatis.diaryMapper.diaryDelete",date);
	}
	
	//글 수정
	public int diaryModify(DiaryDTO diaryDTO) {
		return sqlSession.update("mybatis.diaryMapper.diaryModify",diaryDTO);
	}
}
