package com.mm.pro.model;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;

public class ProDAOImple implements ProDAO {

private SqlSessionTemplate sqlMap;
	
	
	public ProDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	
	//상품 등록
	@Override
	public int proInsert(ProDTO dto) {
		int count=sqlMap.insert("proInsert",dto);
		return count;
	}
	
	
	@Override
		public List<ProDTO> proList(Map map) {
			List<ProDTO> lists=sqlMap.selectList("proList", map);
			return lists;
		}
	
	
	@Override
		public int getTotalCnt() {
			int count=sqlMap.selectOne("proTotalCnt");
			return count;
		}

	@Override
		public int proDelete(int pro_idx) {
			int count=sqlMap.delete("proDelete",pro_idx);
			return count;
		}

	@Override
		public ArrayList<ProDTO> proFind(String proF) {
			//ArrayList<ProDTO> lists=sqlMap.selectList(proF);
			return null;
		}
	
	
}
