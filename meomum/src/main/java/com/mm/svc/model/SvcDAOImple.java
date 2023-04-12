package com.mm.svc.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class SvcDAOImple implements SvcDAO {
	
	private SqlSessionTemplate sqlMap;
	
	
	public SvcDAOImple(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}

	/**방문 견적 신청*/
	//사용자 정보(svc_member)
	@Override
	public int svcMemInsert(SvcMemDTO dto) {
		int count = sqlMap.insert("svcMemInsert",dto);
		return count;
	}
	
	//신청 내용(svc_detail)
	@Override
	public int svcDetailInsert(SvcDetailDTO dto) {
		int count = sqlMap.insert("svcDetailInsert",dto);
		return count;
	}
	
	//신청 일자(svc_date)
	@Override
	public int svcDateInsert(SvcDateDTO dto) {
		int count = sqlMap.insert("svcDateInsert",dto);
		return count;
	}
	
	/**예약 완료된 날짜 선택 불가능 메서드*/
	@Override
	public List<String> svcTimeSelect(String userdate) {
		List<String> times = sqlMap.selectList("svcTimeSelect", userdate);
		return times;
	}
	
	/**관리자: 방문 견적 신청자 리스트*/
	@Override
	public List<SvcSelectAllDTO> svcAdminList(int cp, int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		List<SvcSelectAllDTO> list = sqlMap.selectList("svcAdminList",map);
		return list;
	}
	
	/**관리자: 방문 견적 예약 신청자 리스트(캘린더)*/
	@Override
	public List<SvcSelectAllDTO> svcAdminLista() {
		List<SvcSelectAllDTO> list = sqlMap.selectList("svcAdminLista");
		return list;
	}
	
	/**관리자:방문 견적 예약 신청자 리스트(총 게시글)*/
	@Override
	public int getTotalCnt() {
		int count = sqlMap.selectOne("svcAdminListCnt");
		count = count==0?1:count;
		return count;
	}
	
	/**관리자: 방문 예약 신청자 세부 검색*/
	@Override
	public List<SvcSelectAllDTO> svcSelectDetail(String minDate, String maxDate, int category, String keyword, List<String> state,int cp,int ls) {
		
		int start = (cp-1)*ls+1;
	    int end = cp*ls;

		Map map = new HashMap();
		map.put("minDate",minDate);
		map.put("maxDate",maxDate);
		map.put("keyword", keyword);
		map.put("category", category);
		map.put("state",state);
		map.put("start", start);
		map.put("end", end);

		List<SvcSelectAllDTO> lists = sqlMap.selectList("svcSelectDetail", map);
		return lists;
	}
	
	/**관리자: 방문 예약 신청자 세부 검색 총 게시글*/
	@Override
	public int svcSelectDetailCnt(String minDate, String maxDate, int category, String keyword, List<String> state) {
		
		Map map = new HashMap();
		map.put("minDate",minDate);
		map.put("maxDate",maxDate);
		map.put("keyword", keyword);
		map.put("category", category);
		map.put("state",state);
		
		int count = sqlMap.selectOne("svcSelectDetailCnt",map);
		count = count==0?1:count;

		return count;
	}

	
	/**관리자&사용자: 방문 견적 예약 상세 보기*/
	@Override
	public SvcContentDTO svcContent(String idx) {
		SvcContentDTO dto = sqlMap.selectOne("svcContent",idx);
		dto.setSvc_req(dto.getSvc_req().replaceAll("\n", "<br>"));
		return dto;
	}
	
	/**관리자: 정리일상 견적 내용 추가*/
	@Override
	public int svcIngInsert(SvcIngDTO dto) {
		int count = sqlMap.insert("svcIngInsert",dto);
		return count;
	}
	
	/**관리자: 정리일상 진행 형황 상세 보기*/
	@Override
	public SvcIngDTO svcIngContent(String idx) {
		SvcIngDTO dto = sqlMap.selectOne("svcIngContent", idx);
		return dto;
	}
	
	/**관리자&사용자: 예약 정보 수정(방문 견적)*/
	//사용자 정보(svc_member)
	@Override
	public int svcMemUpdate(SvcMemDTO dto) {
		int count = sqlMap.update("svcMemUpdate", dto);
		return count;
	}
	//신청 내용(svc_detail)
	@Override
	public int svcDetailUpdate(SvcDetailDTO dto) {
		int count = sqlMap.update("svcDetailUpdate", dto);
		return count;
	}
	//신청 일자(svc_date)
	@Override
	public int svcDateUpdate(SvcDateDTO dto) {
		int count = sqlMap.update("svcDateUpdate", dto);
		return count;
	}
	
	/**관리자: 정리일상 견적 수정*/
	@Override
	public int svcIngUpdate(SvcIngDTO dto) {
		int count = sqlMap.update("svcIngUpdate",dto);
		return count;
	}
	
//	@Override
//	public int svcStateUpdate(SvcMemDTO dto) {
//		int count = sqlMap.update("svcStateUpdate",dto);
//		return count;
//	}
	
	/**마이페이지 : 방문 견적 예약 내역*/
	@Override
	public List<SvcSelectAllDTO> svcUserList(int cp,int ls, int user_idx) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("user_idx", user_idx);
		List<SvcSelectAllDTO> list = sqlMap.selectList("svcUserList",map);
		return list;
	}
	
	/**마이페이지: 방문 견적 예약 내역 총 게시글 수*/
	@Override
	public int svcUserListCnt(int user_idx) {
		int count = sqlMap.selectOne("svcUserListCnt",user_idx);
		count = count==0?1:count;
		return count;
	}
	
	/**마이페이지 : 정리일상 진행 현황*/
	@Override
	public List<SvcIngDTO> svcIngList(int cp,int ls,int user_idx) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("user_idx", user_idx);
		List<SvcIngDTO> list = sqlMap.selectList("svcIngList",map);
		return list;
	}
	
	/**마이페이지: 정리일상 진행 현황 총 게시글*/
	@Override
	public int svcIngListCnt(int user_idx) {
		int count = sqlMap.selectOne("svcAdminListCnt",user_idx);
		count = count==0?1:count;
		return count;
	}

	/**마이페이지: 예약 삭제(방문 견적 신청)*/
	//예약 상태 변경(svc_member)
	@Override
	public int svcStateCancle(SvcContentDTO dto) {
		int count = sqlMap.update("svcStateCancle", dto);
		return count;
	}
	//예약 날짜 비활성화(svc_date)
	@Override
	public int svcDateCancle(SvcContentDTO dto) {
		int count = sqlMap.update("svcDateCancle", dto);
		return count;
	}
	/**정리일상 결제 시 상태 변경*/
	//svc_member
	@Override
	public int updateSvcState(IdxDTO  dto) {
		int count = sqlMap.update("updateSvcState",dto);
		return count;
	}
	//svc_ing
	@Override
	public int updatePayState(IdxDTO dto) {
		int count = sqlMap.update("updatePayState",dto);
		return count;
	}
	
	/**캘린더 서비스 진행 고객 가져오기*/
	@Override
	public List<SvcIngDTO> svcIngCalList() {
		List<SvcIngDTO> lists = sqlMap.selectList("svcIngCalList");
		
	
		return lists;
	}
	/**캘린더 서비스 진행 고객 이름만 가져오기*/
	@Override
	public String sveIngCalName(String svc_idx) {
		String user_name = sqlMap.selectOne("sveIngCalName", svc_idx);
		return user_name;
	}
}
