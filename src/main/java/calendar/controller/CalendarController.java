package calendar.controller;

import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import calendar.bean.CalendarDTO;
import ledger.bean.LedgerDTO;
import ledger.controller.LedgerService;


@Controller
public class CalendarController {
	@Autowired
	private CalendarService calendarService;

	@Autowired
	private LedgerService ledgerService;

	// 달력으로 이동
	@RequestMapping(value="calendar.do")
	public ModelAndView calendar(HttpServletRequest request, 
			HttpServletResponse response) {
		System.out.println("캘린더 폼 이동");
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("memId");
		System.out.println("등록된 id : "+id);

		int year = 0; int month = 0; 
		
		String cmd = request.getParameter("cmd");	// 메인에서 접근 확인
		System.out.println("cmd : "+cmd);
		
		if(cmd==null || (!cmd.equals("main"))) {	// 달력에서 년, 월 선택 (메인이 아닌경우)
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));
			
			// 월 변경 (1월->12월 / 12월->1월)
			if(month<0) {month=11; year=year-1;}	// 월이 1월->12월로 이동
			if(month==12) {month=0; year=year+1;}	// 월이 12월 -> 1월로 이동
		}
		
		//		------------------ 원하는 년,월으로 날짜 뽑아오기
		CalendarDTO calendarDTO  = calendarService.daySet(year, month, cmd);

		//		------------------ 해당 월에 맞는 데이터 데이터 찾아오기
		List<LedgerDTO> ledgerList = ledgerService.monthListLedger(calendarDTO, id);

		// Date(sql) -> String으로 변환 (LedgerDTO stringDate 셋팅)
		ledgerList = calendarService.stringDateSet(ledgerList);

		//		------------------ 찾아온 데이터를 해당 날짜별로 데이터를 묶는다.
		// 날짜별 가계부 정보 담을 리스트
		Map<String, List<LedgerDTO>> monthMap = new HashMap<>();	// <날짜, 가계부DTO>
		List<LedgerDTO> endVelueList = null;	// map에 필요한 리스트
		List<String> dayList = new ArrayList<String>();	// 해당 월에 해당하는 일자를 저장하는 리스트 (yyyy-mm-dd)

		
		// 날짜를 String(날짜 조합) -> Date -> String(포멧 변경) 하는 for문
		for(int i=0;i<calendarDTO.getLastOfDate();i++) {
			endVelueList = new ArrayList<LedgerDTO>();	// 날짜별로 담을 리스트
			// 1. String (날짜 조합)
			String beforeKeyDate = calendarDTO.getYear()+"-"+(calendarDTO.getMonth()+1)
					+"-"+(i+1);

			// 2. String -> Date(util) (포멧 변경)
			java.util.Date afterKeyDate = 
					calendarService.stringToUtilDate(beforeKeyDate);
			
			// 3. Date(util) -> String (자료형 변경)
			String endKeyDate = 
					calendarService.utilDateToString(afterKeyDate);

			// 해당 날짜에 맞는 데이터를 날짜별로 묶는 리스트 for문
			for(int j=0;j<ledgerList.size();j++) {	// 날짜가 같으면 가계부 내용 들어감
				// 날짜와 같으면 리스트 조합
				if(endKeyDate.equals(ledgerList.get(j).getStringDate())) {
					endVelueList.add(ledgerList.get(j));
				}
			}
			monthMap.put(endKeyDate, endVelueList);
			dayList.add(endKeyDate);
			
//			------------- test용 (나중에 지울 예정)
			if(monthMap.get(endKeyDate).size()!=0) {	// 데이터가 널이 아닐경우
				String cate = monthMap.get(endKeyDate).get(0).getCategory();
				System.out.println("해당 날짜 : "+endKeyDate+" || 카테고리 : "+cate+" || 등록개수 : "+monthMap.get(endKeyDate).size());
			}else {
				System.out.println("해당 날짜 : "+endKeyDate+" || 카테고리 : 없음 ");
			}
			System.out.println(year+"년/"+month+"달 총 일수 : "+dayList.size());
		}

		for(String temp : dayList) {
			System.out.println("dayList 날짜 "+temp);
		}
//		-------------------------------------------------------------------------------------

		// !!!! 날짜만 담은 배열을 넘겨주어야 한다. .jsp페이지에서 그것과 맵을 비교하여 맵안에 리스트 사이즈가
		// 0이상일 경우 출력하도록
		// 그리고 날짜를 클릭하여 가계부 등록페이지에 넘겨줄때 그 배열의 날짜를 넘겨준다.

		//		---------------------------------------------------------------------------------	
		ModelAndView modelAndView = new ModelAndView("/WEB-INF/ledger_index.jsp");
		modelAndView.addObject("calendarDTO", calendarDTO);	// 달력에 들어가는 정보
		modelAndView.addObject("ledgerList", ledgerList);	// 검색날짜에 맞는 가계부 정보 리스트
		modelAndView.addObject("monthMap", monthMap);		// 해당월-날짜별 가계부 리스트 정보
		modelAndView.addObject("dayList", dayList);			// 해당 월의 날짜 담은 리스트(yyyy-mm-dd)
		modelAndView.addObject("page", "/calendar/calendar");
		
//		modelAndView.setViewName("ledger_index.jsp");
		return modelAndView;
	}
}
