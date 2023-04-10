package com.mm.svc.model;

import java.util.List;
import java.util.Map;

public interface SvcDAO {
	public int svcMemInsert(SvcMemDTO dto);
	public int svcDetailInsert(SvcDetailDTO dto);
	public int svcDateInsert(SvcDateDTO dto);
	
	public List<String> svcTimeSelect(String userdate);
	
	public List<SvcSelectAllDTO> svcAdminList();
	
	public SvcContentDTO svcContent(String idx);
	public SvcIngDTO svcIngContent(String idx);
	
	public int svcMemUpdate(SvcMemDTO dto);
	public int svcDetailUpdate(SvcDetailDTO dto);
	public int svcDateUpdate(SvcDateDTO dto);
	public int svcIngUpdate(SvcIngDTO dto);
	/* public int svcStateUpdate(SvcMemDTO dto); */
	
	public int svcIngInsert(SvcIngDTO dto);
	
	public List<SvcSelectAllDTO> svcUserList(int user_idx);
	public List<SvcIngDTO> svcIngList(int user_idx);
	
	public int svcStateCancle(SvcContentDTO dto);
	public int svcDateCancle(SvcContentDTO dto);
	
	public List<SvcSelectAllDTO> svcSelectDetail(String minDate, String maxDate, int category, String keyword, List<String> state);

	public List<SvcIngDTO> svcIngCalList();
	public String sveIngCalName(String svc_idx);

}
