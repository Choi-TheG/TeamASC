<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 탈퇴 비밀번호 확인</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
		<link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
		<title>Bootstrap Example</title>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
			/* 모두 감싸는 wrap */
			#uPwdWrap {
				width: 50%;
				height: 100%;
				margin-left: 150px;
				margin-right: 300px;
				/* border: 5px solid red; */
			}
		
			/* 비밀번호 확인 경고문 */
			.alert {
				width: 670px;
				height: 60px;
			}
			
			.danger1 {
				margin-top: 70px;
			}
			
			.danger2 {
				margin-top: 10px;
			}
			
			/* 비밀번호 확인 form */
			.form {
				width: 350px;
				height: 60px;
				border: 0.5px solid lightgray;
				border-radius: 6px;
				outline: none;
				padding-left: 10px;
				color: #384D59;
			}
			
			/* 탈퇴 버튼 */
			.mpBtn {
				height: 50px;
				border: none;
				border-radius: 10px;
				color: white;
				background-color: #0F2859;
				padding: 0 15px;
				margin-left: 250px;
				margin-top: 30px;
			}
			
			.col-md-6 {
				margin-left: 130px;
				margin-top: 100px;
			}
		</style>
		<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			console.log('ready');
					
		$('#removeUserForm').keyup('keypress', function() { // submit 버튼 클릭 시 발동, 비밀번호가 일치해야 탈퇴 가능
			let pwd1 = $("#removePwd1").val();
			let pwd2 = $("#removePwd2").val();
						
			if(pwd1 != pwd1 || pwd2 != "") {
				if(pwd1 == pwd2) {
					$("#pwdText").html('옳은 비밀번호입니다.');
					$("#pwdText").attr('color', 'green');
				} else {
					$("#pwdText").html('틀린 비밀번호입니다.');
					$("#pwdText").attr('color', 'red');
				} 
			}
						
		}); // removeUserForm end
					
	}); // document end
	</script>
	</head>
		<body>
		<div id="uPwdWrap">
			<svg xmlns="http://www.w3.org/2000/svg" style="display: none;">
				<symbol id="exclamation-triangle-fill" viewBox="0 0 16 16">
		        	<path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"></path>
		      	</symbol>
	    	</svg>
			<div class="alert alert-danger d-flex align-items-center danger1" role="alert">
	  			<svg class="bi flex-shrink-0 me-2" role="img" aria-label="Danger:">
	  			<use xlink:href="#exclamation-triangle-fill"/></svg>
	 		 	<div>
	   			 	개인정보 보호를 위해 비밀번호를 입력해주세요.
	  			</div>
	  		</div>
	  		<div class="alert alert-danger d-flex align-items-center danger2" role="alert">
	  			<svg class="bi flex-shrink-0 me-2" role="img" aria-label="Danger:">
	  			<use xlink:href="#exclamation-triangle-fill"/></svg>
	  			<div>
	   			 	탈퇴 시 회원님의 정보는 자동으로 삭제되지 않습니다.
	  			</div>
	  		</div>
			<form action="./removePwdCheck" method="POST" id="removeUserForm">
			<input type="hidden" name="pwd1" value="${member.pwd}" id="removePwd1">
				<div>
					<div class="col-md-6">
						<input type="hidden" name="id" value="${member.id}">
						<input type="password" name="pwd" value="" id="removePwd2" placeholder="password" class="form">
						<br /><br />
						<font id="pwdText"></font>
					</div>
					<div>
						<input type="submit" value="탈퇴하기" class="mpBtn">
					</div>
				</div>
			</form>
		</div>
	</body>
</html>