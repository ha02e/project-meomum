package com.mm.svc.model;

import java.util.ArrayList;
import java.util.List;

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
	
	/**방문 견적 예약 신청자 리트스*/
	@Override
	public List<SvcSelectAllDTO> svcList() {
		List<SvcSelectAllDTO> list = sqlMap.selectList("svcList");
		return list;
	}
	
	/**예약 상세 보기*/
	@Override
	public List<SvcContentDTO> svcContent(String idx) {
		List<SvcContentDTO> list = sqlMap.selectList("svcContent",idx);
		return list;
	}
}
