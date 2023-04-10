package com.mm.point.model;

import java.sql.Date;

public class PointDTO {
	private int point_idx;
	private String cate_idx;
	private int user_idx;
	private int point_use;
	private Date point_usedate;  
	private String point_info; 
	private int point_num;
	private int result;
	
	public PointDTO() {
		super();
	}

	public PointDTO(int point_idx, String cate_idx, int user_idx, int point_use, Date point_usedate, String point_info,
			int point_num, int result) {
		super();
		this.point_idx = point_idx;
		this.cate_idx = cate_idx;
		this.user_idx = user_idx;
		this.point_use = point_use;
		this.point_usedate = point_usedate;
		this.point_info = point_info;
		this.point_num = point_num;
		this.result = result;
	}

	public int getPoint_idx() {
		return point_idx;
	}

	public void setPoint_idx(int point_idx) {
		this.point_idx = point_idx;
	}

	public String getCate_idx() {
		return cate_idx;
	}

	public void setCate_idx(String cate_idx) {
		this.cate_idx = cate_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getPoint_use() {
		return point_use;
	}

	public void setPoint_use(int point_use) {
		this.point_use = point_use;
	}

	public Date getPoint_usedate() {
		return point_usedate;
	}

	public void setPoint_usedate(Date point_usedate) {
		this.point_usedate = point_usedate;
	}

	public String getPoint_info() {
		return point_info;
	}

	public void setPoint_info(String point_info) {
		this.point_info = point_info;
	}

	public int getPoint_num() {
		return point_num;
	}

	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}

	public int getResult() {
		return result;
	}

	public void setResult(int result) {
		this.result = result;
	}
}
