package com.mm.cart.model;

import org.mybatis.spring.SqlSessionTemplate;

public class CartDAOImple implements CartDAO {

	private SqlSessionTemplate sqlMap;
	
	
	public CartDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	

	//장바구니 추가
	@Override
	public int cartInsert(CartDTO dto) {
		int count=sqlMap.insert("cartInsert",dto);
		return count;
	}

}
