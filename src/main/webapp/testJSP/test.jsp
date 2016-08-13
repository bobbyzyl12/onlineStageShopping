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
	html,body,div,ul,li
	{
		margin: 0;
		padding: 0;
		height: 100%;
		-webkit-box-sizing: border-box;
    	-moz-box-sizing: border-box;
        box-sizing: border-box;
        font-family: "Microsoft YaHei",Arial,Helvetica,sans-serif;
	}
	
	.header_container
	{
		width:auto;
		height:150px;
		background-image:url(1.jpg);
	}
	
	div.wrapper{
		position:relative;
		height:auto !important;
		min-height:100%;
	}
	
	div.main_container{
		padding-bottom:40px;
	}
	
	div.footer{
		margin-top:10px;
		position:absolute;
		bottom:0px;
		left:0;		/*IE*/
		height:30px;
		width:100%;
		text-align:center;
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
		width:1200px;
			
		margin-left:auto;
    	margin-right:auto;
    	
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
	}
	
	a.header_btn:hover,a.header_btn:active{
		color:#fff !important;
		background-color:#bebebe;
	}
	
	.header_icon{
		font-size: 22px;
	}
	
	.header_under_center{
		height:100%;
		width:1200px;
		margin-left:auto;
    	margin-right:auto;
    	vertical-align:middle;
	}
	
	.header_logo_box{
		width:auto;
		padding:10px 0px 0px 0px;
		float:left;
	}
		
	img.header_logo{
		height:80px;
	}
	
	.search_box{
		float:left;
	}
	
	.header_search_box{
		float:left;
		position:relative;
		left:50px;
		padding:25px 50px 0px 0px;
	}
	
	.header_search{
		width:700px;
		height:50px;
		padding:0px 0px 0px 30px;
		margin:0;
		border-width:3px;
		border-style:solid;
		border-color:#3399ff #3399ff; 
		font-size:20px;
		outline:medium;
		background-color:#f2f2f2;
	}
	
	.header_search:hover,.header_search:focus{
		background-color:#ffffff;
	}
	
	
	.search_btn_box{
		float:left;
	}
	
	.search_btn{
		width:120px;
		height:50px;
		font-size:20px;
		color:#fff;
		font-weight:bold;
		padding:0px 0px 0px 0px;
		border:0;
		margin:0;
		background-color:#3399ff;
		letter-spacing:6px;
		text-align:center;
	}
	
	.search_btn:hover{
		background-color:#007fff;
	}
	
	.new_msg{
		min-width: 16px;
    	height: 16px;
    	line-height: 14px;
    	text-align: center;
    	display:inline-block;
    	background: #ff80aa;
    	color: #fff;
    	border-radius: 3px;
    	
    	position: relative;
    	right: 18px;
    	top: -65px;
    	padding:0 2px 0 2px;
    	border: 1px solid #fff;
    	
    	font-style:normal;
		font-size:9px;
	}
	
</style>
</head>
<body>
	<div class="wrapper">
		<div class="header_container">
			<div class="header_basic">
				<div class="header_box">
					<div class="header_botton_box">
						<ul>
							<li>
								<a href="#" class="header_btn" style="border-width:0 2px 0 2px;">
	  								<span class="glyphicon glyphicon-user header_icon"></span>
	  								<p style="display:inline-block;">&nbsp;&nbsp;个人中心</p>
								</a>
							</li>
							<li>
								<a href="#" class="header_btn">
	  								<span class="glyphicon glyphicon-envelope header_icon"></span>
	  								<p style="display:inline-block;">&nbsp;&nbsp;我的消息</p>
	  								<em class="new_msg">12</em>
								</a>
							</li>
							<li>
								<a href="#" class="header_btn">
	  								<span class="glyphicon glyphicon-shopping-cart header_icon"></span>
	  								<p style="display:inline-block;">&nbsp;&nbsp;购物车</p>
								</a>
							</li>
							<li>
								<a href="#" class="header_btn">
	  								<span class="glyphicon glyphicon-list-alt header_icon"></span>
	  								<p style="display:inline-block;">&nbsp;&nbsp;我的订单</p>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="header_under">
				<div class="header_under_center">
					<div class="header_logo_box">
						<a href="">
							<img class="header_logo" src="logo.png">
						</a>
					</div>
					<div class="header_search_box">
						<div class="search_box">
							<input class="header_search" id="search" placeholder="输入关键字">
						</div>
						<div class="search_btn_box">
							<button class="search_btn">搜索</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="main_container">
			<div>
			
			</div>
		</div>
		<div class="footer">
				Copyright (c) 2016	
		</div>
	</div>
</body>
</html>
