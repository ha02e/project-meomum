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
	public List<AskDTO> askList(int cp, int ls) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		
		List<AskDTO> lists = sqlMap.selectList("askList",map);
		return lists;
	}

	/**간단문의 총 게시글 수*/
	 @Override
	public int askCnt() {
		int cnt = sqlMap.selectOne("askCnt");

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
}
