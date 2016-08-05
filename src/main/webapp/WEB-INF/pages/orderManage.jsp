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
<title>订单信息管理页面</title>
<style type="text/css">
	html, body, div, span, object, iframe,
	h1, h2, h3, h4, h5, h6, p, blockquote, pre,
	abbr, address, cite, code,
	del, dfn, em, img, ins, kbd, q, samp,
	small, strong, sub, sup, var,
	b, i,
	dl, dt, dd, ol, ul, li,
	fieldset, form, label, legend,
	table, caption, tbody, tfoot, thead, tr, th, td {
		margin:0;
		padding:0;
		border:0;
		outline:0;
		font-size:100%;
		vertical-align:baseline;
		background:transparent;
		overflow-y:hidden;
	}
	
	body {
		margin:0;
		padding:0;
		font:12px/15px "Helvetica Neue",Arial, Helvetica, sans-serif;
		color: #555;
	}
	
	#content {width:65%; max-width:690px; margin:6% auto 0;}
	
	table {
		overflow:hidden;
		border:1px solid #d3d3d3;
		background:#fefefe;
		width:950px;
		margin:5% auto 0;
		-moz-border-radius:5px; /* FF1+ */
		-webkit-border-radius:5px; /* Saf3-4 */
		border-radius:5px;
		-moz-box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
		-webkit-box-shadow: 0 0 4px rgba(0, 0, 0, 0.2);
	}
	
	th, td {padding:18px 20px 18px; text-align:center; }
	
	th {padding-top:22px; text-shadow: 1px 1px 1px #fff; background:#e8eaeb;}
	
	td {border-top:1px solid #e0e0e0; border-right:1px solid #e0e0e0;}
	
	tr.odd-row td {background:#f6f6f6;}
	
	td.first, th.first {text-align:left}
	
	td.last {border-right:none;}
	
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
	
	.normalbutton {
       	width:100px;
    	height:35px;
    	background-color: #999999;
    	color: #ffffff;
    	font-size:16px;
    	font-family:"微软雅黑";
    	cursor: hand;
    	text-decoration: none;
		-moz-border-radius: 6px;
		-webkit-border-radius: 6px;
		-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
		-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
		text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
		border-bottom: 1px solid rgba(0,0,0,0.25);
		}
		
	.smallbutton {
       	width:60px;
    	height:30px;
    	background-color: #999999;
    	color: #ffffff;
    	font-size:12px;
    	margin-left:auto;
    	margin-right:auto;
    	font-family:"微软雅黑";
    	cursor: hand;
    	text-decoration: none;
		-moz-border-radius: 6px;
		-webkit-border-radius: 6px;
		-moz-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
		-webkit-box-shadow: 0 1px 3px rgba(0,0,0,0.6);
		text-shadow: 0 -1px 1px rgba(0,0,0,0.25);
		border-bottom: 1px solid rgba(0,0,0,0.25);
		}
		a{
			font-size:15px;
			margin:20px;
		}
		a:visited{color:#fff;text-decoration:none;}
		a:hover{color:#fff;text-decoration:none;}
		a:link{color:#fff;text-decoration:none;}
		a:active{color:#fff;text-decoration:none;}
		
</style>


</head>
<body>
	<div style="text-align:center;position:absolute;top:20px;">
		 <table align="center" border="1" cellpadding="10">
  			<tr>
  				<th>订单ID</th>
  				<th>所属用户ID</th>
  				<th>创建时间</th>
  				<th>总金额</th>
  				<th>地址</th>
  				<th>分期等级</th>
  				<th>订单状态</th>
  				<th>修改状态</th>
  			</tr>
  			  <c:forEach items="${pageModel.datas}" var="order">
     			<tr>
  				<td>${order.orderID}</td>
  				<td>${order.userID}</td>
  				<td>
  					<fmt:formatDate value="${order.orderCreateDate}" pattern="yyyy-MM-dd"/>
  				</td>
  				<td>${order.totalPrice}</td>
  				<td>${order.orderAddress}</td>
  				<td>${order.orderLevel}</td>
  				<td>
					<c:choose>
    					<c:when test="${order.orderState == '1'}">
       						<p style="color:#00b300;font-weight:bold;">等待支付</p>
   						</c:when>
    					<c:when test="${order.orderState=='7'}">
       						<p style="color:#red;font-weight:bold;">已冻结</p>
   						</c:when>
    					<c:when test="${order.orderState=='2'}">
       						<p style="color:#a64dff;font-weight:bold;">等待审核</p>
   						</c:when>
   						<c:when test="${order.orderState=='4'}">
       						<p style="color:#e5e600;font-weight:bold;">未通过审核</p>
   						</c:when>
   						<c:when test="${order.orderState=='5'}">
       						<p style="color: #4d4dff;font-weight:bold;">支付完成</p>
   						</c:when>
   						<c:when test="${order.orderState=='0'}">
       						<p style="color:red;font-weight:bold;">已逾期</p>
   						</c:when>
					</c:choose>
				</td>
  				<td>
  					<a href="${ctx}/page/jumpToEditOrderPage?orderID=${order.orderID}" class="smallbutton"><button>修改</button></a>
  				</td>
  			</tr>
   			</c:forEach> 
  		</table>
  		<div align="center" style="margin:20px;">
               <a href="${pageContext.request.contextPath}/page/jumpToOrderManage">首页</a>
               <c:if test="${pageModel.pageNo>1&&pageModel.datas!=null}"><a href="${pageContext.request.contextPath}/page/jumpToOrderManage?pageNo=${pageModel.pageNo-1}">上一页</a></c:if>
               <c:if test="${pageModel.pageNo<pageModel.totalpage&&pageModel.datas!=null}"><a href="${pageContext.request.contextPath}/page/jumpToOrderManage?pageNo=${pageModel.pageNo+1}">下一页</a></c:if>
               <c:if test="${pageModel.totalpage!=0}">
               		<a href="${pageContext.request.contextPath}/page/jumpToOrderManage?pageNo=${pageModel.totalpage}">
             			尾页
             		</a>
             	</c:if>
             	<div style="color:#d9d9d9;margin-top:20px;">
                                            总页数:${pageModel.totalpage}
                                            总数量:${pageModel.totalrecode}
                                            当前页:${pageModel.pageNo}
         		</div>
         </div>
 </div>
<script type="text/javascript">

 </script>
</body>
</html>