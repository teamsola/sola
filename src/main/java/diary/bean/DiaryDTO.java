package diary.bean;

import java.sql.Date;

public class DiaryDTO {

	public int diary_seq;
	public String id;
	public Date diary_date;
	public String diary_content;
	
	public int getDiary_seq() {
		return diary_seq;
	}
	public void setDiary_seq(int diary_seq) {
		this.diary_seq = diary_seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getDiary_date() {
		return diary_date;
	}
	public void setDiary_date(Date diary_date) {
		this.diary_date = diary_date;
	}
	public String getDiary_content() {
		return diary_content;
	}
	public void setDiary_content(String diary_content) {
		this.diary_content = diary_content;
	}

}
