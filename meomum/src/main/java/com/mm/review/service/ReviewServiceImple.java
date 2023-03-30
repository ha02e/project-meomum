package com.mm.review.service;

import com.mm.review.model.ReviewDAO;
import com.mm.review.model.ReviewDTO;

public class ReviewServiceImple implements ReviewService {
	
	private ReviewDAO reviewDao;
	
	public ReviewDAO getReviewDao() {
		return reviewDao;
	}
	
	public void setReviewDao(ReviewDAO reviewDao) {
		this.reviewDao = reviewDao;
	}


	@Override
	public int reviewWrite(ReviewDTO dto) {
		int count=reviewDao.reviewWrite(dto);
		return count;
	}

}
