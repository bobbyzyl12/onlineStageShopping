package com.ssss.dao;

import java.util.List;

import com.ssss.entity.GoodsInOrder;
import com.ssss.entity.Order;
import com.ssss.entity.OrderDetail;
import com.ssss.entity.PageModel;
import com.ssss.entity.User;

public interface OrderDao {
	
	public void add (Order order);
	
	public void addGoodsInOrder(GoodsInOrder goodsInOrder);
	
	public Order findByID(Integer orderID);
	
	public List<Order> selectOrderByUserID(Integer userID);
	
	public List<Order> findAllToCheck();
	
	public List<GoodsInOrder> selectGoodsInOrder(Integer orderID);
	
	public List<OrderDetail> findDetailByOrderID(Integer orderID);
	
	public OrderDetail findDetailByID(Integer orderDetailID);
	
	public void update(Order order);
	
	public void updateToPaid(OrderDetail orderDetail);
	
	public void updateToWait(OrderDetail orderDetail);
	
	public OrderDetail findDetailByNo(OrderDetail orderDetail);
	
	public void addIntoOrderDetail(OrderDetail orderDetail);
	
	public List<Order> findAll(PageModel<Order> t);
	
	public Integer findAllCount(PageModel<Order> pageModel);
}
