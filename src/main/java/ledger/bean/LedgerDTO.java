package ledger.bean;

import java.sql.Date;

public class LedgerDTO {
	
	private int seq;			// 시퀀스
	private String id;			// 회원 아이디
	private String inOut;		// 수입-지출 분류
	private String content;		// 내용
	private String contentPlus;	// 추가 내용
	private int income;			// 수입
	private int spand;			// 지출
	private int balance;		// 잔액
	private String category;	// 카테고리 (분류)
	private Date logdate;		// 날짜(선택한/입력한 날 X)
	
	private String stringDate;	// 날짜를 String 으로 변환
	
	
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getInOut() {
		return inOut;
	}
	public void setInOut(String inOut) {
		this.inOut = inOut;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getContentPlus() {
		return contentPlus;
	}
	public void setContentPlus(String contentPlus) {
		this.contentPlus = contentPlus;
	}
	public int getIncome() {
		return income;
	}
	public void setIncome(int income) {
		this.income = income;
	}
	public int getSpand() {
		return spand;
	}
	public void setSpand(int spand) {
		this.spand = spand;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Date getLogdate() {
		return logdate;
	}
	public void setLogdate(Date logdate) {
		this.logdate = logdate;
	}
	public String getStringDate() {
		return stringDate;
	}
	public void setStringDate(String stringDate) {
		this.stringDate = stringDate;
	}
	
}
