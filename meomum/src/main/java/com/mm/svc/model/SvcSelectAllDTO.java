package com.mm.svc.model;

import java.sql.Date;

public class SvcSelectAllDTO {
	private String svc_idx;
	private int user_idx;
	private String user_name;
	private String user_tel;
	private Date svc_regdate;
	private String svc_state;
	private String svc_days;
	private String svc_time;
	
	public SvcSelectAllDTO() {
		super();
	}

	public SvcSelectAllDTO(String svc_idx, int user_idx, String user_name, String user_tel, Date svc_regdate,
			String svc_state, String svc_days, String svc_time) {
		super();
		this.svc_idx = svc_idx;
		this.user_idx = user_idx;
		this.user_name = user_name;
		this.user_tel = user_tel;
		this.svc_regdate = svc_regdate;
		this.svc_state = svc_state;
		this.svc_days = svc_days;
		this.svc_time = svc_time;
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

	public Date getSvc_regdate() {
		return svc_regdate;
	}

	public void setSvc_regdate(Date svc_regdate) {
		this.svc_regdate = svc_regdate;
	}

	public String getSvc_state() {
		return svc_state;
	}

	public void setSvc_state(String svc_state) {
		this.svc_state = svc_state;
	}

	public String getSvc_days() {
		return svc_days;
	}

	public void setSvc_days(String svc_days) {
		this.svc_days = svc_days;
	}

	public String getSvc_time() {
		return svc_time;
	}

	public void setSvc_time(String svc_time) {
		this.svc_time = svc_time;
	}
}
