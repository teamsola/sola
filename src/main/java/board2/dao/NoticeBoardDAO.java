package board2.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board2.bean.BoarddDTO;


@Repository
public class NoticeBoardDAO {
		@Autowired
		private SqlSessionTemplate sqlSession;
		
		public List<BoarddDTO> boardList(int startNum, int endNum) {
			Map<String, Integer> map = new HashMap<String, Integer>();
			map.put("startNum", startNum);
			map.put("endNum", endNum);		
			return sqlSession.selectList("mybatis.boardMapper2.noticeboardList", map);
		}
		
		public int getTotalA() {		
			return sqlSession.selectOne("mybatis.boardMapper2.noticegetTotalA");
		}
		// 글 상세보기
		public BoarddDTO boardView(int seq) {		
			return sqlSession.selectOne("mybatis.boardMapper2.noticeboardView", seq);
		}	
		// 글 쓰기
		public int boardWrite(BoarddDTO boarddDTO) {		
			return sqlSession.insert("mybatis.boardMapper2.noticeboardWrite", boarddDTO);
		}
		// 조회수 증가
		public void updateHit(int seq) {	
			sqlSession.update("mybatis.boardMapper2.noticeupdateHit", seq);
		}
		// 삭제
		public int boardDelete(int seq) {		
			return sqlSession.delete("mybatis.boardMapper2.noticeboardDelete", seq);
		}

		public int replycount(BoarddDTO boarddDTO) {
			// TODO Auto-generated method stub
			return sqlSession.selectOne("mybatis.boardMapper2.noticereplycount", boarddDTO);
		}

		public int addreply(BoarddDTO boarddDTO) {
			// TODO Auto-generated method stub
			return sqlSession.insert("mybatis.boardMapper2.noticeboardaddreply",boarddDTO);
		}
		public List<BoarddDTO> ajax_commentList(int seq) {
			return sqlSession.selectList("mybatis.boardMapper2.noticeboardajax_commentList",seq );
		}
		
		public int boardModify(BoarddDTO boarddDTO) {
			return sqlSession.update("mybatis.boardMapper2.noticeboardModify", boarddDTO);
		}
		public int deletereply(BoarddDTO boarddDTO) {
			// TODO Auto-generated method stub
			return sqlSession.delete("mybatis.boardMapper2.noticeboarddeletereply",boarddDTO);
		}
		public int replymodify(BoarddDTO boarddDTO) {
			return sqlSession.update("mybatis.boardMapper2.noticeboardmodifyreply", boarddDTO);
		}

		public List<BoarddDTO> boardsearchList(int startNum, int endNum, String keyword) {
			
			Map<String, String> map = new HashMap<String, String>();
			map.put("startNum", startNum+"");
			map.put("endNum", endNum+"");	
			map.put("keyword", keyword);
			return sqlSession.selectList("mybatis.boardMapper2.noticeboardsearchlist",map);
		}
		
}