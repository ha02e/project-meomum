package com.mm.ntc.model;

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

	@Override
	public List<NtcDTO> ntcList(Map map) {
		List<NtcDTO> list = sqlMap.selectList("ntcList", map);

		if (list == null) {
			return null;
		}

		return list;
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
	public int getTotalCnt() {
		int count = sqlMap.selectOne("ntcTotalCnt");
		return count;
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

	@Override
	public List<NtcDTO> ntcSearch(String keyword) {
		List<NtcDTO> list = sqlMap.selectList("ntcSearch", keyword);
		return list;
	}
}
