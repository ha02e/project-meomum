package com.mm.payment.model;

import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class PaymentDAOImple implements PaymentDAO {
	
	private SqlSessionTemplate sqlMap;
	
	
	public PaymentDAOImple(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	 @Override
	public int paymentInsert(PaymentDTO dto) {
		int count = sqlMap.insert("paymentInsert", dto);
		return count;
	}
	 
	 @Override
	public PaymentDTO paymentSelect(String cate_idx) {
		PaymentDTO dto = sqlMap.selectOne("paymentSelect",cate_idx);
		return dto;
	}
}
