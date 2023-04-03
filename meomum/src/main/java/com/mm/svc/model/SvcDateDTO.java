package com.mm.svc.model;

/**방문 견적 예약 일자 테이블(svc_date) DTO*/
public class SvcDateDTO {
	private int svc_date_idx;
	private String svc_idx;
	private int user_idx;
	private String svc_days;
	private String svc_time;
	
	public SvcDateDTO() {
		super();
	}

	public SvcDateDTO(int svc_date_idx, String svc_idx, int user_idx, String svc_days, String svc_time) {
		super();
		this.svc_date_idx = svc_date_idx;
		this.svc_idx = svc_idx;
		this.user_idx = user_idx;
		this.svc_days = svc_days;
		this.svc_time = svc_time;
	}


	public int getSvc_date_idx() {
		return svc_date_idx;
	}


	public void setSvc_date_idx(int svc_date_idx) {
		this.svc_date_idx = svc_date_idx;
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
