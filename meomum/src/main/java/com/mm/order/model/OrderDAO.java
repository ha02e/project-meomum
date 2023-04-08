package com.mm.order.model;

import java.util.List;
import java.util.Map;

import com.mm.pro.model.ProDTO;

public interface OrderDAO {

	public ProDTO orderList(int idx);
	public int orderInsert(OrderDTO dto);
	public List<OrderDTO> myOrderList(Integer idx);
	public List<OrderReportDTO> orderReport(Map map);
	public int reportTotalCnt();
}
