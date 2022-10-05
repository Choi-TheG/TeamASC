<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사원 목록</title>
	</head>
	<body>
		<h1>Member List</h1>
		<c:forEach var="member" items="${list}">
		<table>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>부서명</th>
				<th>직급</th>
				<th>이메일</th>
				<th>전화번호</th>
			</tr>
			<tr>
				<td>${member.memberNo}</td>
				<td>${member.name}</td>
				<td>${member.depart}</td>
				<td>${member.position}</td>
				<td>${member.email}</td>
				<td>${member.phoneNum}</td>
				<a href="read.do">
					<button>조회</button>
				</a>
			</tr>
		</table>
		</c:forEach>
	</body>
</html>