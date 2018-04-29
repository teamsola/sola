package board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board.bean.BoardDTO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//글등록
	public int boardWrite(BoardDTO boardDTO) {
		return sqlSession.insert("mybatis.boardMapper.boardWrite",boardDTO);
	}


	public List<BoardDTO> boardList(int startNum, int endNum){
		
		Map<String, Integer> map=new HashMap<String,Integer>();
		map.put("startNum",startNum);
		map.put("endNum",endNum);
		
		return sqlSession.selectList("mybatis.boardMapper.boardList",map);
		
	}
	
	public BoardDTO boardView(int board_seq) {
		return sqlSession.selectOne("mybatis.boardMapper.boardView",board_seq);
	}
	
	public void updateHit(int board_seq) {
		sqlSession.update("mybatis.boardMapper.updateHit",board_seq);
	}
	
	public int getTotalA() {	
		return sqlSession.selectOne("mybatis.boardMapper.getTotalA");
	}
	
	public int boardDelete(int board_seq) {
		return sqlSession.delete("mybatis.boardMapper.boardDelete",board_seq);
	}
	
	public int boardModify(BoardDTO boardDTO) {
		return sqlSession.update("mybatis.boardMapper.boardModify",boardDTO);
	}
	
}
