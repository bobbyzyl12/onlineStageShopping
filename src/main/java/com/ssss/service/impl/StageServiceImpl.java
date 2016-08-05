package com.ssss.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssss.dao.GoodsDao;
import com.ssss.dao.StageDao;
import com.ssss.dao.UserDao;
import com.ssss.entity.Goods;
import com.ssss.entity.Stage;
import com.ssss.entity.StageSelect;
import com.ssss.service.StageService;


@Transactional
@Service(value = "stageService")
public class StageServiceImpl implements StageService{
	@Autowired
	private GoodsDao goodsDao;
	
	@Autowired
	private StageDao stageDao;
	
	@Autowired
	private UserDao userDao;
	
	public List<StageSelect> stageOption(Integer userID,Integer goodsID)
	{
		//通过goodsID获得总价
		float totalPrice = (goodsDao.findByID(goodsID)).getGoodsPrice();
		
		//通过userID找到该user的信用等级
		Integer creditLevel = (userDao.findByID(userID)).getUserCredit();
		
		//通过信用等级查找user能够获得的分期等级
		List<Integer> stageList = stageDao.findStageByCredit(creditLevel);
		
		//创建一个新的list存放最后的结果,以及temp用以存放一个临时的stageSelect元组
		List<StageSelect> stageSelection = new ArrayList<StageSelect>();
		
		//第一种情况无分期，即不选择分期(在分期表中为stageID=1)
		StageSelect noStage = new StageSelect();
		noStage.setPerPrice(totalPrice);
		noStage.setStageLevel(1);
		noStage.setStageNum(1);
		stageSelection.add(noStage);
		
		for(int i=0;i<stageList.size();++i)
		{
			//遍历stageList,通过stageList中的stageID查找出期数，手续费等
			Integer sID = stageList.get(i);
			Stage tempStage = stageDao.findByID(sID);
			
			//真正的总价为手续费率*原总价/100
			float trueTotal = totalPrice*tempStage.getCharge()/100 + totalPrice;
			
			//每一期的价格为总价/期数（这里保证约到两位小数）
			float perPrice = (float)(Math.round((trueTotal/tempStage.getStageNum())*100))/100;
			
			//赋值temp
			StageSelect temp = new StageSelect();
			temp.setStageLevel(sID);
			temp.setStageNum(tempStage.getStageNum());
			temp.setPerPrice(perPrice);
			
			//最后将赋值完的temp加入结果的list中
			stageSelection.add(temp);
		}
		return stageSelection;
	}
}
