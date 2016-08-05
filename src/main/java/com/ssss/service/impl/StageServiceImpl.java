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
		//ͨ��goodsID����ܼ�
		float totalPrice = (goodsDao.findByID(goodsID)).getGoodsPrice();
		
		//ͨ��userID�ҵ���user�����õȼ�
		Integer creditLevel = (userDao.findByID(userID)).getUserCredit();
		
		//ͨ�����õȼ�����user�ܹ���õķ��ڵȼ�
		List<Integer> stageList = stageDao.findStageByCredit(creditLevel);
		
		//����һ���µ�list������Ľ��,�Լ�temp���Դ��һ����ʱ��stageSelectԪ��
		List<StageSelect> stageSelection = new ArrayList<StageSelect>();
		
		//��һ������޷��ڣ�����ѡ�����(�ڷ��ڱ���ΪstageID=1)
		StageSelect noStage = new StageSelect();
		noStage.setPerPrice(totalPrice);
		noStage.setStageLevel(1);
		noStage.setStageNum(1);
		stageSelection.add(noStage);
		
		for(int i=0;i<stageList.size();++i)
		{
			//����stageList,ͨ��stageList�е�stageID���ҳ������������ѵ�
			Integer sID = stageList.get(i);
			Stage tempStage = stageDao.findByID(sID);
			
			//�������ܼ�Ϊ��������*ԭ�ܼ�/100
			float trueTotal = totalPrice*tempStage.getCharge()/100 + totalPrice;
			
			//ÿһ�ڵļ۸�Ϊ�ܼ�/���������ﱣ֤Լ����λС����
			float perPrice = (float)(Math.round((trueTotal/tempStage.getStageNum())*100))/100;
			
			//��ֵtemp
			StageSelect temp = new StageSelect();
			temp.setStageLevel(sID);
			temp.setStageNum(tempStage.getStageNum());
			temp.setPerPrice(perPrice);
			
			//��󽫸�ֵ���temp��������list��
			stageSelection.add(temp);
		}
		return stageSelection;
	}
}
