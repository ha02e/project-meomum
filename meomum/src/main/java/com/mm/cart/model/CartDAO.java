package com.mm.cart.model;
import java.util.*;

public interface CartDAO {

	public int cartInsert(CartDTO dto);
	public List<CartDTO> cartCheck(int pro_idx);
	public int cartMoreInsert(CartDTO dto);
	
}
