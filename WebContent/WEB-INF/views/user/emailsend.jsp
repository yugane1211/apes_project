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
    <title>������ȣ �Է�</title>
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
alert("�̸����� �߼۵Ǿ����ϴ�. ������ȣ 6�ڸ��� �Է����ּ���.");
</script>
<div id="aaa" style="background-color: rgb(234, 170, 0);">
        <a href="${root }" id="a3"><nav style="color: rgb(55, 58, 54);" id="c">Ȥ��<br>Ż��</nav></a>

    <section>
        <h3 id="fontc">������ȣ �Է�</h3>
        <p id="fontc">���� 6�ڸ��� �Է����ּ���.</p>
        <form action="mailconfig" method="post">
		<input type="text" name="press" class="press">
		<input type="hidden" name="dice" value="${dice }">
		<input type="hidden" name="email" value="${requestScope.email}">
		<br>
		<input type="submit" value="Ȯ��" class="bu" style="color: rgb(234, 170, 0);" id="fontc">
		</form>
    </section>
</div>
</body>
</html>