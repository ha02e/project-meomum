package com.mm.order.model;

import java.util.List;

import com.mm.pro.model.ProDTO;

public interface OrderDAO {

	public ProDTO orderList(int idx);
	public int orderInsert(OrderDTO dto);
}
