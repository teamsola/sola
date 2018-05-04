package board2.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board2.bean.BoarddDTO;



@Repository
public class FreeBoardDAO {
		@Autowired
		private SqlSessionTemplate sqlSession;
		
		public List<BoarddDTO> boardList(int startNum, int endNum) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNum", startNum);
			map.put("endNum", endNum);		
			return sqlSession.selectList("mybatis.boardMapper2.freeboardList", map);
		}
		public List<BoarddDTO> boardsearchList(int startNum, int endNum, String keyword) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("startNum", startNum+"");
			map.put("endNum", endNum+"");
			map.put("keyword", keyword);
			
			return sqlSession.selectList("mybatis.boardMapper2.freeboardsearchlist", map);
		}
		
		public int getTotalA() {		
			return sqlSession.selectOne("mybatis.boardMapper2.freegetTotalA");
		}
		// 글 상세보기
		public BoarddDTO boardView(int seq) {		
			return sqlSession.selectOne("mybatis.boardMapper2.freeboardView", seq);
		}	
		// 글 쓰기
		public int boardWrite(BoarddDTO boarddDTO) {		
			return sqlSession.insert("mybatis.boardMapper2.freeboardWrite", boarddDTO);
		}
		// 조회수 증가
		public void updateHit(int seq) {	
			sqlSession.update("mybatis.boardMapper2.freeupdateHit", seq);
		}
		// 삭제
		public int boardDelete(int seq) {		
			return sqlSession.delete("mybatis.boardMapper2.freeboardDelete", seq);
		}
		public int boardModify(BoarddDTO boarddDTO) {
			return sqlSession.update("mybatis.boardMapper2.freeboardModify", boarddDTO);
		}
		public int addreply(BoarddDTO boarddDTO) {
			return sqlSession.insert("mybatis.boardMapper2.freeboardaddreply", boarddDTO);
		}
		
		public List<BoarddDTO> ajax_commentList(int seq) {
			return sqlSession.selectList("mybatis.boardMapper2.freeboardajax_commentList",seq );
		}

		public int deletereply(BoarddDTO boarddDTO) {
			// TODO Auto-generated method stub
			return sqlSession.delete("mybatis.boardMapper2.freeboarddeletereply",boarddDTO);
		}
		
		public	int replycount(BoarddDTO boarddDTO) {
			return sqlSession.selectOne("mybatis.boardMapper2.freereplycount", boarddDTO);
		}
		
		public int replymodify(BoarddDTO boarddDTO) {
			return sqlSession.update("mybatis.boardMapper2.freeboardmodifyreply", boarddDTO);
		}

		
		
	}
