package com.mm.cart.model;

import java.sql.Date;

public class CartDTO {

	private int cart_idx;
	private int pro_idx;
	private int user_idx;
	private int cart_amount;
	
	private String pro_name;
	private int pro_cate;
	private int pro_amount;
	private int pro_state;
	private int pro_price;
	private int pro_subprice;
	private int pro_delprice;
	private String pro_thumb;
	private int pro_month;
	private int pro_allprice;
	
	
	public CartDTO() {
		super();
	}


	public CartDTO(int cart_idx, int pro_idx, int user_idx, int cart_amount, Date pro_date, String pro_name,
			int pro_cate, int pro_amount, int pro_state, int pro_price, int pro_subprice, int pro_delprice,
			String pro_thumb, int pro_month, int pro_allprice) {
		super();
		this.cart_idx = cart_idx;
		this.pro_idx = pro_idx;
		this.user_idx = user_idx;
		this.cart_amount = cart_amount;
		this.pro_name = pro_name;
		this.pro_cate = pro_cate;
		this.pro_amount = pro_amount;
		this.pro_state = pro_state;
		this.pro_price = pro_price;
		this.pro_subprice = pro_subprice;
		this.pro_delprice = pro_delprice;
		this.pro_thumb = pro_thumb;
		this.pro_month = pro_month;
		this.pro_allprice = pro_allprice;
	}


	public int getCart_idx() {
		return cart_idx;
	}


	public void setCart_idx(int cart_idx) {
		this.cart_idx = cart_idx;
	}


	public int getPro_idx() {
		return pro_idx;
	}


	public void setPro_idx(int pro_idx) {
		this.pro_idx = pro_idx;
	}


	public int getUser_idx() {
		return user_idx;
	}


	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}


	public int getCart_amount() {
		return cart_amount;
	}


	public void setCart_amount(int cart_amount) {
		this.cart_amount = cart_amount;
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
