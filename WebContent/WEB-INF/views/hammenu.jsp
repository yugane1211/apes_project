<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
  <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${root }resources/css/hammenu.css">

<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
    <script>
    $(document).ready(function(){
            $(".ham").click(function(){
            $(".menu").slideToggle();
        });
            $(".ham").click(function(){
            $(this).toggleClass("active")
        });
    });
    /*$(document).ready(function(){
        $(header).load("hammenu.html");
    });*/
    </script>
   
   <style>
        a{text-decoration: none;}
        a:link{color: rgb(55, 58, 54);}
        a:hover{
        	color:red;
        }
        a:visited{color:rgb(55, 58, 54);}
        .kiehl{font-size: larger; margin-left: 63%; position: absolute; margin-top: 0px;}
        .kiehl ul{list-style: none; margin-left: 70%; padding: 0;}
        .kiehl li{margin: 0; padding-left: 30px; border: 0; float: left;}
        #fontc {
            color: rgb(55, 58, 54);
            font-family: 'Noto Sans KR', sans-serif;
            font-weight: bold;
        }

        header {
            margin: 0;
            height: 100px;
            background-color: rgb(242, 169, 0);
        }

        .title {
            font-size: 3em;
            color: rgb(55, 58, 54);
            font-family: 'Black Han Sans', sans-serif;
            margin-left: 30px;
            float: left;
        }
    </style>

</head>
<body>
<% String urls=request.getParameter("url"); %>

  <header>
        <div class="title" style="position: absolute;"><a href="${root }">Ȥ��<br>Ż��</a></div>
        <div id="fontc" class="kiehl">
 			<c:if test="${sessionScope.userlogin.user_login==false }">
	    	    <li><a href="${root }user/login?url=<%=urls %>">�α���</a></li>
	            <li><a href="${root }user/signin">ȸ������</a></li>

       		</c:if>
            <c:if test="${sessionScope.userlogin.user_login==true }">
		 		<li>${sessionScope.userlogin.user_nickname }�� ȯ���մϴ�.</li>
	            <li><a href="${root }user/logout?url=<%=urls%>">�α׾ƿ�</a></li>
        	</c:if>
        
        </div>
        <div id="nav">    
            <div class="ham">
                <span class="bar1"></span>
                <span class="bar2"></span>
                <span class="bar3"></span>
            </div>
        </div>   
        <div>
            <ul class="menu" id="fontc" style="z-index:3;">
                <li class="active"><a href="${root }user/mypage">���� ������</a></li>
                <li><a href="${root }pass/ticket">�̿�� ����</a></li>
                <li><a href="${root }board/freedom">���� �Խ���</a></li>
                <li><a href="${root }board/qna">���� �Խ���</a></li>
                <li><a href="${root }tour01">��õ �ڽ�</a></li>
                <li><a href="${root }guide">�̿� �ȳ�</a></li>
            </ul>    
        </div> 
    </header>

</body>
</html>