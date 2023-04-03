package com.mm.svc.model;

import java.util.List;

public interface SvcDAO {
	public int svcMemInsert(SvcMemDTO dto);
	public int svcDetailInsert(SvcDetailDTO dto);
	public int svcDateInsert(SvcDateDTO dto);
	public List<String> svcTimeSelect(String userdate);
	public List<SvcSelectAllDTO> svcList();
	public List<SvcContentDTO> svcContent(String idx);
	
}
