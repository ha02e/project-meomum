package com.mm.payment.model;

import java.util.List;
import java.util.Map;

public interface PaymentDAO {
	public int paymentInsert(PaymentDTO dto);
	public PaymentDTO paymentSelect(String cate_idx);
	
	/**통계*/
	public int payTotal();
	public List<Map<String, Object>> payOutline();
	public List<PaymentDTO> payList(int cp, int ls);
	public int payCnt();

}
