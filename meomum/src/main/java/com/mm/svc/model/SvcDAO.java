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
	public int svcMemUpdate(SvcMemDTO dto);
	public int svcDetailUpdate(SvcDetailDTO dto);
	public int svcDateUpdate(SvcDateDTO dto);
	public int svcIngInsert(SvcIngDTO dto);
	public List<SvcSelectAllDTO> svcUserList(int user_idx);
	public int svcStateCancle(String svc_idx);
	public int svcDateCancle(String svc_idx);
	public List<SvcSelectAllDTO> svcSelectDetail(String minDate, String maxDate, int category, String keyword, List<String> state);
}
