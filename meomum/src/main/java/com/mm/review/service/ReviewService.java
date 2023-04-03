package com.mm.review.service;

import java.util.List;

import com.mm.review.model.ReviewDTO;

public interface ReviewService {
	
	public int reviewInsert(ReviewDTO dto);
	public List<ReviewDTO> reviewList(int cp, int ls);
	public int getTotalCnt();
	public ReviewDTO reviewContent(int review_idx);

}
