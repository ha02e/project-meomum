package com.mm.pro.model;

import java.util.*;

	public interface ProDAO {
	public int proInsert(ProDTO dto);
	public List<ProDTO> proList(Map map);
	public List<ProDTO> proItemList(Map map);
	public int getTotalCnt();
	public int itemTotalCnt();
	public int proDelete(int pro_idx);
	public List<ProDTO> proFind1(int proF);
	public List<ProDTO> proFind2(String proF);
	public List<ProDTO> proUpdateList(int pro_idx);
	public int proUpdate(ProDTO dto);
	public boolean proFindFile(String name);
	public List<ProDTO> proBest();
	
	public ProDTO proSelect(int pro_idx);
	public int proAmountUpdate(ProDTO dto);
	public int proStateUpdate(ProDTO dto);
	
	public int proAmountSelect(int pro_idx);
	public int proAmountShipUpdate(Map map);
	public int returnProUpdate(Map map);
	
	public int getA_TotalCnt(Map map);
	public List<ProDTO> proListAmount(Map map);
	
}
