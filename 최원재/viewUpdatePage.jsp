<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>view update page</title>
</head>
<body>
<form action="update.do" method="post">
<table border="1">
<tr>
	<td>사번 :</td><td colspan="3"><input type="text" value="${member.memberNo}" readonly="readonly"></td>
	<td>부서 :</td><td><input type="text" value="${member.depart}"></td>
</tr>
<tr>
	<td>이름 :</td><td><input type="text" value="${member.name}"></td>
	<td>비밀번호 : </td><td><input type="text" value="${member.pwd}"></td>
	<td>직책 :</td><td><input type="text" value="${member.position}"></td>
</tr>
<tr>
	<td>생년월일 :</td><td><input type="text" value="${member.birthDate}"></td>
	<td>전화번호 :</td><td><input type="text" value="${phoneNum}"></td>
	<td>입사년도 :</td><td><input type="text" value="${joinDate}"></td>
	<td>이메일 :</td><td><input type="text" value="${email}"></td>	
</tr>
<tr>
	<td>
		<input type="submit" value="수정하기">
	</td>
	<td>
		<input type="button" value="뒤로가기" onclick="javascript:history.back();">
	</td>
</tr>
</table>
</form>
</body>
</html>