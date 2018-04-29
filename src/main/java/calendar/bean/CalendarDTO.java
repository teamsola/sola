package calendar.bean;

public class CalendarDTO {
	private int year;			// 년
	private int month;			// 월
	private int day;			// 일 (지정 검색시)
	private int today;			// 오늘
	private int lastOfDate;		// 마지막날 (해당월)
	private int firstWeek;		// 해당월 1일 요일
	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	public int getToday() {
		return today;
	}
	public void setToday(int today) {
		this.today = today;
	}
	public int getLastOfDate() {
		return lastOfDate;
	}
	public void setLastOfDate(int lastOfDate) {
		this.lastOfDate = lastOfDate;
	}
	public int getFirstWeek() {
		return firstWeek;
	}
	public void setFirstWeek(int firstWeek) {
		this.firstWeek = firstWeek;
	}
	
	
}
