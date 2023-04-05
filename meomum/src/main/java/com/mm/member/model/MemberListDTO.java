package com.mm.member.model;

import java.sql.Date;

public class MemberListDTO {
	private int user_idx;
	private String user_info;
	private String user_id;
	private String user_name;
	private String user_tel;
	private Date joindate;
	private int svcCount;
	private int orderCount;
	private int reviewCount;
	private String user_memo;
	
	public MemberListDTO() {
		super();
	}
	public MemberListDTO(int user_idx, String user_info, String user_id, String user_name, String user_tel,
			Date joindate, int svcCount, int orderCount, int reviewCount, String user_memo) {
		super();
		this.user_idx = user_idx;
		this.user_info = user_info;
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_tel = user_tel;
		this.joindate = joindate;
		this.svcCount = svcCount;
		this.orderCount = orderCount;
		this.reviewCount = reviewCount;
		this.user_memo = user_memo;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_info() {
		return user_info;
	}
	public void setUser_info(String user_info) {
		this.user_info = user_info;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	public int getSvcCount() {
		return svcCount;
	}
	public void setSvcCount(int svcCount) {
		this.svcCount = svcCount;
	}
	public int getOrderCount() {
		return orderCount;
	}
	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}
	public int getReviewCount() {
		return reviewCount;
	}
	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}
	public String getUser_memo() {
		return user_memo;
	}
	public void setUser_memo(String user_memo) {
		this.user_memo = user_memo;
	}
	
	
}
