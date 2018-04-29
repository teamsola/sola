package ledger.controller;

import java.sql.Date;
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
import calendar.controller.CalendarService;
import ledger.bean.LedgerDTO;

@Controller
public class LedgerController {

	@Autowired
	private LedgerService ledgerService;

	@Autowired
	private CalendarService calendarService;

	HttpSession session = null;

	// 가계부 메인 이동
	@RequestMapping(value="ledgerMain.do")
	public ModelAndView ledgerMain(HttpServletRequest request, 
			HttpServletResponse response) {
		System.out.println("가계부 메인 이동");

		//		===================== 세션의 id 저장 (수정 해야됨) ===========================
		session = request.getSession();

		/*session.setAttribute("memId", "aaa");*/
		//		======================================================================

		ModelAndView modelAndView = new ModelAndView("/WEB-INF/ledger_index.jsp");
		//		modelAndView.addObject("page", "ledger_index");
		//		modelAndView.setViewName("/WEB-INF/ledger_index.jsp");
		return modelAndView;
	}


	// 가계부 입력 폼 이동
	@RequestMapping(value="ledgerInsertForm.do")
	public ModelAndView ledgerInsertForm(HttpServletRequest request, 
			HttpServletResponse response) {
		System.out.println("가계부 입력 폼 이동");


		//		--------------- 분류 카테고리
		String[] categoryOut = new String[] {"식비", "교통", "문화생활", "마트-편의점", 
				"패션-미용", "생활용품", "주거-통신", "건강", "교육", "경조사-회비", "부모님", "기타"};

		String[] categoryIn = new String[] {"현금", "상품권"};


		//		--------------- 입력을 원하는 날짜

		String stringDate = request.getParameter("stringDate");

		ModelAndView modelAndView = new ModelAndView("/WEB-INF/ledger_index.jsp");
		modelAndView.addObject("categoryOut", categoryOut);	// 지출 카테고리
		modelAndView.addObject("categoryIn", categoryIn);	// 수입 카테고리
		modelAndView.addObject("stringDate", stringDate);	// 해당 날짜

		modelAndView.addObject("content", "/ledger/ledgerInsertForm");
		//		modelAndView.setViewName("ledgerInsertForm.jsp");
		return modelAndView;
	}

	// 가계부 입력 처리
	@RequestMapping(value="ledgerInsert.do")
	public ModelAndView ledgerInsert(HttpServletRequest request, 
			LedgerDTO ledgerDTO) {
		System.out.println("가계부 입력 처리");

		int money = Integer.parseInt(request.getParameter("money"));

		if(ledgerDTO.getInOut().equals("수입")) {		// 수입일 경우
			ledgerDTO.setIncome(money);
		}else {										// 지출일 경우
			ledgerDTO.setSpand(money);
		}
		ledgerDTO.setBalance(ledgerDTO.getIncome()-ledgerDTO.getSpand());
		System.out.println("balance : "+ledgerDTO.getBalance());
		System.out.println("inout : "+ledgerDTO.getInOut());
		System.out.println("category : "+ledgerDTO.getCategory());
		System.out.println("income : "+ledgerDTO.getIncome());
		System.out.println("spand : "+ledgerDTO.getSpand());
		System.out.println("logdate : "+ledgerDTO.getLogdate());

		//		===================== 세션에서 id 불러옴 (수정 해야됨) ===========================
		session = request.getSession();

		ledgerDTO.setId((String)session.getAttribute("memId"));
		//		===============================================================================

		int su = ledgerService.insertLedger(ledgerDTO);

		ModelAndView modelAndView = new ModelAndView("/WEB-INF/ledger_index.jsp");
		modelAndView.addObject("su", su);
		modelAndView.addObject("stringDate", ledgerDTO.getLogdate());
		modelAndView.addObject("cmd", "insert");
		modelAndView.addObject("content", "/ledger/ledgerMessage");
		//		modelAndView.setViewName("ledgerInsert.jsp");
		return modelAndView;
	}

	// 가계부 하루 보기 
	@RequestMapping(value="ledgerViewDetail.do")
	public ModelAndView ledgerViewDetail(HttpServletRequest request) {
		
		LedgerDTO ledgerDTO = new LedgerDTO();
		int seq = Integer.parseInt(request.getParameter("seq"));
		String stringDate = request.getParameter("stringDate");
		
		session = request.getSession();
		String id = (String)session.getAttribute("memId");
		
		ledgerDTO = ledgerService.viewLedger(seq, id);
		
		ModelAndView modelAndView = new ModelAndView("/WEB-INF/ledger_index.jsp");
		modelAndView.addObject("stringDate", stringDate);	// 조회한 날짜
		modelAndView.addObject("ledgerDTO", ledgerDTO);
		modelAndView.addObject("content", "/ledger/ledgerViewDetail");
		
		return modelAndView;
	}

	// 가계부 하루 보기 
	@RequestMapping(value="ledgerViewDay.do")
	public ModelAndView ledgerViewDay(HttpServletRequest request) {

		session = request.getSession();
		String id = (String)session.getAttribute("memId");

		System.out.println("가계부 상세보기 이동");
		String stringDate = null;	// 	요청 날짜(String)
		Date sqlDate = null;		//	요청 날짜 (Date(sql))


		// today : 달력 클릭 | before : View 이전 | after : View 다음
		String cmd = request.getParameter("cmd");

		List<LedgerDTO> todayList = new ArrayList<>();	// 해당 일의 리스트

		if(cmd.equals("today")) {	// 메인 -> 일일보기
			CalendarDTO calendarDTO = new CalendarDTO();
			calendarDTO = calendarService.today();	// 날짜 받아옴
			stringDate = calendarService.stringDateSet	// 날짜 조합
					(calendarDTO.getYear(), calendarDTO.getMonth()+1, calendarDTO.getToday());

		}else {
			// 조회를 원하는 날짜 (String -> Date(sql)
			stringDate = request.getParameter("stringDate");
		}

		sqlDate = calendarService.stringToSqlDate(stringDate);
		System.out.println("today : "+sqlDate);

		if(cmd.equals("choiceDay") || cmd.equals("today") || cmd.equals("delete") || cmd.equals("insert") || cmd.equals("modify")) {	// 해당일(달력 클릭) 또는 오늘(실제) 또는 삭제 후
			todayList = ledgerService.todayListLedger(sqlDate, id);

		}else if(cmd.equals("before")) {	// 해당일 이전(View 이전클릭) 
			System.out.println("before 작업전 날짜 : "+sqlDate);
			// 전달된 날짜에서 -1하루 함 (View page 전달용 || DB작업과 상관없음)
			stringDate = calendarService.beforeDate(sqlDate);
			System.out.println("before 작업후 날짜 : "+stringDate);
			todayList = ledgerService.beforeListLedger(sqlDate, id);


		}else if(cmd.equals("after")) {		// 해당일 다음(View 다음클릭) 
			System.out.println("after 작업전 날짜 : "+sqlDate);
			// 전달된 날짜에서 +1하루 함 (View page 전달용 || DB작업과 상관없음)
			stringDate = calendarService.afterDate(sqlDate);
			System.out.println("after 작업후 날짜 : "+stringDate);
			todayList = ledgerService.afterListLedger(sqlDate, id);

		}

		// LedgerDTO stringDate 셋팅 (Date(sql) -> String)
		todayList = calendarService.stringDateSet(todayList);

		ModelAndView modelAndView = new ModelAndView("/WEB-INF/ledger_index.jsp");
		modelAndView.addObject("stringDate", stringDate);	// 조회한 날짜
		modelAndView.addObject("todayList", todayList);

		modelAndView.addObject("content", "/ledger/ledgerViewDay");
		//		modelAndView.setViewName("ledgerViewDay.jsp");

		return modelAndView;

	}


	// 가계부 일일 보기
	@RequestMapping(value="ledgerViewAll.do")
	public ModelAndView ledgerViewAll(HttpServletRequest request) {
		System.out.println("일일 보기 처리");

		session = request.getSession();
		String id = (String)session.getAttribute("memId");

		CalendarDTO calendarDTO = null;
		List<LedgerDTO> ledgerList = null;

		int year=0;
		int month=0;

		String cmd = request.getParameter("cmd"); 	// main 

		// 년월 셋팅
		if(cmd==null) {	// 월별 통계시
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));

		}else if(cmd.equals("main")) {	// 메인에서 접근시 (오늘 기준 년-월)
			Calendar cal = Calendar.getInstance();
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH);	// 0부터 시작
		}

		// 기준 날짜 셋팅
		calendarDTO = calendarService.daySet(year, month, "");

		// 내림차순으로 정리
		ledgerList = ledgerService.viewAllLedger(calendarDTO, id);

		// Date(sql) -> String으로 변환 (LedgerDTO stringDate 셋팅)
		ledgerList = calendarService.stringDateSet(ledgerList);


		ModelAndView modelAndView = new ModelAndView("/WEB-INF/ledger_index.jsp");
		modelAndView.addObject("calendarDTO",calendarDTO );	// 셋팅 날짜 데이터
		modelAndView.addObject("ledgerList",ledgerList );	// 가계부 리스트
		modelAndView.addObject("content", "/ledger/ledgerViewAll");
		return modelAndView;
	}


	// 가계부 월별 보기
	@RequestMapping(value="ledgerViewMonth.do")
	public ModelAndView ledgerViewMonth(HttpServletRequest request) {
		System.out.println("가계부 월별보기 이동");

		session = request.getSession();
		String id = (String)session.getAttribute("memId");

		int year =0;
		String cmd = request.getParameter("cmd");

		// 1. 해당 년 구하기
		if(cmd==null) {	// 달력에서 년별 조회했을 경우
			year = Integer.parseInt(request.getParameter("year"));

		}else if(cmd.equals("main")) {	// 메인에서 접근시 (오늘 기준 년)
			Calendar cal = Calendar.getInstance();
			year = cal.get(Calendar.YEAR);
		}
		List<LedgerDTO> ledgerList = null;
		Map<Integer, List<LedgerDTO>> yearMap = new HashMap<>();
		for(int i=0; i<12; i++) {
			// 해당 월의 데이터 뽑아옴
			CalendarDTO calendarDTO = calendarService.daySet(year, i, "");

			// 해당 월에 해당하는 가계부 정보 받음
			ledgerList = new ArrayList<>();
			ledgerList = ledgerService.monthListLedger(calendarDTO, id);

			// Date(sql) -> String으로 변환 (LedgerDTO stringDate 셋팅)
			ledgerList = calendarService.stringDateSet(ledgerList);

			// 월 + 데이터 
			yearMap.put(i+1, ledgerList);
		}


		//		------------ test용 (삭제예정)

		for(int i=1;i<13;i++) {
			System.out.println(year+"년 / "+i+"월 / 데이터 갯수 : "+yearMap.get(i).size() );
		}

		//		-------------

		ModelAndView modelAndView = new ModelAndView("/WEB-INF/ledger_index.jsp");
		modelAndView.addObject("year", year);
		modelAndView.addObject("yearMap", yearMap);
		modelAndView.addObject("content", "/ledger/ledgerViewMonth");
		//		modelAndView.setViewName("ledgerViewMonth.jsp");

		return modelAndView;
	}

	// 가계부 결산 보기
	@RequestMapping(value="ledgerViewClosing.do")
	public ModelAndView ledgerViewClosing(HttpServletRequest request) {
		System.out.println("가계부 결산보기 이동");

		session = request.getSession();
		String id = (String)session.getAttribute("memId");

		CalendarDTO calendarDTO = null;
		List<LedgerDTO> ledgerList = null;

		int year=0;
		int month=0;

		String cmd = request.getParameter("cmd"); 	// main 

		// 년월 셋팅
		if(cmd==null) {	// 월별 통계시
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"));

		}else if(cmd.equals("main")) {	// 메인에서 접근시 (오늘 기준 년-월)
			Calendar cal = Calendar.getInstance();
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH);	// 0부터 시작
		}


		// 기준 날짜 셋팅
		calendarDTO = calendarService.daySet(year, month, "");

		// 기준일 가계부 데이터 가져옴
		ledgerList = ledgerService.monthListLedger(calendarDTO, id);

		// Date(sql) -> String으로 변환 (LedgerDTO stringDate 셋팅)
		ledgerList = calendarService.stringDateSet(ledgerList);



		//		--------------- 분류 카테고리
		String[] categoryOut = new String[] {"식비", "교통", "문화생활", "마트-편의점", 
				"패션-미용", "생활용품", "주거-통신", "건강", "교육", "경조사-회비", "부모님", "기타"};

		String[] categoryIn = new String[] {"현금", "상품권"};


		ModelAndView modelAndView = new ModelAndView("/WEB-INF/ledger_index.jsp");
		modelAndView.addObject("calendarDTO",calendarDTO );	// 셋팅 날짜 데이터
		modelAndView.addObject("ledgerList",ledgerList );	// 가계부 리스트
		modelAndView.addObject("categoryOut", categoryOut);	// 지출 카테고리
		modelAndView.addObject("categoryIn", categoryIn);	// 수입 카테고리
		modelAndView.addObject("content", "/ledger/ledgerViewClosing");
		//		modelAndView.setViewName("ledgerViewClosing.jsp");

		return modelAndView;
	}

	// 가계부 통계 보기
	@RequestMapping(value="ledgerViewStats.do")
	public ModelAndView ledgerViewStats(HttpServletRequest request) {
		System.out.println("가계부 통계보기 이동");

		session = request.getSession();
		String id = (String)session.getAttribute("memId");

		Calendar cal = Calendar.getInstance();
		CalendarDTO calendarDTO = null;
		CalendarDTO calendarDTOBefore = null;
		
		List<LedgerDTO> ledgerList = null;		// 현재 가계부 리스트
		List<LedgerDTO> ledgerListBefore = null;// 지난달 (월별-이전달과 비교에 사용(div))
		Map<Integer, List<LedgerDTO>> yearMap = null;
		

		List<String> monthDay = null;	// 한달 1-막일 까지 조합한 데이터
		List<String> monthDayBefore = null;	// 지난달 (월별-이전달과 비교에 사용(div))
		List<String> selectPeriodList = new ArrayList<>();	// 기간 조회에 사용되는 날짜(시작일-종료일)

		int year=0; int month=0;

		String cmd = request.getParameter("cmd"); 		// main, stats
		String period = request.getParameter("period");	// month, year, selectPeriod
		String inout = request.getParameter("inout");	// 수입-지출, 수입, 지출
		String startDay = request.getParameter("startDay");	// 기간별 조회 시작날짜
		String endDay = request.getParameter("endDay");		// 기간별 조회 끝 날짜

		System.out.println("period : "+period);
		System.out.println("inout : "+inout);

		// ------------------------------ 년월 셋팅 ------------------------------
		if(cmd.equals("stats") && period.equals("month")) {		// 월별 통계시
			year = Integer.parseInt(request.getParameter("year"));
			String monthTemp = request.getParameter("month");
			System.out.println("monthTemp : "+monthTemp);
			
			if(monthTemp == null) {	// 연간 -> 월간으로 변경될경우 값이 없음
				month = cal.get(Calendar.MONTH);
				System.out.println("month : "+month);
			}else {
				month = Integer.parseInt(monthTemp);
			}

		}else if(cmd.equals("main") && period==null) {	// 메인에서 접근시 (오늘 기준 년-월)
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH);	// 0부터 시작

		}else if(cmd.equals("stats") && period.equals("year")) {	// 년별 통계시
			year = Integer.parseInt(request.getParameter("year"));
		}else if(period.equals("selectPeriod")) {
			year = cal.get(Calendar.YEAR);
		}

		// ------------------------------ 데이터 셋팅 ------------------------------
		if(cmd.equals("main") || period.equals("month")) {	// 메인 || 통계 - 월간
			// 기준 날짜 셋팅
			calendarDTO = calendarService.daySet(year, month, "");
			calendarDTOBefore = calendarService.daySet(year, month-1, "");	// div용 이전 달
			// 기준일 가계부 데이터 가져옴
			ledgerList = ledgerService.monthListLedger(calendarDTO, id);
			ledgerListBefore = ledgerService.monthListLedger(calendarDTOBefore, id);	// div용 이전 달

			// Date(sql) -> String으로 변환 (LedgerDTO stringDate 셋팅)
			ledgerList = calendarService.stringDateSet(ledgerList);
			ledgerListBefore = calendarService.stringDateSet(ledgerListBefore);	// div용 이전 달

			monthDay = new ArrayList<>();
			for(int i=1;i<=calendarDTO.getLastOfDate();i++) {
				monthDay.add(calendarService.stringDateSet(year, month+1, i));
			}
			monthDayBefore = new ArrayList<>();	// div용 이전 달
			for(int i=1;i<=calendarDTOBefore.getLastOfDate();i++) {
				monthDayBefore.add(calendarService.stringDateSet(year, month+1, i));
			}
			


		}else if(period.equals("year")) {	// 통계 - 연간

			yearMap = new HashMap<>();
			for(int i=0; i<12; i++) {
				// 해당 월의 데이터 뽑아옴
				calendarDTO = calendarService.daySet(year, i, "");

				// 해당 월에 해당하는 가계부 정보 받음
				ledgerList = new ArrayList<>();
				ledgerList = ledgerService.monthListLedger(calendarDTO, id);

				// Date(sql) -> String으로 변환 (LedgerDTO stringDate 셋팅)
				ledgerList = calendarService.stringDateSet(ledgerList);

				// 월 + 데이터 
				yearMap.put(i+1, ledgerList);
			}
		}else if(period.equals("selectPeriod")) {
			calendarDTO = calendarService.today();
			ledgerList = ledgerService.searchList(startDay, endDay, id);
			ledgerList = calendarService.stringDateSet(ledgerList);


			//	기간별 조회 시작일 -> 종료일 까지의 날짜
			java.util.Date utilStartDay = calendarService.stringToUtilDate(startDay);
			java.util.Date utilEndDay = calendarService.stringToUtilDate(endDay);

			Calendar calStartDay = Calendar.getInstance();
			Calendar calEndDay = Calendar.getInstance();

			calStartDay.setTime(utilStartDay);
			calEndDay.setTime(utilEndDay);

			while( calStartDay.compareTo( calEndDay ) !=1 ){


				selectPeriodList.add(calendarService.utilDateToString(calStartDay.getTime()));

				//시작날짜 + 1 일
				calStartDay.add(Calendar.DATE, 1);
			}

		}

		// ------------------------------ 분류 카테고리 ------------------------------
		String[] categoryOut = new String[] {"식비", "교통", "문화생활", "마트-편의점", 
				"패션-미용", "생활용품", "주거-통신", "건강", "교육", "경조사-회비", "부모님", "기타"};

		String[] categoryIn = new String[] {"현금", "상품권"};




		// ------------------------------ 데이터 전달 ------------------------------
		ModelAndView modelAndView = new ModelAndView("/WEB-INF/ledger_index.jsp");

		if(cmd.equals("main")) {
			modelAndView.addObject("calendarDTO",calendarDTO );	// 셋팅 날짜 데이터
			modelAndView.addObject("calendarDTOBefore",calendarDTOBefore );
			modelAndView.addObject("ledgerList", ledgerList );	// 가계부 리스트
			modelAndView.addObject("ledgerListBefore", ledgerListBefore );
			modelAndView.addObject("period", "month");			// month, year
			modelAndView.addObject("inout", "수입-지출");	
			modelAndView.addObject("monthDay", monthDay);		// 1-막일까지 조합된 날짜 모음
			modelAndView.addObject("monthDayBefore", monthDayBefore);

		}else if(cmd.equals("stats") && period.equals("month")) {	// 통계 - 월간
			modelAndView.addObject("calendarDTO",calendarDTO );	// 셋팅 날짜 데이터
			modelAndView.addObject("calendarDTOBefore",calendarDTOBefore );
			modelAndView.addObject("ledgerList", ledgerList );	// 가계부 리스트
			modelAndView.addObject("ledgerListBefore", ledgerListBefore );
			modelAndView.addObject("period", period);			// month, year
			modelAndView.addObject("inout", inout);				// 수입-지출, 수입, 지출
			modelAndView.addObject("monthDay", monthDay);		// 1-막일까지 조합된 날짜 모음
			modelAndView.addObject("monthDayBefore", monthDayBefore);

		}else if(cmd.equals("stats") && period.equals("year")) {	// 통계 - 연간
			modelAndView.addObject("year", year);
			modelAndView.addObject("yearMap", yearMap);
			modelAndView.addObject("period", period);			// month, year
			modelAndView.addObject("inout", inout);				// 수입-지출, 수입, 지출

		}else if(cmd.equals("stats") && period.equals("selectPeriod")) {	// 통계 - 기간
			modelAndView.addObject("calendarDTO", calendarDTO);
			modelAndView.addObject("year", year);
			modelAndView.addObject("startDay",startDay);
			modelAndView.addObject("endDay",endDay);
			modelAndView.addObject("ledgerList", ledgerList );	// 가계부 리스트
			modelAndView.addObject("period", period);			// month, year, selectPeriod
			modelAndView.addObject("inout", inout);				// 수입-지출, 수입, 지출
			modelAndView.addObject("selectPeriodList", selectPeriodList);	// 기간 조회에 사용되는 날짜리스트(시작일-종료일)
		}

		modelAndView.addObject("categoryOut", categoryOut);	// 지출 카테고리
		modelAndView.addObject("categoryIn", categoryIn);	// 수입 카테고리
		modelAndView.addObject("cmd", cmd);					// main, stats
		modelAndView.addObject("content", "/ledger/ledgerViewStats");
		//		modelAndView.setViewName("ledgerViewStats.jsp");

		return modelAndView;
	}

	// 가계부 수정 폼 이동
	@RequestMapping(value="ledgerModifyForm.do")
	public ModelAndView ledgerModifyForm(HttpServletRequest request) {
		System.out.println("가계부 수정 폼 이동");

		session = request.getSession();
		String id = (String)session.getAttribute("memId");

		String stringDate = request.getParameter("stringDate");
		int seq = Integer.parseInt(request.getParameter("seq"));

		//				--------------- 분류 카테고리
		String[] categoryOut = new String[] {"식비", "교통", "문화생활", "마트-편의점", 
				"패션-미용", "생활용품", "주거-통신", "건강", "교육", "경조사-회비", "부모님", "기타"};

		String[] categoryIn = new String[] {"현금", "상품권"};


		LedgerDTO ledgerDTO = new LedgerDTO();
		ledgerDTO = ledgerService.viewLedger(seq, id);

		ledgerDTO.setStringDate(stringDate);

		ModelAndView modelAndView = new ModelAndView("/WEB-INF/ledger_index.jsp");

		modelAndView.addObject("ledgerDTO", ledgerDTO);
		modelAndView.addObject("stringDate", stringDate);
		modelAndView.addObject("categoryOut", categoryOut);	// 지출 카테고리
		modelAndView.addObject("categoryIn", categoryIn);	// 수입 카테고리
		modelAndView.addObject("seq", seq);
		modelAndView.addObject("content", "/ledger/ledgerModifyForm");
		//		modelAndView.setViewName("ledgerModifyForm.jsp");

		return modelAndView;
	}

	// 가계부 수정
	@RequestMapping(value="ledgerModify.do")
	public ModelAndView ledgerModify(HttpServletRequest request,
			LedgerDTO ledgerDTO) {
		System.out.println("가계부 수정 처리");
		
		String stringDate = request.getParameter("stringDate");

		int money = Integer.parseInt(request.getParameter("money"));
		if(ledgerDTO.getInOut().equals("수입")) {		// 수입일 경우
			ledgerDTO.setIncome(money);
		}else {										// 지출일 경우
			ledgerDTO.setSpand(money);
		}
		ledgerDTO.setBalance(ledgerDTO.getIncome()-ledgerDTO.getSpand());
		//		===================== 세션에서 id 불러옴 (수정 해야됨) ===========================
		session = request.getSession();

		ledgerDTO.setId((String)session.getAttribute("memId"));
		//		===============================================================================
		int su = ledgerService.modifyLedger(ledgerDTO);

		ModelAndView modelAndView = new ModelAndView("/WEB-INF/ledger_index.jsp");
		modelAndView.addObject("su", su);
		modelAndView.addObject("cmd", "modify");
		modelAndView.addObject("stringDate", stringDate);
		modelAndView.addObject("content", "/ledger/ledgerMessage");
		//		modelAndView.setViewName("ledgerModify.jsp");
		return modelAndView;
	}

	// 가계부 삭제
	@RequestMapping(value="ledgerDelete.do")
	public ModelAndView ledgerDelete(HttpServletRequest request) {
		System.out.println("가계부 삭제 처리");

		session = request.getSession();
		String id = (String)session.getAttribute("memId");

		int seq = Integer.parseInt(request.getParameter("seq"));
		String stringDate = request.getParameter("stringDate");
		String message = null;

		int su = ledgerService.DeleteLedger(seq, id);

		ModelAndView modelAndView = new ModelAndView("/WEB-INF/ledger_index.jsp");
		modelAndView.addObject("message", message);
		modelAndView.addObject("cmd", "delete");
		modelAndView.addObject("su", su);
		modelAndView.addObject("stringDate", stringDate);
		modelAndView.addObject("content", "/ledger/ledgerMessage");

		return modelAndView;
	}


}
