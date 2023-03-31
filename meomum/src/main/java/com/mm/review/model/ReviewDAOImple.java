package com.mm.review.model;

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

}
