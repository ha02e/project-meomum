package com.mm.payment.model;

import java.sql.Date;

public class PaymentDTO {
	private String payment_idx;
	private String cate_idx;
	private String payment_cate;
	private String pay_method;
	private int amount;
	private Date pay_buydate;
	private Date pay_cancleDate;
	private String pay_state;
	
	public PaymentDTO() {
		super();
	}

	public PaymentDTO(String payment_idx, String cate_idx, String payment_cate, String pay_method, int amount,
			Date pay_buydate, Date pay_cancleDate, String pay_state) {
		super();
		this.payment_idx = payment_idx;
		this.cate_idx = cate_idx;
		this.payment_cate = payment_cate;
		this.pay_method = pay_method;
		this.amount = amount;
		this.pay_buydate = pay_buydate;
		this.pay_cancleDate = pay_cancleDate;
		this.pay_state = pay_state;
	}

	public String getPayment_idx() {
		return payment_idx;
	}

	public void setPayment_idx(String payment_idx) {
		this.payment_idx = payment_idx;
	}

	public String getCate_idx() {
		return cate_idx;
	}

	public void setCate_idx(String cate_idx) {
		this.cate_idx = cate_idx;
	}

	public String getPayment_cate() {
		return payment_cate;
	}

	public void setPayment_cate(String payment_cate) {
		this.payment_cate = payment_cate;
	}

	public String getPay_method() {
		return pay_method;
	}

	public void setPay_method(String pay_method) {
		this.pay_method = pay_method;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public Date getPay_buydate() {
		return pay_buydate;
	}

	public void setPay_buydate(Date pay_buydate) {
		this.pay_buydate = pay_buydate;
	}

	public Date getPay_cancleDate() {
		return pay_cancleDate;
	}

	public void setPay_cancleDate(Date pay_cancleDate) {
		this.pay_cancleDate = pay_cancleDate;
	}

	public String getPay_state() {
		return pay_state;
	}

	public void setPay_state(String pay_state) {
		this.pay_state = pay_state;
	}
	
}
