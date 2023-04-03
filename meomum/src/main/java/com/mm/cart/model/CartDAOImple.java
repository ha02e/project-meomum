package com.mm.cart.model;

import java.util.List;
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
	
	
	//장바구니 중복 확인
	@Override
	public List<CartDTO> cartCheck(int pro_idx) {
		List<CartDTO> lists=sqlMap.selectList("cartCheck",pro_idx);
		return lists;
	}
	
	
	//중복된 상품의 개수 추가
	@Override
	public int cartMoreInsert(CartDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}
	

}
