package com.mm.ntc.model;

import java.util.List;

public interface NtcDAO {
	public int ntcInsert(NtcDTO dto);
	public List<NtcDTO> ntcList();
	public NtcDTO ntcContent(Integer idx);
	public int ntcDelete(int idx);
	public int ntcViewCnt(int idx);
	public NtcDTO ntcFind(Integer idx);
	public int ntcUpdate(NtcDTO dto);
	public List<NtcDTO> ntcSearch(String keyword);
}

