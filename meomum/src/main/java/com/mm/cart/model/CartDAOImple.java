package com.mm.cart.model;

import java.util.*;
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
	public int cartCheck(int pro_idx,int user_idx) {
		Map map=new HashMap();
		map.put("pro_idx", pro_idx);
		map.put("user_idx", user_idx);	
		int count=sqlMap.selectOne("cartCheck",map);
		return count;
	}
	
	//장바구니 리스트 출력
	@Override
	public List<CartDTO> cartList(int user_idx) {
		List<CartDTO> lists=sqlMap.selectList("cartList", user_idx);
		return lists;
	}

	//장바구니 삭제
	@Override
	public int cartDelete(int cart_idx) {
		int count=sqlMap.delete("cartDelete",cart_idx);
		return count;
	}
	
	
	//장바구니 수량 조절
	@Override
	public int cartNumUpdate(int cart_amount, int cart_idx) {
		Map map=new HashMap();
		map.put("cart_amount", cart_amount);
		map.put("cart_idx", cart_idx);
		int count=sqlMap.update("cartNumUpdate",map);
		return count;
	}
	   @Override
	    public int userCartCount(int user_idx) {
	        int result = sqlMap.selectOne("userCartCount", user_idx);
	        return result;
	    }
	   
@Override
	public CartDTO orderListCartIDX(int cart_idx) {
	CartDTO dto= sqlMap.selectOne("orderListCartIDX", cart_idx);
		return dto;
	}

	

}
