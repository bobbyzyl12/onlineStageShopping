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
<title>注册页面</title>
<style type="text/css">
		html, body {
			margin: 0;
			padding: 0;
			height: 100%;
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
			position:fixed;
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

		.text {
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

		.text:focus {
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
	</style>

 <script type="text/javascript">
	$(function(){
		$("#fail").hide();
		$("#repeat").hide();
		$("#userNameError").hide();
		$("#userPwdError").hide();
		$("#userPhoneError").hide();
		$("#userEmailError").hide();
		$("#userCheckPwdError").hide();
		
		$("#signinButton").click(function(){
			//获取输入的用户名和密码以及个人信息并将其赋值给temp进行判断和传值
			var tempUserName = $("#userName").val();
			var tempUserPwd =  $("#userPwd").val();
			var tempUserCheckPwd =  $("#userCheckPwd").val();
			var tempUserPhone =  $("#userPhone").val();
			var tempUserEmail =  $("#userEmail").val();
			var tempDefalut = Number(1);
			
			$("#userNameError").hide();
			$("#userPwdError").hide();
			$("#userPhoneError").hide();
			$("#userEmailError").hide();
			$("#userCheckPwdError").hide();
			
			//用于记录所有的输入是否合法
			var ok1=false;
			var ok2=false;
			var ok3=false;
			var ok4=false;
			var ok5=false;
			
			//验证邮箱和电话正确的正则表达式
			var regPwd=/[a-zA-Z0-9]*/;
			var regPhone=/^1[3|4|5|7|8]\d{9}$/;
			var regEmail=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
			
			//较为简单的判断逻辑
            if(tempUserName=="" || tempUserName.length < 3 || tempUserName.length > 50){
            	 $("#userNameError").show();
                }
            else{ok1=true;}
         
            if(tempUserPwd=="" || tempUserPwd.length < 3 || tempUserPwd.length > 50||(!regPwd.test(tempUserPwd ))){
            	 $("#userPwdError").show();
            }
        	else{ok2=true;}
            
            if(!regPhone.test(tempUserPhone)){
            	 $("#userPhoneError").show();
            }
        	else{ok3=true;}
            
            if(!regEmail.test(tempUserEmail)){
            	$("#userEmailError").show();
            }
        	else{ok4=true;}
            
            if(tempUserPwd!=tempUserCheckPwd){
            	$("#userCheckPwdError").show();
            }
        	else{ok5=true;}
            
           	//创建一个临时的user变量用于传参,用户信用等级默认设置为1，用户的状态默认设置为正常状态
            var tempUser={'userName':tempUserName,'userPwd':tempUserPwd,'userEmail':tempUserEmail,'userPhone':tempUserPhone,'userCredit':tempDefalut,'userState':tempDefalut};
   
            if(ok1&&ok2&&ok3&&ok4&&ok5){			//如有一个不合法(即为false)则不提交至后台
            	$.ajax({ 							//提交                          	  
				url: ' ${ctx}/user/signin',       //处理注册的页面                 
				type: 'POST',
				data: tempUser,                
				success: function (msg) { 
                    if (msg == "success"){
                    	window.location.href='${ctx}/page/jumpToLogin';
                      }
                    else if(msg == "repeat"){
                    	 $("#repeat").dialog({
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
		<input class="btn" type="submit" value="登陆" onclick="javascrtpt:window.location.href='${ctx}/page/jumpToLogin'" style="width:80px;position:absolute;right:150px;top:5px;"/>
		<input class="btn" type="submit" value="返回主页"  onclick="javascrtpt:window.location.href='${ctx}/page/jumpToHomePage'" style="width:120px;position:absolute;right:20px;top:5px;"/>
	</div>
	<div style="position:relative;top:180px">
	<div class="container duel">
		<div class="input-box-line">
		<p class="lsTitle">注册</p>
		<label style="width:100px;text-align:right;color:red;" id="userNameError">*请填写3-50位的用户名</label>
        <input class="text1" type="text" id="userName" name="userName" placeholder="用户名"/>
        <label style="width:100px;text-align:right;color:red;" id="userPwdError">*请填写3-50位的密码</label>
        <input class="text1" type="password" id="userPwd" name="userPwd" placeholder="密码"/>
        <label style="width:100px;text-align:right;color:red;" id="userCheckPwdError">*请再次填写您的密码</label>
        <input class="text1" type="password" id="userCheckPwd" name="userPwd" placeholder="确认密码"/>
        <label style="width:100px;text-align:right;color:red;" id="userEmailError">*请确认您的邮箱格式</label>
        <input class="text1" type="text" id="userEmail" name="userEmail" placeholder="邮箱地址"/>
        <label style="width:100px;text-align:right;color:red;" id="userPhoneError">*请填写正确的手机密码</label>
        <input class="text1" type="text" id="userPhone" name="userPhone" placeholder="手机号码"/>
        <input class="btn1" type="button" id="signinButton" value="注册"/>
   		</div>
   	</div>
	</div>
</div>
<div id="fail" title="提示">
  	<p>注册失败！请重新注册</p>
</div>
 <div id="repeat" title="提示">
  	<p>用户名已使用</p>
</div>
</body>
</html>