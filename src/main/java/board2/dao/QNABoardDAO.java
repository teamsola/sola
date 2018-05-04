package board2.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board2.bean.BoarddDTO;



@Repository
public class QNABoardDAO {
		@Autowired
		private SqlSessionTemplate sqlSession;
		
		public List<BoarddDTO> boardList(int startNum, int endNum) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNum", startNum);
			map.put("endNum", endNum);		
			return sqlSession.selectList("mybatis.boardMapper2.qnaboardList", map);
		}
		public List<BoarddDTO> boardsearchList(int startNum, int endNum, String keyword) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("startNum", startNum+"");
			map.put("endNum", endNum+"");
			map.put("keyword", keyword);
			return sqlSession.selectList("mybatis.boardMapper2.qnaboardsearchlist", map);
		}
		
		public int getTotalA() {		
			return sqlSession.selectOne("mybatis.boardMapper2.qnagetTotalA");
		}
		// 글 상세보기
		public BoarddDTO boardView(int seq) {		
			return sqlSession.selectOne("mybatis.boardMapper2.qnaboardView", seq);
		}	
		// 글 쓰기
		public int boardWrite(BoarddDTO boarddDTO) {		
			return sqlSession.insert("mybatis.boardMapper2.qnaboardWrite", boarddDTO);
		}
		// 조회수 증가
		public void updateHit(int seq) {	
			sqlSession.update("mybatis.boardMapper2.qnaupdateHit", seq);
		}
		// 삭제
		public int boardDelete(int seq) {		
			return sqlSession.delete("mybatis.boardMapper2.qnaboardDelete", seq);
		}
		public int boardModify(BoarddDTO boarddDTO) {
			return sqlSession.update("mybatis.boardMapper2.qnaboardModify", boarddDTO);
		}

		
}
