<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창</title>
</head>
<body>
<form action="join.do" method="post">
<table align="center">
	<tr>
		<th colspan="3">
			회원가입
		</th>
	</tr>
	<tr>
		<td>
			아이디
		</td>
		<td>
			<input type="text" placeholder="ID" name="id">
		</td>
		<td>
			<input type="button" value="ID check" onclick="">
		</td>
	</tr>
	<tr>
		<td>
			비밀번호
		</td>
		<td>
			<input type="password" placeholder="password" name="pwd">
		</td>
	</tr>
	<tr>
		<td>
			이름
		</td>
		<td>
			<input type="text" placeholder="name" name="name">
		</td>
	</tr>
	<tr>
		<td>
			이메일
		</td>
		<td>
			<input type="text" placeholder="e-mail" name="email">@
		</td>
		<td>
			<label for="email"></label>
			<select id="email" name="email" >
				<option value="">이메일을 선택하세요</option>
				<option value="naver">naver.com</option>
				<option value="daum">daum.net</option>
				<option value="google">gmail.com</option>
			</select>
		</td>
		<td>
			<input type="button" value="이메일 인증" onclick="">
		</td>
	</tr>
	<c:if>
		<tr>
			<td>
				인증번호
			</td>
			<td>
				<input type="text" placeholder="인증번호를 입력하세요">
			</td>
			<td>
				<input type="button" value="인증번호 확인" onclick="">
			</td>
		</tr>
	</c:if>
	<tr>
		<td>
			일단 공란
		</td>
		<td>
			<input type="text" placeholder="숫자만 입력" name="phoneNum">
		</td>
	</tr>
	<tr>
		<th colspan="3">
			<input type="submit" value="회원가입 하기">
		</th>
	</tr>
</table>
</form>
</body>
</html>