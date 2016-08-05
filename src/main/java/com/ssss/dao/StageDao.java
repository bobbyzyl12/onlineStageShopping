package com.ssss.dao;

import java.util.List;

import com.ssss.entity.Stage;

public interface StageDao {
	
	Stage findByID(Integer stageID);

	List<Integer> findStageByCredit(Integer creditID);
}
