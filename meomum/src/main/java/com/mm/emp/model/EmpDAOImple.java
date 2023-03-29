package com.mm.emp.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class EmpDAOImple implements EmpDAO {

	private SqlSessionTemplate sqlMap;
	
	
	public EmpDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}
	
	@Override
	public int empAdd(EmpDTO dto) {
		int count = sqlMap.insert("empInsert",dto);
		return count;
	}
	
	@Override
	public int empDel(int idx) {
		int count = sqlMap.delete("empDel",idx);
		return count;
	}
	
	@Override
	public List<EmpDTO> empAllList() {
		List<EmpDTO> list = sqlMap.selectList("empAllList");
		return list;
	}
	

	@Override
	public EmpDTO empSearch(int idx) {
		EmpDTO dto = sqlMap.selectOne("empSearch",idx);
		return dto; 
	}
	
	@Override
	public int empUpdate(EmpDTO dto) {
		int result = sqlMap.update("empUpdate", dto);
		return result;
	}
}
