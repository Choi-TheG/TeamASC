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
		<a href="viewJoin.do">사원 등록</a>
		<table>
			<tr>
				<th>사번</th>
				<th>이름</th>
				<th>부서명</th>
				<th>직급</th>
				<th>이메일</th>
				<th>전화번호</th>
			</tr>
			<c:forEach var="member" items="${list}">
			<tr>
				<td>${member.memberNo}</td>
				<td>${member.name}</td>
				<td>${member.depart}</td>
				<td>${member.position}</td>
				<td>${member.email}</td>
				<td>${member.phoneNum}</td>
				<td>
					<a href="read.do?memberNo=${member.memberNo}">
						<button>조회</button>
					</a>
				</td>
			</tr>
			</c:forEach>
		</table>
	</body>
</html>