<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>   
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
   
   
   <style>
   body{background-color: rgb(242, 169, 0); margin:8px 0 0 0;}
     #e{
        display: inline-block;  
     width: 100%;
    height: auto;
    margin: -10px;
    position: relative;
 
   background-size: cover;
     }
     footer{
    	top:200px;
    }
       
    #c{
        font-size: 4em;
        text-align: center;
       margin-top: 30px;
        font-family: 'Black Han Sans', sans-serif;
    }

    #passwordUpdate{
        text-align: center;
    }
    h3{
        margin-top: 60px;
        text-align: center;
        font-family: 'Noto Sans KR', sans-serif; 
        font-weight: bold;
        font-size: 1.6em;
        color: rgb(55, 58, 54);
    }
    .upform{
        font-size: 1.7em;
        text-align: center;
       margin-top: 30px;
       font-family: 'Noto Sans KR', sans-serif; 
     color: rgb(55, 58, 54);
    }
    
    #leftform{
    	margin-right:4%;
    }
    
    
    
    #user_password,#user_password2{
       border-radius: 10px;
       font-size: 30px;
       margin-top: 20px;
       
    }

    #c2{
        margin-left: -45px;
    }

     button{

         font-size: 1.4em;
         border-radius: 10px;
         color: rgb(234, 170, 0);
         background-color: rgb(55, 58, 54);
         margin-top: 30px;
     }

     #a3{
        text-decoration: none;
    }
    </style>
</head>
<body>
<div id="e" style="background-color: rgb(234, 170, 0);">
        <a href="${root }" id="a3"><nav style="color: rgb(55, 58, 54);" id="c">혹성<br>탈출</nav></a>
<h3>새로운 비밀번호를 입력하세요.</h3>

<form:form action="modifyPw" mehtod="post" modelAttribute="passwordUpdate">
	<p class="upform">비밀번호 : <form:password path="user_password" showPassword="true" size="13"/><br>
	<form:errors path="user_password" style="color:red;"/></p>
	<p class="upform" id="leftform">비밀번호 확인 : <form:password path="user_password2" showPassword="true" size="13"/><br>
	<form:errors path="user_password2" style="color:red;"/></p>
	<form:hidden path="user_id" />
	
	<form:button type="submit">비밀번호 수정</form:button>
</form:form>
</div>
<jsp:include page="../footer.jsp"/>
</body>
</html>