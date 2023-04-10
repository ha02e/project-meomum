package com.mm.pro.model;

import java.util.*;

	public interface ProDAO {
	public int proInsert(ProDTO dto);
	public List<ProDTO> proList(Map map);
	public int getTotalCnt();
	public int proDelete(int pro_idx);
	public List<ProDTO> proFind1(int proF);
	public List<ProDTO> proFind2(String proF);
	public List<ProDTO> proUpdateList(int pro_idx);
	public int proUpdate(ProDTO dto);
	public String proFindFile(Integer idx);
	
	public ProDTO proSelect(int pro_idx);
	public int proAmountUpdate(ProDTO dto);
	public int proStateUpdate(ProDTO dto);
	
	public int proAmountSelect(int pro_idx);
	public int proAmountShipUpdate(String order_idx);
}
