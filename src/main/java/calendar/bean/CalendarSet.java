package calendar.bean;

import java.util.Calendar;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


@Transactional	
@Repository
public class CalendarSet {

	// 년 월을 기준으로 월데이터 뽑아옴
	public CalendarDTO daySet(int year, int month, String cmd) {

		CalendarDTO calendarDTO = new CalendarDTO();

		Calendar cal = Calendar.getInstance();
		calendarDTO.setToday(cal.get(Calendar.DAY_OF_MONTH));	// 오늘 날짜 (실제)
		
		if(cmd==null || (!cmd.equals("main"))) {	// 달력에서 접근시에
			// 요청하는 날짜 기반 셋팅 (1은 매달 첫째주 요일을 구하기 위한것)
			System.out.println("year : "+year);
			System.out.println("month : "+month);
			cal.set(year, month, 1);
		
		}else if(cmd.equals("main")) {	// 메인에서 접근시
			// 현재 날짜 기반 셋팅 (1은 매달 첫째주 요일을 구하기 위한것)
			cal.set(cal.get(Calendar.YEAR), cal.get(Calendar.MONTH), 1);
		}
		
		
		calendarDTO.setYear(cal.get(Calendar.YEAR));
		calendarDTO.setMonth(cal.get(Calendar.MONTH));// 0부터 시작 +1해주어야 한다.
		calendarDTO.setDay(cal.get(Calendar.DAY_OF_MONTH));	// 설정 일
		calendarDTO.setLastOfDate(cal.getActualMaximum(Calendar.DATE));// 마지막 날
		calendarDTO.setFirstWeek(cal.get(Calendar.DAY_OF_WEEK));// 이번달 1일의 해당 요일 일-1, 토-7
//		cal.get(Calendar.DAY_OF_WEEK) 는 해당일의 요일을 알려줌(셋팅을 1일로 해놔서 해당 월의 1일 요일이 나옴)
		
		System.out.println("C.daySet 년도 : "+calendarDTO.getYear());
		System.out.println("C.daySet 월 : "+calendarDTO.getMonth());
		System.out.println("C.daySet 일 : "+calendarDTO.getDay());
		System.out.println("C.daySet 오늘 : "+calendarDTO.getToday());
		System.out.println("C.daySet 마지막날 : "+calendarDTO.getLastOfDate());
		System.out.println("C.daySet 1일의 요일 : "+calendarDTO.getFirstWeek());
		return calendarDTO;
	}
	
	// 오늘 기준 년/월/일 가져옴
	public CalendarDTO today() {
		CalendarDTO calendarDTO = new CalendarDTO();
		Calendar cal = Calendar.getInstance();
		
		calendarDTO.setToday(cal.get(Calendar.DAY_OF_MONTH));	// 오늘 날짜 (실제)
		calendarDTO.setYear(cal.get(Calendar.YEAR));
		calendarDTO.setMonth(cal.get(Calendar.MONTH));// 0부터 시작 +1해주어야 한다.
		calendarDTO.setDay(cal.get(Calendar.DAY_OF_MONTH));	// 설정 일
		calendarDTO.setLastOfDate(cal.getActualMaximum(Calendar.DATE));// 마지막 날
		calendarDTO.setFirstWeek(cal.get(Calendar.DAY_OF_WEEK));// 이번달 1일의 해당 요일 일-1, 토-7
		
		System.out.println("C.today 년도 : "+calendarDTO.getYear());
		System.out.println("C.today 월 : "+calendarDTO.getMonth());
		System.out.println("C.today 일 : "+calendarDTO.getDay());
		System.out.println("C.today 오늘 : "+calendarDTO.getToday());
		System.out.println("C.today 마지막날 : "+calendarDTO.getLastOfDate());
		System.out.println("C.today 마지막 요일 : "+calendarDTO.getFirstWeek());
		
		return calendarDTO;
	}
}
