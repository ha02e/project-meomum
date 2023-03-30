package com.mm.pro.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ProDAOImple implements ProDAO {

private SqlSessionTemplate sqlMap;
	
	
	public ProDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	
	@Override
	public int proInsert(ProDTO dto) {
		int count=sqlMap.insert("proInsert",dto);
		return count;
	}
	
	

}
