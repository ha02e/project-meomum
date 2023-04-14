package com.mm.payment.model;

public interface PaymentDAO {
	public int paymentInsert(PaymentDTO dto);
	public PaymentDTO paymentSelect(String cate_idx);

}
