<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Project Manager</title>
<style>
table {
   width: 90%;
   border: 1px solid #bcbcbc;
}
input {
   width : 120px;
}
td{
   border: 0px solid black;
   margin-bottom: 5px;
}
tr{
   height: 60px;
}
#sm1{
   background-color:#0F2859;
   border-radius: 5px;
   color:white;
   opacity:1.0;
   font-weight: bold;
}
.manageProject-man{
   width:100%;
   position:relative;
   left:20px;
   display:block;
   margin-left:auto;
   margin-right:auto;
}
.tableName{
   text-align: center;
   width: 20%;
   border: 5px;
   font-size: 18px;
   font-weight: bold;
}
input[type=date]{
   width: 100%;
   height: 40px;
   border-radius: 5px;
   font-size: 16px;
   border-color: #e0e0e0;
   text-align:center;
   margin:0px;
}
input[type=text]{
   width: 99%;
   height: 40px;
   border-radius: 5px;
   font-size: 16px;
   border-color: #e0e0e0;
}
input[type=text]:hover{
   background-color: #e0e0e0;
}
input[type=submit]{
   color: white;
    background-color: #384D59;
    border: 0;
    padding: 5px;
    border-radius: 5px;
    font-weight: bold;
}
button{
   color: white;
    background-color: #384D59;
    border: 0;
    padding: 5px;
    border-radius: 5px;
    font-weight: bold;
}
#projectNameChange, #dateChange{
   width: 70%; 
   height: 40px; 
   border: 0px;
   border-radius: 5px; 
   font-size: 16px; 
   font-weight: bold; 
   text-align: center;
   color: white;
   background-color: #384D59;
}

.btnClick{
   width: 100px; 
   height: 40px; 
   border: 0px;
   border-radius: 5px; 
   font-size: 16px; 
   font-weight: bold; 
   text-align: center;
   color: white;
   background-color: #384D59;
}
#startDate{
	float:left;
	width:48.5%;
	margin-right:3px;
}
#endDate{
	float:right;
	width:48.5%;
	margin-left:3px;
}
.processNav>ul {
	list-style: none;
	display: inline-block;
	width: 95%;
	height: 100px;
	text-align: center;
}
.processNav>ul>li {
	float: left;
}
.processNav>ul>li>a {
	border: 2px solid white;
	background-color: #F1F3F5;
	color: #384D59;
	text-decoration: none;
	font-size: 20px;
	display: block;
	width: 130px;
	padding: 30px 30px;
}
.processNav>ul>li>a:hover {
	border: 5px solid #0F2859;
	background-color: white;
	color: #384D59;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	display: block;
	width: 130px;
	padding: 30px 30px;
}
.processNav .li1>a {
	border: 5px solid #0F2859;
	background-color: white;
	color: #384D59;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
	display: block;
	width: 130px;
	padding: 30px 30px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


$(document).ready(function(){
   let teamLeaderSeq = document.getElementById("teamLeaderSeq").value;
   let userSeq = document.getElementById("userSeq").value;
   let OGstart = document.getElementById("startDate").value;
   let OGend = document.getElementById("endDate").value;
   if(teamLeaderSeq === userSeq){
       document.getElementById("projectName").readOnly=false;
       document.getElementById("startDate").readOnly=false;
       document.getElementById("endDate").readOnly=false;
   }
   
   let oldProjectName = document.getElementById("projectName").value;
   let thisProjectSeq = document.getElementById("projectSeq").value;
   let checkProjectName = false;
   $("#dateChange").on("click",function(){
	   start = document.getElementById("startDate").value;
       end = document.getElementById("endDate").value;
	   $.ajax({
           type : "get",
           url : "modifyProjectDate",
           dataType : "text",
           data : {startDate:start,endDate:end,projectSeq:thisProjectSeq},
           success : function(data,status){
           let jsonBoolean = JSON.parse(data);
           	  if(jsonBoolean){
           	      alert("???????????? ?????? ??????");
           	   	  OGstart = document.getElementById("startDate").value;
           	      OGend = document.getElementById("endDate").value;
           	  }
           },
           error : function(data,status){
              console.log("error");
           },
           complete : function(data,status){
              console.log("finish");
           }
        }); // ????????? ajax end 
   });
   $("#projectNameChange").on("click",function(){

      let newProjectName = document.getElementById("projectName").value;
      if(oldProjectName == newProjectName){
         alert("????????? ??????????????? ?????????");
         return false;
      } else if (newProjectName == ""){
         alert("?????????????????? ????????? ?????????");
         document.getElementById("projectName").value = oldProjectName;
         return false;
      } else {
         let modifyPossible = false;
         $.ajax({
            type : "get",
            url : "checkProjectName",
            dataType : "text",
            data : {projectName:newProjectName},
            success : function(data,status){
            
            let jsonBoolean = JSON.parse(data);
               if(!jsonBoolean){
                  alert("?????? ???????????? ??????????????? ?????????");
                  document.getElementById("projectName").value = oldProjectName;
                  return false;
               } else{
                  if(confirm('?????????????????????????') == true){
                     $.ajax({
                        type : "get",
                        url : "modifyProjectName",
                        dataType : "text",
                        data : {projectName:newProjectName,projectSeq:thisProjectSeq},
                        success : function(data,status){
                        let jsonBoolean = JSON.parse(data);
                           if(jsonBoolean){
                              alert("?????? ??????");
                              oldProjectName = newProjectName;
                              location.reload();
                           } else{
                              alert("?????? ??????");
                              document.getElementById("projectName").value = oldProjectName;
                           }
                        },
                        error : function(data,status){
                           console.log("error");
                        },
                        complete : function(data,status){
                           console.log("finish");
                        }
                     }); // ????????? ajax end
                  } else{
                     document.getElementById("projectName").value = oldProjectName;
                  }
                  
               }
            },
            error : function(data,status){
               console.log("error");
            },
            complete : function(data,status){
               console.log("finish");
            }
         }); // ????????? ajax end 
      }
   });
   
   $("#btnModify").on("click",function(){
      
      let message = confirm('???????????? ?????? ?????????????????? ?');
      
      if(message){
         this.form.action="/asc/project/modifyProjectName2";
         this.form.method="GET";
         this.form.submit();
         return true;
      } else{
         return false;
      }
   });
   
   $("#btnStop").on("click",function(){
      
      let message = confirm('????????? ??????????????? ???????????????????????? ?');
      
      if(message){
         this.form.action="/asc/project/deleteProject";
         this.form.method="GET";
         this.form.submit();
         return true;
      } else{
         return false;
      }
   });
   
   $("#startDate").on("change",function(){
       start = document.getElementById("startDate").value;
       end = document.getElementById("endDate").value;

       if(start != "" && end != "" && start > end){
    	alert("???????????? ????????? ???????????? ??????????????????");
    	document.getElementById("startDate").value = OGstart;
       	document.getElementById("endDate").value = OGend;
       }
    });
    
    $("#endDate").on("change",function(){
   	start = document.getElementById("startDate").value;
       end = document.getElementById("endDate").value;
       
       if(start != "" && end != "" && start > end){
          alert("???????????? ????????? ???????????? ??????????????????");
          document.getElementById("startDate").value = OGstart;
          document.getElementById("endDate").value = OGend;
       }
    });
});
</script>
</head>
<body>
<nav class="processNav">
	<ul>
		<li class="li1"><a href="../project/manageProject">????????????</a></li>
		<li><a href="../documents/readDocuments">?????? ??????</a></li>
		<li><a href="../function/manageFunction">??????</a></li>
		<li><a href="../wbs/manageWbs">??????</a></li>
		<li><a href="../implementation/viewImplementation">??????</a></li>
		<li><a href="../test/manageTest">?????????</a></li>
		<li><a href="../project/viewComplete">??????</a></li>
	</ul>
</nav>
<div class="manageProject-man">
<form action="/asc/project/modifyProjectName2" method="get">
<input type="hidden" name="projectSeq" value="${project.projectSeq}" id="projectSeq">
<input type="hidden" name="teamId" value="${project.teamId}">
<input type="hidden" name="memberSeq" value="${member.userSeq}" id="userSeq">
<input type="hidden" name="teamLeaderSeq" value="${project.teamLeaderSeq}" id="teamLeaderSeq">
<table>
   <tr>
      <th colspan="3" align="center"><h1>???????????? ??????</h1></th>
   </tr>
   <tr>
      <td class="tableName">
         ???????????????
      </td>
      <td>
         <input type="text" value="${project.projectName}" id="projectName" readOnly name="projectName">
      </td>
      <c:if test="${project.teamLeaderSeq eq member.userSeq && project.finishYn ne 'S'}">
         <td class="tableName">
            <input type="button" value="??????" id="projectNameChange">
         </td>
      </c:if>
   </tr>
   <tr>
      <td class="tableName">
         ????????????
      </td>
      <td>
         <input type="text" value="${project.finishYn eq 'Y' ? '??????' : (project.finishYn eq 'N' ? '??????' : '??????')}" readOnly="true">
      </td>
   </tr>
   <tr>
      <td class="tableName">
         ?????????
      </td>
      <td>
         <input type="text" value="${project.percentage}%" readOnly="true">
      </td>
   </tr>
   <tr>
      <td class="tableName">
         ???????????? ??????
      </td>
      <td class="dateTd">
         <div><input id="startDate" type="date" value="${fn:substring(project.startDate,0,4)}-${fn:substring(project.startDate,4,6)}-${fn:substring(project.startDate,6,8)}" readonly></div>
         <div><input id="endDate" type="date" value="${fn:substring(project.endDate,0,4)}-${fn:substring(project.endDate,4,6)}-${fn:substring(project.endDate,6,8)}" readonly></div>
      </td>
      <c:if test="${project.teamLeaderSeq eq member.userSeq && project.finishYn ne 'S'}">
         <td class="tableName">
            <input type="button" value="??????" id="dateChange">
         </td>
      </c:if>
   </tr>
   <tr><td></td>
      <td>
         <tr>
            <td></td>
            <td style="font-size:20px;font-weight:bold;">
               ?????? ??????
            </td>
            <th style="font-size:20px;text-align:center;">??????/??????</th>
         </tr>
         <c:forEach var="teamMember" items ="${list}">
            <tr><td></td>
               <td><input type="text" value="${teamMember.userName}" style="width:100%;" readOnly="true"></td>
               <c:choose>
                  <c:when test="${project.teamLeaderSeq eq teamMember.userSeq}">
                     <td style="text-align:center;font-size:18px;font-weight:bold;">??????</td>
                  </c:when>
                  <c:when test="${project.teamLeaderSeq eq member.userSeq && teamMember.userSeq ne member.userSeq}">
                     <td style="text-align:center;font-size:18px;font-weight:bold;"><a style="color:red;" href="deleteTeamMember?userSeq=${teamMember.userSeq}&teamId=${project.teamId}" onclick="return confirm('????????? ???????????????????????? ?');">??????</a></td>
                  </c:when>
                  <c:when test="${project.teamLeaderSeq ne member.userSeq}">
                     <td style="text-align:center;font-size:18px;font-weight:bold;">??????</td>
                  </c:when>
               </c:choose>
            </tr>
         </c:forEach>
         <c:choose>
            <c:when test="${project.teamLeaderSeq eq member.userSeq && project.finishYn ne 'S'}">
               <tr><td></td><td><button type="button" onclick="location.href='viewInviteProject'" style="width: 100%; height:40px;display:block;">????????????</button></td></tr>
            </c:when>
         </c:choose>
</table>
<c:if test="${project.finishYn ne 'S'}">
   <input type="button" value="??????" style="margin-top: 8px;margin-left: 5px;" id="btnStop" class="btnClick">
</c:if>
</form>
</div>
</body>



</html>