package com.mm.ntc.model;

import java.util.List;

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
	public List<NtcDTO> ntcList() {
		List<NtcDTO> list = sqlMap.selectList("ntcList");
		return list;
	}

	@Override
	public NtcDTO ntcContent(int idx) {
		NtcDTO dto=sqlMap.selectOne("ntcContent",idx);
		dto.setNtc_content(dto.getNtc_content().replaceAll("\n", "<br>"));
		return dto;
	}

}
