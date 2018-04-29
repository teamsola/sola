package mall.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mall.bean.MallDTO;

@Repository
public class MallDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//등록
	public int mallInsert(MallDTO mallDTO) {
		return sqlSession.insert("mybatis.mallMapper.mallInsert",mallDTO);
	}
	
	//원본 불러오기(수정시)
	public MallDTO mallView(int mall_seq) {
		return sqlSession.selectOne("mybatis.mallMapper.mallView",mall_seq);
	}
	
	//수정
	public int mallUpdate(MallDTO mallDTO) {
		return sqlSession.update("mybatis.mallMapper.mallUpdate",mallDTO);
	}
	
	//삭제
	public int mallDelete(int mall_seq) {
		return sqlSession.delete("mybatis.mallMapper.mallDelete",mall_seq);
	}
	
	//글 목록
	public List<MallDTO> mallList(){
		return sqlSession.selectList("mybatis.mallMapper.mallList");
	}

}
