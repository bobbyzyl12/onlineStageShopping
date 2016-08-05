package com.ssss.service;

import java.util.List;

import com.ssss.entity.GoodsDetailInOrder;
import com.ssss.entity.MyOrder;
import com.ssss.entity.Order;
import com.ssss.entity.PageModel;

public interface OrderService {
	public void submitOrder(String address,Integer userID);
	
	public List<MyOrder> showMyOrder(Integer userID);
	
	public List<GoodsDetailInOrder> getGoodsDetail(Integer orderID);
	
	public MyOrder findBasicInfo(Integer orderID);
	
	public List<Order> findAllToCheck();
	
	public void pass(Integer orderID);
	
	public void reject(Integer orderID);
	
	public List<Order> getUserOrder(Integer userID);
	
	public void compeletePay(Integer orderID,Integer stageNo);
	
	public Order findByID(Integer orderID);
	
	public void editState(Integer orderID,String orderState);
	
	public List<Order> findAll(PageModel<Order> pageModel);
	
	public Integer findAllCount(PageModel<Order> pageModel);
}
