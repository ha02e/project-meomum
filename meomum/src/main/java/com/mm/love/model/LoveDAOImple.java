package com.mm.love.model;
import java.io.*;
import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class LoveDAOImple implements LoveDAO {

	private SqlSessionTemplate sqlMap;
	

	public LoveDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int loveInsert(int pro_idx, int user_idx) {		
		Map map=new HashMap();
		map.put("pro_idx", pro_idx);
		map.put("user_idx", user_idx);	
		int count=sqlMap.insert("loveInsert", map);
		return count;
	}

}
