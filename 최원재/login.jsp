<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인창</title>
</head>
<body>
<form action="login.do" method="post">
	<table align="center">
	<tr>
		<th colspan="2">
			Login
		</th>
	</tr>
	<tr>
		<td>
			ID
		</td>
		<td>
			<input type="text" placeholder="ID" name="id">
		</td>
	</tr>
	<tr>
		<td>
			PW
		</td>
		<td>
			<input type="password" placeholder="password" name="pwd">
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="login">
		</th>
	</tr>
	</table>
</form>
</body>
</html>