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
<title>增加用户页面</title>
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>

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
			color: #fff;
			outline: 0 none;
		}

		::-webkit-input-placeholder {
			color: #cecece;
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

		.btn {
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
	</style>
	<script type="text/javascript">
 	function re(){
		window.location.href="${ctx}/page/jumpToUserManage";
	} 
	$(function(){
		$("#fail").hide();
		$("#repeat").hide();
		$("#userNameError").hide();
		$("#userPwdError").hide();
		$("#userPhoneError").hide();
		$("#userEmailError").hide();
		$("#userCreditError").hide();
		
		$("#confirmButton").click(function(){
			//获取输入的用户名和密码以及个人信息并将其赋值给temp进行判断和传值
			var tempUserName = $("#userName").val();
			var tempUserPwd =  $("#userPwd").val();
			var tempUserCredit = $("#userCredit").val();
			var tempUserPhone =  $("#userPhone").val();
			var tempUserEmail =  $("#userEmail").val();
			var tempUserState = Number(1);
			
			$("#userNameError").hide();
			$("#userPwdError").hide();
			$("#userPhoneError").hide();
			$("#userEmailError").hide();
			$("#userCreditError").hide();
			
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
			var regCredit=/^[0-9]*$/;
			
			//较为简单的判断逻辑
			 if(tempUserName=="" || tempUserName.length<3||tempUserName.length>50){
            	$("#userNameError").show();
                }
            else{ok1=true;}
         
            if(tempUserPwd=="" ||(!regPwd.test(tempUserPwd))||tempUserPwd.length<3||tempUserPwd.length>50){
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
            
            if(!regCredit.test(tempUserCredit)){
            	$("#userCreditError").show();
            }
        	else{ok5=true;}
            
           	//创建一个临时的user变量用于传参
            var tempUser={'userName':tempUserName,'userPwd':tempUserPwd,'userEmail':tempUserEmail,'userPhone':tempUserPhone,'userCredit':tempUserCredit,'userState':tempUserState};
   
            if(ok1&&ok2&&ok3&&ok4&&ok5){			//如有一个不合法(即为false)则不提交至后台
            	$.ajax({ 							//提交                          	  
				url: ' ${ctx}/user/add',       //处理增加用户的页面                 
				type: 'POST',
				data: tempUser,                
				success: function (msg) { 
                    if (msg == "success"){
                    	window.location.href='${ctx}/page/jumpToUserManage';
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
	<div class="container duel">
		<div class="input-box-line">
		<label style="width:100px;text-align:right;color:white;" id="userNameError">*请填写3-50位的用户名</label>
        <input class="text" type="text" id="userName" name="userName" placeholder="用户名"/>
        	<label style="width:100px;text-align:right;color:white;" id="userPwdError">*请填写3-50位的由数字与字母组成的密码</label>
        <input class="text" type="text" id="userPwd" name="userPwd" placeholder="密码"/>
        <label style="width:100px;text-align:right;color:white;" id="userEmailError">*请确认您的邮箱格式</label>
        <input class="text" type="text" id="userEmail" name="userEmail" placeholder="邮箱地址"/>
        <label style="width:100px;text-align:right;color:white;" id="userPhoneError">*请填写正确的手机密码</label>
        <input class="text" type="text" id="userPhone" name="userPhone" placeholder="手机号码"/>
        <label style="width:100px;text-align:right;color:white;" id="userCreditError">*请填写正确的等级</label>
        <input class="text" type="text" id="userCredit" name="userCredit" placeholder="用户信用额度等级"/>
        <input class="btn" type="button" id="confirmButton" value="提交"/>
        <input class="btn" type="button" id="returnButton" value="返回" onclick="re()"/>
   </div>
</div>
 <div id="fail" title="提示">
  	<p>增加失败！</p>
</div>
 <div id="repeat" title="提示">
  	<p>用户名已使用</p>
</div>
</body>
</html>