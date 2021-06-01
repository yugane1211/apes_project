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
    <link rel="stylesheet" href="${root }resources/css/all.css">
    <title>��й�ȣ ã��</title>

    <style>
      #aaa{
        display: inline-block;  
     width: 1530px;
    height: 740px;
    margin: -10px;
    position: relative;
 
   background-size: cover;

    }
    #in{
    position:relative;
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
        margin-top: 60px;
        text-align: center;
        font-size: 1.7em;
        font-family: 'Noto Sans KR', sans-serif; 
        color: rgb(55, 58, 54);
    }
    #phone{
        width: 300px;
        height: 30px;
        border-radius: 10px;
        margin-right:20px;
    }

    .bu{
    	position:absolute;
    	top:-11px;
    	right:34.5%;
        background-color: rgb(55, 58, 54);
        color: rgb(234, 170, 0);
        width: 70px;
       height: 35px;
       font-size: 20px;
       border-radius: 10px;
      margin-top: 20px;
    }

    </style>
</head>
<body>
<div id="aaa" style="background-color: rgb(234, 170, 0);">
        <a href="${root }" id="a3"><nav style="color: rgb(55, 58, 54);" id="c">Ȥ��<br>Ż��</nav></a>
    <section>
<p id="fontc">���� �� �Է��Ͽ��� �޴��� ��ȣ�� �Է��ϼ���.(- ����)</p>
<form action="emailfind" method="post">
<div id="in">
<input type="text" name="phone" id="phone"> 
<button type="submit" id="fontc" class="bu" style="color: rgb(234, 170, 0);">Ȯ��</button>
</div>
</form>
 </section>
    </div>

</body>
</html>