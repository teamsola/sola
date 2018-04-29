package calendar.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import calendar.bean.CalendarDTO;
import calendar.bean.CalendarSet;
import calendar.bean.DateChange;
import ledger.bean.LedgerDTO;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	CalendarSet calendarSet;
	
	@Autowired
	DateChange dateChange;
	
	@Override
	public CalendarDTO daySet(int year, int month, String cmd) {
		return calendarSet.daySet(year, month, cmd);
	}
	
	@Override
	public CalendarDTO today() {
		return calendarSet.today();
	}

	@Override
	public String dateToString(Date logDate) {
		return dateChange.dateToString(logDate);
	}

	@Override
	public java.util.Date stringToUtilDate(String date) {
		return dateChange.stringToUtilDate(date);
	}

	@Override
	public String utilDateToString(java.util.Date utilDate) {
		return dateChange.utilDateToString(utilDate);
	}

	@Override
	public List<LedgerDTO> stringDateSet(List<LedgerDTO> ledgerList) {
		return dateChange.stringDateSet(ledgerList);
	}

	@Override
	public Date stringToSqlDate(String stringDate) {
		return dateChange.stringToSqlDate(stringDate);
	}

	@Override
	public String beforeDate(Date sqlDate) {
		return dateChange.beforeDate(sqlDate);
	}

	@Override
	public String afterDate(Date sqlDate) {
		return dateChange.afterDate(sqlDate);
	}

	@Override
	public String stringDateSet(int year, int month, int day) {
		return dateChange.stringDateSet(year, month, day);
	}
	
	

	
}
