package com.mm.cart.model;
import java.util.*;


public interface CartDAO {

	public int cartInsert(CartDTO dto);
	public int cartCheck(int pro_idx,int user_idx);
	public List<CartDTO> cartList(int user_idx);
	public int cartDelete(int cart_idx);
	public int cartNumUpdate(int cart_amount, int cart_idx);
    public int userCartCount(int user_idx);
    public CartDTO orderListCartIDX(int cart_idx);
    public void orderCartDelete(int user_idx,int pro_idx);
}
