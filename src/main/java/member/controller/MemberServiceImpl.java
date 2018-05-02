package member.controller;

import java.util.ArrayList;

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
	
	public ArrayList<MemberDTO> memberList(int startNum, int endNum){
		return (ArrayList<MemberDTO>)memberDAO.memberList(startNum, endNum);
	}
	
	public ArrayList<MemberDTO> searchList(int startNum, int endNum, String searchOp, String keyword){
		return (ArrayList<MemberDTO>)memberDAO.searchList(startNum, endNum, searchOp, keyword);
	}
	
	public int getTotalA() {
		return memberDAO.getTotalA();
	}
	
	public int getTotalS(String searchOp,String keyword) {
		return memberDAO.getTotalS(searchOp,keyword);
	}
	
	public int memberWd(String id) {
		return memberDAO.memberWd(id);
	}

	public ArrayList<String> findIdByEmail(String email1, String email2)
	{
		return (ArrayList<String>)memberDAO.findIdByEmail(email1, email2);
	}

	public ArrayList<String> findIdByTel(String tel1, String tel2, String tel3)
	{
		return (ArrayList<String>)memberDAO.findIdByTel(tel1, tel2, tel3);
	}

	public String findPw(String email1, String email2)
	{
		return memberDAO.findPw(email1, email2);
	}
	
	

}
