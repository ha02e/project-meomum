package com.mm.ask.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.servlet.ModelAndView;

import com.mm.member.model.MemberDTO;

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
	
	/**간단문의 리스트*/
	@Override
	public List<AskDTO> askList(int cp, int ls,String type,String fvalue) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		if(type.equals("yes")) {
			map.put("fvalue","%" + fvalue + "%");
		}
		
		List<AskDTO> lists = sqlMap.selectList("askList",map);
		return lists;
	}

	/**간단문의 총 게시글 수*/
	 @Override
	public int askCnt(String fvalue) {
		 fvalue = "%" + fvalue + "%";
		int cnt = sqlMap.selectOne("askCnt", fvalue);

		return cnt;
	}
	 
	 
	 /**간단문의 본문 보기 */
	 @Override
	public AskDTO askContent(int ask_idx) {
		AskDTO dto = sqlMap.selectOne("askSelectContent",ask_idx);
		return dto;
	}
	 
	 /**중복 파일 이름 있는지 확인*/
	 @Override
	public boolean existsFile(String fileName) {
		
		int result =  sqlMap.selectOne("existsFile", fileName);
		 
		return result>0?true:false;
	}
	 
	 /**관리자 댓글 달기 */
	 @Override
	public int commentsInsert(CommentsDTO dto) {
			int result = sqlMap.insert("commentsInsert",dto);
			sqlMap.update("updateAskPlusOne",dto.getAsk_idx());
		return result;
	}
	 
	 /**댓글 출력*/
	 @Override
	public CommentsDTO commList(int ask_idx) {
		CommentsDTO dto = sqlMap.selectOne("commList", ask_idx);
		return dto;
	}
	 
	 /**간단문의 본문 글 삭제*/
 	@Override
	public int deleteAsk(int ask_idx) {
		int result = sqlMap.delete("deleteAsk",ask_idx);
		if(result>0) {
			sqlMap.delete("deleteComm",ask_idx);
		}
		return result;
	}
 	
 	@Override
 	public int deleteComm(int ask_idx) {
 		int result = sqlMap.delete("deleteComm",ask_idx);
 		if(result>0) {
			sqlMap.update("updateAskMinusOne",ask_idx);

 		}
 		return result;
 	}
 	
 	/**관리자용 간단문의 리스트*/
	@Override
	public List<AskDTO> askList_a(int cp, int ls,String type,String fvalue,String checklist) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("checklist", checklist);
		
		map.put("fvalue","%" + fvalue + "%");
		
		
		List<AskDTO> lists = sqlMap.selectList("askList_a",map);
		return lists;
	}

	/**간단문의 관리자용 총 게시글 수*/
	 @Override
	public int askCnt_a(String fvalue,String checklist) {
	
			Map map = new HashMap();
			map.put("checklist", checklist);
			map.put("fvalue","%" + fvalue + "%");
			
		int cnt = sqlMap.selectOne("askCnt_a", map);

		return cnt;
	}
	 
	
	
	
	/**회원 본인 간단문의 리스트*/
	@Override
	public List<AskDTO> myaskList(int cp, int ls, int user_idx) {
		
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("user_idx", user_idx);
		
		List<AskDTO> lists = sqlMap.selectList("myaskList",map);

		
		return lists;
	}
	/**회원 본인 간단문의 총 개수*/
	@Override
	public int myaskCnt(int user_idx) {
		int cnt = sqlMap.selectOne("myaskCnt", user_idx);
		return cnt;
	}
}
