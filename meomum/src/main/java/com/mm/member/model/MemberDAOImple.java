package com.mm.member.model;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import com.fasterxml.jackson.annotation.JacksonInject;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;


public class MemberDAOImple implements MemberDAO {
	

	private SqlSessionTemplate sqlMap;

	
	public MemberDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	public MemberDAOImple() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public int insertJoin(MemberDTO dto) {
		int count = sqlMap.insert("insertJoin", dto);
		return count;
	}

	@Override
	public int login(String input_id, String input_pwd) {
		MemberDTO dto = sqlMap.selectOne("login", input_id);
		int result = 0;

		if (dto == null) {
			result = NOT_ID;
		} else {
			if (dto.getUser_pwd().equals(input_pwd)) {
				result = LOGIN_OK;
			} else {
				result = NOT_PWD;
			}
		}

		return result;
	}

	@Override
	public MemberDTO getsessionInfo(String input_id) {
		MemberDTO dto = sqlMap.selectOne("login", input_id);
		return dto;
	}

	/** 카카오 code보내 access_Token얻기 */
	@Override
	public String getAccessToken(String authorize_code) {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송

			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");

			sb.append("&client_id=f9f8f92fec61a14408e68cf856744293"); // REST_API키 본인이 발급받은 key 넣어주기
			sb.append("&redirect_uri=http://localhost:9090/meomum/kakao_login.do"); // REDIRECT_URI 본인이 설정한 주소 넣어주기

			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// jackson objectmapper 객체 생성
			ObjectMapper objectMapper = new ObjectMapper();
			// JSON String -> Map
			Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
			});

			access_Token = jsonMap.get("access_token").toString();
			refresh_Token = jsonMap.get("refresh_token").toString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return access_Token;
	}

	/** access_Token을 보내 사용자의 정보 얻기 */
	@Override
	public HashMap<String, Object> getKakaoUserInfo(String access_Token) {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";

		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);
			System.out.println("result type" + result.getClass().getName()); // java.lang.String

			try {
				// jackson objectmapper 객체 생성
				ObjectMapper objectMapper = new ObjectMapper();
				// JSON String -> Map
				Map<String, Object> jsonMap = objectMapper.readValue(result, new TypeReference<Map<String, Object>>() {
				});

				System.out.println(jsonMap.get("properties"));

				Map<String, Object> properties = (Map<String, Object>) jsonMap.get("properties");
				Map<String, Object> kakao_account = (Map<String, Object>) jsonMap.get("kakao_account");

				// System.out.println(properties.get("nickname"));
				// System.out.println(kakao_account.get("email"));

				String nickname = properties.get("nickname").toString();
				String email = kakao_account.get("email").toString();

				userInfo.put("nickname", nickname);
				userInfo.put("email", email);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		return userInfo;
	}

	/* 회원 정보 가져오기 **/
	@Override
	public MemberDTO getuserInfo(int user_idx) {
		MemberDTO dto = sqlMap.selectOne("getuserInfo", user_idx);
		return dto;
	}

	/** 회원 정보 수정 */
	@Override
	public int updateUserInfo(MemberDTO dto) {
		int count = sqlMap.update("updateUserInfo", dto);

		return count;
	}

	/** 회원정보 비밀번호 수정 */
	@Override
	public int updatePWD(String newPwd, int user_idx) {
		Map map = new HashMap();
		map.put("user_idx", user_idx);
		map.put("newPwd", newPwd);

		int count = sqlMap.update("updatePWD", map);
		return count;
	}

	/** 회원 정보 리스트 불러오기 */
	@Override
	public List<MemberListDTO> memberList(int cp, int ls, String type, String fvalue, String orderby) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;

		Map map = new HashMap();

		if (type.equals("yes")) {
			map.put("fvalue", "%" + fvalue + "%");
		}

		map.put("start", start);
		map.put("end", end);
		map.put("orderby", orderby);

		List<MemberListDTO> lists = sqlMap.selectList("memberList", map);
		return lists;
	}

	/** 총회원수 */
	@Override
	public int getuserTTCnt(String fvalue) {
		fvalue = "%" + fvalue + "%";
		int count = sqlMap.selectOne("getuserTTCnt", fvalue);
		return count;
	}

	/** 회원 관리자로 변경 메서드 */
	@Override
	public int managerUpdate(int user_idx) {
		int count = sqlMap.update("managerUpdate", user_idx);
		return count;
	}

	/** 관리자 _회원 메모 수정 */
	@Override
	public int userMemoUpdate(int user_idx, String user_memo) {
		Map map = new HashMap();
		map.put("user_idx", user_idx);
		map.put("user_memo", user_memo);
		int count = sqlMap.update("userMemoUpdate", map);
		return count;
	}

	/** 관리자 정보 리스트 불러오기 */
	@Override
	public List<MemberListDTO> managerList(int cp, int ls, String type, String fvalue, String orderby) {
		int start = (cp - 1) * ls + 1;
		int end = cp * ls;

		Map map = new HashMap();

		if (type.equals("yes")) {
			map.put("fvalue", "%" + fvalue + "%");
		}

		map.put("start", start);
		map.put("end", end);
		map.put("orderby", orderby);

		List<MemberListDTO> lists = sqlMap.selectList("managerList", map);
		return lists;
	}

	/** 관리자 수 */
	@Override
	public int getmanagerTTCnt(String fvalue) {
		fvalue = "%" + fvalue + "%";
		int count = sqlMap.selectOne("getmanagerTTCnt", fvalue);
		return count;
	}

	/** 관리자 회원으로 변경 */
	@Override
	public int managerDelete(int user_idx) {
		int count = sqlMap.update("managerDelete", user_idx);
		return count;
	}

	/**회원 아이디 찾기*/
	@Override
	public String findID(String user_name, String user_tel) {
		
		Map map = new HashMap();
		map.put("user_name", user_name);
		map.put("user_tel", user_tel);
		
		String user_id = sqlMap.selectOne("findID", map);
		return user_id;
	}
	
	
	/**회원 비밀번호 찾기*/
	@Override
	public Integer findPWD(String user_name, String user_tel,String user_id) {
		
		Map map = new HashMap();
		map.put("user_name", user_name);
	map.put("user_tel", user_tel);
		map.put("user_id", user_id);
		
		Integer user_idx = sqlMap.selectOne("findPWD", map);
		return user_idx;
	}
	
	/**회원 아이디 중복 검사*/
	@Override
	public boolean memberIdcheck(String input_id) {
		boolean result = sqlMap.selectOne("memberIdcheck", input_id)==null?true:false;
		return result;
	}
	
	
	/**회원 탈퇴시 서비스 이용 중인게 있는지 확인*/
	@Override
	public int dropSelectInfo(int user_idx) {
		int result = sqlMap.selectOne("dropSelectInfo",user_idx);
		
	return result;
	}
	
	/**회원 탈퇴*/
	@Override
	public int deleteMember(int user_idx,String user_id) {
		int result = sqlMap.delete("deleteMember",user_idx);
		
		if(result>0) {
			Map map = new HashMap();
			map.put("user_idx", user_idx);
			map.put("user_id", user_id);
			
			sqlMap.insert("insertMemberDrop",map);
		}
		return result;
	}

	
}
