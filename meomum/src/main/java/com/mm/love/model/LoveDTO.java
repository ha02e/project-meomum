package com.mm.love.model;

public class LoveDTO {
	
	private int love_idx;
	private int pro_idx;
	private int user_idx;
	private int love_check;
	
	
	public LoveDTO() {
		super();
	}

	
	public LoveDTO(int love_idx, int pro_idx, int user_idx, int love_check) {
		super();
		this.love_idx = love_idx;
		this.pro_idx = pro_idx;
		this.user_idx = user_idx;
		this.love_check = love_check;
	}

	
	public int getLove_idx() {
		return love_idx;
	}

	public void setLove_idx(int love_idx) {
		this.love_idx = love_idx;
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

	public int getLove_check() {
		return love_check;
	}

	public void setLove_check(int love_check) {
		this.love_check = love_check;
	}
	
	
	
	
}
