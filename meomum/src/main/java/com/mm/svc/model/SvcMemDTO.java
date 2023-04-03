package com.mm.svc.model;

/**예약 신청자 정보 테이블(svc_member) DTO*/
public class SvcMemDTO {
	private String svc_idx;
	private int user_idx;
	private String user_name;
	private String user_tel;
	private String user_pcode;
	private String user_addr;
	private String user_detail;
	private String svc_state;
	
	public SvcMemDTO() {
		super();
	}

	public SvcMemDTO(String svc_idx, int user_idx, String user_name, String user_tel, String user_pcode,
			String user_addr, String user_detail, String svc_state) {
		super();
		this.svc_idx = svc_idx;
		this.user_idx = user_idx;
		this.user_name = user_name;
		this.user_tel = user_tel;
		this.user_pcode = user_pcode;
		this.user_addr = user_addr;
		this.user_detail = user_detail;
		this.svc_state = svc_state;
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

	public String getUser_pcode() {
		return user_pcode;
	}

	public void setUser_pcode(String user_pcode) {
		this.user_pcode = user_pcode;
	}

	public String getUser_addr() {
		return user_addr;
	}

	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}

	public String getUser_detail() {
		return user_detail;
	}

	public void setUser_detail(String user_detail) {
		this.user_detail = user_detail;
	}

	public String getSvc_state() {
		return svc_state;
	}

	public void setSvc_state(String svc_state) {
		this.svc_state = svc_state;
	}	
}
