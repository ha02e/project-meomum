package com.mm.order.model;

import java.sql.Date;

public class OrderReportDTO {
	private String order_idx;
	private int pro_idx;
	private String pro_name;
	private int pro_amount;
	private int user_idx;
	private String user_name;
	private String user_tel;
	private int amount;
	private int order_status;
	private Date order_date;
	private String receiver;
	private String receiver_tel;
	private String order_msg;
	private String ship_addr;
	private Date sub_start;
	private Date sub_end;
	
	
	public OrderReportDTO() {
		super();
	}


	public OrderReportDTO(String order_idx, int pro_idx, String pro_name, int pro_amount, int user_idx,
			String user_name, String user_tel, int amount, int order_status, Date order_date, String receiver,
			String receiver_tel, String order_msg, String ship_addr, Date sub_start, Date sub_end) {
		super();
		this.order_idx = order_idx;
		this.pro_idx = pro_idx;
		this.pro_name = pro_name;
		this.pro_amount = pro_amount;
		this.user_idx = user_idx;
		this.user_name = user_name;
		this.user_tel = user_tel;
		this.amount = amount;
		this.order_status = order_status;
		this.order_date = order_date;
		this.receiver = receiver;
		this.receiver_tel = receiver_tel;
		this.order_msg = order_msg;
		this.ship_addr = ship_addr;
		this.sub_start = sub_start;
		this.sub_end = sub_end;
	}


	public String getOrder_idx() {
		return order_idx;
	}


	public void setOrder_idx(String order_idx) {
		this.order_idx = order_idx;
	}


	public int getPro_idx() {
		return pro_idx;
	}


	public void setPro_idx(int pro_idx) {
		this.pro_idx = pro_idx;
	}


	public String getPro_name() {
		return pro_name;
	}


	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}


	public int getPro_amount() {
		return pro_amount;
	}


	public void setPro_amount(int pro_amount) {
		this.pro_amount = pro_amount;
	}


	public int getUser_idx() {
		return user_idx;
	}


	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
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


	public String getReceiver() {
		return receiver;
	}


	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}


	public String getReceiver_tel() {
		return receiver_tel;
	}


	public void setReceiver_tel(String receiver_tel) {
		this.receiver_tel = receiver_tel;
	}


	public String getOrder_msg() {
		return order_msg;
	}


	public void setOrder_msg(String order_msg) {
		this.order_msg = order_msg;
	}


	public String getShip_addr() {
		return ship_addr;
	}


	public void setShip_addr(String ship_addr) {
		this.ship_addr = ship_addr;
	}


	public Date getSub_start() {
		return sub_start;
	}


	public void setSub_start(Date sub_start) {
		this.sub_start = sub_start;
	}


	public Date getSub_end() {
		return sub_end;
	}


	public void setSub_end(Date sub_end) {
		this.sub_end = sub_end;
	}

}
