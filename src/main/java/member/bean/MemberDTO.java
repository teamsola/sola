package member.bean;
// 회원관리(로그인 등)
public class MemberDTO
{
	public String id;			// id			
	public String pwd;			// 비밀번호
	public String name;			// 이름(본명)
	public String nickname;		// 별명
	public String gender;		// 성별
	public String tel1;
	public String tel2;
	public String tel3;
	public String email1;
	public String email2;
	public String post;			// 우편번호
	public String addr1;		
	public String addr2;
	public String joinDate;		// 가입일
	public String grade;		// 회원등급
	public int score;			// 활동점수
	public String profile;		// 프로필사진
	
	@Override
	public String toString()
	{
		return "MemberDTO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", nickname=" + nickname + ", gender="
				+ gender + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", email1=" + email1 + ", email2="
				+ email2 + ", post=" + post + ", addr1=" + addr1 + ", addr2=" + addr2 + ", joinDate=" + joinDate
				+ ", grade=" + grade + ", score=" + score + ", profile=" + profile + "]";
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getPwd()
	{
		return pwd;
	}
	public void setPwd(String pwd)
	{
		this.pwd = pwd;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public String getTel1()
	{
		return tel1;
	}
	public void setTel1(String tel1)
	{
		this.tel1 = tel1;
	}
	public String getTel2()
	{
		return tel2;
	}
	public void setTel2(String tel2)
	{
		this.tel2 = tel2;
	}
	public String getTel3()
	{
		return tel3;
	}
	public void setTel3(String tel3)
	{
		this.tel3 = tel3;
	}
	public String getEmail1()
	{
		return email1;
	}
	public void setEmail1(String email1)
	{
		this.email1 = email1;
	}
	public String getEmail2()
	{
		return email2;
	}
	public void setEmail2(String email2)
	{
		this.email2 = email2;
	}
	public String getPost()
	{
		return post;
	}
	public void setPost(String post)
	{
		this.post = post;
	}
	public String getAddr1()
	{
		return addr1;
	}
	public void setAddr1(String addr1)
	{
		this.addr1 = addr1;
	}
	public String getAddr2()
	{
		return addr2;
	}
	public void setAddr2(String addr2)
	{
		this.addr2 = addr2;
	}
	public String getJoinDate()
	{
		return joinDate;
	}
	public void setJoinDate(String joinDate)
	{
		this.joinDate = joinDate;
	}
	public String getGrade()
	{
		return grade;
	}
	public void setGrade(String grade)
	{
		this.grade = grade;
	}
	public int getScore()
	{
		return score;
	}
	public void setScore(int score)
	{
		this.score = score;
	}
	public String getProfile()
	{
		return profile;
	}
	public void setProfile(String profile)
	{
		this.profile = profile;
	}
	
}
