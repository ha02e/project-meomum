package com.mm.ask.model;

import java.sql.*;
import java.text.SimpleDateFormat;

public class AskDTO {
	private int ask_idx;
	private String user_idx;
	private String ask_title;
	private String ask_writer;
	private String ask_tel;
	private String rsd_type;
	private String rsd_py;
	private String ask_file;
	private String ask_content;
	private String ask_pwd;
	private String ask_tos;
	private java.sql.Timestamp ask_wdate;
	private int ask_ask;
	
	/**날짜 변환 */
    private String ask_date; // yyyy-MM-dd 형식의 문자열 저장
    private boolean newicon;
    
	public AskDTO() {
		super();
	}

	public AskDTO(int ask_idx, String user_idx, String ask_title, String ask_writer, String ask_tel, String rsd_type,
			String rsd_py, String ask_file, String ask_content, String ask_pwd, String ask_tos, Timestamp ask_wdate,
			int ask_ask) {
		super();
		this.ask_idx = ask_idx;
		this.user_idx = user_idx;
		this.ask_title = ask_title;
		this.ask_writer = ask_writer;
		this.ask_tel = ask_tel;
		this.rsd_type = rsd_type;
		this.rsd_py = rsd_py;
		this.ask_file = ask_file;
		this.ask_content = ask_content;
		this.ask_pwd = ask_pwd;
		this.ask_tos = ask_tos;
		this.ask_wdate = ask_wdate;
		this.ask_ask = ask_ask;
	}

	public int getAsk_idx() {
		return ask_idx;
	}

	public void setAsk_idx(int ask_idx) {
		this.ask_idx = ask_idx;
	}

	public String getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(String user_idx) {
		this.user_idx = user_idx;
	}

	public String getAsk_title() {
		return ask_title;
	}

	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}

	public String getAsk_writer() {
		return ask_writer;
	}

	public void setAsk_writer(String ask_writer) {
		this.ask_writer = ask_writer;
	}

	public String getAsk_tel() {
		return ask_tel;
	}

	public void setAsk_tel(String ask_tel) {
		this.ask_tel = ask_tel;
	}

	public String getRsd_type() {
		return rsd_type;
	}

	public void setRsd_type(String rsd_type) {
		this.rsd_type = rsd_type;
	}

	public String getRsd_py() {
		return rsd_py;
	}

	public void setRsd_py(String rsd_py) {
		this.rsd_py = rsd_py;
	}

	public String getAsk_file() {
		return ask_file;
	}

	public void setAsk_file(String ask_file) {
		this.ask_file = ask_file;
	}

	public String getAsk_content() {
		return ask_content;
	}

	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}

	public String getAsk_pwd() {
		return ask_pwd;
	}

	public void setAsk_pwd(String ask_pwd) {
		this.ask_pwd = ask_pwd;
	}

	public String getAsk_tos() {
		return ask_tos;
	}

	public void setAsk_tos(String ask_tos) {
		this.ask_tos = ask_tos;
	}

	public String getAsk_wdate() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		return sdf.format(this.ask_wdate);
	}


	public void setAsk_wdate(java.sql.Timestamp ask_wdate) {
		this.ask_wdate = ask_wdate;
	}

	public int getAsk_ask() {
		return ask_ask;
	}

	public void setAsk_ask(int ask_ask) {
		this.ask_ask = ask_ask;
	}


	
	
	public String getAsk_date() {
		return ask_date;
	}

	public void setAsk_date(String ask_date) {
		this.ask_date = ask_date;
	}

	public String getAsk_wdateYMD() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		return sdf.format(this.ask_wdate);
	}
	
	public String getAsk_wdateTime() {
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm");

		return sdf.format(this.ask_wdate);
	}

	public boolean isNewicon() {
		return newicon;
	}

	public void setNewicon(boolean newicon) {
		this.newicon = newicon;
	}
	
	
	
}

