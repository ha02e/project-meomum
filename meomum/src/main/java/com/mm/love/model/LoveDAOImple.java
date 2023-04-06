package com.mm.love.model;

import org.mybatis.spring.SqlSessionTemplate;

public class LoveDAOImple implements LoveDAO {

	private SqlSessionTemplate sqlMap;
	

	public LoveDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int loveInsert(LoveDTO dto) {
		
		System.out.println("dto:"+dto);
		
		int count=sqlMap.insert("loveInsert", dto);
		return count;
	}

}
