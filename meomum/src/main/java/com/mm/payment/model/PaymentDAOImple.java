package com.mm.payment.model;

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
}
