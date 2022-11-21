<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update page</title>
</head>
<body>
<form action="./updatedocument?documentsSeq=${documents.documentsSeq}" method="post">
<div>
	<input type="text" value="${documents.documentsName }" placeholder="문서명">
</div>
<div>파일 업로드</div>
<div>
	<input type="submit" value="수정">
</div>
</form>
</body>
</html>