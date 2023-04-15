package com.mm.turnback.model;

import java.util.List;
import java.util.Map;

import com.mm.order.model.MyOrderListDTO;


public interface ReturnDAO {
	public int returnApplyInsert(ReturnDTO dto);

	public List<MyOrderListDTO> myReturnProList(Map map);
	public int myReturnProListCnt(Map map);

	public List<ReturnListDTO> returnProList(Map map);
	public int returnProListCnt(Map map);
	
	public ReturnListDTO returnData(Map map);
	
	public int returnStartUpdate(Map map);
	public int returnNoUpdate(Map map);
}
