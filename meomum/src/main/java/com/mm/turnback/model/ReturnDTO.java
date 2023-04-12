package com.mm.turnback.model;

import java.sql.Date;

public class ReturnDTO {
	
	private String return_idx;
	private String order_idx;
	private int user_idx;
	private int pro_idx;
	private Date return_date;
	private Date return_start_date;
	private Date return_end_date;
	private String return_reason;
	
	
	public ReturnDTO() {
		super();
	}


	public ReturnDTO(String return_idx, String order_idx, int user_idx, int pro_idx, Date return_date,
			Date return_start_date, Date return_end_date, String return_reason) {
		super();
		this.return_idx = return_idx;
		this.order_idx = order_idx;
		this.user_idx = user_idx;
		this.pro_idx = pro_idx;
		this.return_date = return_date;
		this.return_start_date = return_start_date;
		this.return_end_date = return_end_date;
		this.return_reason = return_reason;
	}


	public String getReturn_idx() {
		return return_idx;
	}


	public void setReturn_idx(String return_idx) {
		this.return_idx = return_idx;
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


	public Date getReturn_date() {
		return return_date;
	}


	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
	}


	public Date getReturn_start_date() {
		return return_start_date;
	}


	public void setReturn_start_date(Date return_start_date) {
		this.return_start_date = return_start_date;
	}


	public Date getReturn_end_date() {
		return return_end_date;
	}


	public void setReturn_end_date(Date return_end_date) {
		this.return_end_date = return_end_date;
	}


	public String getReturn_reason() {
		return return_reason;
	}


	public void setReturn_reason(String return_reason) {
		this.return_reason = return_reason;
	}

}
