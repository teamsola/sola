package calendar.bean;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import org.springframework.stereotype.Service;

import ledger.bean.LedgerDTO;

@Service
public class DateChange {

	// Date(sql) -> String 
	public String dateToString(Date SqlDate) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(SqlDate);
	}

	// Date(sql) -> String (LedgerDTO stringDate 셋팅용)
	public List<LedgerDTO> stringDateSet(List<LedgerDTO> ledgerList){
		for(int i=0;i<ledgerList.size();i++) {
			ledgerList.get(i).setStringDate(
					dateToString(ledgerList.get(i).getLogdate()));
		}
		return ledgerList;
	}

	// Date(util) -> String
	public String utilDateToString(java.util.Date utilDate) {
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(utilDate);
	}



	// String -> Date(util)
	public java.util.Date stringToUtilDate(String stringDate) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		try {
			return sdf.parse(stringDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	// String -> Date(sql)
	public Date stringToSqlDate(String stringDate){
		return Date.valueOf(stringDate);
	}

	// Date(sql) -> String (하루 전)
	public String beforeDate(Date sqlDate) {
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd"); 
		Calendar cal = Calendar.getInstance();
		cal.setTime(sqlDate);
		cal.add(Calendar.DATE, -1);	// 하루 전
		return sdformat.format(cal.getTime());
	}

	// Date(sql) -> String (하루 후)
	public String afterDate(Date sqlDate) {
		SimpleDateFormat sdformat = new SimpleDateFormat("yyyy-MM-dd"); 
		Calendar cal = Calendar.getInstance();
		cal.setTime(sqlDate);
		cal.add(Calendar.DATE, +1);	// 하루 후
		return sdformat.format(cal.getTime());
	}
	
	// 날짜 조합 (year+month+day) -> String
	public String stringDateSet(int year, int month, int day) {
		String stringDate = year+"-"+month+"-"+day;
	
		return utilDateToString(stringToUtilDate(stringDate));
	}
}
