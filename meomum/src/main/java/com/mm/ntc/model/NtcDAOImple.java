package com.mm.ntc.model;

import java.util.HashMap;	
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public class NtcDAOImple implements NtcDAO {

	private SqlSessionTemplate sqlMap;

	
	public NtcDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public int ntcInsert(NtcDTO dto) {
		int count = sqlMap.insert("ntcInsert", dto);
		return count;
	}

	/**공지사항 리스트*/
	@Override
	public List<NtcDTO> ntcList(int cp, int ls,String fvalue) {
		int start = (cp-1)*ls+1;
		int end = cp*ls;
		
		Map map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("fvalue","%" + fvalue + "%");
		List<NtcDTO> list = sqlMap.selectList("ntcList", map);

		return list;
	}
/**공지사항 총 게시물*/
	@Override
	public int ntcTotalCnt(String fvalue) {
		fvalue = "%" + fvalue + "%";
		int count = sqlMap.selectOne("ntcTotalCnt", fvalue);
		return count;
	}
	
	
	@Override
	public NtcDTO ntcContent(Integer idx) {
		if (idx == null) {
			return null; // or throw an exception
		}
		NtcDTO dto = sqlMap.selectOne("ntcContent", idx);
		if (dto == null) {
			return null; // or throw an exception
		}
		dto.setNtc_content(dto.getNtc_content().replaceAll("\n", "<br>"));
		return dto;
	}


	@Override
	public int ntcDelete(int idx) {
		int count = sqlMap.delete("ntcDelete", idx);
		return count;
	}

	@Override
	public int ntcViewCnt(int idx) {
		int count = sqlMap.update("ntcViewCnt", idx);
		return count;
	}

	@Override
	public NtcDTO ntcFind(Integer idx) {
		NtcDTO dto = sqlMap.selectOne("ntcFind", idx);
		return dto;
	}

	@Override
	public int ntcUpdate(NtcDTO dto) {
		int count = sqlMap.update("ntcUpdate", dto);
		return count;
	}
/*
	@Override
	public List<NtcDTO> ntcSearch(String keyword) {
		List<NtcDTO> list = sqlMap.selectList("ntcSearch", keyword);
		return list;
	}
*/
	@Override
	public String getNtcImageName(Integer idx) {
		String dto=sqlMap.selectOne("getNtcImageName", idx);
		return dto;
	}
}
