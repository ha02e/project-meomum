package com.mm.review.model;

import java.sql.Date;

public class ReviewDTO {

	private int review_idx;
	private int user_idx;
	private String cate_idx;
	private int category;
	private String writer;
	private int star;
	private String subject;
	private String content;
	private Date writedate;
	private int readnum;
	private String thumb;
	
	
	public ReviewDTO() {
		super();
	}

	public ReviewDTO(int review_idx, int user_idx, String cate_idx, int category, String writer, int star,
			String subject, String content, Date writedate, int readnum, String thumb) {
		super();
		this.review_idx = review_idx;
		this.user_idx = user_idx;
		this.cate_idx = cate_idx;
		this.category = category;
		this.writer = writer;
		this.star = star;
		this.subject = subject;
		this.content = content;
		this.writedate = writedate;
		this.readnum = readnum;
		this.thumb = thumb;
	}

	
	public int getReview_idx() {
		return review_idx;
	}

	public void setReview_idx(int review_idx) {
		this.review_idx = review_idx;
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

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	public String getThumb() {
		return thumb;
	}

	public void setThumb(String thumb) {
		this.thumb = thumb;
	}
	
}
