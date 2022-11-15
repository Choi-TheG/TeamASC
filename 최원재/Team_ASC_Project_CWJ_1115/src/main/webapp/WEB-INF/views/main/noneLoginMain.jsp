<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath"  value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
<!--       <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"> -->
      <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
      <title>비로그인 메인</title>
      <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">
   </head>
   <body>
      <div class="newB" style="float: left; bottom: 200px; position: absolute; left: 200px;">
         <a class="a-font" href="${contextPath}/user/viewLoginBeforeProject" style="position:relative; left:200px; bottom:100px;"><button type="button" class="btn btn-primary" style="bottom: 50px;">프로젝트 생성</button></a>
      </div>
      <div style="float: center; width: 80%; margin-left: auto; margin-right: auto; display: block;">
         <img src="${contextPath}/resources/images/projectManage.png" width="100%" height="700">
      </div>
   </body>
</html>