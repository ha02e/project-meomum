package com.mm.pro.model;

import java.sql.Date;

public class ProDTO {
	
	private int pro_idx;
	private Date pro_date;
	private String pro_name;
	private int pro_cate;
	private int pro_amount;
	private int pro_state;
	private int pro_price;
	private int pro_subprice;
	private int pro_delprice;
	private String pro_thumb;
	private String pro_img1;
	private String pro_img2;
	private String pro_content;
	private int pro_month;
	private int pro_allprice;
	
	public ProDTO() {
		super();
	}

	public ProDTO(int pro_idx, Date pro_date, String pro_name, int pro_cate, int pro_amount, int pro_state,
			int pro_price, int pro_subprice, int pro_delprice, String pro_thumb, String pro_img1, String pro_img2,
			String pro_content, int pro_month, int pro_allprice) {
		super();
		this.pro_idx = pro_idx;
		this.pro_date = pro_date;
		this.pro_name = pro_name;
		this.pro_cate = pro_cate;
		this.pro_amount = pro_amount;
		this.pro_state = pro_state;
		this.pro_price = pro_price;
		this.pro_subprice = pro_subprice;
		this.pro_delprice = pro_delprice;
		this.pro_thumb = pro_thumb;
		this.pro_img1 = pro_img1;
		this.pro_img2 = pro_img2;
		this.pro_content = pro_content;
		this.pro_month = pro_month;
		this.pro_allprice = pro_allprice;
	}

	public int getPro_idx() {
		return pro_idx;
	}

	public void setPro_idx(int pro_idx) {
		this.pro_idx = pro_idx;
	}

	public Date getPro_date() {
		return pro_date;
	}

	public void setPro_date(Date pro_date) {
		this.pro_date = pro_date;
	}

	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	public int getPro_cate() {
		return pro_cate;
	}

	public void setPro_cate(int pro_cate) {
		this.pro_cate = pro_cate;
	}

	public int getPro_amount() {
		return pro_amount;
	}

	public void setPro_amount(int pro_amount) {
		this.pro_amount = pro_amount;
	}

	public int getPro_state() {
		return pro_state;
	}

	public void setPro_state(int pro_state) {
		this.pro_state = pro_state;
	}

	public int getPro_price() {
		return pro_price;
	}

	public void setPro_price(int pro_price) {
		this.pro_price = pro_price;
	}

	public int getPro_subprice() {
		return pro_subprice;
	}

	public void setPro_subprice(int pro_subprice) {
		this.pro_subprice = pro_subprice;
	}

	public int getPro_delprice() {
		return pro_delprice;
	}

	public void setPro_delprice(int pro_delprice) {
		this.pro_delprice = pro_delprice;
	}

	public String getPro_thumb() {
		return pro_thumb;
	}

	public void setPro_thumb(String pro_thumb) {
		this.pro_thumb = pro_thumb;
	}

	public String getPro_img1() {
		return pro_img1;
	}

	public void setPro_img1(String pro_img1) {
		this.pro_img1 = pro_img1;
	}

	public String getPro_img2() {
		return pro_img2;
	}

	public void setPro_img2(String pro_img2) {
		this.pro_img2 = pro_img2;
	}

	public String getPro_content() {
		return pro_content;
	}

	public void setPro_content(String pro_content) {
		this.pro_content = pro_content;
	}

	public int getPro_month() {
		return pro_month;
	}

	public void setPro_month(int pro_month) {
		this.pro_month = pro_month;
	}

	public int getPro_allprice() {
		return pro_allprice;
	}

	public void setPro_allprice(int pro_allprice) {
		this.pro_allprice = pro_allprice;
	}
	
	
	
	
	
	
}
