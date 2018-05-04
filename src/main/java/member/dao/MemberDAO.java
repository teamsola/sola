package member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import member.bean.MemberDTO;

public class MemberDAO
{
	private SqlSessionTemplate sqlSession;

	public MemberDTO login(String id, String pwd)
	{
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pwd", pwd);

		return sqlSession.selectOne("mybatis.memberMapper.login", map);
	}

	public MemberDAO(SqlSessionTemplate sqlSession)
	{
		this.sqlSession = sqlSession;
	}

	public int join(MemberDTO memberDTO)
	{
		return sqlSession.insert("mybatis.memberMapper.memberJoin", memberDTO);
	}

	public boolean isExistId(String id)
	{
		boolean exist = false;
		if (sqlSession.selectOne("mybatis.memberMapper.isExistId", id) != null)
		{
			exist = true;
		}
		return exist;
	}

	public MemberDTO memberView(String id)
	{
		return sqlSession.selectOne("mybatis.memberMapper.memberView", id);
	}

	public int memberInfoUpdate(MemberDTO memberDTO)
	{
		return sqlSession.update("mybatis.memberMapper.memberInfoUpdate", memberDTO);
	}

	public int memberPwUpdate(MemberDTO memberDTO)
	{
		return sqlSession.update("mybatis.memberMapper.memberPwUpdate", memberDTO);
	}

	public int memberProfileUpdate(MemberDTO memberDTO)
	{
		System.out.println(memberDTO.getId());
		return sqlSession.update("mybatis.memberMapper.memberProfileUpdate", memberDTO);
	}

	public int memberProfileUpdate2(MemberDTO memberDTO)
	{
		return sqlSession.update("mybatis.memberMapper.memberProfileUpdate2", memberDTO);
	}

	public int memberProfileDelete(String id)
	{
		return sqlSession.update("mybatis.memberMapper.memberProfileDelete", id);
	}

	public int memberWithdrawal(String id)
	{
		return sqlSession.delete("mybatis.memberMapper.memberWithdrawal", id);
	}

	public List<MemberDTO> memberList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);		
		return sqlSession.selectList("mybatis.memberMapper.memberList", map);
	}
	
	public List<MemberDTO> searchList(int startNum, int endNum,String searchOp,String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		map.put("searchOp",searchOp);
		map.put("keyword", keyword);
		return sqlSession.selectList("mybatis.memberMapper.searchList", map);
	}
	
	public int getTotalA() {		
		return sqlSession.selectOne("mybatis.memberMapper.getTotalA");
	}
	
	public int getTotalS(String searchOp,String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOp", searchOp);
		map.put("keyword", keyword);
		return sqlSession.selectOne("mybatis.memberMapper.getTotalS", map);
	}
	
	public int memberWd(String id) {
		return sqlSession.delete("mybatis.memberMapper.memberWd",id);
	}

	public List<String> findIdByEmail(String email1, String email2)
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("email1", email1);
		map.put("email2", email2);
		return sqlSession.selectList("mybatis.memberMapper.findIdByEmail", map);
	}
	
	public List<String> findIdByTel(String tel1, String tel2, String tel3)
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("tel1", tel1);
		map.put("tel2", tel2);
		map.put("tel3", tel3);
		return sqlSession.selectList("mybatis.memberMapper.findIdByTel", map);
	}
	
	public String findPw(String email1, String email2)
	{
		Map<String, String> map = new HashMap<String, String>();
		map.put("email1", email1);
		map.put("email2", email2);
		return sqlSession.selectOne("mybatis.memberMapper.findPw", map);
	}
	
	
	public MemberDAO()
	{
	}

}
