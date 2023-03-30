package com.mm.member.model;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class MemberDTO {
	private int user_idx;
	private String user_id;
	private String user_jointype;
	private String user_info;
	private String user_pwd;
	private String user_name;
	private String user_pcode;
	private String user_addr;
	private String addr_detail;
	private String user_tel;
	private java.sql.Timestamp joindate;
	private String tos;
	private String user_pia;
	private String user_memo;
	public MemberDTO() {
		super();
	}
	public MemberDTO(int user_idx, String user_id, String user_jointype, String user_info, String user_pwd,
			String user_name, String user_pcode, String user_addr, String addr_detail, String user_tel,
			Timestamp joindate, String tos, String user_pia, String user_memo) {
		super();
		this.user_idx = user_idx;
		this.user_id = user_id;
		this.user_jointype = user_jointype;
		this.user_info = user_info;
		this.user_pwd = user_pwd;
		this.user_name = user_name;
		this.user_pcode = user_pcode;
		this.user_addr = user_addr;
		this.addr_detail = addr_detail;
		this.user_tel = user_tel;
		this.joindate = joindate;
		this.tos = tos;
		this.user_pia = user_pia;
		this.user_memo = user_memo;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_jointype() {
		return user_jointype;
	}
	public void setUser_jointype(String user_jointype) {
		this.user_jointype = user_jointype;
	}
	public String getUser_info() {
		return user_info;
	}
	public void setUser_info(String user_info) {
		this.user_info = user_info;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getUser_tel() {
		return user_tel;
	}
	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}
	public String getJoindate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd, HH:mm:ss");
		return sdf.format(this.joindate);
	}

	public void setJoindate(java.sql.Timestamp joindate) {
		this.joindate = joindate;
	}
	public String getTos() {
		return tos;
	}
	public void setTos(String tos) {
		this.tos = tos;
	}
	public String getUser_pia() {
		return user_pia;
	}
	public void setUser_pia(String user_pia) {
		this.user_pia = user_pia;
	}
	public String getUser_memo() {
		return user_memo;
	}
	public void setUser_memo(String user_memo) {
		this.user_memo = user_memo;
	}
	
	
	
}
