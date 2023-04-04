package com.mm.review.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.mm.member.model.MemberDTO;
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
	
	@Override
	public List<ReviewDTO> reviewList(int cp, int ls) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<ReviewDTO> lists=reviewDao.reviewList(map);
		return lists;
	}
	
	@Override
	public int getTotalCnt() {
		int count=reviewDao.getTotalCnt();
		count=count==0?1:count;
		return count;
	}
	
	@Override
	public List<ReviewDTO> myreviewList(int cp, int ls, int user_idx) {
		int start=(cp-1)*ls+1;
		int end=cp*ls;
		
		Map map=new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("user_idx", user_idx);
		
		List<ReviewDTO> lists=reviewDao.myreviewList(map);
		return lists;
	}
	
	@Override
	public int myreviewTotalCnt() {
		int count=reviewDao.myreviewTotalCnt();
		count=count==0?1:count;
		return count;
	}
	
	
	@Override
	public ReviewDTO reviewContent(int review_idx) {
		ReviewDTO dto=reviewDao.reviewContent(review_idx);
		dto.setContent(dto.getContent().replaceAll("\n", "<br>"));
		return dto;
	}
	
	@Override
	public int reviewReadnum(int review_idx) {
		int count=reviewDao.reviewReadnum(review_idx);
		return count;
	}

	
	@Override
	public int reviewDelete(int review_idx) {
		int count=reviewDao.reviewDelete(review_idx);
		return count;
	}
	
}
