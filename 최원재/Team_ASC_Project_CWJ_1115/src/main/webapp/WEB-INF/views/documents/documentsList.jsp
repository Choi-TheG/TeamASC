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
a{text-decoration:none;color:#000;}
table{
	width: 100%;
	
}

th{
	text-align: center;
	border-bottom: 1px solid #c2c2c2;
	font-size: 20px;
}

tr:hover{ background-color:#f5f5f5; }

input[type=text]{
	border: 0px;
	width: 98%;
	height: 30px;
	font-size: 20px;
	display: center;
}

input[type=button]{
	color: white;
    background-color: #384D59;
    border: 0;
    padding: 5px;
    border-radius: 5px;
    font-weight: bold;
    margin-right: 5px;
}

.documentsSide{
	width:100%;
	height: 25px;
	color: white;
    background-color: #384D59;
    border: 0;
    padding: 5px;
    border-radius: 5px;
    font-weight: bold;
    margin-right: 5px;
}

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

#documentsName{
	text-align: center;
}

#createButton{
	width: 100%;
	height: 25px;
	border: 1px solid #c2c2c2;
	border-radius: 5px;
	background-color: #fff;
	color: #000;
	text-align: center;
	font-size: 14px;
}
#createButton:hover{
	border-radius: 5px;
	background-color: #f5f5f5;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<body>
<form action="#" method="post" enctype="multipart/form-data">
<table id="topmenu">
<tr>
	<th width="30%">
		문서명
	</th>
	<th width="35%">
		파일
	</th>
	<th width="15%">
		업로드일자
	</th>
	<th>
		작성자
	</th>
	<th style="width:8%;border-bottom:none;background-color:none;">
		
	</th>
</tr>
<c:forEach var="documents" items="${list}" varStatus="index">
<tr><td hidden="hidden"><input type="text" value="${documents.documentsSeq}" name="documentsSeq"></td>
<td hidden="hidden"><input type="text" value="${documents.projectSeq}" name="projectSeq"></td></tr>
<tr>
	<td>
		<input type="text" value="${documents.documentsName}" name="documentsName" id="documentsName">
	</td>
	<td>
		<div class="filebox">
			<input class="upload-name" value="업로드 파일" style="width:70%;" disabled="disabled">
			<label for="ex_filename">업로드</label> 
			<input type="file" id="ex_filename" class="upload-hidden" name="uploadFile">
		</div>
	</td>
	<td>
		<input type="text" value="${documents.updateTime}" name="updateTime" readonly="readonly">
	</td>
	<td>
		<input type="text" value="${documents.writer}" name="writer" readonly="readonly">
	</td>
	<td>
		<a href="/updateDocuments?documentsSeq=${documents.documentsSeq}"><button class="documentsSide">수정</button></a>
		<input type="button" name="download" value="다운로드" class="documentsSide" style="margin-top:2px;">
	</td>
</tr>
</c:forEach>
</table>
</form>
<!-- 버튼 누르면 행 추가 -->
<input type="button" value="+ 추가" onclick='return addRow();' id="createButton">
<script>
$(document).ready(function(){
	var fileTarget = $('.filebox .upload-hidden');
	
	  fileTarget.on('change', function(){
	      if(window.FileReader){
	          var filename = $(this)[0].files[0].name;
	      } else {
	          var filename = $(this).val().split('/').pop().split('\\').pop();
	      }
	
	      $(this).siblings('.upload-name').val(filename);
	  });
});

function addRow(){
	// table id 찾기
	const table = document.getElementById('topmenu');
	
	// 행 추가
	const newRow = table.insertRow();
	
	// 값 가져오기(컨트롤러 연결) : rest ?
	
	
	// Cell 추가 (name= not null)
	const newCellName = newRow.insertCell(0);
	newCellName.innerHTML = '<input type="text" value="${documents.documentsName}" name="documentsName" id="documentsName" placeholder="문서명"/>';
	const newCellFile = newRow.insertCell(1);
	newCellFile.innerHTML = '<div class="filebox"><input class="upload-name" value="업로드 파일" style="width:70%;" disabled="disabled"><label for="ex_filename">업로드</label><input type="file" id="ex_filename" class="upload-hidden" name="uploadFile"></div>';
	const newCellUpdateTime = newRow.insertCell(2);
	newCellUpdateTime.innerHTML = '<input type="text" value="${documents.updateTime}" name="updateTime" readonly="readonly">';
	const newCellWriter = newRow.insertCell(3);
	newCellWriter.innerHTML = '<input type="text" value="${documents.writer}" name="writer" readonly="readonly">';
	const newCellUpDown = newRow.insertCell(4);
	newCellUpDown.innerHTML = '<a href="/updateDocuments?documentsSeq=${documents.documentsSeq}"><button class="documentsSide">수정</button></a><input type="button" name="download" value="다운로드" class="documentsSide" style="margin-top:2px;">';
	
}
</script>
</body>
</html>