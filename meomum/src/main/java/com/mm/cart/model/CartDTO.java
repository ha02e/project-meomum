package com.mm.cart.model;

public class CartDTO {

	private int cart_idx;
	private int pro_idx;
	private int user_idx;
	private int cart_amount;
	
	
	public CartDTO() {
		super();
	}


	public CartDTO(int cart_idx, int pro_idx, int user_idx, int cart_amount) {
		super();
		this.cart_idx = cart_idx;
		this.pro_idx = pro_idx;
		this.user_idx = user_idx;
		this.cart_amount = cart_amount;
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
	
	
	
	
}
