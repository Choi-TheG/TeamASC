<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	function goPage(type,frm){
		if(type==0){
			frm.action = "viewUpdatePage.do";
		} else if(type==1){
			frm.action = "delete.do";
		}
	}
</script>
<title>read</title>
</head>
<body>
<form action="#" method="post">
<table border="1">
<tr>
	<td>사번 :</td><td colspan="3"><input type="text" value="${member.memberNo}" readonly="readonly" name="memberNo"></td>
	<td>부서 :</td><td><input type="text" value="${member.depart}" readonly="readonly" name="depart"></td>
</tr>
<tr>
	<td>이름 :</td><td><input type="text" value="${member.name}" readonly="readonly" name="name"></td>
	<td>비밀번호 : </td><td><input type="password" value="${member.pwd}" readonly="readonly" name="pwd"></td>
	<td>직책 :</td><td><input type="text" value="${member.position}" readonly="readonly" name="position"></td>
</tr>
<tr>
	<td>생년월일 :</td><td><input type="text" value="${member.birthDate}" readonly="readonly" name="birthDate"></td>
	<td>전화번호 :</td><td><input type="text" value="${member.phoneNum}" readonly="readonly" name="phoneNum"></td>
	<td>입사년도 :</td><td><input type="text" value="${member.joinDate}" readonly="readonly" name="joinDate"></td>
	<td>이메일 :</td><td><input type="text" value="${member.email}" readonly="readonly" name="email"></td>
</tr>
<tr>
	<td>
		<input type="submit" value="수정하기" onclick="goPage(0,document.frm)">
	</td>
	<td>
		<input type="button" value="리스트로 가기" onclick="javascript:history.back();">
	</td>
	<td>
		<input type="submit" value="삭제하기" onclick="goPage(1,document.frm)">
		<a href="delete.do?memberNo=${member.memberNo}"><button>삭제하기</button></a>
	</td>
</tr>
</table>
</form>

</body>
</html>