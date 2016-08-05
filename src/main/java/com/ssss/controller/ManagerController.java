package com.ssss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssss.service.ManagerService;

@Controller
@RequestMapping(value="/manager")
public class ManagerController {
	@Autowired
	private ManagerService managerService;
	/**
     * ÉóºËÔ±µÇÂ½
     * @param String userName,String password
     * @return
     */
	
	@RequestMapping(value="/login")
	@ResponseBody
    public String login(@RequestParam(value = "managerName") String managerName,@RequestParam(value = "managerPwd") String managerPwd) throws Exception {
        if(managerService.checkLogin(managerName, managerPwd) == "success"){
            return "success";            
        }
        if(managerService.checkLogin(managerName, managerPwd) == "locked"){
        	return "locked";
        }
        return "error";
    }
	

	
}
