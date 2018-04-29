package member.controller;

import member.bean.MemberDTO;

public interface MemberService
{
	public String login(String id, String pwd);
	public int memberJoin(MemberDTO memberDTO);
	public boolean isExistId(String id);
	public MemberDTO memberView(String id);
	public int memberInfoUpdate(MemberDTO memberDTO);
	public int memberPwUpdate(MemberDTO memberDTO);
	public int memberProfileUpdate(MemberDTO memberDTO);
	public int memberProfileUpdate2(MemberDTO memberDTO);
	public int memberProfileDelete(String id);
	public int memberWithdrawal(String id);
}
