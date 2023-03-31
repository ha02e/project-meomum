package com.mm.svc.model;

public class SvcDateDTO {
	
	private String svc_idx;
	private int user_idx;
	private String svc_date;
	private String svc_time;
	
	
	public SvcDateDTO() {
		super();
	}

	public SvcDateDTO(String svc_idx, int user_idx, String svc_date, String svc_time) {
		super();
		this.svc_idx = svc_idx;
		this.user_idx = user_idx;
		this.svc_date = svc_date;
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

	public String getSvc_date() {
		return svc_date;
	}

	public void setSvc_date(String svc_date) {
		this.svc_date = svc_date;
	}

	public String getSvc_time() {
		return svc_time;
	}

	public void setSvc_time(String svc_time) {
		this.svc_time = svc_time;
	}
	

}
