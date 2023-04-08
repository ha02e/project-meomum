package com.mm.shipping.model;

import java.sql.Date;

public class ShippingDTO {
	private int ship_idx;
	private int user_idx;
	private String cate_idx;
	private String order_idx;
	private int pro_idx;
	private String ship_info;
	private int ship_num;
	private String man_name;
	private String man_tel;
	private Date ship_date;
	private Date complete_date;
	
	
	public ShippingDTO() {
		super();
	}

	public ShippingDTO(int ship_idx, int user_idx, String cate_idx, String order_idx, int pro_idx, String ship_info,
			int ship_num, String man_name, String man_tel, Date ship_date, Date complete_date) {
		super();
		this.ship_idx = ship_idx;
		this.user_idx = user_idx;
		this.cate_idx = cate_idx;
		this.order_idx = order_idx;
		this.pro_idx = pro_idx;
		this.ship_info = ship_info;
		this.ship_num = ship_num;
		this.man_name = man_name;
		this.man_tel = man_tel;
		this.ship_date = ship_date;
		this.complete_date = complete_date;
	}

	
	public int getShip_idx() {
		return ship_idx;
	}

	public void setShip_idx(int ship_idx) {
		this.ship_idx = ship_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public String getCate_idx() {
		return cate_idx;
	}

	public void setCate_idx(String cate_idx) {
		this.cate_idx = cate_idx;
	}

	public String getOrder_idx() {
		return order_idx;
	}

	public void setOrder_idx(String order_idx) {
		this.order_idx = order_idx;
	}

	public int getPro_idx() {
		return pro_idx;
	}

	public void setPro_idx(int pro_idx) {
		this.pro_idx = pro_idx;
	}

	public String getShip_info() {
		return ship_info;
	}

	public void setShip_info(String ship_info) {
		this.ship_info = ship_info;
	}

	public int getShip_num() {
		return ship_num;
	}

	public void setShip_num(int ship_num) {
		this.ship_num = ship_num;
	}

	public String getMan_name() {
		return man_name;
	}

	public void setMan_name(String man_name) {
		this.man_name = man_name;
	}

	public String getMan_tel() {
		return man_tel;
	}

	public void setMan_tel(String man_tel) {
		this.man_tel = man_tel;
	}

	public Date getShip_date() {
		return ship_date;
	}

	public void setShip_date(Date ship_date) {
		this.ship_date = ship_date;
	}

	public Date getComplete_date() {
		return complete_date;
	}

	public void setComplete_date(Date complete_date) {
		this.complete_date = complete_date;
	}
	
}
