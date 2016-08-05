package com.ssss.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssss.dao.ManagerDao;
import com.ssss.entity.Manager;
import com.ssss.service.ManagerService;

@Service(value = "managerService")
@Transactional
public class ManagerServiceImpl implements  ManagerService{
	@Autowired
	private ManagerDao managerDao;
	
	public String checkLogin(String managerName, String managerPwd) {
		Manager temp=managerDao.findByName(managerName);
		if(temp==null)
			return "not exist";
		Integer state = temp.getManagerState();
        if (temp.getManagerPwd().equals(managerPwd)&&(state.equals(1))) {
        	return "success";
        }
        if(temp.getManagerPwd().equals(managerPwd)&&(state.equals(2))) {
        	return "locked";
        }
        return "error";
        
    }
}
