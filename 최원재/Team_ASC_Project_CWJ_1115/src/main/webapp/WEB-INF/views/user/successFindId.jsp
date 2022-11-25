<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
	.board-main {
		width:40%;
		height:50%;
		float:center;
		display:block;
		margin-left:15%;
		margin-top:4.5%;
		text-align: center;
	}
	.button {
		color:white;
		padding: 7px 20px;
		font-weight: bold;
	}
	.login-button {
		padding:10px 23%;
		margin-top:30px;
		font-size: 20px;
		background-color: #384D59;
		border-radius:5px;
		font-size: 15px;
	}
	.search-button {
		background-color:white;
		margin-top: 10px;
		border:none;
		border-bottom: 1px solid #384D59;
		color:#384D59;
		font-weight: bold;
		font-size:13px;
	}
	.input-box{
	  position:relative;
	  margin:10px 0px;
	}
	.input-box > input{
	  background:transparent;
	  border:none;
	  border-bottom: solid 1px #ccc;
	  padding:20px 0px 5px 0px;
	  font-size:14pt;
	  width:100%;
	}
	input::placeholder{
		color:transparent;
	}
	input:placeholder-shown + label{
	  color:#aaa;
	  font-size:14pt;
	  top:15px;
	}
	input:focus + label, label{
	  color:#8aa1a1;
	  font-size:10pt;
	  pointer-events: none;
	  position: absolute;
	  left:0px;
	  top:0px;
	  transition: all 0.2s ease ;
	  -webkit-transition: all 0.2s ease;
	  -moz-transition: all 0.2s ease;
	  -o-transition: all 0.2s ease;
	}
	input:focus, input:not(:placeholder-shown){
	  border-bottom: solid 1px #8aa1a1;
	  outline:none;
	}
</style>
<title>Insert title here</title>
</head>
<body>
<div class="board-main">

<div class="input-box">
<form action="viewLogin" method="GET" id="findInfoIdForm"> 
    <div style="font-size:20px;">입력해주신 정보와 일치하는 아이디는 아래와 같습니다.</div>
    <div style="font-size:80px;">${id }</div>
    </br>
    <input class="button login-button" type="submit" value="로그인" id="findIdBtn"></br>
	<a href="viewFindInfoPwd"><input class="button search-button" type="button" value="비밀번호 찾기"></a>
</form>
</div>
</div>

</body>
</html>