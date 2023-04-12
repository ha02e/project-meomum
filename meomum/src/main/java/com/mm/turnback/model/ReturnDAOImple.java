package com.mm.turnback.model;

import org.mybatis.spring.SqlSessionTemplate;

public class ReturnDAOImple implements ReturnDAO {
	
	private SqlSessionTemplate sqlMap;

	public ReturnDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	
	@Override
	public int returnApplyInsert(ReturnDTO dto) {
		int count=sqlMap.insert("returnApplyInsert",dto);
		return count;
	}
}
