package com.mm.point.model;

import java.sql.Date;

public class PointDTO {
	private int point_idx;
	private String cate_idx;
	private int user_idx;
	private int point_use;
	private Date point_usedate;  
	private String point_info; 
	private int point_num;
	
	
	/**select할때 필요값*/
	private int point_sum;
	private String point_type;
	private String point_changed;
	private int rnum;
	
	public PointDTO() {
		super();
	}

	public PointDTO(int point_idx, String cate_idx, int user_idx, int point_use, Date point_usedate, String point_info,
			int point_num) {
		super();
		this.point_idx = point_idx;
		this.cate_idx = cate_idx;
		this.user_idx = user_idx;
		this.point_use = point_use;
		this.point_usedate = point_usedate;
		this.point_info = point_info;
		this.point_num = point_num;
	}
	
	
	
/**포인트 추가된 dto*/

	public PointDTO(int point_idx, String cate_idx, int user_idx, int point_use, Date point_usedate, String point_info,
		int point_num, int point_sum, String point_type, String point_changed, int rnum) {
	super();
	this.point_idx = point_idx;
	this.cate_idx = cate_idx;
	this.user_idx = user_idx;
	this.point_use = point_use;
	this.point_usedate = point_usedate;
	this.point_info = point_info;
	this.point_num = point_num;
	this.point_sum = point_sum;
	this.point_type = point_type;
	this.point_changed = point_changed;
	this.rnum = rnum;
	}


	public int getPoint_idx() {
		return point_idx;
	}
	
	public void setPoint_idx(int point_idx) {
		this.point_idx = point_idx;
	}

	public String getCate_idx() {
		return cate_idx;
	}

	public void setCate_idx(String cate_idx) {
		this.cate_idx = cate_idx;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getPoint_use() {
		return point_use;
	}

	public void setPoint_use(int point_use) {
		this.point_use = point_use;
	}

	public Date getPoint_usedate() {
		return point_usedate;
	}

	public void setPoint_usedate(Date point_usedate) {
		this.point_usedate = point_usedate;
	}

	public String getPoint_info() {
		return point_info;
	}

	public void setPoint_info(String point_info) {
		this.point_info = point_info;
	}

	public int getPoint_num() {
		return point_num;
	}

	public void setPoint_num(int point_num) {
		this.point_num = point_num;
	}

	
	//포인트 합계 추가
	public int getPoint_sum() {
		return point_sum;
	}

	public void setPoint_sum(int point_sum) {
		this.point_sum = point_sum;
	}

	public String getPoint_type() {
		return point_type;
	}

	public void setPoint_type(String point_type) {
		this.point_type = point_type;
	}

	public String getPoint_changed() {
		 String money = String.valueOf(point_changed);
		    int len = money.length();
		    StringBuilder sb = new StringBuilder();
		    for (int i = len - 1; i >= 0; i--) {
		        sb.append(money.charAt(i));
		        if ((len - i - 1) % 3 == 2 && i != 0) {
		            sb.append(",");
		        }
		    }
		
		
		    return sb.reverse().toString();
	}

	public void setPoint_changed(String point_changed) {
		this.point_changed = point_changed;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	
	
	
}
