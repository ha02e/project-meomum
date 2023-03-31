package com.mm.member.model;

import java.util.*;

public interface MemberDAO {
	/**로그인*/
	int NOT_ID = 1;
	int NOT_PWD = 2;
	int LOGIN_OK = 3;
	int ERROR = -1;
	
	public int insertJoin(MemberDTO dto);
	public int login(String input_id, String input_pwd);
	public MemberDTO getUserInfo(String input_id);
	String getAccessToken(String authorize_code);
	public HashMap<String, Object> getKakaoUserInfo(String access_Token);
}
