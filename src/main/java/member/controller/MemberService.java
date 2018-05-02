package member.controller;

import java.util.ArrayList;

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
	public ArrayList<MemberDTO> memberList(int startNum, int endNum);
	public ArrayList<MemberDTO> searchList(int startNum, int endNum, String searchOp, String keyword);
	public int getTotalA();
	public int getTotalS(String searchOp,String keyword);
	public int memberWd(String id);
	public ArrayList<String> findIdByEmail(String email1, String email2);
	public ArrayList<String> findIdByTel(String tel1, String tel2, String tel3);
	public String findPw(String email1, String email2);
}
