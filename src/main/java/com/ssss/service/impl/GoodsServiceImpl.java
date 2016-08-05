package com.ssss.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssss.dao.CartDao;
import com.ssss.dao.GoodsDao;
import com.ssss.dao.StageDao;
import com.ssss.entity.Goods;
import com.ssss.entity.GoodsInCart;
import com.ssss.entity.MyCart;
import com.ssss.entity.PageModel;
import com.ssss.entity.Stage;
import com.ssss.entity.StageSelect;
import com.ssss.entity.User;
import com.ssss.service.GoodsService;

@Service(value = "goodsService")
public class GoodsServiceImpl implements GoodsService{
	
	@Autowired
	private GoodsDao goodsDao;
	
	@Autowired
	private CartDao cartDao;
	
	@Autowired
	private StageDao stageDao;
	
	@Transactional
	public void add(Goods goods) {
		goodsDao.add(goods);
	}
	@Transactional
	public String update(Goods goods){
		goodsDao.update(goods);
		return "success";
	}
	
	
	@Transactional(readOnly = true)
	public Goods findByID(Integer goodsID) {
		return goodsDao.findByID(goodsID);
	}
	
	
	@Transactional(readOnly= true)
	public List<Goods> search(String temp)
	{
		return goodsDao.search(temp);
	}
	
	
	@Transactional(readOnly = true)
	public List<Goods> findAll(PageModel<Goods> pageModel){
		return goodsDao.findAll(pageModel);
	}
	
	@Transactional
	public Integer findAllCount() {
		return goodsDao.findAllCount();
	}
	
	@Transactional
	public void delete(Integer goodsID) {
		Goods temp = goodsDao.findByID(goodsID);
		temp.setGoodsState("2");
		goodsDao.update(temp);
	}
	
	@Transactional
	public String addIntoCart(GoodsInCart goodsInCart)
	{
		GoodsInCart a = cartDao.findGoodsInCart(goodsInCart); 
		if(a==null)
		{
			cartDao.addIntoCart(goodsInCart);
			return "success";
		}
		else
		{
			Integer originNum = (a.getQuantity());
			Integer addNum = goodsInCart.getQuantity();
			Integer res = originNum + addNum;
			goodsInCart.setQuantity(res);
			cartDao.editGoodsInCart(goodsInCart);
			return "success";
		}
		
	}
	
	public List<MyCart> showMyCart(Integer userID)
	{
		List<GoodsInCart> goodsInCartMap = cartDao.findMyCart(userID);
		
		//������
		List<MyCart> res = new ArrayList<MyCart>();
		
		//�������������Ľ��goodsInCart
		for(int i=0;i<goodsInCartMap.size();++i)
		{
			//��ÿ��Ҫ���е����Զ���ȡ����
			GoodsInCart temp = goodsInCartMap.get(i);
			Integer goodsID =temp.getGoodsID();
			Integer quantity = temp.getQuantity();
			Integer stageLevel = temp.getStageLevel();
			
			//ͨ��goodsID���ҵ���Ӧ��goods
			Goods tempGoods = goodsDao.findByID(goodsID);
			float totalPrice =tempGoods.getGoodsPrice();
			
			//ͨ��stageLevel���ҵ���Ӧ��stage
			Stage tempStage = stageDao.findByID(stageLevel); 
			
			//��������ܼ�
			float trueTotal = (float)(Math.round((((totalPrice*tempStage.getCharge()/100 + totalPrice)*quantity)*100)))/100;
			float perPrice = (float)(Math.round((trueTotal/tempStage.getStageNum())*100))/100;
			
			//����myCartElement��Ϊ�丳ֵ
			MyCart myCartElement = new MyCart();
			myCartElement.setGoodsName(tempGoods.getGoodsName());
			myCartElement.setGoodsPicture(tempGoods.getGoodsPicture());
			myCartElement.setQuantity(quantity);
			myCartElement.setStageNum(tempStage.getStageNum());
			myCartElement.setTotalPrice((trueTotal));
			myCartElement.setPerPrice(perPrice);
			myCartElement.setGoodsID(goodsID);
			myCartElement.setStageLevel(stageLevel);
			
			//��myCartElement������List��
			res.add(myCartElement);
		}	
		
		return res;
	}
	
	@Transactional
	public String editGoodsInCart(GoodsInCart temp)
	{
		cartDao.editGoodsInCart(temp);
		return "success";
		
	}
	
	@Transactional
	public void deleteGoodsInCart(GoodsInCart temp)
	{
		cartDao.deleteGoodsInCart(temp);
		
	}
}
