package com.mm.order.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.mm.pro.model.ProDTO;

public class OrderDAOImple implements OrderDAO {
	
	private SqlSessionTemplate sqlMap;
	

	public OrderDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	@Override
	public ProDTO orderList(int idx) {
		ProDTO dto=sqlMap.selectOne("orderList", idx);
		return dto;
	}
	
	@Override
	public int orderInsert(OrderDTO dto) {
		int count=sqlMap.insert("orderInsert", dto);
		return count;
	}
	
	@Override
	public List<OrderDTO> myOrderList(Integer idx) {
		List<OrderDTO> list=sqlMap.selectList("myOrderList", idx);
		return list;
	}
}
