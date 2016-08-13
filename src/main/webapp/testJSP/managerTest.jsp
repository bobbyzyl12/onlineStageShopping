<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<meta charset="utf-8">
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://apps.bdimg.com/libs/bootstrap/3.3.0/css/bootstrap.min.css">  
  <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
  <script src="http://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.1/Chart.min.js"></script>
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
		height:45px;
		background-image:url(m1.jpg);
		background-size:cover; 
	}
	
	div.wrapper{
		position:relative;
		min-height:100%;
		height:auto !important;
		width:100%;
	}
	
	div.main_container{
		overflow:auto;
		padding-bottom:40px;
	}
	
	div.main_container_box{
		position:relative;
		top:10px;
		width:1200px;
		margin-left:auto;
		margin-right:auto;
		background-color:#E9E9E9;
		border-radius:10px;
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
	}
	
	.header_basic{
		background-color:white;
		height:40px;
		overflow: hidden;
		
		position:relative;
		filter:alpha(opacity=75); /*支持 IE 浏览器*/
		-moz-opacity:0.75; /*支持 FireFox 浏览器*/
		opacity:0.75; /*支持 Chrome, Opera, Safari 等浏览器*/
		
		box-shadow: rgba(0,0,0,0.1) 0 1px 2px;
	}
	
	.header_box{
		height:100%;
		width:1200px;
			
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
		
	.chart_box{
		float:left;
		width:500px;
	}
	
	.big_chart{
		height:375px;
		width:400px;
		margin-top:20px;
		margin-bottom:10px;
		margin-right:auto;
		margin-left:auto;
		text-align:center;
		background-color:white;
		box-shadow:2px 2px 3px #aaaaaa;
		border-radius:5px;
	}
	
	.small_chart_box{
		width:400px;
		height:200px;
		margin-right:auto;
		margin-left:auto;
		
	}
	
	.small_chart{
		float:left;
		width:195px;
		text-align:center;
		background-color:white;
		box-shadow:2px 2px 3px #aaaaaa;
		border-radius:5px;
	}	
	
	.chart_btn_box{
		float:right;
		height:200px;
		width:195px;
		margin:0px;
		text-align:center;
		background-color:white;
		box-shadow:2px 2px 3px #aaaaaa;
		border-radius:5px;
	}
	
	.message_box{
		float:right;
		height:580px;
		width:700px;
		margin-left:auto;
		margin-right:auto;
		position:relative;
		top:20px;
		right:30px;
		
		background-color:white;
		box-shadow:2px 2px 3px #aaaaaa;
		border-radius:5px;
	
		font-size:16px;
	}
	
	.order_msg{
		height:250px;
		border-style:solid;
  		border-top-width:2px;
  		border-bottom-width:2px;
  		border-left-width:2px;
  		border-right-width:2px;
  		border-color:#aaaaaa;
  		padding:25px;
  		padding-left:30px;
	}
	
	.user_msg{
		height:250px;
		border-style:solid;
  		border-top-width:2px;
  		border-bottom-width:2px;
  		border-left-width:2px;
  		border-right-width:2px;
  		border-color:#aaaaaa;
  		padding:25px;
  		padding-left:30px;
	}
	
	.result_msg{
		height:80px;
		border-style:solid;
  		border-top-width:10px;
  		border-bottom-width:2px;
  		border-left-width:2px;
  		border-right-width:2px;
  		border-color:#aaaaaa;
  		text-align:center;
  		padding-top:15px;
	}
	
	span.title_text{
		font-weight:bold;
	}
	
	span.important_text{
		font-weight:bold;
		color:#ff6384;
	}
	
	img.icon_img{
		position:absolute;
		top:20px;
		right:50px;
		width:200px;
		height:200px;
		
	}
	
	.btn_pass{
		  padding:0;
		  margin-left:10px;
		  margin-right:10px;
		  height:40px;
		  width:100px;
		  color:#ffffff;
		  background-color:#4a8cf7;
		  font-size:20px;
		  font-weight:normal;
		  font-family:Microsoft YaHei;
		  border:2px solid #dcdcdc;
		  -webkit-border-top-left-radius:8px;
		  -moz-border-radius-topleft:8px;
		  border-top-left-radius:8px;
		  -webkit-border-top-right-radius:8px;
		  -moz-border-radius-topright:8px;
		  border-top-right-radius:8px;
		  -webkit-border-bottom-left-radius:8px;
		  -moz-border-radius-bottomleft:8px;
		  border-bottom-left-radius:8px;
		  -webkit-border-bottom-right-radius:8px;
		  -moz-border-radius-bottomright:8px;
		  border-bottom-right-radius:8px;
		  -moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  -webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  box-shadow: inset 0px 0px 0px 0px #ffffff;
		  text-align:center;
		  display:inline-block;
		  text-decoration:none;
		}
		
	.btn_pass:hover{
		color:#cee0fd;
		background-color:#0b68ff;
	}
	
	.btn_reject{
		  padding:0;
		  margin-left:10px;
		  margin-right:10px;
		  height:40px;
		  width:100px;
		  color:#ffffff;
		  background-color:#ff6782;
		  font-size:20px;
		  font-weight:normal;
		  font-family:Microsoft YaHei;
		  border:2px solid #dcdcdc;
		  -webkit-border-top-left-radius:8px;
		  -moz-border-radius-topleft:8px;
		  border-top-left-radius:8px;
		  -webkit-border-top-right-radius:8px;
		  -moz-border-radius-topright:8px;
		  border-top-right-radius:8px;
		  -webkit-border-bottom-left-radius:8px;
		  -moz-border-radius-bottomleft:8px;
		  border-bottom-left-radius:8px;
		  -webkit-border-bottom-right-radius:8px;
		  -moz-border-radius-bottomright:8px;
		  border-bottom-right-radius:8px;
		  -moz-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  -webkit-box-shadow: inset 0px 0px 0px 0px #ffffff;
		  box-shadow: inset 0px 0px 0px 0px #ffffff;
		  text-align:center;
		  display:inline-block;
		  text-decoration:none;
		}
		
	.btn_reject:hover{
		color:#ffcdd6;
		background-color:#ff5170;
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
	  								<p style="font-size:16px;">订单审核</p>
								</a>
							</li>
							<li>
								<a href="#" class="header_btn">
	  								<p style="font-size:16px;">信用审核</p>
								</a>
							</li>
							<li>
								<a href="#" class="header_btn" >
	  								<p style="font-size:16px;">退款审核</p>
								</a>
							</li>
						</ul>
					</div>
					<div class="header_botton_box">
						<ul>
							<li>
								<a href="#" class="header_btn" style="border-width:0 2px 0 2px;">
	  								<span class="glyphicon glyphicon-log-out header_icon"></span>
	  								<p style="display:inline-block;">&nbsp;&nbsp;退出登陆</p>
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		<div class="main_container">
			<div class="main_container_box">
				<div class="chart_box">
					<div class="big_chart">
						<canvas id="myChart" width="400" height="325"></canvas>
						<p>所有金额统计</p>
					</div>
					<div class="small_chart_box">
						<div class="small_chart">
							<canvas id="smallChart" width="195" height="180"></canvas>
							<p>用户所有订单各状态数量</p>
						</div>
						<div class="chart_btn_box">
							<canvas id="smallChart2" width="195" height="180"></canvas>
							<p>用户所有订单各状态金额</p>
						</div>
					</div>
				</div>
				<div class="message_box">
					<div class="order_msg">
						<p><span class="title_text">订单编号：</span>312132101321</p>
						<p><span class="title_text">订单生成时间：</span>2016年10月12日</p>
						<p><span class="title_text">订单总金额：</span>￥ 300.12</p>
						<p><span class="title_text">订单每期应付金额：</span>￥ 150.12</p>
						<p><span class="title_text">订单分期：</span>2期</p>
						<p><span class="title_text">订单最终应付金额：</span><span class="important_text">￥ 300.24</span></p>					
						<img src="listImg.png" class="icon_img"/>
					</div>
					<div class="user_msg">
						<p><span class="title_text">用户编号：</span>312132101321</p>
						<p><span class="title_text">用户信用额度等级：</span>普通用户1</p>
						<p><span class="title_text">用户累计逾期次数：</span>3次</p>
						<p><span class="title_text">用户现总欠款金额：</span>￥ 300.00</p>
						<p><span class="title_text">用户最高欠款累计额度：</span>￥ 1000.00</p>
						<p><span class="title_text">用户剩余可欠款额度：</span><span class="important_text">￥ 700.00</span></p>		
						<img src="userImg.png" class="icon_img" style="position:absolute;top:270px;right:40px;"/>
					</div>
					<div class="result_msg">
						<button class="btn_pass">通过</button>
						<button class="btn_reject">不通过</button>
					</div>
				</div>
			</div>
		</div>
		<div class="footer">
			Copyright (c) 2016
		</div>
	</div>
	<script type="text/javascript">
	$(function(){
		var data_big = {
			    labels: [
			        "已逾期金额",
			        "已支付金额",
			        "等待支付金额",
			    ],
			    datasets: [
			        {
			            data: [11.1, 22.21, 33.33],
			            backgroundColor: [
			                "#FF6384",
			                "#36A2EB",
			                "#FFCE56"
			            ],
			            hoverBackgroundColor: [
			                "#FF6384",
			                "#36A2EB",
			                "#FFCE56"
			            ]
			        }]
			};
		var options_big={
				   animateRotate :true,
				   animateScale : true,
		};
		
		var ctx = document.getElementById("myChart").getContext("2d");
		var newChart = new Chart(ctx, {
		  	type: 'doughnut',
		    data: data_big,
		    options: options_big
		});
		
		var data_small = {
			    labels: [
			        "已逾期",
			        "已支付",
			        "待支付",
			        "其他",
			    ],
			    datasets: [
			        {
			            data: [1,3,4,6],
			            backgroundColor: [
			                "#FF6384",
			                "#36A2EB",
			                "#FFCE56",
			                "#666666"
			            ],
			            hoverBackgroundColor: [
			                "#FF6384",
			                "#36A2EB",
			                "#FFCE56",
			                "#666666"
			            ]
			        }]
			};
		var options_small={
				   animateRotate :true,
				   animateScale : true,
		};
		
		var ctx = document.getElementById("smallChart").getContext("2d");
		var newSmallChart = new Chart(ctx, {
		  	type: 'doughnut',
		    data: data_small,
		    options: options_small
		});
		

		var data_small2 = {
			    labels: [
			        "已逾期",
			        "已支付",
			        "待支付",
			        "其他",
			    ],
			    datasets: [
			        {
			            data: [21.32,313.1,411.1,11.32],
			            backgroundColor: [
			                "#FF6384",
			                "#36A2EB",
			                "#FFCE56",
			                "#666666"
			            ],
			            hoverBackgroundColor: [
			                "#FF6384",
			                "#36A2EB",
			                "#FFCE56",
			                "#666666"
			            ]
			        }]
			};
		var options_small2={
				   animateRotate :true,
				   animateScale : true,
		};
		
		var ctx = document.getElementById("smallChart2").getContext("2d");
		var newSmallChart2 = new Chart(ctx, {
		  	type: 'doughnut',
		    data: data_small2,
		    options: options_small2
		});
	});
	
		
	</script>
	
</body>
</html>
