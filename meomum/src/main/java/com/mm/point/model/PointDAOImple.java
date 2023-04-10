package com.mm.point.model;

import org.mybatis.spring.SqlSessionTemplate;

public class PointDAOImple implements PointDAO {
	
	private SqlSessionTemplate sqlMap;
	
	public PointDAOImple(SqlSessionTemplate sqlMap) {
		this.sqlMap = sqlMap;
	}
	
	@Override
	public PointDTO pointTotal(int user_idx) {

	PointDTO dto = sqlMap.selectOne("pointTotal",user_idx);
	return dto;
	}

}
