package com.mm.point.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class PointDAOImple implements PointDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public PointDAOImple(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
//	@Override
//	public PointDTO pointTotal(int user_idx) {
//
//	PointDTO dto = sqlMap.selectOne("pointTotal",user_idx);
//	return dto;
//	}
	
	/**사용자 총 포인트 조회*/
	@Override
	public int pointTotal(int user_idx) {
		int result = sqlMap.selectOne("pointTotal", user_idx);
		return result;
	}
	
	/**포인트 적립 및 사용*/
	@Override
	public int pointInsert(PointDTO dto) {
		int count = sqlMap.insert("pointInsert",dto);
		return count;
	}
	
	/**정리일상 결제 포인트 조회*/
	@Override
	public PointDTO svcPointSelect(String cate_idx) {
		// TODO Auto-generated method stub
		return null;
	}
	

	/**포인트 리스트*/
	@Override
	public List<PointDTO> pointList(int user_idx,int cp, int ls) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;

		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("user_idx", user_idx);
		
		List<PointDTO> lists = sqlMap.selectList("pointList", map);
		return lists;
	}
	
	/**포인트 총 개수*/
	@Override
	public int pointCnt(int user_idx) {
		int cnt = sqlMap.selectOne("pointCnt",user_idx);
		return cnt;
	}
	
	
	/**관리자 포인트 지급/회수*/
	@Override
	public int pointInsertManager(PointDTO dto) {
		int count = sqlMap.insert("pointInsertManager",dto);
		return count;
	}
}
