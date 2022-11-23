<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 관리</title>
<style type="text/css">
.processNav>ul {
	list-style: none;
	display: inline-block;
	width: 95%;
	height: 100px;
	text-align: center;
}
.processNav>ul>li {
	float: left;
}
.processNav>ul>li>a {
	border: 2px solid white;
	background-color: #F1F3F5;
	color: #384D59;
	text-decoration: none;
	font-size: 20px;
	display: block;
	width: 130px;
	padding: 30px 30px;
}
.processNav>ul>li>a:hover {
	border: 5px solid #0F2859;
	background-color: white;
	color: #384D59;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	display: block;
	width: 130px;
	padding: 30px 30px;
}
.processNav .li2>a {
	border: 5px solid #0F2859;
	background-color: white;
	color: #384D59;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	display: block;
	width: 130px;
	padding: 30px 30px;
}
.btnClick{
   width: 100px; 
   height: 40px; 
   border: 0px;
   border-radius: 5px; 
   font-size: 16px; 
   font-weight: bold; 
   text-align: center;
   color: white;
   background-color: #384D59;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	console.log('ready');
	
	$("#complete2").on("click", function() {
		
		let message = confirm('현재 과정을 완료하시겠습니까?');
		
		if(message == true) {
			alert("완료");
			$(".li2>a").css({"border" : "2px solid white", "background" : "#faf43e", "color" : "white", "text-decoration" : "none", "font-size" : "20px"})
			return true;
		} else {
			return false;
		}
		
	}); // #complete2 end
}); // document end
</script>
</head>
<body>
<nav class="processNav">
	<ul>
		<li><a href="../project/manageProject">프로젝트</a></li>
		<li class="li2"><a href="../documents/manageDocuments">문서 관리</a></li>
		<li><a href="../function/manageFunction">기능</a></li>
		<li><a href="../wbs/manageWbs">일정</a></li>
		<li><a href="../implementation/viewImplementation">구현</a></li>
		<li><a href="../test/manageTest">테스트</a></li>
		<li><a href="../project/viewComplete">완성</a></li>
	</ul>
</nav>
<h1>문서 관리</h1>
<div>
	<input type="button" value="완료" id="complete2" class="btnClick">
</div>
</body>
</html>