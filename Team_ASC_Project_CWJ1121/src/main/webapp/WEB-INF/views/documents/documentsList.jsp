<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문서 관리</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
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

button, input[type=button]{
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

#createBtn{
	width: 100%;
	margin: 0px;
	height: 25px;
	border: 1px solid #c2c2c2;
	border-radius: 5px;
	background-color: #fff;
	color: #000;
	text-align: center;
	font-size: 14px;
}
#createBtn:hover{
	border-radius: 5px;
	background-color: #f5f5f5;
}
</style>
</head>
<body>
<form action="#" method="POST" enctype="multipart/form-data" >
<table id="documentsTable">
	<tr><th width="30%">문서명</th><th width="35%">파일</th><th width="15%">업로드일자</th><th width="10%">작성자</th><th style="width:8%;border-bottom:none;background-color:none;">수정</th></tr>
	<c:forEach var="documents" items="${list}" varStatus="index">
		<tr><td hidden="hidden"><input type="text" value="${documents.documentsSeq}" name="documentsSeq"></td><td hidden="hidden"></td></tr>
		<tr>
			<td>
				<input type="text" value="${documents.documentsName}" name="documentsName" id="documentsName${documents.documentsSeq}" placeholder="문서명">
			</td>
			<td>
				<div class="filebox">
					<input class="upload-name" value="업로드 파일" style="width:70%;" disabled="disabled">
					<label for="ex_filename${documents.documentsSeq}">업로드</label> 
					<input type="file" id="ex_filename${documents.documentsSeq}" class="upload-hidden" name="uploadFile">
					<%-- <input type="file" name="uploadFile" id="file${documents.documentsSeq}"> --%>
				</div>
			</td>
			<td>
				<input type="text" value="${documents.updateTime}" name="updateTime" readonly="readonly">
			</td>
			<td>
				<input type="text" value="${documents.writer}" name="writer" id="writer${documents.documentsSeq}" readonly="readonly">
			</td>
			<td>
				<input type="button" onclick="updateBtn(${documents.documentsSeq});" value="수정" style="width:90%;margin-bottom:3px;">
				<br/>
				<c:choose>
				<c:when test="${documents.realFileName ne null}">
					<input type="button" value="다운로드" onclick="return ready(this.form);">
					<input type="button" value="삭제" onclick="deleteBtn(${documents.documentsSeq});">
				</c:when>
				<c:otherwise>
					<input type="button" value="삭제" onclick="deleteBtn(${documents.documentsSeq});" style="width:90%;">
				</c:otherwise>
				</c:choose>
			</td>
		</tr>
	</c:forEach>
</table>
</form>
<input type="button" onclick="location.href='createDocument.do'" value="+ 추가" id="createBtn">
<script>
// 배우고 수정할것
$(document).ready(function(){
	console.log('ready');
	/* const docSeq = document.getElementById("documentsSeq").value; */
	
	// 행 추가
	$('#createBtn2').on('click',function(){
		$.ajax({
			type : "get",
			url : "test.do",
			dataType : "text",
			success : function(data,status){
				console.log(data);
				let jsonObj = JSON.parse(data);
				let result = "<tr><td><input type=\"text\" value=\""+jsonObj.documentsName
				+"\" name=\"documentsName\" id=\"documentsName\" placeholder=\"문서명\"></td><td><div class=\"filebox\"><input class=\"upload-name\" value=\"업로드 파일\" style=\"width:70%;\" disabled=\"disabled\">"
				+"<label for=\"ex_filename\">업로드</label><input type=\"file\" id=\"ex_filename\" class=\"upload-hidden\" name=\"uploadFile\"></div></td>"
				+"<td><input type=\"text\" value=\""+jsonObj.updateTime+"\" name=\"updateTime\" readonly=\"readonly\"></td>"
				+"<td><input type=\"text\" value=\""+jsonObj.writer+"}\" name=\"writer\" readonly=\"readonly\"></td>"
				+"<td><input type=\"button\" value=\"수정\" onclick=\"location.href='viewUpdateDocument?documentsSeq=\""+jsonObj.documentsSeq+"\';\" style=\"width:90%;margin-bottom:3px;\"></br>"
				+"<input type=\"button\" value=\"삭제\" onclick=\"location.href='viewUpdateDocument?documentsSeq=\""+jsonObj.documentsSeq+"\';\" style=\"width:90%;\">"
				+"<input type=\"button\" value=\"다운로드\" onclick=\"return ready(this.form);\"></td>"
				
				location.reload();
			},
			error : function(data,status){
				
			},
			complete : function(data,status){
				
			}
		}); // ajax end
	}); // 행 추가 createBtn end
	
	/* // upload file
	$('#file'+docSeq).on('click',function(){
		$.ajax({
			type : "post",
			url : "uploadFile",
			enctype : "multipart/form-data",
			data : {uploadFile:uploadFile},
			contentType : false,
			processData : false,
			success : function(data,status){
				const jsonBoolean = JSON.parse(data);
				if(jsonBoolean){
					alert(uploadFile);
					location.reload();
				} else{
					alert('fail');
				}
			},
			error : function(data, status){
				
			},
			complete : function(data, status){
				
			}
		}); // ajax end
	}); // upload end */
}); // document end

function updateBtn(documentsSeq){
	const documentsName = document.getElementById("documentsName"+documentsSeq).value;
	const writer = document.getElementById("writer"+documentsSeq).value;
	const uploadFile = document.getElementById("ex_filename"+documentsSeq).value;
	
	$.ajax({
		type : "get",
		url : "updateDocument",
		dataType : "text",
		data : {documentsSeq:documentsSeq,documentsName:documentsName,writer:writer},
		success : function(data,status){
			const jsonBoolean = JSON.parse(data);
			if(jsonBoolean){
				/* alert(documentsSeq+', '+documentsName+', '+writer); */
				console.log('modify done.');
				location.reload();
			} else{
				console.log('fail');
			}
		},
		error : function(data,status){
			
		},
		complete : function(data,status){
			
		}
	}); // ajax end
	
	// upload file
	$('#file'+documentsSeq).on('click',function(){
		$.ajax({
			type : "post",
			url : "uploadFile",
			enctype : "multipart/form-data",
			data : {uploadFile:uploadFile},
			contentType : false,
			processData : false,
			success : function(data,status){
				const jsonBoolean = JSON.parse(data);
				if(jsonBoolean){
					alert(uploadFile);
					location.reload();
				} else{
					alert('fail');
				}
			},
			error : function(data, status){
				
			},
			complete : function(data, status){
				
			}
		}); // ajax end
	}); // upload end
}

function deleteBtn(documentsSeq){
	const check = confirm('ㄹㅇ삭제함?');
	if(check){
		location.href='deleteDocument?documentsSeq='+documentsSeq;
	}
	return check;
}

</script>
</body>
</html>