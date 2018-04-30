package ledger.dao;



import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import calendar.bean.CalendarDTO;
import ledger.bean.LedgerDTO;

@Repository
public class LedgerDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	// 가계부 입력
	public int insertLedger(LedgerDTO ledgerDTO) {
		System.out.println("===> SpringMVC-myBatis로 insertLedger() 기능 처리");
		return sqlSession.insert("mybatis.ledgerMapper.insertLedger", ledgerDTO);
	}

	// 해당월의 가계부 리스트
	public List<LedgerDTO> monthListLedger(CalendarDTO calendarDTO, String id){

		// Data(sql)형으로 형변환 첫째날
		String startDay = calendarDTO.getYear()+"-"+(calendarDTO.getMonth()+1)+"-"+1;
		Date startDate = Date.valueOf(startDay);
		System.out.println("startDate : "+startDate);
		// Data(sql)형으로 형변환 마지막날
		String endDay = calendarDTO.getYear()+"-"+(calendarDTO.getMonth()+1)+"-"+calendarDTO.getLastOfDate();
		Date endDate = Date.valueOf(endDay);
		System.out.println("endDate : "+endDate);

		//		Map<String, Date> map = new HashMap<String, Date>();
		Map<String, Object> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("id", id);

		System.out.println("===> SpringMVC-myBatis로 monthListLedger() 기능 처리");
		return sqlSession.selectList("mybatis.ledgerMapper.monthListLedger", map);
	}

	// 해당 일의 가계부 리스트
	public List<LedgerDTO> todayListLedger(Date sqlDate, String id){

		Map<String, Object> map = new HashMap<>();
		map.put("sqlDate", sqlDate);
		map.put("id", id);
		System.out.println("===> SpringMVC-myBatis로 todayListLedger() 기능 처리");
		return sqlSession.selectList("mybatis.ledgerMapper.todayListLedger", map);
	}

	// View 이전 (전날)
	public List<LedgerDTO> beforeListLedger(Date sqlDate, String id){

		Map<String, Object> map = new HashMap<>();
		map.put("sqlDate", sqlDate);
		map.put("id", id);
		System.out.println("===> SpringMVC-myBatis로 beforeListLedger() 기능 처리");
		return sqlSession.selectList("mybatis.ledgerMapper.beforeListLedger", map);
	}

	// View 다음 (다음날)
	public List<LedgerDTO> afterListLedger(Date sqlDate, String id){

		Map<String, Object> map = new HashMap<>();
		map.put("sqlDate", sqlDate);
		map.put("id", id);
		System.out.println("===> SpringMVC-myBatis로 afterListLedger() 기능 처리");
		return sqlSession.selectList("mybatis.ledgerMapper.afterListLedger", map);
	}

	// 가계부 조회(단일)
	public LedgerDTO viewLedger(int seq, String id){

		Map<String, Object> map = new HashMap<>();
		map.put("seq", seq);
		map.put("id", id);

		System.out.println("===> SpringMVC-myBatis로 viewLedger() 기능 처리");
		return sqlSession.selectOne("mybatis.ledgerMapper.viewLedger", map);
	}

	// 가계부 통계-기간별 조회
	public List<LedgerDTO> searchList(String startDay, String endDay, String id){

		Date startDate = Date.valueOf(startDay);
		Date endDate = Date.valueOf(endDay);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("id", id);

		System.out.println("===> SpringMVC-myBatis로 searchList() 기능 처리");
		return sqlSession.selectList("mybatis.ledgerMapper.searchListLedger",map);
	}

	// 가계부 일일 조회 (ViewAll)
	public List<LedgerDTO> viewAllLedger(CalendarDTO calendarDTO, String id) {
		// Data(sql)형으로 형변환 첫째날
		String startDay = calendarDTO.getYear()+"-"+(calendarDTO.getMonth()+1)+"-"+1;
		Date startDate = Date.valueOf(startDay);
		System.out.println("startDate : "+startDate);
		// Data(sql)형으로 형변환 마지막날
		String endDay = calendarDTO.getYear()+"-"+(calendarDTO.getMonth()+1)+"-"+calendarDTO.getLastOfDate();
		Date endDate = Date.valueOf(endDay);
		System.out.println("endDate : "+endDate);

		//		Map<String, Date> map = new HashMap<String, Date>();
		Map<String, Object> map = new HashMap<>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("id", id);
		System.out.println("===> SpringMVC-myBatis로 viewAllLedger() 기능 처리");
		return sqlSession.selectList("mybatis.ledgerMapper.viewAllLedger",map);
	}

	// 가계부 수정
	public int modifyLedger(LedgerDTO ledgerDTO) { 
		System.out.println("===> SpringMVC-myBatis로 modifyLedger() 기능 처리");
		return sqlSession.update("mybatis.ledgerMapper.modifyLedger", ledgerDTO);
	}



	// 가계부 삭제
	public int DeleteLedger(int seq, String id) {

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("seq", seq);
		map.put("id", id);

		System.out.println("===> SpringMVC-myBatis로 DeleteLedger() 기능 처리");
		return sqlSession.delete("mybatis.ledgerMapper.DeleteLedger",map);
	}
}
