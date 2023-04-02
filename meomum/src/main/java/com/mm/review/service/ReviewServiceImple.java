package com.mm.review.service;

import com.mm.review.model.ReviewDAO;
import com.mm.review.model.ReviewDTO;

public class ReviewServiceImple implements ReviewService {

	private ReviewDAO reviewDao;
	
	public ReviewServiceImple(ReviewDAO reviewDao) {
		super();
		this.reviewDao = reviewDao;
	}

	@Override
	public int reviewInsert(ReviewDTO dto) {
		int count=reviewDao.reviewInsert(dto);
		return count;
	}

}
