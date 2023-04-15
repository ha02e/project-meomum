package com.mm.turnback.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mm.order.model.MyOrderListDTO;

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
	public List<MyOrderListDTO> myReturnProList(Map map) {
		List<MyOrderListDTO> lists = sqlMap.selectList("myReturnProList", map);
		return lists;
	}
	
	@Override
	public int myReturnProListCnt(Map map) {
		int count=sqlMap.selectOne("myReturnProListCnt", map);
		count = count == 0 ? 1 : count;
		return count;
	}
	
	@Override
	public List<ReturnListDTO> returnProList(Map map) {
		List<ReturnListDTO> lists = sqlMap.selectList("returnProList",map);
		return lists;
	}
	
	@Override
	public int returnProListCnt(Map map) {
		int count = sqlMap.selectOne("returnProListCnt", map);
		count = count == 0 ? 1 : count;
		return count;
	}
	
	@Override
	public ReturnListDTO returnData(Map map) {
		ReturnListDTO dto=sqlMap.selectOne("returnData", map);
		return dto;
	}
	
	@Override
	public int returnStartUpdate(Map map) {
		int count=sqlMap.update("returnStartUpdate", map);
		return count;
	}
	
	@Override
	public int returnNoUpdate(Map map) {
		int count=sqlMap.update("returnNoUpdate", map);
		return count;
	}
}
