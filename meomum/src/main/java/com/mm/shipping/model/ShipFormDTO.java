package com.mm.shipping.model;

import java.sql.Date;

public class ShipFormDTO {
	private String ship_info;
	private int ship_num;
	private String receiver;
	private String reveiver_tel;
	private String ship_addr;
	private String order_msg;
	private String man_name;
	private String man_tel;
	private Date ship_date;
	private int pro_idx;
	private int pro_amount;
	
	
	public ShipFormDTO() {
		super();
	}

	public ShipFormDTO(String ship_info, int ship_num, String receiver, String reveiver_tel, String ship_addr,
			String order_msg, String man_name, String man_tel, Date ship_date, int pro_idx, int pro_amount) {
		super();
		this.ship_info = ship_info;
		this.ship_num = ship_num;
		this.receiver = receiver;
		this.reveiver_tel = reveiver_tel;
		this.ship_addr = ship_addr;
		this.order_msg = order_msg;
		this.man_name = man_name;
		this.man_tel = man_tel;
		this.ship_date = ship_date;
		this.pro_idx = pro_idx;
		this.pro_amount = pro_amount;
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

	public String getReceiver() {
		return receiver;
	}

	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}

	public String getReveiver_tel() {
		return reveiver_tel;
	}

	public void setReveiver_tel(String reveiver_tel) {
		this.reveiver_tel = reveiver_tel;
	}

	public String getShip_addr() {
		return ship_addr;
	}

	public void setShip_addr(String ship_addr) {
		this.ship_addr = ship_addr;
	}

	public String getOrder_msg() {
		return order_msg;
	}

	public void setOrder_msg(String order_msg) {
		this.order_msg = order_msg;
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

	public int getPro_idx() {
		return pro_idx;
	}

	public void setPro_idx(int pro_idx) {
		this.pro_idx = pro_idx;
	}

	public int getPro_amount() {
		return pro_amount;
	}

	public void setPro_amount(int pro_amount) {
		this.pro_amount = pro_amount;
	}
	
}
