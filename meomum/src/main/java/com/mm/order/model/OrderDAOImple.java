package com.mm.order.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.mm.pro.model.ProDTO;

public class OrderDAOImple implements OrderDAO {

	private SqlSessionTemplate sqlMap;

	public OrderDAOImple(SqlSessionTemplate sqlMap) {
		super();
		this.sqlMap = sqlMap;
	}

	@Override
	public ProDTO orderList(int idx) {
		ProDTO dto = sqlMap.selectOne("orderList", idx);
		return dto;
	}

	@Override
	public int orderInsert(OrderDTO dto) {
		int count = sqlMap.insert("orderInsert", dto);
		return count;
	}
	
	@Override
	public List<OrderReportDTO> myOrderReport(Map map) {
		List<OrderReportDTO> lists = sqlMap.selectList("myOrderReport", map);
		return lists;
	}

	@Override
	public int myReportTotalCnt(int user_idx) {
		int count = sqlMap.selectOne("myReportTotalCnt",user_idx);
		count = count == 0 ? 1 : count;
		return count;
	}

	@Override
	public List<OrderReportDTO> orderReport(Map map) {
		List<OrderReportDTO> lists = sqlMap.selectList("orderReport", map);
		return lists;
	}

	@Override
	public int reportTotalCnt() {
		int count = sqlMap.selectOne("reportTotalCnt");
		count = count == 0 ? 1 : count;
		return count;
	}
	
	@Override
	public OrderReportDTO orderData(Map map) {
		OrderReportDTO odto=sqlMap.selectOne("orderData", map);
		return odto;
	}
	
	@Override
	public int shipStartUpdate(Map map) {
		int count=sqlMap.update("shipStartUpdate", map);
		return count;
	}
	
	@Override
	public int returnApplyUpdate(Map map) {
		int count=sqlMap.update("returnApplyUpdate", map);
		return count;
	}
	
	@Override
	public int returnSubmitUpdate(Map map) {
		int count=sqlMap.update("returnSubmitUpdate",map);
		return count;
	}
	
	@Override
	public int returnCancelUpdate(Map map) {
		int count=sqlMap.update("returnCancelUpdate", map);
		return count;
	}
	
	
	@Override
	public int order_proInsert(OrderProDTO dto) {
		int count=sqlMap.insert("order_proInsert",dto);
		return count;
	}
	
	
	@Override
	public List<MyOrderListDTO> mySubsAllList(Map map) {
		List<MyOrderListDTO> lists = sqlMap.selectList("mySubsAllList", map);
		return lists;
	}
	
	@Override
	public int mySubsAllListCnt(int user_idx) {
		int count=sqlMap.selectOne("mySubsAllListCnt", user_idx);
		count = count == 0 ? 1 : count;
		return count;
	}
	
	@Override
	public List<MyOrderListDTO> myReturnProList(Map map) {
		List<MyOrderListDTO> lists = sqlMap.selectList("myReturnProList", map);
		return lists;
	}
	
	@Override
	public int myReturnProListCnt(int user_idx) {
		int count=sqlMap.selectOne("myReturnProListCnt", user_idx);
		count = count == 0 ? 1 : count;
		return count;
	}
}
