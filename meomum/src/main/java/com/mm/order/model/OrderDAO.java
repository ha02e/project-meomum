package com.mm.order.model;

import java.util.List;
import java.util.Map;

import com.mm.pro.model.ProDTO;

public interface OrderDAO {

	public ProDTO orderList(int idx);
	public int orderInsert(OrderDTO dto);
	public int order_proInsert(OrderProDTO dto);
	public List<OrderDTO> myOrderList(int idx);
	public List<OrderReportDTO> myOrderReport(Map map);
	public int myReportTotalCnt(int user_idx);
	public List<OrderReportDTO> orderReport(Map map);
	public int reportTotalCnt();
	public OrderReportDTO orderData(String order_idx);
	public int shipStartUpdate(String order_idx);
}
