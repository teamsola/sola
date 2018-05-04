package board2.bean;

public class BoarddDTO
{
	
	private int seq;			// 일련번호
	private String category;	// 카테고리
	private String id;		// id
	private String nickname;	// 별명
	private String subject;	// 제목
	private String content;	// 내용
	private String file1;		// image uri
	private int re;			// 댓글(답글) 여부 0-default(원글), 1-댓글(답글)
	private int re_lev;		// 원글에 붙은 대댓글 구분용
	private int re_ref;		// 원글 seq
	private int re_seq;		// 원글에 답변이 여러개일 경우 보여줄 순서
	private int hit;			// 조회수
	private String logtime;	// 작성시간
	
	public int getRe_lev() {
		return re_lev;
	}
	public void setRe_lev(int re_lev) { 
		this.re_lev = re_lev;
	}
	
	public int getSeq()
	{
		return seq;
	}
	public void setSeq(int seq)
	{
		this.seq = seq;
	}
	public String getCategory()
	{
		return category;
	}
	public void setCategory(String category)
	{
		this.category = category;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getNickname()
	{
		return nickname;
	}
	public void setNickname(String nickname)
	{
		this.nickname = nickname;
	}
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getLogtime()
	{
		return logtime;
	}
	public void setLogtime(String logtime)
	{
		this.logtime = logtime;
	}
	public String getFile()
	{
		return file1;
	}
	public void setFile(String file1)
	{
		this.file1 = file1;
	}
	public int getRe()
	{
		return re;
	}
	public void setRe(int re)
	{
		this.re = re;
	}
	public int getRe_ref()
	{
		return re_ref;
	}
	public void setRe_ref(int re_ref)
	{
		this.re_ref = re_ref;
	}
	public int getRe_seq()
	{
		return re_seq;
	}
	public void setRe_seq(int re_seq)
	{
		this.re_seq = re_seq;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	@Override
	public String toString() {
		return "BoarddDTO [seq=" + seq + ", category=" + category + ", id=" + id + ", nickname=" + nickname
				+ ", subject=" + subject + ", content=" + content + ", file1=" + file1 + ", re=" + re + ", re_lev="
				+ re_lev + ", re_ref=" + re_ref + ", re_seq=" + re_seq + ", hit=" + hit + ", logtime=" + logtime + "]";
	}
	
}
