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
    <title>인증번호 입력</title>
    <style>
         #aaa{
        display: inline-block;  
     width: 1530px;
    height: 740px;
    margin: -10px;
    position: relative;
 
   background-size: cover;

    }

    #c{
        font-size: 4em;
        text-align: center;
       margin-top: 30px;
        font-family: 'Black Han Sans', sans-serif;
        
    }
    #a3{
        text-decoration: none;
    }
    section{
        margin-top: 40px;
        text-align: center;
        font-size: 1.7em;
        font-family: 'Noto Sans KR', sans-serif; 
        color: rgb(55, 58, 54);
    }

    .press{
        width: 300px;
        height: 40px;
        border-radius: 10px;
    }

    .bu{
        background-color: rgb(55, 58, 54);
        color: rgb(234, 170, 0);
        width: 90px;
       height: 40px;
       margin-top: 20px;
       font-size: 25px;
       border-radius: 10px;
    }

    </style>
</head>
<body>
<script>
alert("이메일이 발송되었습니다. 인증번호 6자리를 입력해주세요.");
</script>
<div id="aaa" style="background-color: rgb(234, 170, 0);">
        <a href="${root }" id="a3"><nav style="color: rgb(55, 58, 54);" id="c">혹성<br>탈출</nav></a>

    <section>
        <h3 id="fontc">인증번호 입력</h3>
        <p id="fontc">숫자 6자리를 입력해주세요.</p>
        <form action="mailconfig" method="post">
		<input type="text" name="press" class="press">
		<input type="hidden" name="dice" value="${dice }">
		<input type="hidden" name="email" value="${requestScope.email}">
		<br>
		<input type="submit" value="확인" class="bu" style="color: rgb(234, 170, 0);" id="fontc">
		</form>
    </section>
</div>
</body>
</html>