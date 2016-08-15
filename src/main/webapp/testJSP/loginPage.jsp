<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">  
  <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>

<style type="text/css">
	html,body,div,ul,li,a
	{
		margin: 0;
		padding: 0;
		height: 100%;
		-webkit-box-sizing: border-box;
    	-moz-box-sizing: border-box;
        box-sizing: border-box;
        font-family: "Microsoft YaHei",Arial,Helvetica,sans-serif;
	}
	
	a{text-decoration:none;}
	a:link{text-decoration:none;}
	
	.header_container
	{
		width:auto;
		height:130px;
		background-image:url(oheader.png);
	}
	
	div.wrapper{
		position:relative;
		min-height:100%;
		height:auto !important;
		width:100%;
	}
	
	div.main_container{
		padding-bottom:40px;
	}
	
	div.main_container_box{
		position:relative;
		width:1000px;
		margin-left:auto;
		margin-right:auto;
		margin-top:30px;
		margin-bottom:10px;
		overflow:hidden;
	}
	
	div.footer{
		height:30px;
		position:absolute;
		bottom:0px;
		left:0px;
		width:100%;
		text-align:center;
		display:block;
		background-color:#fff;
		border-top-width:1px;
		border-style:solid;
		border-color:#ccc;
		border-bottom-width:0px;
		border-left-width:0px;
		border-right-width:0px;
	}
	
	.header_basic{
		background-color:white;
		height:40px;
		overflow: hidden;
		
		position:relative;
		filter:alpha(opacity=95); /*支持 IE 浏览器*/
		-moz-opacity:0.95; /*支持 FireFox 浏览器*/
		opacity:0.95; /*支持 Chrome, Opera, Safari 等浏览器*/
		
		box-shadow: rgba(0,0,0,0.1) 0 1px 2px;
	}
	
	.header_box{
		height:100%;
		width:1000px;
			
		margin-left:auto;
    	margin-right:auto;
    	
	}
	
	.header_selection_box{
		float:left;
	}
	
	
	.header_botton_box{
		float:right;
	}

	ul{
		height:100%;
		list-style-type:none;
	}
	li{
		line-height:40px;
		float:left;
	}
	
	a.header_btn:link,a.header_btn:visited
	{
		display:block;
		width:110px;
		height:100%;
		color:rgb(102, 102, 102);
		font-weight:bold;
		text-align:center;
		padding:4px;
		border:2px solid #ccc; 
		border-width:0 2px 0 0;
		text-decoration:none;
		text-transform:none;
		padding:0px;
		margin:0px;
	}
	
	a.header_btn:hover,a.header_btn:active{
		color:#fff !important;
		background-color:#bebebe;
	}
	
	.header_icon{
		font-size: 22px;
	}
	
	div.login_form_box{
		float:left;
		height:450px;
		width:500px;
		background-image:url(loginBack.jpg);
		text-align:center;
		padding:20px 10px 20px 10px;
		margin:0;
	}
	
	div.login_img_box{
		position:relative;
		height:450px;
		width:500px;
		background-color:green;
		text-align:center;
		padding:20px 10px 20px 10px;
		margin:0;
		float:left;
		background-image:url(ad.jpg);
	}
	
	div.input_box{
		position:relative;
		top:65px;
		
	}
	
	input.login_input{
		width:380px;
		height:40px;
		font-size:18px;
		margin-top:5px;
		margin-bottom:15px;
		padding-left:20px;
		border: 1px solid #ddd;
    	border-radius: 2px;
    	color: #aaa;
    	font-size: 14px;
		outline:none;
	}
	
	input.login_input：hover,input.login_input:focus{
		border: 1px solid #4f90fb;
	}
	
	.alert_msg{
		font-size:14px;
		color:#ff6384;
	}
	
	.login_title{
		font-size:28px;
		color:#666;
		position:relative;
		left:-40px;
		margin:0px;
	}
	
	.title_name{
		font-size:24px;
		font-weight:blod;
		font-family:"Microsoft YaHei";
	}
	
	.btn_login{
		  padding:0;
		  margin-left:10px;
		  margin-right:10px;
		  height:40px;
		  width:180px;
		  color:#ffffff;
		  background-color:#4f90fb;
		  font-size:18px;
		  font-weight:normal;
		  border:1px solid #1647e9;
		  -webkit-border-top-left-radius:2px;
		  -moz-border-radius-topleft:2px;
		  border-top-left-radius:2px;
		  -webkit-border-top-right-radius:2px;
		  -moz-border-radius-topright:2px;
		  border-top-right-radius:2px;
		  -webkit-border-bottom-left-radius:2px;
		  -moz-border-radius-bottomleft:2px;
		  border-bottom-left-radius:2px;
		  -webkit-border-bottom-right-radius:2px;
		  -moz-border-radius-bottomright:2px;
		  border-bottom-right-radius:2px;
		  -moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  -webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  box-shadow: inset 0px 0px 0px 0px #ffffff;
		  text-align:center;
		  display:inline-block;
		  text-decoration:none;
		}
		
	.btn_login:hover{
		background-color:#9bc0fd;
	}
	
	.btn_signin{
		  padding:0;
		  margin-left:10px;
		  margin-right:10px;
		  height:40px;
		  width:180px;
		  color:#000;
		  background-color:#fff;
		  font-size:18px;
		  font-weight:normal;
		  border:1px solid #dcdcdc;
		  -webkit-border-top-left-radius:2px;
		  -moz-border-radius-topleft:2px;
		  border-top-left-radius:2px;
		  -webkit-border-top-right-radius:2px;
		  -moz-border-radius-topright:2px;
		  border-top-right-radius:2px;
		  -webkit-border-bottom-left-radius:2px;
		  -moz-border-radius-bottomleft:2px;
		  border-bottom-left-radius:2px;
		  -webkit-border-bottom-right-radius:2px;
		  -moz-border-radius-bottomright:2px;
		  border-bottom-right-radius:2px;
		  -moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  -webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  box-shadow: inset 0px 0px 0px 0px #ffffff;
		  text-align:center;
		  display:inline-block;
		  text-decoration:none;
		}
		
	.btn_signin:hover{
		color:#ff6384;
	}
	
	.login_btn_box{
		margin-top:20px;
	}
	
	.other_role{
		color:#666;
		margin:5px;
	}
	
	.other_role:hover{
		color:#ff6384;
	}
	
	
</style>
</head>
<body>
	<div class="wrapper">
	<div class="header_container">
			<div class="header_basic">
				<div class="header_box">
					<div class="header_selection_box">
						<ul>
							<li>
								<a href="#" class="header_btn" style="border-width:0 2px 0 2px;">
	  								<p style="font-size:18px;">返回主页</p>
								</a>
							</li>
						</ul>
					</div>
					<div class="header_botton_box">
						<ul>
							<li>
								<a href="#" class="header_btn" style="border-width:0 2px 0 2px;">
	  								<p style="font-size:18px;">登陆</p>
								</a>
							</li>
							<li>
								<a href="#" class="header_btn">
	  								<p style="font-size:18px;">注册</p>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="main_container">
			<div class="main_container_box" style="background-color:#ccc;">
				<div class="login_img_box">
				</div>
				<div class="login_form_box">
					<div class="input_box">
						<p class="login_title">
							<span class="glyphicon glyphicon-user"></span>
							<span class="title_name">用户名</span>
							<span class="alert_msg" id="alert_username_msg">*账号长度应在3-32字符之间</span>
						</p>
						<input type="text" id="username" placeholder="请输入您的账号" class="login_input">
						
						<p class="login_title" style="left:-50px;">
							<span class="glyphicon glyphicon-lock"></span>
							<span class="title_name">密码</span>
							<span class="alert_msg" id="alert_pwd_msg">*密码长度应在3-32字符之间</span>
						</p>
						<input type="password" id="password" placeholder="请输入您的密码" class="login_input">
						<div class="login_btn_box">
							<button class="btn_login">登陆</button>
							<button class="btn_signin">注册</button>
							<div style="position:relative;left:-50px;top:10px;text-align:right;">
								<a href="#"><p class="other_role"> >系统管理员登陆</p></a>
								<a href="#"><p class="other_role">>审核员登陆</p></a>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
				Copyright (c) 2016	
		</div>
	</div>
</body>
</html>
