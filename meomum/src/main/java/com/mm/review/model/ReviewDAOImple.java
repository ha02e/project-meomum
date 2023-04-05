package com.mm.review.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

public class ReviewDAOImple implements ReviewDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public ReviewDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public int reviewInsert(ReviewDTO dto) {
		int count=sqlMap.insert("reviewInsert", dto);
		return count;
	}

	
	@Override
	public List<ReviewDTO> reviewList(Map map) {
		List<ReviewDTO> lists=sqlMap.selectList("reviewList",map);
		return lists;
	}
	
	@Override
	public int getTotalCnt() {
		int count=sqlMap.selectOne("reviewTotalCnt");
		return count;
	}
	
	@Override
	public List<ReviewDTO> myreviewList(Map map) {
		List<ReviewDTO> lists=sqlMap.selectList("myreviewList",map);
		return lists;
	}
	
	@Override
	public int myreviewTotalCnt() {
		int count=sqlMap.selectOne("myreviewTotalCnt");
		return count;
	}
	
	@Override
	public List<ReviewDTO> reviewableList(Map map) {
		List<ReviewDTO> lists=sqlMap.selectList("reviewableList",map);
		return lists;
	}
	
	@Override
	public int reviewableTotalCnt(int user_idx) {
		int count=sqlMap.selectOne("reviewableTotalCnt",user_idx);
		return count;
	}
	
	
	@Override
	public ReviewDTO reviewContent(int review_idx) {
		ReviewDTO dto=sqlMap.selectOne("reviewContent",review_idx);
		return dto;
	}
	
	@Override
	public int reviewReadnum(int review_idx) {
		int count=sqlMap.update("reviewReadnum", review_idx);
		return count;
	}
	
	
	@Override
	public int reviewDelete(int review_idx) {
		int count=sqlMap.delete("reviewDelete",review_idx);
		return count;
	}
	
	
	@Override
	public ReviewDTO reviewUpdateForm(int review_idx) {
		ReviewDTO review=sqlMap.selectOne("reviewContent", review_idx);
		return review;
	}
	
	@Override
	public int reviewUpdate(ReviewDTO dto) {
		int count=sqlMap.update("reviewUpdate", dto);
		return count;
	}
}
