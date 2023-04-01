package com.mm.svc.model;

import java.util.List;

public interface SvcDAO {
	public int svcInsert(SvcDTO dto);
	public int svcDateInsert(SvcDateDTO dto);
	public List<String> svcTimeSelect(String userdate);
	
}
