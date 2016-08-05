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
	 * ��Ҫ���ڿ��Ƹ���ҳ��֮����ת�Լ�Ԥ���أ�������ת����
	 * �û�����ҳ������Ա����ҳ�����Ա����ҳ
	 * �û��ĵ�½/ע�ᣬ����Ա�ĵ�½�����Ա�ĵ�½ҳ��
	 * �û����ҵ���Ϣ���ҵĹ��ﳵ���ҵĶ���ҳ��
	 * ��Ʒ���飬��������ҳ��
	 * ����Ա���û�����Ʒ��������Ϣ���������޸�ҳ��
	 * ���Ա�����õȼ����ҳ��
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
     * ��ת���û���ע��ҳ��
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToSignin")
	public String jumpToSignin(){
		return "signin";
	}
	
	/**
     * ��ת���û��ĵ�½ҳ��
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToLogin")
	public String jumpToLogin(){
		return "login";
	}
	
	/**
     * ��ת����½�ɹ���ҳ��(�ص���ҳ)
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToWelcome")
	public String jumpToIndex(){
		return "gotoIndex";
	}
	
	/**
     * ��ת������Ա�ĵ�½ҳ��
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToAdministerLogin")
	public String jumpToAdministerLogin(){
		return "administerLogin";
	}
	
	/**
     * ��ת�����Ա�ĵ�½ҳ��
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToManagerLogin")
	public String jumpToManagerLogin(){
		return "managerLogin";
	}
	
	/**
     * ��ת������Ա��ҳ
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToAdministerIndex")
	public String jumpToAdministerIndex(){
		return "administerIndex";
	}
	
	/**
     * ��ת������Ա���û�����ҳ��
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
     * ��ת������Ա�Ķ�������ҳ��
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
     * ��ת������Ա����Ʒ����ҳ��
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
     * ��ת������Ա�������û�ҳ��
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToAddUserPage")
	public String jumpToAddUserManage(){
		return "addUserPage";
	}
	
	/**
     * ��ת������Ա�ı༭�û�ҳ��
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
     * ��ת������Ա��ɾ���û�ҳ��
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToDeleteUserPage")
	public String jumpToDeleteUserManage(@RequestParam(value = "userID") Integer userID){
		userService.delete(userID);
		return "deleteUserPage";
	}
	
	/**
     * ��ת������Ա�ı༭����ҳ��
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
     * ��ת���û�����ҳ
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToHomePage")		//��ת���û���ҳ
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
     * ��ת�����Ա��ҳ
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToHomeAgain")
	public String jumpToHomeAgain(){
		return "homePage";
	}
	
	/**
     * ��ת�����Ա��ҳ
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToManagerIndex")
	public String jumpToManagerIndex(){
		return "managerIndex";
	}
	
	/**
     * ��ת���û��ġ��ҵĹ��ﳵ��ҳ��
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
     * ��ת���û��ġ��ҵĶ�����ҳ��
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
     * ��ת���û��ġ��ҵĸ�����Ϣ��ҳ��
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
     * ��ת���û��ġ��ҵĸ�����Ϣ��ҳ��
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToPayPage")
	public String jumpToPayPage(@RequestParam(value = "orderID") Integer orderID,@RequestParam(value = "stageNo") Integer stageNo){
		orderService.compeletePay(orderID, stageNo);
		return "payPage";
	}
	
	/**
     * ��ת����Ʒ��ϸ��Ϣҳ��
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToGoodsDetail")
	public String jumpToGoodsDetail(@RequestParam(value = "goodsID") Integer goodsID,Map<String, Object> map,HttpSession session){
		//ͨ������goodsID��goods���������Լ���
		Goods temp= goodsService.findByID(goodsID);
		map.put("goodsID", goodsID);
		map.put("goodsState", temp.getGoodsState());
		map.put("goodsName", temp.getGoodsName());
		map.put("goodsPrice", temp.getGoodsPrice());
		map.put("goodsPicture", temp.getGoodsPicture());
		map.put("goodsStore", temp.getGoodsStore());
		map.put("goodsDescribe", temp.getGoodsDescribe());
		
		//����session�õ���ǰ��userID
		Integer userID =(Integer) session.getAttribute("userID");
		if(userID==null)	userID=0;
		List<StageSelect> optionList = stageService.stageOption(userID, goodsID);
		map.put("optionList",optionList);
		return "goodsDetail";
	}
	
	/**
     * ��ת��������ϸ��Ϣҳ��
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
     * ��ת������Ա��������Ʒҳ��
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToAddGoodsPage")
	public String jumpToAddGoodsManage(){
		return "addGoodsPage";
	}
	
	/**
     * ��ת������Ա�ı༭��Ʒҳ��
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
     * ��ת������Ա��ɾ����Ʒҳ��
     * @param
     * @return
     */
	@RequestMapping(value = "/jumpToDeleteGoodsPage")
	public String jumpToDeleteGoodsManage(@RequestParam(value = "goodsID") Integer goodsID){
		goodsService.delete(goodsID);
		return "deleteGoodsPage";
	}
	
	/**
     * ��ת�����Ա���û��������ҳ��
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
     * ��ת�����Ա�Ķ������ҳ��
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
     * ��ת�����Ա���û������ϸ���鿴�û��������飩ҳ��
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
     * ��ת�����Ա���û������ϸ���鿴�û��������飩ҳ��
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
