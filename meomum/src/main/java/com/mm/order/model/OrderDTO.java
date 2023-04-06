package com.mm.order.model;

import java.sql.Date;

public class OrderDTO {
	
	private String order_idx;
	private int user_idx;
	private String order_name;
	private Date sub_start;
	private Date sub_end;
	private String order_pcode;
	private String receiver;
	private String receiver_tel;
	private String order_addr;
	private String order_detail;
	private String order_msg;
	private int using_point;
	private int pay_date;
	private int amount;
	private int order_status;
	private Date order_date;
	private String order_tos;
	
	public OrderDTO() {
		super();
	}

	public OrderDTO(String order_idx, int user_idx, String order_name, Date sub_start, Date sub_end, String order_pcode,
			String receiver, String receiver_tel, String order_addr, String order_detail, String order_msg,
			int using_point, int pay_date, int amount, int order_status, Date order_date, String order_tos) {
		super();
		this.order_idx = order_idx;
		this.user_idx = user_idx;
		this.order_name = order_name;
		this.sub_start = sub_start;
		this.sub_end = sub_end;
		this.order_pcode = order_pcode;
		this.receiver = receiver;
		this.receiver_tel = receiver_tel;
		this.order_addr = order_addr;
		this.order_detail = order_detail;
		this.order_msg = order_msg;
		this.using_point = using_point;
		this.pay_date = pay_date;
		this.amount = amount;
		this.order_status = order_status;
		this.order_date = order_date;
		this.order_tos = order_tos;
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

	public String getOrder_name() {
		return order_name;
	}

	public void setOrder_name(String order_name) {
		this.order_name = order_name;
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

	public String getOrder_pcode() {
		return order_pcode;
	}

	public void setOrder_pcode(String order_pcode) {
		this.order_pcode = order_pcode;
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

	public String getOrder_addr() {
		return order_addr;
	}

	public void setOrder_addr(String order_addr) {
		this.order_addr = order_addr;
	}

	public String getOrder_detail() {
		return order_detail;
	}

	public void setOrder_detail(String order_detail) {
		this.order_detail = order_detail;
	}

	public String getOrder_msg() {
		return order_msg;
	}

	public void setOrder_msg(String order_msg) {
		this.order_msg = order_msg;
	}

	public int getUsing_point() {
		return using_point;
	}

	public void setUsing_point(int using_point) {
		this.using_point = using_point;
	}

	public int getPay_date() {
		return pay_date;
	}

	public void setPay_date(int pay_date) {
		this.pay_date = pay_date;
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

	public String getOrder_tos() {
		return order_tos;
	}

	public void setOrder_tos(String order_tos) {
		this.order_tos = order_tos;
	}
	
	
	
	
	
	
}
