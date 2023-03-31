package com.mm.member.model;

public interface MemberDAO {
	/**로그인*/
	int NOT_ID = 1;
	int NOT_PWD = 2;
	int LOGIN_OK = 3;
	int ERROR = -1;
	
	public int insertJoinMM(MemberDTO dto);
	public int mmLogin(String input_id, String input_pwd);
	public MemberDTO getUserInfo(String input_id);

}
