package com.mm.ntc.model;

import java.util.List;

public interface NtcDAO {
	public int ntcInsert(NtcDTO dto);
	public List<NtcDTO> ntcList();
	public NtcDTO ntcContent(int idx);
}

