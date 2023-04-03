package com.mm.ntc.model;

import java.util.List;
import java.util.Map;

public interface NtcDAO {
	public int ntcInsert(NtcDTO dto);
	public List<NtcDTO> ntcList(Map map);
	public int getTotalCnt();
	public NtcDTO ntcContent(Integer idx);
	public int ntcDelete(int idx);
	public int ntcViewCnt(int idx);
	public NtcDTO ntcFind(Integer idx);
	public int ntcUpdate(NtcDTO dto);
	public List<NtcDTO> ntcSearch(String keyword);
}

