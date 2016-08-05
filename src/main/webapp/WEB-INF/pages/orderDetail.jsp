<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath }"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="${ctx}/js/jquery.min.js"></script>
<title>订单详情</title>
<style type="text/css">
	html, body{
		margin: 0;
		padding: 0;
		height: 100%;
		overflow-x:hidden;
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
		.btn2 {
			margin: 5px auto;
			display: block;
			border: 10px;
			border-radius: 5px;
			background: #0066ff;
			height: 30px;
			width: 80px;
			color:#fff;
			font-family:"微软雅黑";
			font-size:14px;
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
			border: 10px;
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
table {
		overflow:hidden;
		table-layout:fixed;
		border:1px solid #d3d3d3;
		background:#fefefe;
		width:70%;
		margin:2% auto 0;
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
	
	a:visited{text-decoration:none; color:#000}
	a:hover{ text-decoration:none; color:#000}
	a:link{ text-decoration:none; color:#000}
	a:active{ text-decoration:none; color:#000}
	
	.text1 {
			margin-bottom: 5px;
			padding-left: 5px;
			padding-right: 5px;
			display: block;
			border: 2px solid  #999999;
			border-radius: 5px;
			background: none;
			width: 80%;
			height: 30px;
			transition: border-color ease .4s;
		}

		.text1:focus {
			border-color:#4d79ff;
		}
		
		.notvitalinfo
		{
			font-size: 14px;
			font-family: "微软雅黑";
			font-weight: normal;
			color: #595959;
		}
		
		.reallynotvitalinfo
		{
			font-size: 12px;
			font-family: "微软雅黑";
			font-weight: normal;
			color: #595959;
		}
</style>

<script type="text/javascript">
$(function(){
	var state = $("#orderState").val();
	
	if(state == '1'||state == '0'){
		 $("#payArea").show();
		 $("#payDone").hide();
	}
		
	else if(state == '5'){ 
		$("#payArea").hide();
		$("#payDone").show();
	}
	else{
		$("#payArea").hide();
		$("#payDone").hide();
	}
});
</script>

</head>
<body>
	<input id="orderState" type="hidden" value="${myOrder.orderState}">
	<div class="header" style="height:60px;">
		<input class="btn" type="submit" value="返回主页"  onclick="javascrtpt:window.location.href='${ctx}/page/jumpToHomePage'" style="width:120px;position:absolute;right:20px;top:5px;"/>
	</div>
	<div style="position:relative;left:15%;top:10px">
		<p class="reallynotvitalinfo">订单编号：${myOrder.orderID}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单状态：${myOrder.orderState}</p>
	</div>
	<div>
		<table>
	 		<tr>
  				<th>商品图片</th>
  				<th>商品名</th>
  				<th>商品数量</th>
  				<th>小计</th>
  			</tr>
	 	<c:forEach items="${goodsDetailInOrderList}"  var="temp">
	 		<tr>
	 			<td>
	 				<a href="${ctx}/page/jumpToGoodsDetail?goodsID=${temp.goodsID}">
	 					<img  style="width:100px;height:100px;border:1px" src="${ctx}/img/${temp.goodsPicture}">
	 				</a>
	 			</td>
	 			<td>
	 				<a href="${ctx}/page/jumpToGoodsDetail?goodsID=${temp.goodsID}">
	 					${temp.goodsName}
	 				</a>
	 			</td>
	 			<td>
	 				${temp.quantity}
	 			</td>
	 			<td>￥${temp.totalPrice}</td>
	 		</tr>
	 	</c:forEach>
	 </table>
	</div>
	<div>
		<div style="border:4px solid  #4d79ff;width:65%;margin:30px;border-radius:10px;margin-left: auto;margin-right: auto;text-align:right;padding:10px 30px">
			<p class="notvitalinfo">总计：&nbsp;￥${myOrder.orderTotalPrice}</p>
			<p class="notvitalinfo" style="font-size:14px">本期为第
				<span style="color:#4d79ff;font-weight:bold;font-size:18px;">${myOrder.nextNo}</span>
				期
				<span style="font-size:12px;">（共</span>
				<span style="font-size:15px;color:#4d79ff;font-weight:bold;">${myOrder.totalStageNum}</span>
				<span style="font-size:12px;">期）</span>
			</p>
			<p class="notvitalinfo" style="font-size:10px">
				无利率支付截止时间:&nbsp;&nbsp;&nbsp;&nbsp;
				<fmt:formatDate value="${myOrder.deadline}" pattern="yyyy-MM-dd"/>
			</p>
			<p class="notvitalinfo" style="font-size:18px">本期需要支付:&nbsp;&nbsp;<span style="color:#4d79ff;font-weight:bold;font-size:22px;">￥${myOrder.nextStagePrice}</span></p>
		</div>
		<div id="payArea" style="width:65%;text-align:right;margin-left:auto;margin-right:auto;">
			<a href="${ctx}/page/jumpToPayPage?orderID=${myOrder.orderID}&stageNo=${myOrder.nextNo}">
				<input class="btn3" id="payButton" type="button" value="支付当期" style="position:relative;right:20px"/>
			</a>
		</div>
		<div id="payDone" style="width:65%;text-align:right;margin-left:auto;margin-right:auto;">
				<input class="btn3" type="button" value="已支付完成" style="position:relative;right:20px"/>
		</div>
	</div>
</body>
</html>