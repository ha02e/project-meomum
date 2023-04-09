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
	public MemberDTO getsessionInfo(String input_id);
	String getAccessToken(String authorize_code);
	public HashMap<String, Object> getKakaoUserInfo(String access_Token);
	public int updateUserInfo(MemberDTO dto);
	public MemberDTO getuserInfo(int user_idx);
	public int updatePWD(String newPwd,int user_idx);
	/*수정예정*/
	public List<MemberListDTO> memberList(int cp, int ls,String type,String fvalue,String orderby);
	public int getuserTTCnt(String fvalue);
	public int managerUpdate(int user_idx);
	public int userMemoUpdate(int user_idx,String user_memo);
	public List<MemberListDTO> managerList(int cp, int ls,String type,String fvalue,String orderby);
	public int getmanagerTTCnt(String fvalue);
	public int managerDelete(int user_idx);
	public String findID(String user_name, String user_tel);
	public Integer findPWD(String user_name, String user_tel,String user_id);
	public boolean memberIdcheck(String input_id);
	public int dropSelectInfo(int user_idx);
	public int deleteMember(int user_idx,String user_id);
	

}
