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
	
	//���ɶ�������
	public void submitOrder(String address,Integer userID)
	{
		//���ҵĹ��ﳵ�е���ƷID�Լ������ͷ��ڵȼ�����list��ȡ���������ڵȼ�����
		List<GoodsInCart> goodsInCart = cartDao.findMyCartOrdered(userID);
		
		//preStage���ڼ�¼֮ǰһ�е�stageLevel��currentOrderID���ڼ�¼��ǰ��orderID
		Integer preStage = 0;
		Integer currentOrderID = 0;
		
		//��list���ڴ�������½���order��id���ں�����order��һ������
		List<Integer> orderIDList = new ArrayList<Integer>();
		
		//������List,����order������Ʒ�����������붩����
		for(int i=0;i<goodsInCart.size();++i)
		{
			//ȡ����ǰ��Ҫ�����һ��
			GoodsInCart currentGoodsInCart = goodsInCart.get(i);
			//ȡ������Ʒ�ķ��ڵȼ�
			Integer currentStage = currentGoodsInCart.getStageLevel();
			
			//��������֮ǰ��һ�У����½�һ��order
			if(preStage != currentStage)
			{
				preStage = currentStage;	//����stageLevel
				
				//�½�һ��order
				Order newOrder = new Order();
				
				//Ϊ�丳ֵ
				Date currentDate = new Date();	//��ȡ��ǰ����
				String currentState = "0";	//�ݶ�״̬Ϊδ�ύ(0)
				float currentPrice = 0;		//�ݶ��ܽ��Ϊ0
				
				newOrder.setOrderCreateDate(currentDate);
				newOrder.setOrderLevel(currentStage);
				newOrder.setOrderState(currentState);
				newOrder.setOrderAddress(address);
				newOrder.setUserID(userID);
				newOrder.setTotalPrice(currentPrice);
				
				//���½���order���뵽����,����currentOrderID��¼,����orderIDList��
				orderDao.add(newOrder);
				currentOrderID = newOrder.getOrderID();
				orderIDList.add(currentOrderID);
				
				//������Ʒ���
				Goods goods=goodsDao.findByID(currentGoodsInCart.getGoodsID());
				if(goods.getGoodsStore()>currentGoodsInCart.getQuantity())
				{	
					goods.setGoodsStore(goods.getGoodsStore()-currentGoodsInCart.getQuantity());
					goodsDao.update(goods);
					//����Ʒ�Լ����������붩����
					GoodsInOrder goodsInOrder =new GoodsInOrder();
					goodsInOrder.setGoodsID(currentGoodsInCart.getGoodsID());
					goodsInOrder.setQuantity(currentGoodsInCart.getQuantity());
					goodsInOrder.setOrderID(currentOrderID);
					orderDao.addGoodsInOrder(goodsInOrder);
				}
				
				
				
			}
			//������еķ��ڵȼ�����ǰһ�еķ��ڵȼ���ֱ�Ӽ���ǰһ�е�order�У�����Ҫ�½�order
			else
			{
				//������Ʒ���
				Goods goods=goodsDao.findByID(currentGoodsInCart.getGoodsID());
				//�������㹻
				if(goods.getGoodsStore()>currentGoodsInCart.getQuantity())
				{	
					goods.setGoodsStore(goods.getGoodsStore()-currentGoodsInCart.getQuantity());
					goodsDao.update(goods);
					//����Ʒ�Լ����������붩����
					GoodsInOrder goodsInOrder =new GoodsInOrder();
					goodsInOrder.setGoodsID(currentGoodsInCart.getGoodsID());
					goodsInOrder.setQuantity(currentGoodsInCart.getQuantity());
					goodsInOrder.setOrderID(currentOrderID);
					orderDao.addGoodsInOrder(goodsInOrder);
				}
				
			}
		}
		
		//����ÿһ���½���order���н�һ���Ĵ�������orderIDList��
		for(int i=0;i<orderIDList.size();++i)
		{	
			//ͨ��orderID�ҵ�order
			Integer tempOrderID = orderIDList.get(i);
			Order tempOrder = orderDao.findByID(tempOrderID);
			
			//�ҵ���ǰorder����Ӧ�ķ��ڵȼ�����ȡ���������Լ�������
			Stage tempStage = stageDao.findByID(tempOrder.getOrderLevel());
			float tempCharge =  tempStage.getCharge();
			Integer tempStageNum = tempStage.getStageNum();
			
			float totalOriginPrice = 0;		//���嶩��ԭʼ�ܼ�
			
			List<GoodsInOrder> tempGoodsInOrderList = orderDao.selectGoodsInOrder(tempOrderID);
			
			for(int j=0;j<tempGoodsInOrderList.size();++j)
			{
				GoodsInOrder tempGoodsInOrder = tempGoodsInOrderList.get(j);
				Integer tempGoodsID = tempGoodsInOrder.getGoodsID();
				
				//�õ�����Ʒԭʼ����
				float goodsOriginPrice = (goodsDao.findByID(tempGoodsID)).getGoodsPrice();
				
				//�ۼ����ж�������Ʒ��ԭʼ�ܼ�
				totalOriginPrice = totalOriginPrice + goodsOriginPrice * (tempGoodsInOrder.getQuantity());
			}
			
			//ʵ��Ӧ���ܼ�Ϊ��ԭ�ܼۣ�*����������+1��
			float totalTruePrice = totalOriginPrice*(tempCharge/100 + 1);
			totalTruePrice =(float)(Math.round((totalTruePrice)*100))/100; //��������Ϊ2λС��
			tempOrder.setTotalPrice(totalTruePrice);		//��order���ܼ����¼���
			
			float perPrice = totalTruePrice/tempStageNum;	//ÿ��ʵ��Ӧ��
			perPrice =(float)(Math.round((perPrice)*100))/100; //��������Ϊ2λС��
			
			//�õ�user�����õȼ��Լ����õȼ�����ϸ��Ϣ
			Integer userCreditLevel = (userDao.findByID(userID)).getUserCredit();
			Integer userMaxNum = creditDao.findByID(userCreditLevel).getMaxNum();
			Integer userMaxPass = creditDao.findByID(userCreditLevel).getMaxPass();
			
			if(userMaxPass >= totalTruePrice)	//�����ܽ������������Զ����ͨ�����
			{
				tempOrder.setOrderState("1");
			}
			else if(userMaxNum < totalTruePrice)	//�����ܽ����������
			{
				tempOrder.setOrderState("7");
			}
			else				//���ܽ���������֮��
			{
				tempOrder.setOrderState("2");
			}
			
			//���ϣ�order�Ļ������Ծʹ�����ϣ���orderform����
			orderDao.update(tempOrder);
			
			//���������ݸö�����״̬ȥ����orderDetail���Լ�¼ÿһ�ڵ�״̬(ÿһ�������м��ھ����ɼ��ڵ�����)
			for(int k=0;k<tempStageNum;++k)
			{
				OrderDetail tempOrderDetail = new  OrderDetail();
				tempOrderDetail.setStageNo(k+1);	//��һ��ʱk=0���ʴ�k+1
				tempOrderDetail.setOrderID(tempOrderID);
				
				//����ÿ��ddl��ʱ��
				Calendar calendar = new GregorianCalendar(); 
				calendar.setTime(tempOrder.getOrderCreateDate()); 
				calendar.add(calendar.DATE,30*(k+1));	//ÿ��30��
				Date ddl=calendar.getTime();
				tempOrderDetail.setDeadline(ddl);
				
				if(k==0)	//��һ�ڱȽ����⣬�����⴦��
				{
					if(tempOrder.getOrderState()=="1"){	//����Ѿ�ͨ���Զ����
						tempOrderDetail.setStageState('2');		//��һ���Ѿ����Կ�ʼ֧��
					}
					else
					{
						tempOrderDetail.setStageState('1');	
					}
					
					//�������������ڵ�һ��֧��
					float firstStagePrice = perPrice +  totalTruePrice - perPrice*tempStageNum;
					firstStagePrice = (float)(Math.round((firstStagePrice)*100))/100;
					tempOrderDetail.setStageMoney(firstStagePrice);
				}
				else	//��������
				{
					tempOrderDetail.setStageMoney(perPrice);
					tempOrderDetail.setStageState('1');
				}
				
				//��ֵ��ɺ�insert
				
				orderDao.addIntoOrderDetail(tempOrderDetail);
			}
			
		}
		
		//�����ո��û����ﳵ�ڵ�������Ʒ
		cartDao.deleteAllGoodsInCart(userID);
	}
	
	//�鿴�ҵĶ���
	public List<MyOrder> showMyOrder(Integer userID){
		
		//����һ��ר�����ڴ������������
		List<MyOrder> res = new ArrayList<MyOrder>();
		
		//����orderList���Դ�Ÿ��û�����order�Ļ�����Ϣ
		List<Order> orderList= orderDao.selectOrderByUserID(userID);
		
		//����orderList
		for(int i=0;i<orderList.size();++i){
			
			Order tempOrder = orderList.get(i);
			
			//�ȶԸ�order�����Ӧ��orderDetail����в�ѯ
			List<OrderDetail> orderDetailList = orderDao.findDetailByOrderID(tempOrder.getOrderID());
			
			//��ʼ��
			Integer payedStageID = orderDetailList.get(0).getOrderDetailID();
			Date currentDate = new Date();
			boolean complete = true;
			
			if(tempOrder.getOrderState()=="0")	//���ԭ��������״̬����ʼ��Ϊδ���֧��״̬�������ж�
			{
				tempOrder.setOrderState("1");
			}
			//�����ñ������Ƿ������ڵĲ���,�Լ��������һ�ڵ�֧����ɵ�DetailID
			for(int j=0;j<orderDetailList.size();++j)
			{
				OrderDetail tempOrderDetail = orderDetailList.get(j);
				//������δ�ɿ�ʼ֧��״̬
				if(tempOrderDetail.getStageState()=='1')
				{	
					//�Ƚ�ÿһ���Ľ�ֹ�����뵱ǰ���ڵĹ�ϵ
					boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
					if(compareDate)		//�����ǰ������ddl����detail��order��״̬������Ϊ����
					{
						tempOrderDetail.setStageState('4');
						tempOrder.setOrderState("0");
					}
					complete = false;
				}
				//�����ڿɿ�ʼ֧��δ֧�����״̬
				else if(tempOrderDetail.getStageState()=='2')
				{
					//�Ƚ�ÿһ���Ľ�ֹ�����뵱ǰ���ڵĹ�ϵ
					boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
					if(compareDate)		//�����ǰ������ddl����detail��order��״̬������Ϊ����
					{
						tempOrderDetail.setStageState('4');
						tempOrder.setOrderState("0");
					}
					complete = false;
				}
				//����֧�����
				else if(tempOrderDetail.getStageState()=='3')
				{
					//��¼��֧����ɵ�stageNum ��orderDetailID
					 payedStageID = tempOrderDetail.getOrderDetailID();
				}
				
				//����һ��detail״̬Ϊ���ڣ�������order��״̬����Ϊ����
				else if(tempOrderDetail.getStageState()=='4')
				{
					tempOrder.setOrderState("0");
					complete = false;
				}
			}
			
			if(complete == true)
				tempOrder.setOrderState("5");
			
			//�õ���һ��֧�����ǵڼ��ڣ�����ǵ�һ�ڵĻ��򲻱䣬��Ҫ���ж�һ�µ�һ���Ƿ��Ѿ�֧����
			Integer nextStageID = 0;
			if(payedStageID == orderDetailList.get(0).getOrderDetailID() && orderDetailList.get(0).getStageState()!='3')
			{
				nextStageID = payedStageID;
			}
			else
			{ 
				nextStageID = payedStageID+1;
			}
			
			//����order�Ļ���״̬
			orderDao.update(tempOrder);
			
			//�õ���һ����Ҫ֧����stage��detail
			OrderDetail nextDetail = orderDao.findDetailByID(nextStageID);
			
			float nextStageMoney = nextDetail.getStageMoney();
			if(orderDao.findDetailByID(nextStageID).getStageState()=='4')	//�����ǰ��Ҫ֧���ĵ���������
			{
				//���Ҹ��û������õȼ�����Ӧ��ÿ�����ʣ����֮��
				float interest =1 + (creditDao.findByID(userDao.findByID(userID).getUserCredit()).getInterest())/10000;
				
				//��������߼��
				Calendar cal = Calendar.getInstance();  
			    cal.setTime(currentDate);  
			    long time1 = cal.getTimeInMillis();               
			    cal.setTime(nextDetail.getDeadline());  
			    long time2 = cal.getTimeInMillis();       
			    long between_days=(time2-time1)/(1000*3600*24);  
			    Integer days = (int) between_days;
			    
			    //���㲢��ΪС�������λ
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
			
			//���뷵�ص�list
			res.add(tempMyOrder);
		}
		
		
		return res;
	}

	//ͨ������id��ѯ������Ʒ����Ϣ
	public List<GoodsDetailInOrder> getGoodsDetail(Integer orderID){
		
		List<GoodsInOrder> goodsInOrderList = orderDao.selectGoodsInOrder(orderID);
		
		List<GoodsDetailInOrder> res = new ArrayList<GoodsDetailInOrder>();
		
		for(int i=0;i<goodsInOrderList.size();++i)
		{
			GoodsInOrder goodsInOrder = goodsInOrderList.get(i);
			Integer goodsID = goodsInOrder.getGoodsID();
			Goods goods = goodsDao.findByID(goodsID);
			float tempPrice = (goods.getGoodsPrice()) * (goodsInOrder.getQuantity());
			
			//�½���Ҫ����ı��һ��
			GoodsDetailInOrder temp = new GoodsDetailInOrder();
			
			//��ֵ
			temp.setGoodsID(goodsInOrder.getGoodsID());
			temp.setGoodsPicture(goods.getGoodsPicture());
			temp.setQuantity(goodsInOrder.getQuantity());
			temp.setTotalPrice(tempPrice);
			temp.setGoodsName(goods.getGoodsName());
			
			res.add(temp);
			
		}
		return res;
	}
	
	//ͨ������id��ѯ�����������Ϣ
	public MyOrder findBasicInfo(Integer orderID)
	{
		Order tempOrder = orderDao.findByID(orderID);
		MyOrder tempMyOrder = new MyOrder();
		Integer userID = tempOrder.getUserID();
		//�ȶԸ�order�����Ӧ��orderDetail����в�ѯ
		List<OrderDetail> orderDetailList = orderDao.findDetailByOrderID(tempOrder.getOrderID());
		
		//��ʼ��
		Integer payedStageID = orderDetailList.get(0).getOrderDetailID();
		Date currentDate = new Date();
		boolean complete = true;
		
		if(tempOrder.getOrderState()=="0")	//���ԭ��������״̬����ʼ��Ϊδ���֧��״̬�������ж�
		{
			tempOrder.setOrderState("1");
		}
		//�����ñ������Ƿ������ڵĲ���,�Լ��������һ�ڵ�֧����ɵ�DetailID
		for(int j=0;j<orderDetailList.size();++j)
		{
			OrderDetail tempOrderDetail = orderDetailList.get(j);
			//������δ�ɿ�ʼ֧��״̬
			if(tempOrderDetail.getStageState()=='1')
			{	
				//�Ƚ�ÿһ���Ľ�ֹ�����뵱ǰ���ڵĹ�ϵ
				boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
				if(compareDate)		//�����ǰ������ddl����detail��order��״̬������Ϊ����
				{
					tempOrderDetail.setStageState('4');
					tempOrder.setOrderState("0");
				}
				complete = false;
			}
			//�����ڿɿ�ʼ֧��δ֧�����״̬
			else if(tempOrderDetail.getStageState()=='2')
			{
				//�Ƚ�ÿһ���Ľ�ֹ�����뵱ǰ���ڵĹ�ϵ
				boolean compareDate =  currentDate.after(tempOrderDetail.getDeadline());
				if(compareDate)		//�����ǰ������ddl����detail��order��״̬������Ϊ����
				{
					tempOrderDetail.setStageState('4');
					tempOrder.setOrderState("0");
				}
				complete = false;
			}
			//����֧�����
			else if(tempOrderDetail.getStageState()=='3')
			{
				//��¼��֧����ɵ�stageNum ��orderDetailID
				 payedStageID = tempOrderDetail.getOrderDetailID();
			}
			
			//����һ��detail״̬Ϊ���ڣ�������order��״̬����Ϊ����
			else if(tempOrderDetail.getStageState()=='4')
			{
				tempOrder.setOrderState("0");
				complete = false;
			}
		}
		
		if(complete == true)
			tempOrder.setOrderState("5");
		
		//�õ���һ��֧�����ǵڼ��ڣ�����ǵ�һ�ڵĻ��򲻱䣬��Ҫ���ж�һ�µ�һ���Ƿ��Ѿ�֧����
		Integer nextStageID = 0;
		if(payedStageID == orderDetailList.get(0).getOrderDetailID() && orderDetailList.get(0).getStageState()!='3')
		{
			nextStageID = payedStageID;
		}
		else
		{ 
			nextStageID = payedStageID+1;
		}
		
		//����order�Ļ���״̬
		orderDao.update(tempOrder);
		
		//�õ���һ����Ҫ֧����stage��detail
		OrderDetail nextDetail = orderDao.findDetailByID(nextStageID);

		float nextStageMoney = nextDetail.getStageMoney();
		if(orderDao.findDetailByID(nextStageID).getStageState()=='4')	//�����ǰ��Ҫ֧���ĵ���������
		{
			//���Ҹ��û������õȼ�����Ӧ��ÿ�����ʣ����֮��
			float interest =1 + (creditDao.findByID(userDao.findByID(userID).getUserCredit()).getInterest())/10000;
			
			//��������߼��
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
	
	//֧���ҵĵ��ڳɹ�������ݿ���в���
	public void compeletePay(Integer orderID,Integer stageNo)
	{
		OrderDetail temp = new OrderDetail();
		temp.setOrderID(orderID);
		temp.setStageNo(stageNo);
		
		//���ڸ�stage��Ӧ��currentDetail
		OrderDetail currentDetail = orderDao.findDetailByNo(temp);
		//����������Ϊ��֧��
		orderDao.updateToPaid(currentDetail);
		
		//�õ���һ��stage
		OrderDetail nextDetail = orderDao.findDetailByID(currentDetail.getOrderDetailID()+1);
		
		//������Ǳ��order��detail
		if(nextDetail.getOrderID() == orderID)
		{
			//����һ������Ϊ���Կ�ʼ֧��
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
