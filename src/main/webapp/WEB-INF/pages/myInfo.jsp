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
<title>my information</title>
<style type="text/css">

	html, body{
		margin: 0;
		padding: 0;
		height: 100%;
	}

	body {
			background-size: cover;
		}
	
	body, h1, input {
			outline: 0 none;
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
		border: 0;
		position:absolute;
		bottom:0px;
		height:40px;
		width:100%;
	}
	.normalPrint
	{
		color:#0066ff;
		font-size:20px;
		font-family:"微软雅黑";
		font-weight:bold;
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
		
		.text1 {
			margin-bottom: 5px;
			padding-left: 5px;
			padding-right: 5px;
			display: block;
			border: 2px solid  #999999;
			border-radius: 5px;
			background: none;
			width: 100%;
			height: 30px;
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
		
		.btn2 {
			margin: 5px auto;
			display: block;
			border: 0px;
			border-radius: 5px;
			background: #0066ff;
			height: 40px;
			width: 60%;
			color:#fff;
			font-family:"微软雅黑";
			font-weight:bold;
			font-size:16px;
			transition: color ease .4s,
			            border-color ease .4s;
		}

		.btn2:hover {
			color:#003366;
			border-color:#003366;
		}
		
		.btn3 {
			margin: 5px auto;
			display: block;
			border: 0px;
			border-radius: 5px;
			background: #0066ff;
			height: 50px;
			width: 200px;
			color:#fff;
			font-family:"微软雅黑";
			font-weight:bold;
			font-size:20px;
			transition: color ease .4s,
			            border-color ease .4s;
		}

		.btn3:hover {
			color:#003366;
			border-color:#003366;
		}
		.searchbutton {
    		background:#2952cc;
			display: inline-block;
			padding: 5px 10px 6px;
			color: #fff;
			text-decoration: none;
			line-height: 1;
			-moz-border-radius: 5px;
			-webkit-border-radius: 5px;
			-moz-box-shadow: 0 1px 3px #999;
			-webkit-box-shadow: 0 1px 3px #999;
			text-shadow: 0 -1px 1px #222;
			border-bottom: 1px solid #222;
			position: relative;
			cursor: pointer;
			font-size:20px;
		}
		table {
		overflow:hidden;
		border:1px solid #d3d3d3;
		background:#fefefe;
		width:85%;
		margin:5% auto 0;
		-moz-border-radius:5px; /* FF1+ */
		-webkit-border-radius:5px; /* Saf3-4 */
		border-radius:5px;
		-moz-box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
		-webkit-box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
	}
	
	th, td {padding:18px 28px 18px; text-align:center; }
	
	th {padding-top:22px; text-shadow: 1px 1px 1px #fff; background:#e8eaeb;}
	
	td {border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0;}
	
	tr.odd-row td {background:#f6f6f6;}
	
	td.first, th.first {text-align:left}
	
	td.last {border-right:none;}
	
	/*
	Background gradients are completely unnecessary but a neat effect.
	*/
	
	td {
		background: -moz-linear-gradient(100% 25% 90deg, #fefefe, #f9f9f9);
		background: -webkit-gradient(linear, 0% 0%, 0% 25%, from(#f9f9f9), to(#fefefe));
	}
	
	tr.odd-row td {
		background: -moz-linear-gradient(100% 25% 90deg, #f6f6f6, #f1f1f1);
		background: -webkit-gradient(linear, 0% 0%, 0% 25%, from(#f1f1f1), to(#f6f6f6));
	}
	
	th {
		background: -moz-linear-gradient(100% 20% 90deg, #e8eaeb, #ededed);
		background: -webkit-gradient(linear, 0% 0%, 0% 20%, from(#ededed), to(#e8eaeb));
	}
	
	/*
	I know this is annoying, but we need additional styling so webkit will recognize rounded corners on background elements.
	Nice write up of this issue: http://www.onenaught.com/posts/266/css-inner-elements-breaking-border-radius
	
	And, since we've applied the background colors to td/th element because of IE, Gecko browsers also need it.
	*/
	
	tr:first-child th.first {
		-moz-border-radius-topleft:5px;
		-webkit-border-top-left-radius:5px; /* Saf3-4 */
	}
	
	tr:first-child th.last {
		-moz-border-radius-topright:5px;
		-webkit-border-top-right-radius:5px; /* Saf3-4 */
	}
	
	tr:last-child td.first {
		-moz-border-radius-bottomleft:5px;
		-webkit-border-bottom-left-radius:5px; /* Saf3-4 */
	}
	
	tr:last-child td.last {
		-moz-border-radius-bottomright:5px;
		-webkit-border-bottom-right-radius:5px; /* Saf3-4 */
	}
</style>

 <script type="text/javascript">
	$(function(){
		$("#userNameInput").hide();
		$("#userPwdInput").hide();
		$("#userPhoneInput").hide();
		$("#userEmailInput").hide();
		$("#error").hide();
		$("#success").hide();
		$("#fail").hide();
		
		var tempUserID= $("#userID").val();
		var tempUserName= $("#userName").val();
		var tempUserPwd= $("#userPwd").val();
		var tempUserPhone= $("#userPhone").val();
		var tempUserEmail= $("#userEmail").val();
		var tempUserCredit= $("#userCredit").val();
		var tempUserState= $("#userState").val();
		var tempDefalut = Number(2);
		
		var ok1=false;
		var ok2=false;
		var ok3=false;
		var ok4=false;
		
		var regPwd=/[a-zA-Z0-9]*/;
		var regPhone=/^1[3|4|5|7|8]\d{9}$/;
		var regEmail=/^(\w-*\.*)+@(\w-?)+(\.\w{2,})+$/;
		
		$("#editName").click(function(){
			$("#editName").hide();
			$("#userNameInput").show();
		});
		
		$("#editPwd").click(function(){
			$("#editPwd").hide();
			$("#userPwdInput").show();
		});
		
		$("#editPhone").click(function(){
			$("#editPhone").hide();
			$("#userPhoneInput").show();
		});
		
		$("#editEmail").click(function(){
			$("#editEmail").hide();
			$("#userEmailInput").show();
		});
		
		$("#submitButton").click(function(){
			
			if(($("#userNameInput").val())==""){
					tempUserName= $("#userName").val();
					var ok1=true;
				}
			else{
				tempUserName= $("#userNameInput").val();
				if(tempUserName.length < 3 || tempUserName.length > 50){
					$("#error").dialog({
				    modal: true
					});
					var ok1=false;
				}
				else{
					var ok1=true;
				}
			}
			
			if($("#userPwdInput").val()==""){
				tempUserPwd= $("#userPwd").val();
				var ok2=true;
			}
			else{
				tempUserPwd= $("#userPwdInput").val();
				if(tempUserPwd.length < 3 || tempUserPwd.length > 50||(!regPwd.test(tempUserPwd))){
					$("#error").dialog({
				    modal: true
					});
					var ok2=false;
				}
				else{
					var ok2=true;
				}
			}
				
			if($("#userPhoneInput").val()==""){
					tempUserPhone= $("#userPhone").val();
					var ok3=true;
			}
			else{
				tempUserPhone= $("#userPhoneInput").val();
				if(!regPhone.test(tempUserPhone)){
					$("#error").dialog({
				    modal: true
					});
					var ok3=false;
				}
				else{
					var ok3=true;
				}
			}
				
			if($("#userEmailInput").val()==""){
				tempUserEmail= $("#userEmail").val();
				var ok4=true;
			}
			else{
				tempUserEmail= $("#userEmailInput").val();
				if(!regEmail.test(tempUserEmail)){
					$("#error").dialog({
				    modal: true
					});
					var ok4=false;
				}
				else{
					var ok4=true;
				}
			}
				
			
			var tempUser={'userID':tempUserID,'userName':tempUserName,'userPwd':tempUserPwd,'userEmail':tempUserEmail,'userPhone':tempUserPhone,'userCredit':tempUserCredit,'userState':tempUserState};
			if(ok1&&ok2&&ok3&&ok4){
				$.ajax({                           	  
					url: '${ctx}/user/edit',             
					type: 'POST',                  
					data: tempUser,                
					success: function (msg){ 
	                    if (msg == "success"){
	                    	window.location.href='${ctx}/page/jumpToMyInfo';
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
		
		$("#apply").click(function(){
			$("#apply").hide();
			$("#successMsg").show();
			var tempUser={'userID':tempUserID,'userName':tempUserName,'userPwd':tempUserPwd,'userEmail':tempUserEmail,'userPhone':tempUserPhone,'userCredit':tempUserCredit,'userState':tempDefalut};
			$.ajax({                           	  
				url: '${ctx}/user/edit',             
				type: 'POST',                  
				data: tempUser,                
				success: function (msg){ 
                    if (msg == "success"){
                    	$("#success").dialog({
        				    modal: true
        				});
                    	window.location.href='${ctx}/page/jumpToMyInfo';
                      }
					else{
						$("#fail").dialog({
        				    modal: true
        				});
					}
					}              
				});    
		});
		
		
	});
 </script>
</head>
<body>
<div>
	<input id="userID" type="hidden" value="${userInfo.userID}">
	<input id="userName" type="hidden" value="${userInfo.userName}">
	<input id="userPwd" type="hidden" value="${userInfo.userPwd}">
	<input id="userPhone" type="hidden" value="${userInfo.userPhone}">
	<input id="userEmail" type="hidden" value="${userInfo.userEmail}">
	<input id="userCredit" type="hidden" value="${userInfo.userCredit}">
	<input id="userState" type="hidden" value="${userInfo.userState}">
	
	<div class="header" style="height:60px;">
		<input class="btn" type="submit" value="返回主页"  onclick="javascrtpt:window.location.href='${ctx}/page/jumpToHomePage'" style="width:120px;position:absolute;right:20px;top:5px;"/>
			<input class="btn" type="button" value="登出" onclick="javascrtpt:window.location.href='${ctx}/user/logout'" style="width:80px;height:40px;position:absolute;right:150px;top:5px;text-align:center;"/>
	</div>
	<div>
		<table border="1" style="font-size:120%;position:relative;top:-30px;width:900px;height:450px;table-layout:fixed;">
 				 <tr>
    				<td>用户名</td>
   					<td>
   						${userInfo.userName}
   					</td>
   					<td>
   						<input class="btn2" type="button" id="editName" value="修改"/>				
  						<input class="text1" type="text" id="userNameInput" placeholder="${userInfo.userName}"/>
  					</td>
  				</tr>
  				  <tr>
    				<td>密码</td>
   					<td>${userInfo.userPwd}</td>
   					<td>
   						<input class="btn2" type="button" id="editPwd" value="修改"/>
   						<input class="text1" type="text" id="userPwdInput" placeholder="${userInfo.userPwd}"/>	
  					</td>
  				</tr> 
  				<tr>
    				<td>电话</td>
   					<td>${userInfo.userPhone}</td>
   					<td>
   						<input class="btn2" type="button" id="editPhone" value="修改"/>
   						<input class="text1" type="text" id="userPhoneInput" placeholder="${userInfo.userPhone}"/>			
  					</td>
  				</tr>
  				<tr>
    				<td>邮箱</td>
   					<td>${userInfo.userEmail}</td>
   					<td>
   						<input class="btn2" type="button" id="editEmail" value="修改"/>
   						<input class="text1" type="text" id="userEmailInput" placeholder="${userInfo.userEmail}"/>				
  					</td>
  				</tr>
  				<tr>
    				<td>用户信用等级</td>
   					<td>${userInfo.userCredit}</td>
   					<td>
   						
   					</td>			
  				</tr>
			</table>
			<div>
				 <div style="padding:0;margin:0;float:right;box-sizing:border-box;position:relative;right:500px">
					<input class="btn3" type="button" id="apply" value="申请提高信用等级"/>
   				</div>
   				<div style="padding:0;margin:0;float:right;box-sizing:border-box;position:relative;right:50px">
					<input class="btn3" id="submitButton" type="button" value="提交我的修改"/>
				</div>
			</div>
	</div>
	</div>
	<div id="error" title="error">
  		<p>输入格式错误，请确认后重新输入</p>
	</div>
	
	<div id="success" title="success">
  		<p>成功</p>
	</div>
	
	<div id="fail" title="fail">
  		<p>失败，请重新尝试</p>
	</div>
</body>
</html>