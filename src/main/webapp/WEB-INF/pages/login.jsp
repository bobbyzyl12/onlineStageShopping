<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
<link rel="stylesheet" href="css/validationEngine.jquery.css">
<script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
<link rel="stylesheet" href="jqueryui/style.css">
<title>登录页面</title>
<style type="text/css">
		html, body {
			margin: 0;
			padding: 0;
			height: 100%;
			overflow-x: hidden; 
		}

		html, body, div, input {
			box-sizing: border-box;
		}

		body {
			background-size: cover;
		}

		body, h1, input {
			outline: 0 none;
		}

		::-webkit-input-placeholder {
			color: #cecece;
		}
		
		.header
		{
			background-image:url('${ctx}/img/hh.jpg');
			padding: 0;
			margin: 0;
			border: 0;
		}
		.foot
		{
			padding: 0;
			margin: 0;
			border: 1px;
			position:absolute;
			bottom:0px;
			height:40px;
			width:100%;
		}
		.duel {
			width: 100%;
			height: 100%;
		}

		.input-box-line {
			margin-left: auto;
			margin-right: auto;
			position: relative;
			top: 38.2%;
			width: 280px;
			transform: translateY(-38.2%);
			box-sizing: border-box;
		}

		.input-box-line > h1 {
			position: relative;
			left: 240px;
			top: -100px;
			margin-bottom: -50px;
			letter-spacing: 14px;
			height: 50px;
			font-size: 52px;
			font-family: 'FZLTXHK--GBK1-0';
			font-weight: normal;
			color: rgba(255, 255, 255, .6);
		}

		.text2 {
			margin-bottom: 8px;
			padding-left: 15px;
			padding-right: 15px;
			display: block;
			border: 1px solid #fff;
			border-radius: 5px;
			background: none;
			width: 100%;
			height: 42px;
			transition: border-color ease .4s;
		}

		.text2:focus {
			border-color: #bdacd3;
		}

		.text1 {
			margin-bottom: 8px;
			padding-left: 15px;
			padding-right: 15px;
			display: block;
			border: 2px solid  #999999;
			border-radius: 5px;
			background: none;
			width: 100%;
			height: 42px;
			transition: border-color ease .4s;
		}

		.text1:focus {
			border-color:#4d79ff;
		}
		
		.btn {
			color: #fff;
			margin: 5px auto;
			display: block;
			border: 1px solid #fff;
			border-radius: 5px;
			background: transparent;
			height: 40px;
			width: 100%;
			transition: color ease .4s,
			            border-color ease .4s;
		}

		.btn:hover {
			color: #bdacd3;
			border-color: #bdacd3;
		}
		
		.btn1 {
			margin: 5px auto;
			display: block;
			border: 0px;
			border-radius: 5px;
			background: #0066ff;
			height: 50px;
			width: 100%;
			color:#fff;
			font-family:"微软雅黑";
			font-weight:bold;
			font-size:18px;
			transition: color ease .4s,
			            border-color ease .4s;
		}

		.btn1:hover {
			color:#003366;
			border-color:#003366;
		}
		
		.lsTitle{
			font-size:30px;
			text-align:center;
			color:#0066ff;
			font-weight:bold;
			font-family:"Microsoft YaHei","微软雅黑";
		}
		
		.ui-widget-header{ 
			border: 1px solid #aaaaaa; 
			background-color:white; 
			color: #000; 
			font-weight: bold; 
		}
		.ui-icon { 
			width: 20px; 
			height: 20px; 
			background-image: url(images/ui-icons_222222_256x240.png); 
		}
		
		.ui-button-text{
			color: #000; 
			border:0px;
		}
</style>

<script type="text/javascript">
	$(function(){
		$("#fail").hide();
		$("#locked").hide();
		$("#userNameError").hide();
		$("#userPwdError").hide();
		
		$("#loginButton").click(function(){
			//获取输入的用户名和密码将其赋值给temp进行判断和传值
			var tempUserName = $("#userName").val();
			var tempUserPwd =  $("#userPwd").val();
			
			//最后提交时用于记录所有的输入是否合法的简单判断，如有一个不合法则不提交至后台
			var ok1=false;
			var ok2=false;
			$("#userNameError").hide();
			$("#userPwdError").hide();
			
			if(tempUserName=="" || tempUserName.length < 3 || tempUserName.length > 50){
				$("#userNameError").show();
			}
            else{ok1=true;}
			
			var regPwd=/[a-zA-Z0-9]*/;
            if(tempUserPwd=="" || tempUserPwd.length < 3 || tempUserPwd.length > 50||(!regPwd.test(tempUserPwd ))){
                $("#userPwdError").show();
            }
        	else{ok2=true;}
            
            if(ok1&&ok2){
            	$.ajax({                           	  
				url: '${ctx}/user/login',       //处理测试页面                 
				type: 'POST',                  
				data: {userName: tempUserName, userPwd:tempUserPwd },                
				success: function (msg){ 
                    if (msg == "success"){
                    	window.location.href='${ctx}/page/jumpToHomePage';
                      }
                    else if(msg == "locked"){
                    	 $("#locked").dialog({
               		      modal: true
               		    });
                      }
					else{
						$("#fail").dialog({
						      modal: true
						    });
					}
					}              
				});    
            }         		  
		});
	});
 </script>
</head>

<body>
	<div>
	<div class="header" style="height:60px;">
		<input class="btn" type="submit" value="注册" onclick="javascrtpt:window.location.href='${ctx}/page/jumpToSignin'" style="width:80px;position:absolute;right:20px;top:5px;"/>
		<input class="btn" type="submit" value="审核员通道"  onclick="javascrtpt:window.location.href='${ctx}/page/jumpToManagerLogin'" style="width:120px;position:absolute;right:130px;top:5px;"/>
		<input class="btn" type="submit" value="管理员通道"  onclick="javascrtpt:window.location.href='${ctx}/page/jumpToAdministerLogin'" style="width:120px;position:absolute;right:260px;top:5px;"/>
	</div>
	
	<div class="container duel" style="position:relative;top:150px">
		<div class="input-box-line">
			<p class="lsTitle">登陆</p>
       		<div>
       			<label style="width:100px;text-align:right;color:red;" id="userNameError">*请填写3-50位的用户名</label>
       			<input class="text1" type="text" id="userName" name="userName" placeholder="用户名"/>
       		</div>
       		<div>
       			<label style="width:100px;text-align:right;color:red;" id="userPwdError">*请填写3-50位的密码</label>
       			<input class="text1" type="password" id="userPwd" name="userPwd" placeholder="密码"/>
       		</div>
       		<input class="btn1" type="button" value="提交" id="loginButton"/>
   	 	</div>
	</div>

	
	</div>
	<div id="fail" title="提示">
  		<p>用户名或密码错误</p>
	</div>
 	<div id="locked" title="提示">
  		<p>用户已被冻结</p>
	</div>
</body>

</html>