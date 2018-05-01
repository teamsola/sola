package proinfo.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import proinfo.bean.ProinfoDTO;

@Transactional	// 커넥션을 얻어도 오고, close도 시킴, aop around로 동작함
@Repository
public class ProinfoDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int insertProinfo(ProinfoDTO proinfoDTO) {
		System.out.println("===> SpringMVC-myBatis로 insertProinfo() 기능 처리");
		return sqlSession.insert("mybatis.proinfoMapper.insertProinfo", proinfoDTO);
	}
	
	public ProinfoDTO viewProinfo(int seq) {
		System.out.println("===> SpringMVC-myBatis로 viewProinfo() 기능 처리");
		return sqlSession.selectOne("mybatis.proinfoMapper.viewProinfo", seq);
	}
	
	public int modifyProinfo(ProinfoDTO proinfoDTO) {
		System.out.println("===> SpringMVC-myBatis로 modifyProinfo() 기능 처리");
		return sqlSession.update("mybatis.proinfoMapper.modifyProinfo", proinfoDTO);
	}
	
	public int deleteProinfo(int seq) {
		System.out.println("===> SpringMVC-myBatis로 deleteProinfo() 기능 처리");
		return sqlSession.delete("mybatis.proinfoMapper.deleteProinfo", seq);
	}
	
	public List<ProinfoDTO> searchList(String searchOp,String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOp",searchOp);
		map.put("keyword", keyword);
		System.out.println("===> SpringMVC-myBatis로 searchList() 기능 처리");
		return sqlSession.selectList("mybatis.proinfoMapper.searchProinfo", map);
	}
	
	public List<ProinfoDTO> search_c(String keyword_c) {
		System.out.println("===> SpringMVC-myBatis로 search_c() 기능 처리");
		return sqlSession.selectList("mybatis.proinfoMapper.search_cProinfo", keyword_c);
	}
	
	public int getTotalS(String searchOp,String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOp", searchOp);
		map.put("keyword", keyword);
		System.out.println("===> SpringMVC-myBatis로 getTotalS() 기능 처리");
		return sqlSession.selectOne("mybatis.proinfoMapper.getTotalSProinfo", map);
	}
	
}
