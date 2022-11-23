<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<style>
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
.processNav .li6>a {
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

#createBtn{
	width: 100%;
	margin: 0px;
	height: 25px;
	border: 1px solid #c2c2c2;
	border-radius: 5px;
	background-color: #fff;
	color: #000;
	text-align: center;
	font-size: 14px;
}

#createBtn:hover{
	border-radius: 5px;
	background-color: #f5f5f5;
}

table, td, th{
	border: 1px solid red;
}
</style>
</head>
<body>
<nav class="processNav">
	<ul>
		<li><a href="../project/manageProject">프로젝트</a></li>
		<li><a href="../documents/manageDocuments">문서 관리</a></li>
		<li><a href="../function/manageFunction">기능</a></li>
		<li><a href="../wbs/manageWbs">일정</a></li>
		<li><a href="../implementation/viewImplementation">구현</a></li>
		<li class="li6"><a href="../test/manageTest">테스트</a></li>
		<li><a href="../project/viewComplete">완성</a></li>
	</ul>
</nav>

<table style="width:100%;">
	<tr><td colspan="6">단위테스트</td></tr>
	<!-- hidden 수정버튼 누르기 전 -->
	<tr>
		<td>
			
		</td>
		<th>
			사용자
		</th>
		<td>
			${test.customer}
		</td>
		<th>
			담당자
		</th>
		<td>
			${test.manager}
		</td>
	</tr>
	<!-- hidden 수정버튼 누르고난 후 -->
	<%-- <tr>
		<th>
			테스트 기능
		</th>
		<td>
			<input type="text" value="${test.program}" name="program">
		</td>
		<th>
			사용자
		</th>
		<td>
			<input type="text" value="${test.customer}" name="customer">
		</td>
		<th>
			담당자
		</th>
		<td>
			<input type="text" value="${test.manager}" name="manager">
		</td>
	</tr> --%>
	<tr><th>No</th><th>테스트시나리오 / 테스트데이터</th><th>예상 결과</th><th>실제 결과</th><th>비고</th></tr>
	<c:forEach var="test" items="${list}" varStatus="index">
		<!-- hidden 수정버튼 누르기 전 -->
		<tr id="text${test.testSeq}" class="hidden">
			<td>
				${test.scenarioNo}
			</td>
			<td>
				${test.scenarioData}
			</td>
			<td>
				${test.expected}
			</td>
			<td>
				${test.result}
			</td>
			<td>
				${test.remark}
			</td>
		</tr>
		<!-- hidden 수정버튼 누르고난 후 -->
		<%-- <tr id="update${test.testSeq}" class="updateHidden">
			<td>
				<input type="text" value="${test.scenarioNo}" name="scenarioNo">
				</br>No
			</td>
			<td>
				<input type="text" value="${test.scenarioData}" name="scenarioData">
				</br>1
			</td>
			<td>
				<input type="text" value="${test.expected}" name="expected">
				</br>2
			</td>
			<td>
				<input type="text" value="${test.result}" name="result">
				</br>3
			</td>
			<td>
				<input type="text" value="${test.remark}" name="remark">
				</br>0
			</td>
		</tr> --%>
	</c:forEach>
</table>
<input type="button" onclick="location.href='createTest.do'" value="+ 추가" id="createBtn">

<!-- //////////////////////////script//////////////////////////////////////// -->
<script>


</script>
</body>
</html>