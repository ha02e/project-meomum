package com.mm.order.model;

import java.sql.Date;

public class MyOrderListDTO {
	
	private String order_idx;
	private int user_idx;
	private int pro_idx;
	private String pro_thumb;
	private String pro_name;
	private Date sub_start;
	private Date sub_end;
	private Date pay_date;
	
	
	public MyOrderListDTO() {
		super();
	}

	public MyOrderListDTO(String order_idx, int user_idx, int pro_idx, String pro_thumb, String pro_name,
			Date sub_start, Date sub_end, Date pay_date) {
		super();
		this.order_idx = order_idx;
		this.user_idx = user_idx;
		this.pro_idx = pro_idx;
		this.pro_thumb = pro_thumb;
		this.pro_name = pro_name;
		this.sub_start = sub_start;
		this.sub_end = sub_end;
		this.pay_date = pay_date;
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

	public String getPro_thumb() {
		return pro_thumb;
	}

	public void setPro_thumb(String pro_thumb) {
		this.pro_thumb = pro_thumb;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
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

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

}
