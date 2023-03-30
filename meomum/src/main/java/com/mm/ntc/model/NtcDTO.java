package com.mm.ntc.model;

import java.sql.Date;

public class NtcDTO {

	private int ntc_idx;
	private String ntc_title;
	private String ntc_content;
	private String  ntc_img;
	private Date ntc_date;
	private String ntc_ctg;
	private int ntc_viewCnt;
	
	public NtcDTO() {
		super();
	}

	public NtcDTO(int ntc_idx, String ntc_title, String ntc_content, String ntc_img, Date ntc_date, String ntc_ctg,
			int ntc_viewCnt) {
		super();
		this.ntc_idx = ntc_idx;
		this.ntc_title = ntc_title;
		this.ntc_content = ntc_content;
		this.ntc_img = ntc_img;
		this.ntc_date = ntc_date;
		this.ntc_ctg = ntc_ctg;
		this.ntc_viewCnt = ntc_viewCnt;
	}

	public int getNtc_idx() {
		return ntc_idx;
	}

	public void setNtc_idx(int ntc_idx) {
		this.ntc_idx = ntc_idx;
	}

	public String getNtc_title() {
		return ntc_title;
	}

	public void setNtc_title(String ntc_title) {
		this.ntc_title = ntc_title;
	}

	public String getNtc_content() {
		return ntc_content;
	}

	public void setNtc_content(String ntc_content) {
		this.ntc_content = ntc_content;
	}

	public String getNtc_img() {
		return ntc_img;
	}

	public void setNtc_img(String ntc_img) {
		this.ntc_img = ntc_img;
	}

	public Date getNtc_date() {
		return ntc_date;
	}

	public void setNtc_date(Date ntc_date) {
		this.ntc_date = ntc_date;
	}

	public String getNtc_ctg() {
		return ntc_ctg;
	}

	public void setNtc_ctg(String ntc_ctg) {
		this.ntc_ctg = ntc_ctg;
	}

	public int getNtc_viewCnt() {
		return ntc_viewCnt;
	}

	public void setNtc_viewCnt(int ntc_viewCnt) {
		this.ntc_viewCnt = ntc_viewCnt;
	}
	
	
	
	
	
	
	
	
	
}
