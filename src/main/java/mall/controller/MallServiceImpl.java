package mall.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mall.bean.MallDTO;
import mall.dao.MallDAO;

@Service
public class MallServiceImpl implements MallService{
	
	@Autowired
	private MallDAO mallDAO;

	//등록
	@Override
	public int mallInsert(MallDTO mallDTO) {
		return mallDAO.mallInsert(mallDTO);
	}
	
	//원본 불러오기
	@Override
	public MallDTO mallView(int mall_seq) {
		return mallDAO.mallView(mall_seq);
	}

	//수정
	@Override
	public int mallUpdate(MallDTO mallDTO) {
		return mallDAO.mallUpdate(mallDTO);
	}

	//삭제
	@Override
	public int mallDelete(int mall_seq) {
		return mallDAO.mallDelete(mall_seq);
	}

	//목록 조회
	@Override
	public ArrayList<MallDTO> mallList() {
		return (ArrayList<MallDTO>)mallDAO.mallList();
	}
}
