package proinfo.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import proinfo.bean.ProinfoDTO;
import proinfo.dao.ProinfoDAO;

@Service
public class ProinfoServiceImpl implements ProinfoService{

	@Autowired
	ProinfoDAO proinfoDAO;

	@Override
	public int insertProinfo(ProinfoDTO proInfoDTO) {
		return proinfoDAO.insertProinfo(proInfoDTO);
	}

	@Override
	public ProinfoDTO viewProinfo(int seq) {
		return proinfoDAO.viewProinfo(seq);
	}

	@Override
	public int modifyProinfo(ProinfoDTO proinfoDTO) {
		return proinfoDAO.modifyProinfo(proinfoDTO);
	}

	@Override
	public int deleteProinfo(int seq) {
		return proinfoDAO.deleteProinfo(seq);
	}

	@Override
	public ArrayList<ProinfoDTO> searchList(int startNum, int endNum, String searchOp, String keyword) {
		return (ArrayList<ProinfoDTO>)proinfoDAO.searchList(startNum, endNum, searchOp, keyword);
	}

	@Override
	public ArrayList<ProinfoDTO> search_c(String keyword_c) {
		return (ArrayList<ProinfoDTO>)proinfoDAO.search_c(keyword_c);
	}

	@Override
	public int getTotalS(String searchOp, String keyword) {
		return proinfoDAO.getTotalS(searchOp,keyword);
	}
	
	
}
