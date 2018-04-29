package mall.controller;

import java.util.ArrayList;

import mall.bean.MallDTO;

public interface MallService{

	//등록
	int mallInsert(MallDTO mallDTO);
	
	//원본 불러오기(수정시)
	MallDTO mallView(int mall_seq);
	
	//수정
	int mallUpdate(MallDTO mallDTO);
	
	//삭제
	int mallDelete(int mall_seq);

	//리스트
	ArrayList<MallDTO> mallList();
	
}
