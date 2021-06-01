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
        #aaa {
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

        #a {
            font-size: 1.7em;
            text-align: center;
            margin-top: 80px;
        }

        #user_id {
            width: 300px;
            height: 40px;
            margin-left: 30px;
            border-radius: 10px;
        }
        #user_password {
            width: 300px;
            height: 40px;
            margin-left: 30px;
            border-radius: 10px;
        }

        span {
            margin-left: -20px;
        }

        #bb {
            margin-left: 43.5%;
            width: 100px;
            height: 40px;
            margin-top: 60px;
            font-size: 1.3em;
            border-radius: 10px;
            background-color: rgb(55, 58, 54);
            color: rgb(234, 170, 0);
        }

        #bbb {
            margin-left: 105px;
            width: 100px;
            height: 40px;
            margin-top: 60px;
            font-size: 1.3em;
            border-radius: 10px;
            background-color: rgb(55, 58, 54);
            color: rgb(234, 170, 0);
        }

        #a5 {
            color: rgb(55, 58, 54);
            margin-left: 48%;
            margin-top: 40px;
            text-decoration: underline;
            font-size:1.2em;
        }

    </style>
</head>
<body>
    <div id="aaa" style="background-color: rgb(234, 170, 0);">
        <a href="${root }" id="a3"><nav style="color: rgb(55, 58, 54);" id="c">혹성<br>탈출</nav></a>
		<form:form action="login_proc?url=${url }" modelAttribute="tempuserlogin">
        <div id="a" style="color: rgb(55, 58, 54);">
            아이디: <form:input path="user_id" placeholder="이메일을 입력하세요"/><br>
            <form:errors path="user_id"/>
            <br>
            <span>비밀번호:<form:password path="user_password" showPassword="true"/><br>
            <form:errors path="user_password"/>
            </span>
        </div>

        <form:button type="submit" id="bb">로그인</form:button>
        <button type="button" onclick="location.href='signin'" id="bbb">회원가입</button>
        </form:form>
        
        <br>
		<br>
        <a href="find" id="a5">아이디/비밀번호 찾기</a>
		<br>
		<br>
		<br>
    </div>
<jsp:include page="../footer.jsp"/>
</body>
</html>