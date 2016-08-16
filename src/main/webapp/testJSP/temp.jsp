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
	.btn{
		border:1px solid #000;
		width:120px;
	}
</style>

<script type="text/javascript">
	$(function(){
		var currentPage=Number(20);
		var pageNum=Number(50);
		
		$("#btn2").text(currentPage-2);
		$("#btn3").text(currentPage-1);
		$("#btn4").text(currentPage);
		$("#btn5").text(currentPage+1);
		$("#btn6").text(currentPage+2);
		$("#btn7").text(pageNum);
		
		//改变当前页的button样式
		$("#btn4").css("background-color","#ff6384"); 
		$("#btn4").css("color","#fff");
		
		//先处理"上一页"和"下一页"的情况
		if(currentPage==1)	//如果当前页为首页
		{
			$("#prePage").hide();	
		}
		
		if(currentPage==pageNum)	//如果当前页为末页
		{
			$("#sufPage").hide();
		}
		
		//处理当前页小于等于3的特殊情况
		if(currentPage<=3){
			$("#prePoint").hide();
			$("#btn1").hide();
		}
		else if(currentPage==4){
			$("#prePoint").hide();
		}
		
		if(currentPage==1)
		{
			$("#btn2").hide();
			$("#btn3").hide();
		}
		else if(currentPage==2)
		{
			$("#btn2").hide();
		}
		
		if(currentPage>=pageNum-2){
			$("#sufPoint").hide();
			$("#btn7").hide();
		}
		else if(currentPage==pageNum-3){
			$("#sufPoint").hide();
		}
		
		if(currentPage==pageNum)
		{
			$("#btn5").hide();
			$("#btn6").hide();
		}
		
		if(currentPage==pageNum-1)
		{
			$("#btn6").hide();
		}
	});
	
</script>


</head>
<body>
	<button class="btn" id="prePage">上一页</button>
	<button class="btn" id="btn1">1</button>
	<span id="prePoint">...</span>
	<button class="btn" id="btn2">2</button>
	<button class="btn" id="btn3">3</button>
	<button class="btn" id="btn4">4</button>
	<button class="btn" id="btn5">5</button>
	<button class="btn" id="btn6">6</button>
	<span id="sufPoint">...</span>
	<button class="btn" id="btn7">7</button>
	<button class="btn" id="sufPage">下一页</button>
</body>
</html>
