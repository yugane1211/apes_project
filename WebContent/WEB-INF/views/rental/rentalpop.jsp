<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>대여</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${root }resources/css/all.css">
<style>
    
 #ccc{
    display: inline-block;  
	width: 500px;
	height: 500px;
	margin: -10px;
	position: relative;
	background-size: cover;
 }

#a{text-align: center; font-size: 1.5em;    font-weight: bold; color: rgb(55, 58, 54); }

#b{ text-align: center; font-weight: bold;  font-family: 'Noto Sans KR', sans-serif; font-size: 1.2em; margin-top: 20px;  color: rgb(55, 58, 54);}
body{ text-align: center; color:rgb(55, 58, 54) ;}

[type=submit]{
    background-color: rgb(55, 58, 54);
    color: rgb(234, 170, 0);
    font-size: 1.1em; border-radius: 5px;
}

</style>

</head>
<body>
<div id="ccc" style="background-color: rgb(234, 170, 0);">

<p id="a">${renoff_name }(${renoff_num }) 대여소</p>
<form action="rental_proc" method="post">
<div>
<p id="b">보유한 이용권</p>
<c:forEach var="passType" items="${pass }">
<input type="radio" name="pass" value="${passType.pass_num},${passType.pass_time},${passType.pass_start}">&nbsp;${passType.pass_type }일권(${passType.pass_time}분)<br>
</c:forEach>
</div>
<div>
<p id="b">대여하실 수단을 선택하세요</p>
<c:if test="${bcount ne 0}">
<input type="radio" name="ride" value="bike">&nbsp;자전거 &nbsp;
</c:if>
<c:if test="${kcount ne 0 }">
<input type="radio" name="ride" value="kick">&nbsp;킥보드
</c:if>
<c:if test="${bcount eq 0 && kcount eq 0 }">
<p>현재 이 대여소에 자전거와 킥보드가 없습니다.</p>
</c:if>
</div>
<input type="hidden" name="renoff_num" value="${renoff_num }"/>
<c:if test="${bcount ne 0 || kcount ne 0 }">
<br>
<input type="submit" value="대여하기">
</c:if>

</form>
</div>

</body>
</html>