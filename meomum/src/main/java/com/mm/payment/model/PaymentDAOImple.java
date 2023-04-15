package com.mm.payment.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mm.svc.model.SvcIngDTO;

public class PaymentDAOImple implements PaymentDAO {
	
	private SqlSessionTemplate sqlMap;
	
	
	public PaymentDAOImple(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	/**결제*/
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
	 
	 /**통계*/
	 @Override
	public int payTotal() {
		int sum = sqlMap.selectOne("payTotal");
		return sum;
	}
	 
	 @Override
	public List<Map<String, Object>> payOutline() {
		 List<Map<String, Object>> list = sqlMap.selectList("payOutline");
		return list;
	}
	 
	 @Override
	public List<PaymentDTO> payList(int cp, int ls) {
		 	int start = (cp-1)*ls+1;
			int end = cp*ls;
			Map map = new HashMap();
			map.put("start", start);
			map.put("end", end);
			
			List<PaymentDTO> list = sqlMap.selectList("payList",map);
			
		return list;
	}
		
	 @Override
	public int payCnt() {
		int count = sqlMap.selectOne("payCnt");
		return count;
	}
}
