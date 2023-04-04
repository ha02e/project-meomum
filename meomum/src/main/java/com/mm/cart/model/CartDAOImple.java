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
	public int cartCheck(int pro_idx) {
		int count=sqlMap.selectOne("cartFind",pro_idx);
		return count;
	}
	
	//장바구니 리스트 출력
	@Override
	public List<CartDTO> cartList(int user_idx) {
		List<CartDTO> lists=sqlMap.selectList("cartList", user_idx);
		return lists;
	}


}
