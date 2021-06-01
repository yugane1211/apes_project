<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원정보 수정</title>
   <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${root }resources/css/all.css">


    <style>
        #aaa{
        display: inline-block;  
     width: 100%;
    height: auto;
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
       margin-left: 16.8%;
       margin-top: 50px;
       color: rgb(55, 58, 54);
    }
    #jk{
        font-size: 1.3em;
       
    }
    #user_id, #user_nickname, #user_password, #user_password2, #user_phone{
        width: 250px;
        height: 35px;
        margin-left: 30px;
        border-radius: 10px;
    }
 p{
     margin-top: -20px;
     margin-left:73px;
 }
 #h4{
     margin-left: 94px;
     margin-bottom:30px;
 }
 #h5{
     margin-left: 24px;
 }
#h6{
    margin-left: 93px;
}
#bu1,#bu2{
    background-color: rgb(55, 58, 54);
    color: rgb(234, 170, 0);
    font-size: 1.3em;
    border-radius: 10px;
    width: 130px;
       height: 40px;
       margin-left: 60px;
}
#bu2{
    margin-left: 100px;
}
#bu{
    background-color: rgb(55, 58, 54);
    color: rgb(234, 170, 0);
    margin-left: 20px;
    width: 80px;
       height: 30px;
       border-radius: 10px;
}

    </style>
</head>
<body>
<div id="aaa" style="background-color: rgb(234, 170, 0);">
        <a href="" id="a3"><nav style="color: rgb(55, 58, 54);" id="c">혹성<br>탈출</nav></a>
<section>

<form:form action="userUpdate_proc" modelAttribute="userUpdate"><!-- action : 경로값이어서 나중에 필요시 바꿀 수 있음 -->
<div id="jk">
<p id="h4">아이디 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${sessionScope.userlogin.user_id }<form:hidden path="user_id" value="${sessionScope.userlogin.user_id }"/><br></p>
<p id="h6">닉네임 : <form:input path="user_nickname"/><br>
<form:errors path="user_nickname" style="color:red;"/></p>
<p>비밀번호 : <form:password path="user_password" showPassword="true"/><br>
<form:errors path="user_password" style="color:red;"/></p>
<p id="h5">비밀번호 확인 : <form:password path="user_password2" showPassword="true"/><br>
<form:errors path="user_password2" style="color:red;"/></p>
<p>전화번호 : <form:input path="user_phone"/><br>
<form:errors path="user_phone" style="color:red;"/></p>
</div>
<form:button type="submit" id="bu1">확인</form:button>
<form:button type="reset" id="bu2">초기화</form:button>
</form:form>
  </section>

</div>
</body>
</html>