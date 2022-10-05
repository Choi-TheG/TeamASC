<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>사원 등룩</title>
	</head>
	<body>
		<form action="join.do" method="post">
			사원번호: <input type="text" name="memberNo" value=""><br/>
			이름 : <input type="text" name="name" value=""><br/>
			비밀번호 : <input type="password" name="pwd" value=""><br/>
			부서 : <input type="text" name="depart" value=""><br/>
			직급 : <input type="text" name="position" value=""><br/>
			입사년도 : <input type="text" name="joinDate" value=""><br/>
			생년월일 : <input type="text" name="birthDate" value=""><br/>
			전화번호 : <input type="text" name="phoneNum" value=""><br/>
			이메일 : <input type="text" name="email" value=""><br/>
			<input type="submit" value="등록">
		</form>
	</body>
</html>