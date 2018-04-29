package proinfo.bean;

// 전문지식 DTO
public class ProinfoDTO {
	private int seq;		// seq
	private String category;// 카테고리(전, 중, 후)
	private String subject;	// 글 제목
	private String contents;// 글 내용
	private String imgFile;	// 글 이미지
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getImgFile() {
		return imgFile;
	}
	public void setImgFile(String imgFile) {
		this.imgFile = imgFile;
	}
	
}
