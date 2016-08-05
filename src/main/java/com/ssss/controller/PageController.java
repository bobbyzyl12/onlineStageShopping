package com.ssss.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssss.entity.Goods;
import com.ssss.entity.GoodsDetailInOrder;
import com.ssss.entity.MyCart;
import com.ssss.entity.MyOrder;
import com.ssss.entity.Order;
import com.ssss.entity.PageModel;
import com.ssss.entity.StageSelect;
import com.ssss.entity.User;
import com.ssss.service.GoodsService;
import com.ssss.service.OrderService;
import com.ssss.service.StageService;
import com.ssss.service.UserService;

@Controller
@RequestMapping(value="/page")
public class PageController {
	/*
	 * 主要用于控制各个页面之间跳转以及预加载，包括跳转到：
	 * 用户的主页，管理员的主页、审核员的主页
	 * 用户的登陆/注册，管理员的登陆、审核员的登陆页面
	 * 用户的我的信息，我的购物车，我的订单页面
	 * 商品详情，订单详情页面
	 * 管理员对用户，商品，订单信息的增加与修改页面
	 * 审核员的信用等级审核页面
	 * */
	
	@Autowired
	private UserService userService;
	
	@Autowired
	@Qualifier(value="goodsService")
	private GoodsService goodsService;
	
	@Autowired
	private StageService stageService;
	
	@Autowired
	private OrderService orderService;
	
	/**
     * 跳转到用户的注册页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToSignin")
	public String jumpToSignin(){
		return "signin";
	}
	
	/**
     * 跳转到用户的登陆页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToLogin")
	public String jumpToLogin(){
		return "login";
	}
	
	/**
     * 跳转到登陆成功的页面(回到首页)
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToWelcome")
	public String jumpToIndex(){
		return "gotoIndex";
	}
	
	/**
     * 跳转到管理员的登陆页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToAdministerLogin")
	public String jumpToAdministerLogin(){
		return "administerLogin";
	}
	
	/**
     * 跳转到审核员的登陆页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToManagerLogin")
	public String jumpToManagerLogin(){
		return "managerLogin";
	}
	
	/**
     * 跳转到管理员主页
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToAdministerIndex")
	public String jumpToAdministerIndex(){
		return "administerIndex";
	}
	
	/**
     * 跳转到管理员的用户管理页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToUserManage")
	public String jumpToUserManage(PageModel<User> pageModel,Map<String, Object> map){		
		if (pageModel == null) {
			pageModel = new PageModel<User>();
		}
		List<User> userList = userService.findAll(pageModel);
		pageModel.setTotalrecode(userService.findAllCount(pageModel));
		pageModel.setDatas(userList);
		map.put("userList", userList);
		map.put("pageModel", pageModel);
		return "userManage";
	}
	
	/**
     * 跳转到管理员的订单管理页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToOrderManage")
	public String jumpToOrderManage(PageModel<Order> pageModel,Map<String, Object> map){
		if (pageModel == null) {
			pageModel = new PageModel<Order>();
		}
		List<Order> orderList = orderService.findAll(pageModel);
		pageModel.setTotalrecode(orderService.findAllCount(pageModel));
		pageModel.setDatas(orderList);
		map.put("orderList", orderList);
		map.put("pageModel", pageModel);
		return "orderManage";
	}
	
	/**
     * 跳转到管理员的商品管理页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToGoodsManage")
	public String jumpToGoodsManage(PageModel<Goods> pageModel,Map<String, Object> map){
		if (pageModel == null) {
			pageModel = new PageModel<Goods>();
		}
		pageModel.setTotalrecode(goodsService.findAllCount());
		List<Goods> goodsList = goodsService.findAll(pageModel);
		pageModel.setDatas(goodsList);
		map.put("goodsList", goodsList);
		map.put("pageModel", pageModel);
		return "goodsManage";
	}
	
	/**
     * 跳转到管理员的增加用户页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToAddUserPage")
	public String jumpToAddUserManage(){
		return "addUserPage";
	}
	
	/**
     * 跳转到管理员的编辑用户页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToEditUserPage")
	public String jumpToEditUserManage(@RequestParam(value = "userID") Integer userID,Map<String, Object> map){
		User temp =userService.findByID(userID);
		map.put("userID", userID);
		map.put("user", temp);
		return "editUserPage";
	}
	  
	/**
     * 跳转到管理员的删除用户页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToDeleteUserPage")
	public String jumpToDeleteUserManage(@RequestParam(value = "userID") Integer userID){
		userService.delete(userID);
		return "deleteUserPage";
	}
	
	/**
     * 跳转到管理员的编辑订单页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToEditOrderPage")
	public String jumpToEditOrderPage(@RequestParam(value = "orderID") Integer orderID,Map<String, Object> map){
		Order temp = orderService.findByID(orderID);
		map.put("orderID", orderID);
		map.put("orderState", temp.getOrderState());
		return "editOrderPage";
	}
	
	/**
     * 跳转到用户的主页
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToHomePage")		//跳转到用户主页
	public String jumpToHomePage(PageModel<Goods> pageModel,Map<String, Object> map){
		if (pageModel == null) {
			pageModel = new PageModel<Goods>();
		}
		pageModel.setPagesize(4);
		pageModel.setTotalrecode(goodsService.findAllCount());
		List<Goods> goodsList = goodsService.findAll(pageModel);
		pageModel.setDatas(goodsList);
		map.put("goodsList", goodsList);
		map.put("pageModel", pageModel);
		return "homePage";
	}
	
	/**
     * 跳转到审核员主页
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToHomeAgain")
	public String jumpToHomeAgain(){
		return "homePage";
	}
	
	/**
     * 跳转到审核员主页
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToManagerIndex")
	public String jumpToManagerIndex(){
		return "managerIndex";
	}
	
	/**
     * 跳转到用户的“我的购物车”页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToMyCart")
	public String jumpToMyCart(Map<String, Object> map,HttpSession session){
		Integer userID=(Integer) session.getAttribute("userID");
		List<MyCart> myCartList= goodsService.showMyCart(userID);
		map.put("myCartList", myCartList);
		return "myCart";
	}
	
	/**
     * 跳转到用户的“我的订单”页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToMyOrder")
	public String jumpToMyOrder(Map<String, Object> map,HttpSession session){
		Integer userID=(Integer) session.getAttribute("userID");
		List<MyOrder> myOrderList= orderService.showMyOrder(userID);
		map.put("myOrderList", myOrderList);
		return "myOrder";
	}
	
	/**
     * 跳转到用户的“我的个人信息”页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToMyInfo")
	public String jumpToMyInfo(Map<String, Object> map,HttpSession session){
		Integer userID=(Integer) session.getAttribute("userID");
		User user = userService.findByID(userID);
		map.put("userInfo", user);
		return "myInfo";
	}
	
	/**
     * 跳转到用户的“我的个人信息”页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToPayPage")
	public String jumpToPayPage(@RequestParam(value = "orderID") Integer orderID,@RequestParam(value = "stageNo") Integer stageNo){
		orderService.compeletePay(orderID, stageNo);
		return "payPage";
	}
	
	/**
     * 跳转到商品详细信息页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToGoodsDetail")
	public String jumpToGoodsDetail(@RequestParam(value = "goodsID") Integer goodsID,Map<String, Object> map,HttpSession session){
		//通过解析goodsID将goods的所有属性加载
		Goods temp= goodsService.findByID(goodsID);
		map.put("goodsID", goodsID);
		map.put("goodsState", temp.getGoodsState());
		map.put("goodsName", temp.getGoodsName());
		map.put("goodsPrice", temp.getGoodsPrice());
		map.put("goodsPicture", temp.getGoodsPicture());
		map.put("goodsStore", temp.getGoodsStore());
		map.put("goodsDescribe", temp.getGoodsDescribe());
		
		//传入session得到当前的userID
		Integer userID =(Integer) session.getAttribute("userID");
		if(userID==null)	userID=0;
		List<StageSelect> optionList = stageService.stageOption(userID, goodsID);
		map.put("optionList",optionList);
		return "goodsDetail";
	}
	
	/**
     * 跳转到订单详细信息页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToOrderDetail")
	public String jumpToOrderDetail(@RequestParam(value = "orderID") Integer orderID,Map<String, Object> map){
		List<GoodsDetailInOrder> goodsDetailInOrderList = orderService.getGoodsDetail(orderID);
		map.put("goodsDetailInOrderList", goodsDetailInOrderList);
		MyOrder temp = orderService.findBasicInfo(orderID);
		map.put("myOrder",temp);
		return "orderDetail";
	}
	
	/**
     * 跳转到管理员的增加商品页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToAddGoodsPage")
	public String jumpToAddGoodsManage(){
		return "addGoodsPage";
	}
	
	/**
     * 跳转到管理员的编辑商品页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToEditGoodsPage")
	public String jumpToEditGoodsManage(@RequestParam(value = "goodsID") Integer goodsID,Map<String, Object> map){
		Goods temp = goodsService.findByID(goodsID);
		map.put("goods", temp);
		return "editGoodsPage";
	}
	  
	/**
     * 跳转到管理员的删除商品页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToDeleteGoodsPage")
	public String jumpToDeleteGoodsManage(@RequestParam(value = "goodsID") Integer goodsID){
		goodsService.delete(goodsID);
		return "deleteGoodsPage";
	}
	
	/**
     * 跳转到审核员的用户信用审核页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToCreditCheck")
	public String jumpToCreditCheck(Map<String, Object> map){
		List<User> users =userService.findAllNeedCheck();
		map.put("userList",users);
		return "creditCheck";
	}
	
	/**
     * 跳转到审核员的订单审核页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToOrderCheck")
	public String jumpToOrderCheck(Map<String, Object> map){
		List<Order> orderList = orderService.findAllToCheck();
		map.put("orderList",orderList);
		return "orderCheck";
	}
	
	/**
     * 跳转到审核员的用户审核详细（查看用户订单详情）页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToUserOrder")
	public String jumpToUserOrder(@RequestParam(value = "userID") Integer userID,Map<String, Object> map){
		List<Order> orderList = orderService.getUserOrder(userID);
		map.put("userID",userID);
		map.put("orderList",orderList);
		return "userOrder";
	}
	
	/**
     * 跳转到审核员的用户审核详细（查看用户订单详情）页面
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToOrderUser")
	public String jumpToOrderUser(@RequestParam(value = "userID") Integer userID,@RequestParam(value = "orderID") Integer orderID,Map<String, Object> map){
		List<Order> orderList = orderService.getUserOrder(userID);
		User temp =userService.findByID(userID);
		map.put("tempOrderID",orderID);
		map.put("user",temp);
		map.put("orderList",orderList);
		return "orderUser";
	}
}
