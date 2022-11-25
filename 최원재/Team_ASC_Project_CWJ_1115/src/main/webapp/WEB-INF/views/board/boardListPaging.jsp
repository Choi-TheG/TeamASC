<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 
<style type="text/css"> 
	.board-main {
		width:68%;
		position:relative;
		left:18%;
		float:center;
		top:5%;
	}
	.table {
		width:850px;
		border-collapse: collapse;	
		table-layout: fixed;
	}
	th {
		border-bottom: 2px solid gray;
		height:30px;
		font-size: 20px;
	}
	td {
		height:40px;
		border-bottom: 1px solid gray;
		line-height: 40px;
		border-right: 1px solid gray;
	}
	.div-center {
		display:block;
		margin-left:auto;
		margin-right:auto;
		text-align: center;
	}
	.write-board {
		text-align: left;
		float: left;
	}
	.button {
		color:white;
		background-color: #384D59;
		border:0;
		padding: 5px;
		border-radius:5px;
		font-weight: bold;
	}
		
	a {
		text-decoration: none;
		color:black;
	}
	.button-write {
		color:white;
		background-color: #384D59;
		border:0;
		padding: 5px 10px;
		border-radius:5px;
		font-weight: bold;
		float:center; 	
	}
	
	#sm5{
		background-color:#0F2859;
		border-radius: 5px;
		color:white;
		opacity:1.0;
		font-weight: bold;
	}

	.search-option {
		position:relative;
		left:200px;
	}
	.search-button {
		padding: 6px 10px;
		margin-left: 30px;
	}
	.search-content-select {
		text-align:center;
		width: 120px;
		height: 30px;
		margin-right: 5px;
	}
	.search-content-text {
		width: 150px;
		height: 23px;
	}
	.page-option {
		position:relative;
		text-align: center;
	}
	.table-short {
		width: 12%;
		text-align: center;
	}
	.table-title {
		display: block;
		overflow:hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		vertical-align: middle;
		padding-left: 15px;
		padding-right: 15px;
	}

}
</style>
<title>Insert title here</title>
</head>
<body class="board-body">
<div class="board-main">
<input type="hidden" name="projectSeq" value="${project.projectSeq }">

<table class="table">
	<tr>
		<th class="table-short">분류</th><th style="text-align: center">제목</th><th class="table-short">작성자</th><th class="table-short">작성일자</th><th class="table-short">완료여부</th>
	</tr>
<c:forEach var="board" items="${pagingList}" begin="0" step="1" >
	<tr>
		<td class="table-short">${board.boardCategory}</td>
		<td class="table-title"><a href="../board/readBoard?boardSeq=${board.boardSeq}">${board.boardTitle}</a></td>
		<td class="table-short">${board.id}</td>
		<td class="table-short">${board.createDate}</td>
		<c:choose>
			<c:when test="${board.completeYn eq 'N' }"><td class="table-short">진행중</td></c:when>
			<c:otherwise><td class="table-short table-end">완료</td></c:otherwise>
		</c:choose>
	</tr>
</c:forEach>
		
</table>
</br>
<a class="button-write" href="../board/viewWriteBoard">글쓰기</a>
</br>

<form action="#" method="GET">
<div>
<input type="hidden" name="projectSeq" value="${project.projectSeq }">
<div class="search-option">
	<select  class="search-content-select" type="button" data-bs-toggle="dropdown" aria-expanded="false" name="boardCategory">
		<option value="">-- 분류 --</option>
		<option value="">전체</option>
		<option value="에러">에러</option>
		<option value="논의">논의</option>
	</select>
	
	<select class="search-content-select" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false" name="completeYn">
		<option value="">-- 완료여부 --</option>
		<option value="">전체</option>
		<option value="N">진행중</option>
		<option value="Y">완료</option>
	</select>

	<input class="search-content-text" type="text" name="keyword">
	
	<input class="button search-button" type="button" value="검색" onclick="return submit1(this.form);">
	
</div>	

</div>
</br>
<div class="page-option">
	 <c:forEach var="num" items="${pageRange}" varStatus="status"> 
	 	<a href="#" onclick="page(${status.count})" name="pageNum">${status.count}</a>
	 </c:forEach> 
</div>
</form>
</div>



</body>


<script type="text/javascript">

	function page(currentPage){
		location.href = "../board/boardListPaging?projectSeq="+${project.projectSeq }+"&pageNum=" + currentPage;
	}
	function submit1(frm) {
		frm.action="./boardSearchListPaging?projectSeq="+${project.projectSeq };
		frm.method="GET";
		frm.submit();
		return true;
	}
	
</script>
</html>