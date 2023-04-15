package com.mm.svc.model;

import java.util.List;
import java.util.Map;

public interface SvcDAO {
	/**방문 견적 신청*/
	public int svcMemInsert(SvcMemDTO dto);
	public int svcDetailInsert(SvcDetailDTO dto);
	public int svcDateInsert(SvcDateDTO dto);
	
	/**예약 시간 제약*/
	public List<String> svcTimeSelect(String userdate);
	
	/**관리자: 방문 견적 신청자 리스트*/
	public List<SvcSelectAllDTO> svcAdminList(int cp,int ls);
	public int getTotalCnt();
	
	/** 관리자:방문 견적 신청자 리스트 (세부 검색)*/
	public List<SvcSelectAllDTO> svcSelectDetail(String minDate, String maxDate, int category, String keyword, List<String> state,int cp, int ls);
	public int svcSelectDetailCnt(String minDate, String maxDate, int category, String keyword, List<String> state);
	
	/**관리자: 예약 삭제*/
	public int svcMemDelete(String idx);
	public int svcDetailDelete(String idx);
  	public int svcDateDelete(String idx);
  	public int svcIngDelete(String idx);
	
	/**정리일상 내역 상세 보기(방문 견적)*/
	public SvcContentDTO svcContent(String idx);
	/**정리일상 내역 상세 보기(정리일상)*/
	public SvcIngDTO svcIngContent(String idx);
	
	/**정보 수정*/
	public int svcMemUpdate(SvcMemDTO dto);
	public int svcDetailUpdate(SvcDetailDTO dto);
	public int svcDateUpdate(SvcDateDTO dto);
	public int svcIngUpdate(SvcIngDTO dto);
	/* public int svcStateUpdate(SvcMemDTO dto); */
	
	/**정리일상 견적 추가*/
	public int svcIngInsert(SvcIngDTO dto);
	
	/**마이페이지: 방문 견적 예약 내역*/
	public List<SvcSelectAllDTO> svcUserList(int cp,int ls,int user_idx);
	public int svcUserListCnt(int user_idx);
	
	/**마이페이지: 정리일상 진행 현황*/
	public List<SvcIngDTO> svcIngList(int cp,int ls,int user_idx);
	public int svcIngListCnt(int user_idx);
	
	/**정리일상 결제 시 상태 변경*/
	//svc_member
	public int updateSvcState(IdxDTO dto);
	//svc_ing
	public int updatePayState(IdxDTO dto);
	
	/**정리일상 결제 취소 시 상태 변경*/
	//svc_member 
	public int svcMemBuyCancel(IdxDTO dto);
	//svc_ing
	public int svcIngBuyCancel(IdxDTO dto);
	
	/**예약 취소*/
	public int svcStateCancel(SvcContentDTO dto);
	public int svcDateCancel(SvcContentDTO dto);
	
	
	/**캘린더*/
	public List<SvcSelectAllDTO> svcAdminLista();
	public List<SvcIngDTO> svcIngCalList();
	public String sveIngCalName(String svc_idx);
	
	/***/
	public List<Map<String, Object>> svcKnowData(); 
	public int svcTotalCnt();
}
