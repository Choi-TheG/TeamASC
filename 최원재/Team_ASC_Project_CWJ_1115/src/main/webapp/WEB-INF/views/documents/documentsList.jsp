<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>프로세스 문서관리</title>
<style>
.filebox input[type="file"] {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip:rect(0,0,0,0);
	border: 0;
}

.filebox label {
	display: inline-block;
	padding: .5em .75em;
	color: #999;
	font-size: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #fdfdfd;
	cursor: pointer;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
}

/* named upload */
.filebox .upload-name {
	display: inline-block;
	padding: .5em .75em;  /* label의 패딩값과 일치 */
	font-size: inherit;
	font-family: inherit;
	line-height: normal;
	vertical-align: middle;
	background-color: #f5f5f5;
	border: 1px solid #ebebeb;
	border-bottom-color: #e2e2e2;
	border-radius: .25em;
	-webkit-appearance: none; /* 네이티브 외형 감추기 */
	-moz-appearance: none;
	appearance: none;
}
</style>
</head>
<body>
<form action="upload" method="post" enctype="multipart/form-data">
<table>
<tr>
	<th>
		문서명
	</th>
	<th>
		파일
	</th>
	<th>
		업로드일자
	</th>
	<th>
		작성자
	</th>
</tr>
<c:forEach var="documents" items="${list}" varStatus="index">
<tr><td hidden="hidden">${documents.documentsSeq}</td>
<td hidden="hidden">${documents.projectSeq}</td></tr>
<tr>
	<td>
		<input type="text" name="documentsName" value="${documents.documentsName}" readonly="readonly">
	</td>
	<td>
		<c:if test="${fileName ne null}">
			<a href="asc/documents/fileDownload?fileName=${documents.fileName}&realFileName=${documents.realFileName}">
			</a> 
		</c:if>
		<div class="filebox">
			<input class="upload-name" value="업로드 파일명" disabled="disabled">
			<label for="ex_file">업로드</label>
	  		<input type="file" id="uploadFile" name="uploadFile">
		</div>
	</td>
	<td>
		${documents.updateTime}
	</td>
	<td>
		${documents.writer}
	</td>
</tr>
</c:forEach>
<!-- DB설계서, 요구사항정의서 -->
<%-- <c:choose></c:choose> --%>
<!-- 버튼 누르면 행 추가 -->
<tr><td colspan="4">+ 추가</td></tr>
</table>
</form>
<script>
$(document).ready(function(){
	var fileTarget = $('.filebox .upload-hidden');
	
	fileTarget.on('change', function(){  // 값이 변경되면
		if(window.FileReader){  // modern browser
		  var filename = $(this)[0].files[0].name;
		} 
		else {  // old IE
		  var filename = $(this).val().split('/').pop().split('\\').pop();  // 파일명만 추출
		}
		
		// 추출한 파일명 삽입
		$(this).siblings('.upload-name').val(filename);
  });
}); 
</script>
</body>
</html>