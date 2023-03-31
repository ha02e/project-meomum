package com.mm.member.model;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImple implements MemberDAO {
	private SqlSessionTemplate sqlMap;

	
	
	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public int insertJoinMM(MemberDTO dto) {
		int count = sqlMap.insert("insertJoinMM",dto);
		return count;
	}
	
	 @Override
	public int mmLogin(String input_id, String input_pwd) {
		MemberDTO dto = sqlMap.selectOne("mmLogin", input_id);
		int result = 0;
		
		if(dto==null) {
			result = NOT_ID;
		}else{
			if(dto.getUser_pwd().equals(input_pwd)) {
				result = LOGIN_OK;
			}else {
				result = NOT_PWD;
			}
		}
		
		return result;
	}
	 
	 @Override
	public MemberDTO getUserInfo(String input_id) {
		MemberDTO dto = sqlMap.selectOne("mmLogin", input_id);
		return dto;
	}
}
