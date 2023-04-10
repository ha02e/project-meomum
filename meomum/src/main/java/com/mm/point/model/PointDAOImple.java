package com.mm.point.model;

import org.mybatis.spring.SqlSessionTemplate;

public class PointDAOImple implements PointDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public PointDAOImple(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
//	@Override
//	public ResultDTO pointTotal(int user_idx) {
//		
//		ResultDTO dto = sqlMap.selectOne("pointTotal",user_idx);
//		return dto;
//	}
	
//	@Override
//	public int pointTotal(int user_idx) {
//		int point  = sqlMap.selectOne("pointTotal",user_idx);
//		return point;
//	}
}
