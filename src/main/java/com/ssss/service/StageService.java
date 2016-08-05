package com.ssss.service;

import java.util.List;

import com.ssss.entity.StageSelect;

public interface StageService {
	public List<StageSelect> stageOption(Integer userID,Integer goodsID);
}
