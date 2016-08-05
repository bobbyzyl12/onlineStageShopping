package com.ssss.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssss.dao.CartDao;
import com.ssss.dao.CreditDao;
import com.ssss.dao.GoodsDao;
import com.ssss.dao.OrderDao;
import com.ssss.dao.StageDao;
import com.ssss.dao.UserDao;
import com.ssss.entity.Goods;
import com.ssss.entity.GoodsDetailInOrder;
import com.ssss.entity.GoodsInCart;
import com.ssss.entity.GoodsInOrder;
import com.ssss.entity.MyCart;
import com.ssss.entity.MyOrder;
import com.ssss.entity.Order;
import com.ssss.entity.OrderDetail;
import com.ssss.entity.PageModel;
import com.ssss.entity.Stage;
import com.ssss.entity.User;
import com.ssss.service.OrderService;

@Service(value = "orderService")
public class OrderServiceImpl implements OrderService{
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private GoodsDao goodsDao;
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private StageDao stageDao;
	
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private CreditDao creditDao;
	
	//生成订单方法
	public void submitOrder(String address,Integer userID)
	{
		//将我的购物车中的商品ID以及数量和分期等级放入list中取出（按分期等级排序）
		List<GoodsInCart> goodsInCart = cartDao.findMyCartOrdered(userID);
		
		//preStage用于记录之前一行的stageLevel，currentOrderID用于记录当前的orderID
		Integer preStage = 0;
		Integer currentOrderID = 0;
		
		//此list用于存放所有新建的order的id用于后续的order进一步处理
		List<Integer> orderIDList = new ArrayList<Integer>();
		
		//遍历该List,创建order并将商品及其数量放入订单中
		for(int i=0;i<goodsInCart.size();++i)
		{
			//取出当前需要处理的一行
			GoodsInCart currentGoodsInCart = goodsInCart.get(i);
			//取出改商品的分期等级
			Integer currentStage = currentGoodsInCart.getStageLevel();
			
			//若不等于之前的一行，则新建一个order
			if(preStage != currentStage)
			{
				preStage = currentStage;	//更新stageLevel
				
				//新建一个order
				Order newOrder = new Order();
				
				//为其赋值
				Date currentDate = new Date();	//获取当前日期
				String currentState = "0";	//暂定状态为未提交(0)
				float currentPrice = 0;		//暂定总金额为0
				
				newOrder.setOrderCreateDate(currentDate);
				newOrder.setOrderLevel(currentStage);
				newOrder.setOrderState(currentState);
				newOrder.setOrderAddress(address);
				newOrder.setUserID(userID);
				newOrder.setTotalPrice(currentPrice);
				
				//将新建的order插入到表中,并将currentOrderID记录,放入orderIDList中
				orderDao.add(newOrder);
				currentOrderID = newOrder.getOrderID();
				orderIDList.add(currentOrderID);
				
				//减少商品库存
				Goods goods=goodsDao.findByID(currentGoodsInCart.getGoodsID());
				if(goods.getGoodsStore()>currentGoodsInCart.getQuantity())
				{	
					goods.setGoodsStore(goods.getGoodsStore()-currentGoodsInCart.getQuantity());
					goodsDao.update(goods);
					//将商品以及其数量放入订单中
					GoodsInOrder goodsInOrder =new GoodsInOrder();
					goodsInOrder.setGoodsID(currentGoodsInCart.getGoodsID());
					goodsInOrder.setQuantity(currentGoodsInCart.getQuantity());
					goodsInOrder.setOrderID(currentOrderID);
					orderDao.addGoodsInOrder(goodsInOrder);
				}
				
				
				
			}
			//如果此行的分期等级等于前一行的分期等级则直接加入前一行的order中，不需要新建order
			else
			{
				//减少商品库存
				Goods goods=goodsDao.findByID(currentGoodsInCart.getGoodsID());
				//如果库存足够
				if(goods.getGoodsStore()>currentGoodsInCart.getQuantity())
				{	
					goods.setGoodsStore(goods.getGoodsStore()-currentGoodsInCart.getQuantity());
					goodsDao.update(goods);
					//将商品以及其数量放入订单中
					GoodsInOrder goodsInOrder =new GoodsInOrder();
					goodsInOrder.setGoodsID(currentGoodsInCart.getGoodsID());
					goodsInOrder.setQuantity(currentGoodsInCart.getQuantity());
					goodsInOrder.setOrderID(currentOrderID);
					orderDao.addGoodsInOrder(goodsInOrder);
				}
				
			}
		}
		
		//对于每一个新建的order进行进一步的处理（遍历orderIDList）
		for(int i=0;i<orderIDList.size();++i)
		{	
			//通过orderID找到order
			Integer tempOrderID = orderIDList.get(i);
			Order tempOrder = orderDao.findByID(tempOrderID);
			
			//找到当前order所对应的分期等级，获取手续费率以及分期数
			Stage tempStage = stageDao.findByID(tempOrder.getOrderLevel());
			float tempCharge =  tempStage.getCharge();
			Integer tempStageNum = tempStage.getStageNum();
			
			float totalOriginPrice = 0;		//定义订单原始总价
			
			List<GoodsInOrder> tempGoodsInOrderList = orderDao.selectGoodsInOrder(tempOrderID);
			
			for(int j=0;j<tempGoodsInOrderList.size();++j)
			{
				GoodsInOrder tempGoodsInOrder = tempGoodsInOrderList.get(j);
				Integer tempGoodsID = tempGoodsInOrder.getGoodsID();
				
				//得到该商品原始单价
				float goodsOriginPrice = (goodsDao.findByID(tempGoodsID)).getGoodsPrice();
				
				//累计所有订单内商品的原始总价
				totalOriginPrice = totalOriginPrice + goodsOriginPrice * (tempGoodsInOrder.getQuantity());
			}
			
			//实际应付总价为（原总价）*（手续费率+1）
			float totalTruePrice = totalOriginPrice*(tempCharge/100 + 1);
			totalTruePrice =(float)(Math.round((totalTruePrice)*100))/100; //四舍五入为2位小数
			tempOrder.setTotalPrice(totalTruePrice);		//将order的总价重新加入
			
			float perPrice = totalTruePrice/tempStageNum;	//每期实际应付
			perPrice =(float)(Math.round((perPrice)*100))/100; //四舍五入为2位小数
			
			//得到user的信用等级以及信用等级的详细信息
			Integer userCreditLevel = (userDao.findByID(userID)).getUserCredit();
			Integer userMaxNum = creditDao.findByID(userCreditLevel).getMaxNum();
			Integer userMaxPass = creditDao.findByID(userCreditLevel).getMaxPass();
			
			if(userMaxPass >= totalTruePrice)	//订单总金额若大于最大自动审核通过额度
			{
				tempOrder.setOrderState("1");
			}
			else if(userMaxNum < totalTruePrice)	//订单总金额大于最大额度
			{
				tempOrder.setOrderState("7");
			}
			else				//若总金额介于两者之间
			{
				tempOrder.setOrderState("2");
			}
			
			//以上，order的基础属性就处理完毕，将orderform更新
			orderDao.update(tempOrder);
			
			//接下来根据该订单的状态去生成orderDetail表以记录每一期的状态(每一个订单有几期就生成几期的数据)
			for(int k=0;k<tempStageNum;++k)
			{
				OrderDetail tempOrderDetail = new  OrderDetail();
				tempOrderDetail.setStageNo(k+1);	//第一期时k=0，故存k+1
				tempOrderDetail.setOrderID(tempOrderID);
				
				//计算每次ddl的时间
				Calendar calendar = new GregorianCalendar(); 
				calendar.setTime(tempOrder.getOrderCreateDate()); 
				calendar.add(calendar.DATE,30*(k+1));	//每期30天
				Date ddl=calendar.getTime();
				tempOrderDetail.setDeadline(ddl);
				
				if(k==0)	//第一期比较特殊，做特殊处理
				{
					if(tempOrder.getOrderState()=="1"){	//如果已经通过自动审核
						tempOrderDetail.setStageState('2');		//第一期已经可以开始支付
					}
					else
					{
						tempOrderDetail.setStageState('1');	
					}
					
					//如果余数，则放在第一期支付
					float firstStagePrice = perPrice +  totalTruePrice - perPrice*tempStageNum;
					firstStagePrice = (float)(Math.round((firstStagePrice)*100))/100;
					tempOrderDetail.setStageMoney(firstStagePrice);
				}
				else	//其他期数
				{
					tempOrderDetail.setStageMoney(perPrice);
					tempOrderDetail.setStageState('1');
				}
				
				//赋值完成后insert
				
				orderDao.addIntoOrderDetail(tempOrderDetail);
			}
			
		}
		
		//最后清空该用户购物车内的所有商品
		cartDao.deleteAllGoodsInCart(userID);
	}
	
	//查看我的订单
	public List<MyOrder> showMyOrder(Integer userID){
		
		//创建一个专门用于创建结果的数组
		List<MyOrder> res = new ArrayList<MyOrder>();
		
		//创建orderList用以存放该用户所有order的基本信息
		List<Order> orderList= orderDao.selectOrderByUserID(userID);
		
		//遍历orderList
		for(int i=0;i<orderList.size();++i){
			
			Order tempOrder = orderList.get(i);
			
			//先对该order及其对应的orderDetail表进行查询
			List<OrderDetail> orderDetailList = orderDao.findDetailByOrderID(tempOrder.getOrderID());
			
			//初始化
			Integer payedStageID = orderDetailList.get(0).getOrderDetailID();
			Date currentDate = new Date();
			boolean complete = true;
			
			if(tempOrder.getOrderState()=="0")	//如果原来是逾期状态，初始化为未完成支付状态，重新判断
			{
				tempOrder.setOrderState("1");
			}
			//遍历该表，发现是否有逾期的部分,以及获得最新一期的支付完成的DetailID
			for(int j=0;j<orderDetailList.size();++j)
			{
				OrderDetail tempOrderDetail = orderDetailList.get(j);
				//若处在未可开始支付状态
				if(tempOrderDetail.getStageState()=='1')
				{	
					//比较每一条的截止日期与当前日期的关系
					boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
					if(compareDate)		//如果当前日期在ddl后，则将detail和order的状态都设置为逾期
					{
						tempOrderDetail.setStageState('4');
						tempOrder.setOrderState("0");
					}
					complete = false;
				}
				//若处在可开始支付未支付完成状态
				else if(tempOrderDetail.getStageState()=='2')
				{
					//比较每一条的截止日期与当前日期的关系
					boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
					if(compareDate)		//如果当前日期在ddl后，则将detail和order的状态都设置为逾期
					{
						tempOrderDetail.setStageState('4');
						tempOrder.setOrderState("0");
					}
					complete = false;
				}
				//若已支付完成
				else if(tempOrderDetail.getStageState()=='3')
				{
					//记录已支付完成的stageNum 的orderDetailID
					 payedStageID = tempOrderDetail.getOrderDetailID();
				}
				
				//若有一条detail状态为逾期，将整个order的状态设置为逾期
				else if(tempOrderDetail.getStageState()=='4')
				{
					tempOrder.setOrderState("0");
					complete = false;
				}
			}
			
			if(complete == true)
				tempOrder.setOrderState("5");
			
			//得到下一期支付的是第几期，如果是第一期的话则不变，需要再判断一下第一期是否已经支付了
			Integer nextStageID = 0;
			if(payedStageID == orderDetailList.get(0).getOrderDetailID() && orderDetailList.get(0).getStageState()!='3')
			{
				nextStageID = payedStageID;
			}
			else
			{ 
				nextStageID = payedStageID+1;
			}
			
			//更新order的基本状态
			orderDao.update(tempOrder);
			
			//得到下一次需要支付的stage的detail
			OrderDetail nextDetail = orderDao.findDetailByID(nextStageID);
			
			float nextStageMoney = nextDetail.getStageMoney();
			if(orderDao.findDetailByID(nextStageID).getStageState()=='4')	//如果当前需要支付的当期是逾期
			{
				//查找该用户的信用等级所对应的每日利率（万分之）
				float interest =1 + (creditDao.findByID(userDao.findByID(userID).getUserCredit()).getInterest())/10000;
				
				//计算出两者间隔
				Calendar cal = Calendar.getInstance();  
			    cal.setTime(currentDate);  
			    long time1 = cal.getTimeInMillis();               
			    cal.setTime(nextDetail.getDeadline());  
			    long time2 = cal.getTimeInMillis();       
			    long between_days=(time2-time1)/(1000*3600*24);  
			    Integer days = (int) between_days;
			    
			    //计算并化为小数点后两位
			    nextStageMoney = nextStageMoney * (float) Math.pow(interest, days); 
			    nextStageMoney = (float)(Math.round((nextStageMoney)*100))/100;	
			}
				
			MyOrder tempMyOrder = new MyOrder();
			tempMyOrder.setOrderID(tempOrder.getOrderID());
			tempMyOrder.setOrderTotalPrice(tempOrder.getTotalPrice());
			String str=String.valueOf(tempOrder.getOrderState());
			tempMyOrder.setOrderState(str);
			tempMyOrder.setNextNo(nextDetail.getStageNo());
			tempMyOrder.setNextStagePrice(nextStageMoney);
			tempMyOrder.setDeadline(nextDetail.getDeadline());
			tempMyOrder.setTotalStageNum(stageDao.findByID(tempOrder.getOrderLevel()).getStageNum());
			
			//加入返回的list
			res.add(tempMyOrder);
		}
		
		
		return res;
	}

	//通过订单id查询其中商品的信息
	public List<GoodsDetailInOrder> getGoodsDetail(Integer orderID){
		
		List<GoodsInOrder> goodsInOrderList = orderDao.selectGoodsInOrder(orderID);
		
		List<GoodsDetailInOrder> res = new ArrayList<GoodsDetailInOrder>();
		
		for(int i=0;i<goodsInOrderList.size();++i)
		{
			GoodsInOrder goodsInOrder = goodsInOrderList.get(i);
			Integer goodsID = goodsInOrder.getGoodsID();
			Goods goods = goodsDao.findByID(goodsID);
			float tempPrice = (goods.getGoodsPrice()) * (goodsInOrder.getQuantity());
			
			//新建需要输出的表的一行
			GoodsDetailInOrder temp = new GoodsDetailInOrder();
			
			//赋值
			temp.setGoodsID(goodsInOrder.getGoodsID());
			temp.setGoodsPicture(goods.getGoodsPicture());
			temp.setQuantity(goodsInOrder.getQuantity());
			temp.setTotalPrice(tempPrice);
			temp.setGoodsName(goods.getGoodsName());
			
			res.add(temp);
			
		}
		return res;
	}
	
	//通过订单id查询到其基础的信息
	public MyOrder findBasicInfo(Integer orderID)
	{
		Order tempOrder = orderDao.findByID(orderID);
		MyOrder tempMyOrder = new MyOrder();
		Integer userID = tempOrder.getUserID();
		//先对该order及其对应的orderDetail表进行查询
		List<OrderDetail> orderDetailList = orderDao.findDetailByOrderID(tempOrder.getOrderID());
		
		//初始化
		Integer payedStageID = orderDetailList.get(0).getOrderDetailID();
		Date currentDate = new Date();
		boolean complete = true;
		
		if(tempOrder.getOrderState()=="0")	//如果原来是逾期状态，初始化为未完成支付状态，重新判断
		{
			tempOrder.setOrderState("1");
		}
		//遍历该表，发现是否有逾期的部分,以及获得最新一期的支付完成的DetailID
		for(int j=0;j<orderDetailList.size();++j)
		{
			OrderDetail tempOrderDetail = orderDetailList.get(j);
			//若处在未可开始支付状态
			if(tempOrderDetail.getStageState()=='1')
			{	
				//比较每一条的截止日期与当前日期的关系
				boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
				if(compareDate)		//如果当前日期在ddl后，则将detail和order的状态都设置为逾期
				{
					tempOrderDetail.setStageState('4');
					tempOrder.setOrderState("0");
				}
				complete = false;
			}
			//若处在可开始支付未支付完成状态
			else if(tempOrderDetail.getStageState()=='2')
			{
				//比较每一条的截止日期与当前日期的关系
				boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
				if(compareDate)		//如果当前日期在ddl后，则将detail和order的状态都设置为逾期
				{
					tempOrderDetail.setStageState('4');
					tempOrder.setOrderState("0");
				}
				complete = false;
			}
			//若已支付完成
			else if(tempOrderDetail.getStageState()=='3')
			{
				//记录已支付完成的stageNum 的orderDetailID
				 payedStageID = tempOrderDetail.getOrderDetailID();
			}
			
			//若有一条detail状态为逾期，将整个order的状态设置为逾期
			else if(tempOrderDetail.getStageState()=='4')
			{
				tempOrder.setOrderState("0");
				complete = false;
			}
		}
		
		if(complete == true)
			tempOrder.setOrderState("5");
		
		//得到下一期支付的是第几期，如果是第一期的话则不变，需要再判断一下第一期是否已经支付了
		Integer nextStageID = 0;
		if(payedStageID == orderDetailList.get(0).getOrderDetailID() && orderDetailList.get(0).getStageState()!='3')
		{
			nextStageID = payedStageID;
		}
		else
		{ 
			nextStageID = payedStageID+1;
		}
		
		//更新order的基本状态
		orderDao.update(tempOrder);
		
		//得到下一次需要支付的stage的detail
		OrderDetail nextDetail = orderDao.findDetailByID(nextStageID);

		float nextStageMoney = nextDetail.getStageMoney();
		if(orderDao.findDetailByID(nextStageID).getStageState()=='4')	//如果当前需要支付的当期是逾期
		{
			//查找该用户的信用等级所对应的每日利率（万分之）
			float interest =1 + (creditDao.findByID(userDao.findByID(userID).getUserCredit()).getInterest())/10000;
			
			//计算出两者间隔
			Calendar cal = Calendar.getInstance();  
		    cal.setTime(currentDate);  
		    long time1 = cal.getTimeInMillis();               
		    cal.setTime(nextDetail.getDeadline());  
		    long time2 = cal.getTimeInMillis();       
		    long between_days=(time2-time1)/(1000*3600*24);  
		    Integer days = (int) between_days;
		    
		    nextStageMoney = nextStageMoney * (float) Math.pow(interest, days); 
		    nextStageMoney = (float)(Math.round((nextStageMoney)*100))/100;	
		}
		tempMyOrder.setOrderID(tempOrder.getOrderID());
		tempMyOrder.setOrderTotalPrice(tempOrder.getTotalPrice());
		tempMyOrder.setOrderState(tempOrder.getOrderState());
		tempMyOrder.setNextNo(nextDetail.getStageNo());
		tempMyOrder.setNextStagePrice(nextStageMoney);
		tempMyOrder.setDeadline(nextDetail.getDeadline());
		tempMyOrder.setTotalStageNum(stageDao.findByID(tempOrder.getOrderLevel()).getStageNum());
		
		return tempMyOrder;
	}
	
	//支付我的当期成功后对数据库进行操作
	public void compeletePay(Integer orderID,Integer stageNo)
	{
		OrderDetail temp = new OrderDetail();
		temp.setOrderID(orderID);
		temp.setStageNo(stageNo);
		
		//现在该stage对应的currentDetail
		OrderDetail currentDetail = orderDao.findDetailByNo(temp);
		//将当期设置为已支付
		orderDao.updateToPaid(currentDetail);
		
		//得到下一个stage
		OrderDetail nextDetail = orderDao.findDetailByID(currentDetail.getOrderDetailID()+1);
		
		//如果不是别的order的detail
		if(nextDetail.getOrderID() == orderID)
		{
			//将下一期设置为可以开始支付
			orderDao.updateToWait(nextDetail);
		}
		
	} 
	
	public List<Order> getUserOrder(Integer userID){
		return orderDao.selectOrderByUserID(userID);
	}
	
	public List<Order> findAllToCheck(){
		return orderDao.findAllToCheck();
	}
	
	public void pass(Integer orderID){
		Order temp = orderDao.findByID(orderID);
		temp.setOrderState("1");
		orderDao.update(temp);
	}
	
	public void reject(Integer orderID){
		Order temp = orderDao.findByID(orderID);
		temp.setOrderState("4");
		orderDao.update(temp);
	}
	
	public List<Order> findAll(PageModel<Order> pageModel){
		return orderDao.findAll(pageModel);
	}
	
	public Integer findAllCount(PageModel<Order> pageModel) {
		return orderDao.findAllCount(pageModel);
	}
	
	public Order findByID(Integer orderID){
		return orderDao.findByID(orderID);
	}
	
	public void editState(Integer orderID,String orderState){
		Order temp = orderDao.findByID(orderID);
		temp.setOrderState(orderState);
		orderDao.update(temp);
	}
}
