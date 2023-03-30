package com.mm.review.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ReviewDAOImple implements ReviewDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public SqlSessionTemplate getSqlMap() {
		return sqlMap;
	}
	
	public void setSqlMap(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}


	@Override
	public int reviewWrite(ReviewDTO dto) {
		int count=sqlMap.insert("reviewInsert", dto);
		return count;
	}

}
