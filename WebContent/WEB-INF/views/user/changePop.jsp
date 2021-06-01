<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${root }resources/css/all.css">
<style>
body *{
	text-align:center;
}
    #phone{
        width: 300px;
        height: 30px;
        border-radius: 10px;
    }

    .bu{
    	position:absolute;
    	top:-20px;
    	right:15.5%;
        background-color: rgb(55, 58, 54);
        color: rgb(234, 170, 0);
        width: 70px;
       height: 35px;
       font-size: 20px;
       border-radius: 10px;
      margin-top: 20px;
    }
    #in{
    position:relative;
    } 
    #pw{
    height:30px;
    border-radius:5px;
    }   
</style>
</head>
<body>
<p id="fontc" style="font-size:20px;">회원님의 비밀번호를 입력하세요</p>
<form action="updateUser" method="post">
<div id="in">
<input type="password" name="user_pw" id="pw"> 
<button type="submit" id="fontc" class="bu" style="color: rgb(234, 170, 0);">확인</button>
</div>
</form>
</body>
</html>