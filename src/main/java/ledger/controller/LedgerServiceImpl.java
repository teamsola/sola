package ledger.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import calendar.bean.CalendarDTO;
import ledger.bean.LedgerDTO;
import ledger.dao.LedgerDAO;

@Service
public class LedgerServiceImpl implements LedgerService {

	@Autowired
	LedgerDAO ledgerDAO;
	
	@Override
	public int insertLedger(LedgerDTO ledgerDTO) {
		return ledgerDAO.insertLedger(ledgerDTO);
	}

	@Override
	public List<LedgerDTO> monthListLedger(CalendarDTO calendarDTO, String id) {
		return ledgerDAO.monthListLedger(calendarDTO,id);
	}

	@Override
	public List<LedgerDTO> todayListLedger(Date sqlDate, String id) {
		// TODO Auto-generated method stub
		return ledgerDAO.todayListLedger(sqlDate, id);
	}

	@Override
	public List<LedgerDTO> beforeListLedger(Date sqlDate, String id) {
		return ledgerDAO.beforeListLedger(sqlDate, id);
	}

	@Override
	public List<LedgerDTO> afterListLedger(Date sqlDate, String id) {
		return ledgerDAO.afterListLedger(sqlDate, id);
	}

	@Override
	public LedgerDTO viewLedger(int seq, String id) {
		return ledgerDAO.viewLedger(seq, id);
	}

	@Override
	public int modifyLedger(LedgerDTO ledgerDTO) {
		return ledgerDAO.modifyLedger(ledgerDTO);
	}

	@Override
	public List<LedgerDTO> searchList(String startDay, String endDay, String id) {
		return ledgerDAO.searchList(startDay, endDay, id);
	}

	@Override
	public int DeleteLedger(int seq, String id) {
		return ledgerDAO.DeleteLedger(seq, id);
	}

	@Override
	public List<LedgerDTO> viewAllLedger(CalendarDTO calendarDTO, String id) {
		return ledgerDAO.viewAllLedger(calendarDTO, id);
	}

	@Override
	public List<LedgerDTO> searchLedger(String keyword, String id) {
		return ledgerDAO.searchLedger(keyword, id);
	}
	
}
