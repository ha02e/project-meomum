package com.mm.ask.model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class CommentsDTO {
	private int comm_idx;
	private int ask_idx;
	private int user_idx;
	private java.sql.Timestamp comm_date;
	private String comm_cont;
	public CommentsDTO() {
		super();
	}
	public CommentsDTO(int comm_idx, int ask_idx, int user_idx, Timestamp comm_date, String comm_cont) {
		super();
		this.comm_idx = comm_idx;
		this.ask_idx = ask_idx;
		this.user_idx = user_idx;
		this.comm_date = comm_date;
		this.comm_cont = comm_cont;
	}
	public int getComm_idx() {
		return comm_idx;
	}
	public void setComm_idx(int comm_idx) {
		this.comm_idx = comm_idx;
	}
	public int getAsk_idx() {
		return ask_idx;
	}
	public void setAsk_idx(int ask_idx) {
		this.ask_idx = ask_idx;
	}
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getComm_date() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(this.comm_date);
	}
	public void setComm_date(java.sql.Timestamp comm_date) {
		this.comm_date = comm_date;
	}
	public String getComm_cont() {
		return comm_cont;
	}
	public void setComm_cont(String comm_cont) {
		this.comm_cont = comm_cont;
	}
	
	
}
