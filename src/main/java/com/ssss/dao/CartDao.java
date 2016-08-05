package com.ssss.dao;

import java.util.List;

import com.ssss.entity.Cart;
import com.ssss.entity.GoodsInCart;

public interface CartDao {
	void addCart(Integer cartID);
	
	void addIntoCart(GoodsInCart goodsInCart);
	
	void editGoodsInCart(GoodsInCart goodsInCart);
	
	void deleteGoodsInCart(GoodsInCart goodsInCart);
	
	void deleteAllGoodsInCart(Integer cartID);
	
	void deleteCart(Integer cartID);
	
	GoodsInCart findGoodsInCart(GoodsInCart goodsInCart);
	
	List<GoodsInCart> findMyCart(Integer cartID);
	
	List<GoodsInCart> findMyCartOrdered(Integer cartID);
	
	void updateCart(GoodsInCart goodsInCart);
	
	Integer findQuantityInCart(GoodsInCart goodsInCart);
	
	Cart findByCartID(Integer cartID);
	
}
