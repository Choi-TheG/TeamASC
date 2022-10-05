<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>read</title>
</head>
<body>
<form action="update.do" method="post">
<table border="1">
<tr>
	<td>사번 :</td><td colspan="3"><input type="text" value="${member.memberNo}" readonly="readonly"></td>
	<td>부서 :</td><td><input type="text" value="${member.depart}" readonly="readonly"></td>
</tr>
<tr>
	<td>이름 :</td><td><input type="text" value="${member.name}" readonly="readonly"></td>
	<td>비밀번호 : </td><td><input type="password" value="${member.pwd}" readonly="readonly"></td>
	<td>직책 :</td><td><input type="text" value="${member.position}" readonly="readonly"></td>
</tr>
<tr>
	<td>생년월일 :</td><td><input type="text" value="${member.birthDate}" readonly="readonly"></td>
	<td>전화번호 :</td><td><input type="text" value="${phoneNum}" readonly="readonly"></td>
	<td>입사년도 :</td><td><input type="text" value="${joinDate}" readonly="readonly"></td>
	<td>이메일 :</td><td><input type="text" value="${email}" readonly="readonly"></td>
</tr>
<tr>
	<td>
		<input type="submit" value="수정하기">
	</td>
	<td>
		<input type="button" value="뒤로가기" onclick="javascript:history.back();">
	</td>
	<td>
		<a href="delete.do?memberNo=${member.memberNo}"><button>삭제하기</button></a>
	</td>
</tr>
</table>
</form>

</body>
</html>