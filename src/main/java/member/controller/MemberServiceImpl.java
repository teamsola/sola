package member.controller;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class MemberServiceImpl implements MemberService
{
	private MemberDAO memberDAO;

	public String login(String id, String pwd)
	{
		return memberDAO.login(id, pwd);
	}

	public int memberJoin(MemberDTO memberDTO)
	{
		return memberDAO.join(memberDTO);
	}

	public boolean isExistId(String id)
	{
		return memberDAO.isExistId(id);
	}

	public MemberDTO memberView(String id)
	{
		return memberDAO.memberView(id);
	}

	public int memberInfoUpdate(MemberDTO memberDTO)
	{
		return memberDAO.memberInfoUpdate(memberDTO);
	}

	public int memberPwUpdate(MemberDTO memberDTO)
	{
		return memberDAO.memberPwUpdate(memberDTO);
	}

	public int memberProfileUpdate(MemberDTO memberDTO)
	{
		return memberDAO.memberProfileUpdate(memberDTO);
	}

	public int memberProfileUpdate2(MemberDTO memberDTO)
	{
		return memberDAO.memberProfileUpdate2(memberDTO);
	}

	public int memberProfileDelete(String id)
	{
		return memberDAO.memberProfileDelete(id);
	}

	public int memberWithdrawal(String id)
	{
		return memberDAO.memberWithdrawal(id);
	}

	public void setMemberDAO(MemberDAO memberDAO)
	{
		this.memberDAO = memberDAO;
	}

}
