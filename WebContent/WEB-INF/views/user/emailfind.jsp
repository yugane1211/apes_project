
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

       #aaa{
        display: inline-block;  
     width: 1530px;
    height: 410px;
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
        margin-top: 50px;
        text-align: center;
        font-size: 1.7em;
        font-family: 'Noto Sans KR', sans-serif; 
        color: rgb(55, 58, 54);
    }
    .bu{
        background-color: rgb(55, 58, 54);
        color: rgb(234, 170, 0);
        width: 270px;
       height: 33px;
       font-size: 20px;
       border-radius: 10px;
      margin-top: 20px;
    }
    </style>
</head>
<body>
<div id="aaa" style="background-color: rgb(234, 170, 0);">
        <a href="${root }" id="a3"><nav style="color: rgb(55, 58, 54);" id="c">혹성<br>탈출</nav></a>

<section>
<c:if test="${re==0}">
	<script>
		alert("아이디가 존재하지 않습니다. 회원가입을 해주세요.");
	</script>
	<p>회원 가입 후 이용해주세요</p>
	<button onclick="location.href='signin'" class="bu" style="color: rgb(234, 170, 0);">회원가입하러 가기</button>
	</c:if>
<c:if test="${re!=0 }">
	<form action="emailsend" method="post">
		<c:forEach var="emailfound" items="${email }" varStatus="st">
			<input type="radio" id="fontc" class="user_id" name="user_id" value="${emailfound}">${emailfound}<br>
		</c:forEach>
		<button type="submit" id="fontc" class="bu" style="color: rgb(234, 170, 0);">인증 메일 보내기</button>
	</form>
</c:if>	
  </section>
</div>

</body>
</html>