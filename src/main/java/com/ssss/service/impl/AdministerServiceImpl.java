package com.ssss.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ssss.dao.AdministerDao;
import com.ssss.entity.Administer;
import com.ssss.service.AdministerService;

@Service(value = "adminitserService")
@Transactional
public class AdministerServiceImpl implements AdministerService{
	
	@Autowired
	private AdministerDao administerDao;
	
	public String checkLogin(String administerName, String administerPwd) {
		Administer temp=administerDao.findByName(administerName);
		if(temp==null)
			return "not exist";
		char state = temp.getAdministerState();
        if (temp.getAdministerPwd().equals(administerPwd)&&(state == '1')) {
        	return "success";
        }
        if(temp.getAdministerPwd().equals(administerPwd)&&(state == '2')) {
        	return "locked";
        }
        return "error";
        
    }
}
