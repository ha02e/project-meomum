package com.mm.order.model;

public class OrderProDTO {
	private String order_idx;
	private int user_idx;
	private int pro_idx;
	private int pro_amount;
	
	
	public OrderProDTO() {
		super();
	}

	public OrderProDTO(String order_idx, int user_idx, int pro_idx, int pro_amount) {
		super();
		this.order_idx = order_idx;
		this.user_idx = user_idx;
		this.pro_idx = pro_idx;
		this.pro_amount = pro_amount;
	}

	
	public String getOrder_idx() {
		return order_idx;
	}

	public void setOrder_idx(String order_idx) {
		this.order_idx = order_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getPro_idx() {
		return pro_idx;
	}

	public void setPro_idx(int pro_idx) {
		this.pro_idx = pro_idx;
	}

	public int getPro_amount() {
		return pro_amount;
	}

	public void setPro_amount(int pro_amount) {
		this.pro_amount = pro_amount;
	}
	
}
