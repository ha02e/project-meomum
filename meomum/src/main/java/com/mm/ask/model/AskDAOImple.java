package com.mm.ask.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.servlet.ModelAndView;

public class AskDAOImple implements AskDAO {
	private SqlSessionTemplate sqlMap;

	public AskDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int askInsert(AskDTO dto) {
		int result = sqlMap.insert("askInsert",dto);
		
		return result;
	}
	

}
