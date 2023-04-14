package com.mm.shipping.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ShippingDAOImple implements ShippingDAO {
	
	private SqlSessionTemplate sqlMap;

	public ShippingDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}


	@Override
	public int shipInsert(ShippingDTO dto) {
		int count=sqlMap.insert("shipInsert", dto);
		return count;
	}
	
	@Override
	public int returnShipInsert(ShippingDTO dto) {
		int count=sqlMap.insert("returnShipInsert", dto);
		return count;
	}
	
}
