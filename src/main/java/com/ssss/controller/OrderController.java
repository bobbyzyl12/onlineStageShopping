package com.ssss.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssss.entity.Goods;
import com.ssss.service.OrderService;
import com.ssss.service.UserService;

@Controller
@RequestMapping(value="/order")
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private UserService userService;
	
	/**
     * 生成订单
     * @param goods
     * @return
     */
	
	@RequestMapping(value = "/submitOrder")
	@ResponseBody
	public String submitOrder(@RequestParam(value = "address") String address,HttpSession session){
		Integer userID=(Integer) session.getAttribute("userID");
		orderService.submitOrder(address,userID);
		return "success";
	}
	
	/**
     * 订单审核通过
     * @param goods
     * @return
     */
	@RequestMapping(value = "/passCheck")
	public String passCheck(@RequestParam(value = "orderID") Integer orderID,Map<String, Object> map){
		orderService.pass(orderID);
		return "managerIndex";
	}
	
	/**
     * 订单审核不通过
     * @param goods
     * @return
     */
	@RequestMapping(value = "/rejectCheck")
	public String rejectCheck(@RequestParam(value = "orderID") Integer orderID,Map<String, Object> map){
		orderService.reject(orderID);
		return "managerIndex";
	}
	
	/**
     * 订单状态修改
     * @param goods
     * @return
     */
	@RequestMapping(value = "/editState")
	@ResponseBody
	public String editState(@RequestParam(value = "orderID") Integer orderID,@RequestParam(value = "orderState") String orderState,Map<String, Object> map){
		orderService.editState(orderID, orderState);
		return "success";
	}
}
