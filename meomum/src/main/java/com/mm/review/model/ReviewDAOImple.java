package com.mm.review.model;

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
	public ReviewDTO reviewContent(int review_idx) {
		ReviewDTO dto=sqlMap.selectOne("reviewContent",review_idx);
		return dto;
	}
}
