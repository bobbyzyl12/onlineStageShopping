<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <script src="http://apps.bdimg.com/libs/jquery/2.1.1/jquery.min.js"></script>
   <script src="http://apps.bdimg.com/libs/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="http://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.2.1/Chart.min.js"></script>
</head>
<body>
	<div style="background-color:red;width:300px;height:300px;" id="a">
	</div>
	<div style="background-color:black;width:300px;height:300px;" id="b">
	</div>
	
	<script type="text/javascript">
		$(function(){
			  $("#b").hide();
		});
		
		 $("#a").mouseover(function(){
			 $("#b").show();
			  
		  });
		 
		 $("#a").mouseout(function(){
			 $("#b").hide();
			  
		  });
		 
		 $("#b").mouseover(function(){
			 $("#b").show();
		  });
		 
		 $("#b").mouseout(function(){
			 $("#b").hide();
			  
		  });
	</script>
</body>
</html>