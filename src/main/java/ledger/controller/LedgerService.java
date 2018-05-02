package ledger.controller;

import java.sql.Date;
import java.util.List;

import calendar.bean.CalendarDTO;
import ledger.bean.LedgerDTO;

// DAO의 메서드를 선언 하는 클래스
public interface LedgerService {
	// 가계부 입력
	public int insertLedger(LedgerDTO ledgerDTO);

	// 가계부 해당 월의 리스트
	public List<LedgerDTO> monthListLedger(CalendarDTO calendarDTO, String id);

	// 가계부 해당 일의 리스트 (달력 클릭)
	public List<LedgerDTO> todayListLedger(Date sqlDate, String id);

	// View 이전 (전날)
	public List<LedgerDTO> beforeListLedger(Date sqlDate, String id);

	// View 다음 (다음날)
	public List<LedgerDTO> afterListLedger(Date sqlDate, String id);
	
	// 가계부 조회 (단일)
	public LedgerDTO viewLedger(int seq, String id);
	
	// 가계부 수정
	public int modifyLedger(LedgerDTO ledgerDTO);
	
	// 가계부 통계-기간별 조회
	public List<LedgerDTO> searchList(String startDay, String endDay, String id);
	
	// 가계부 일일 조회
	public List<LedgerDTO> viewAllLedger(CalendarDTO calendarDTO, String id);
	
	// 가계부 삭제
	public int DeleteLedger(int seq, String id);
	
	// 가계부 검색
	public List<LedgerDTO> searchLedger(String keyword, String id);

}
