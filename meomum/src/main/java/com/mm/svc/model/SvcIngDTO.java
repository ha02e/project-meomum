package com.mm.svc.model;

public class SvcIngDTO {
	public int svc_ing_idx;
	public String svc_idx;
	public int user_idx;
	public String svc_datetime;
	public int estimated;
	public int discount;
	public String type;
	public int total;
	public String pay_state;
	
	public SvcIngDTO() {
		super();
	}

	public SvcIngDTO(int svc_ing_idx, String svc_idx, int user_idx, String svc_datetime, int estimated, int discount,
			String type, int total, String pay_state) {
		super();
		this.svc_ing_idx = svc_ing_idx;
		this.svc_idx = svc_idx;
		this.user_idx = user_idx;
		this.svc_datetime = svc_datetime;
		this.estimated = estimated;
		this.discount = discount;
		this.type = type;
		this.total = total;
		this.pay_state = pay_state;
	}

	public int getSvc_ing_idx() {
		return svc_ing_idx;
	}

	public void setSvc_ing_idx(int svc_ing_idx) {
		this.svc_ing_idx = svc_ing_idx;
	}

	public String getSvc_idx() {
		return svc_idx;
	}

	public void setSvc_idx(String svc_idx) {
		this.svc_idx = svc_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getSvc_datetime() {
		return svc_datetime;
	}

	public void setSvc_datetime(String svc_datetime) {
		this.svc_datetime = svc_datetime;
	}

	public int getEstimated() {
		return estimated;
	}

	public void setEstimated(int estimated) {
		this.estimated = estimated;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getPay_state() {
		return pay_state;
	}

	public void setPay_state(String pay_state) {
		this.pay_state = pay_state;
	}
}
