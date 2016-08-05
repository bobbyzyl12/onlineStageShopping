package com.ssss.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.ssss.entity.MyCart;
import com.ssss.entity.PageModel;
import com.ssss.entity.Goods;
import com.ssss.entity.GoodsInCart;

public interface GoodsService {
	
	public void add(Goods goods);
	
	public String update(Goods goods);
	
	public Goods findByID(Integer goodsID);
	
	public String addIntoCart(GoodsInCart goodsInCart);
	
	public List<Goods> search(String temp);
	
	public List<Goods> findAll(PageModel<Goods> pageModel);
	
	public Integer findAllCount();
	
	public void delete(Integer goodsID);
	
	public List<MyCart> showMyCart(Integer userID);
	
	public String editGoodsInCart(GoodsInCart temp);
	
	public void deleteGoodsInCart(GoodsInCart temp);
}
