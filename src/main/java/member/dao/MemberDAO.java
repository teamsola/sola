package member.dao;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import member.bean.MemberDTO;

public class MemberDAO
{
	private SqlSessionTemplate sqlSession;

	public String login(String id, String pwd)
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

	public MemberDAO()
	{
	}

}
