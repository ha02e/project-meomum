package com.mm.turnback.model;

import java.util.List;
import java.util.Map;


public interface ReturnDAO {
	public int returnApplyInsert(ReturnDTO dto);
	

	public List<ReturnListDTO> returnProList(Map map);
	public int returnProListCnt();
}
