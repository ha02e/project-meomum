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

	/**신청자 정보 저장*/
	@Override
	public int svcMemInsert(SvcMemDTO dto) {
		int count = sqlMap.insert("svcMemInsert",dto);
		return count;
	}
	
	/**신청 상세 내용 저장*/
	@Override
	public int svcDetailInsert(SvcDetailDTO dto) {
		int count = sqlMap.insert("svcDetailInsert",dto);
		return count;
	}
	
	/**신청 일자 저장*/
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
	
	/**관리자: 방문 견적 예약 신청자 리스트*/
	@Override
	public List<SvcSelectAllDTO> svcAdminList() {
		List<SvcSelectAllDTO> list = sqlMap.selectList("svcAdminList");
		return list;
	}
	
	/**관리자: 방문 예약 신청자 세부 검색*/
	@Override
	public List<SvcSelectAllDTO> svcSelectDetail(String minDate, String maxDate, String category, String keyword, String[] state) {
		Map map = new HashMap();
		map.put("minDate",minDate);
		map.put("maxDate",maxDate);
		map.put("keyword", keyword);
		map.put("category", category);
		map.put("state",state);
		
		List<SvcSelectAllDTO> lists = sqlMap.selectList("svcSelectDetail",map);		
		return lists;
	}
	
	/**공통: 예약 상세 보기*/
	@Override
	public SvcContentDTO svcContent(String idx) {
		SvcContentDTO dto = sqlMap.selectOne("svcContent",idx);
		dto.setSvc_req(dto.getSvc_req().replaceAll("\n", "<br>"));
		return dto;
	}
	
	/**공통: 예약 정보 수정*/
	@Override
	public int svcMemUpdate(SvcMemDTO dto) {
		int count = sqlMap.update("svcMemUpdate", dto);
		return count;
	}
	@Override
	public int svcDetailUpdate(SvcDetailDTO dto) {
		int count = sqlMap.update("svcDetailUpdate", dto);
		return count;
	}
	@Override
	public int svcDateUpdate(SvcDateDTO dto) {
		int count = sqlMap.update("svcDateUpdate", dto);
		return count;
	}
	
	/**마이페이지 : 방문 예약 신청 내역*/
	@Override
	public List<SvcSelectAllDTO> svcUserList(int user_idx) {
		List<SvcSelectAllDTO> list = sqlMap.selectList("svcUserList",user_idx);
		return list;
	}
	
	/**마이페이지: 사용자 방문 견적 예약 삭제*/
	@Override
	public int svcStateCancle(String svc_idx) {
		int count = sqlMap.update("svcStateCancle", svc_idx);
		return count;
	}
	
	@Override
	public int svcDateCancle(String svc_idx) {
		int count = sqlMap.update("svcDateCancle", svc_idx);
		return count;
	}
}
