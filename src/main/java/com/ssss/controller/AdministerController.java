package com.ssss.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssss.entity.Administer;
import com.ssss.service.AdministerService;

@Controller
@RequestMapping(value="/administer")
public class AdministerController {
	@Autowired
	private AdministerService administerService;
	/**
     * 管理员登陆
     * @param String userName,String password
     * @return
     */
	@RequestMapping(value="/login")
	@ResponseBody
    public String login(@RequestParam(value = "administerName") String administerName,@RequestParam(value = "administerPwd") String administerPwd) throws Exception {
        if(administerService.checkLogin(administerName, administerPwd) == "success"){
            return "success";	// 路径 WEB-INF/pages/welcome.jsp            
        }
        if(administerService.checkLogin(administerName, administerPwd) == "locked"){
        	return "locked";
        }
        return "error";
    }
	
	
}
