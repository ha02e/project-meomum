package com.mm.review.model;

import java.util.List;
import java.util.Map;

public interface ReviewDAO {
	
	public int reviewInsert(ReviewDTO dto);
	public List<ReviewDTO> reviewList(Map map);
	public int getTotalCnt();
	public ReviewDTO reviewContent(int review_idx);

}
