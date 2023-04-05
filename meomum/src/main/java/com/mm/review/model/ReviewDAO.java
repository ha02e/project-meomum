package com.mm.review.model;

import java.util.List;
import java.util.Map;

public interface ReviewDAO {
	
	public int reviewInsert(ReviewDTO dto);
	
	public List<ReviewDTO> reviewList(Map map);
	public int getTotalCnt();
	
	public List<ReviewDTO> myreviewList(Map map);
	public int myreviewTotalCnt();
	
	public List<ReviewDTO> reviewableList(Map map);
	public int reviewableTotalCnt(int user_idx);
	
	public ReviewDTO reviewContent(int review_idx);
	public int reviewReadnum(int review_idx);
	
	public int reviewDelete(int review_idx);

	public ReviewDTO reviewUpdateForm(int review_idx);
	public int reviewUpdate(ReviewDTO dto);
}
