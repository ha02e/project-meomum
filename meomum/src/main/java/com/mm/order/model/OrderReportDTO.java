package com.mm.order.model;

import java.sql.Date;

public class OrderReportDTO {
	private String order_idx;
	private String pro_name;
	private String user_name;
	private String user_tel;
	private int amount;
	private int order_status;
	private Date order_date;
	
	
	public OrderReportDTO() {
		super();
	}

	public OrderReportDTO(String order_idx, String pro_name, String user_name, String user_tel, int amount,
			int order_status, Date order_date) {
		super();
		this.order_idx = order_idx;
		this.pro_name = pro_name;
		this.user_name = user_name;
		this.user_tel = user_tel;
		this.amount = amount;
		this.order_status = order_status;
		this.order_date = order_date;
	}

	
	public String getOrder_idx() {
		return order_idx;
	}

	public void setOrder_idx(String order_idx) {
		this.order_idx = order_idx;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getOrder_status() {
		return order_status;
	}

	public void setOrder_status(int order_status) {
		this.order_status = order_status;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	
}
