package calendar.controller;

import java.sql.Date;
import java.util.List;

import calendar.bean.CalendarDTO;
import ledger.bean.LedgerDTO;


public interface CalendarService {
	// 해당일 설정
	public CalendarDTO daySet(int year, int month, String cmd);

	// 오늘기준 년/월/일 가져오기
	public CalendarDTO today();

	// Date(sql) -> String 변환
	public String dateToString(Date logDate);

	// String -> Date(util) 변환
	public java.util.Date stringToUtilDate(String date);

	// Date(util) -> String 변환
	public String utilDateToString(java.util.Date utilDate);

	// LedgerDTO stringDate 셋팅 (Date(sql) -> String)
	public List<LedgerDTO> stringDateSet(List<LedgerDTO> ledgerList);

	// String -> Date(sql)
	public java.sql.Date stringToSqlDate(String stringDate);

	// Date(sql) -> String (하루 전)
	public String beforeDate(Date sqlDate);

	// Date(sql) -> String (하루 후)
	public String afterDate(Date sqlDate);

	// 날짜 조합 (year+month+day) -> String
	public String stringDateSet(int year, int month, int day);
}
