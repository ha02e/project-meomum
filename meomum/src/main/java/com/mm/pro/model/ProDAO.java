package com.mm.pro.model;

import java.util.*;

public interface ProDAO {
	public int proInsert(ProDTO dto);
	public List<ProDTO> proList(Map map);
	public int getTotalCnt();
}
