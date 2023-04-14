package com.mm.order.model;

import java.util.List;
import java.util.Map;

import com.mm.pro.model.ProDTO;

public interface OrderDAO {

	public ProDTO orderList(int idx);
	public int orderInsert(OrderDTO dto);
	public int order_proInsert(OrderProDTO dto);
	
	public List<OrderReportDTO> myOrderReport(Map map);
	public int myReportTotalCnt(int user_idx);
	public List<OrderReportDTO> orderReport(Map map);
	public int reportTotalCnt();
	
	public OrderReportDTO orderData(Map map);
	
	public int shipStartUpdate(Map map);
	public int returnApplyUpdate(Map map);
	public int returnSubmitUpdate(Map map);
	public int returnCancelUpdate(Map map);

	public List<MyOrderListDTO> mySubsAllList(Map map);
	public int mySubsAllListCnt(int user_idx);
	public List<MyOrderListDTO> myReturnProList(Map map);
	public int myReturnProListCnt(int user_idx);
}
