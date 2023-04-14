package com.mm.turnback.model;

import java.sql.Date;

public class ReturnListDTO {
	private String return_idx;
	private String order_idx;
	private int user_idx;
	private String order_name;
	private String receiver;
	private int pro_idx;
	private String pro_thumb;
	private String pro_name;
	private int order_status;
	private Date return_date;
	private Date return_start_date;
	private Date return_end_date;
	private String return_reason;
	private String return_ok;
	
	
	public ReturnListDTO() {
		super();
	}


	public ReturnListDTO(String return_idx, String order_idx, int user_idx, String order_name, String receiver,
			int pro_idx, String pro_thumb, String pro_name, int order_status, Date return_date, Date return_start_date,
			Date return_end_date, String return_reason, String return_ok) {
		super();
		this.return_idx = return_idx;
		this.order_idx = order_idx;
		this.user_idx = user_idx;
		this.order_name = order_name;
		this.receiver = receiver;
		this.pro_idx = pro_idx;
		this.pro_thumb = pro_thumb;
		this.pro_name = pro_name;
		this.order_status = order_status;
		this.return_date = return_date;
		this.return_start_date = return_start_date;
		this.return_end_date = return_end_date;
		this.return_reason = return_reason;
		this.return_ok = return_ok;
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


	public String getOrder_name() {
		return order_name;
	}


	public void setOrder_name(String order_name) {
		this.order_name = order_name;
	}


	public String getReceiver() {
		return receiver;
	}


	public void setReceiver(String receiver) {
		this.receiver = receiver;
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


	public int getOrder_status() {
		return order_status;
	}


	public void setOrder_status(int order_status) {
		this.order_status = order_status;
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


	public String getReturn_ok() {
		return return_ok;
	}


	public void setReturn_ok(String return_ok) {
		this.return_ok = return_ok;
	}


}
