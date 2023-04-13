package com.mm.turnback.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class ReturnDAOImple implements ReturnDAO {
	
	private SqlSessionTemplate sqlMap;

	public ReturnDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	
	@Override
	public int returnApplyInsert(ReturnDTO dto) {
		int count=sqlMap.insert("returnApplyInsert",dto);
		return count;
	}
	
	@Override
	public List<ReturnListDTO> returnProList(Map map) {
		List<ReturnListDTO> lists = sqlMap.selectList("returnProList",map);
		return lists;
	}
	
	@Override
	public int returnProListCnt() {
		int count = sqlMap.selectOne("returnProListCnt");
		count = count == 0 ? 1 : count;
		return count;
	}
	
	@Override
	public ReturnListDTO returnData(String order_idx) {
		ReturnListDTO dto=sqlMap.selectOne("returnData", order_idx);
		return dto;
	}
}
