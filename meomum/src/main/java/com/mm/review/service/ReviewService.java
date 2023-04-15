package com.mm.review.service;

import java.util.List;
import java.util.Map;

import com.mm.review.model.ReviewDTO;

public interface ReviewService {
	
	public int reviewInsert(ReviewDTO dto);
	
	public List<ReviewDTO> reviewList(int cp, int ls,String fvalue,String category);
	public int getTotalCnt(String fvalue, String category);
	
	public List<ReviewDTO> myreviewList(int cp, int ls, int user_idx);
	public int myreviewTotalCnt(int user_idx);
	
	public List<ReviewDTO> reviewableList(int cp, int ls, int user_idx);
	public int reviewableTotalCnt(int user_idx);
	
	public ReviewDTO reviewContent(int review_idx);
	public int reviewReadnum(int review_idx);
	
	public int reviewDelete(int review_idx);

	public ReviewDTO reviewUpdateForm(int review_idx);
	public int reviewUpdate(ReviewDTO dto);
}
