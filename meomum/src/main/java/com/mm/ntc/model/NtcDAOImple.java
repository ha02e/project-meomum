package com.mm.ntc.model;

import org.mybatis.spring.SqlSessionTemplate;

public class NtcDAOImple implements NtcDAO {

	private SqlSessionTemplate sqlMap;
	
	
	public NtcDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}



	@Override
	public int ntcInsert(NtcDTO dto) {
		int count=sqlMap.insert("ntcInsert",dto);
		return count;
	}

}
