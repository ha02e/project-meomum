package com.mm.svc.model;

import java.sql.Date;

/**방문 견적 예약 상세 내용 테이블(svc_detail) DTO*/
public class SvcDetailDTO {
	private int svc_detail_idx;
	private String svc_idx;
	private int user_idx;
	private String svc_type;
	private String svc_py;
	private String svc_area;
	private String svc_req;
	private String svc_know;
	private String svc_pia;
	private Date svc_regdate;
	private String svc_memo;
	
	public SvcDetailDTO() {
		super();
	}

	public SvcDetailDTO(int svc_detail_idx, String svc_idx, int user_idx, String svc_type, String svc_py,
			String svc_area, String svc_req, String svc_know, String svc_pia, Date svc_regdate, String svc_memo) {
		super();
		this.svc_detail_idx = svc_detail_idx;
		this.svc_idx = svc_idx;
		this.user_idx = user_idx;
		this.svc_type = svc_type;
		this.svc_py = svc_py;
		this.svc_area = svc_area;
		this.svc_req = svc_req;
		this.svc_know = svc_know;
		this.svc_pia = svc_pia;
		this.svc_regdate = svc_regdate;
		this.svc_memo = svc_memo;
	}

	public int getSvc_detail_idx() {
		return svc_detail_idx;
	}

	public void setSvc_detail_idx(int svc_detail_idx) {
		this.svc_detail_idx = svc_detail_idx;
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

	public String getSvc_type() {
		return svc_type;
	}

	public void setSvc_type(String svc_type) {
		this.svc_type = svc_type;
	}

	public String getSvc_py() {
		return svc_py;
	}

	public void setSvc_py(String svc_py) {
		this.svc_py = svc_py;
	}

	public String getSvc_area() {
		return svc_area;
	}

	public void setSvc_area(String svc_area) {
		this.svc_area = svc_area;
	}

	public String getSvc_req() {
		return svc_req;
	}

	public void setSvc_req(String svc_req) {
		this.svc_req = svc_req;
	}

	public String getSvc_know() {
		return svc_know;
	}

	public void setSvc_know(String svc_know) {
		this.svc_know = svc_know;
	}

	public String getSvc_pia() {
		return svc_pia;
	}

	public void setSvc_pia(String svc_pia) {
		this.svc_pia = svc_pia;
	}

	public Date getSvc_regdate() {
		return svc_regdate;
	}

	public void setSvc_regdate(Date svc_regdate) {
		this.svc_regdate = svc_regdate;
	}

	public String getSvc_memo() {
		return svc_memo;
	}

	public void setSvc_memo(String svc_memo) {
		this.svc_memo = svc_memo;
	}
	
	
	
}
