<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
          <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <c:set var='root' value='${pageContext.request.contextPath}/'/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>문의게시판</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap"
	rel="stylesheet">
<style>
body{background-color: rgb(242, 169, 0); margin:8px 0 0 0;}
header{margin: 0; height: 100px;}
section{width: 100%; height: auto; margin-bottom:40px;}
#ccc {
	display: inline-block;
	width: 100%;
	height: inherit;
	margin: -10px;
	position: relative;
	background-size: cover;
}

#c {
	margin-left: 30px;
	font-size: 3em;
	margin-top: -70px;
	font-family: 'Black Han Sans', sans-serif;
}



img {
	margin-left: 350px;
	width: 800px;
	height: 300px;
}

#d1 {
	margin-left: 1100px;
	margin-top: -40px;
	font-size: 1.5em;
	font-family: 'Noto Sans KR', sans-serif;
}



#a3 {
	text-decoration: none;
}

#c5 {
	float: right;
}

#c6 {
	margin-left: 850px;
	margin-top: 10px;
	width : 50px;
	height: 40px;
	position: relative;
	right: -3%;
	bottom: 0%;
}

#c7 {
	width: 50px;
	margin-left: 17px;
	position: relative;
	right: -2%;
	bottom: 0%;
}

#c8 {
	position: relative;
	right: -68%;
	bottom: -10px;
}

div>button {
	height: 40px;
	margin-right: 10px;
	color: rgb(234, 170, 0);
	background-color: rgb(55, 58, 54);
}

table {
	border: 2px solid rgb(55, 58, 54);
	border-collapse: collapse;
	margin-left: 26.5%;
	margin-top: 50px;
	font-family: 'Noto Sans KR', sans-serif;
	font-weight: bold;
}

#g {
	width: 700px;
	height: 40px;
	text-indent:20px;
	font-size:1.7em;
	padding:10px 0 10px 0;
}


#g1 {
	height: 40px;
}

#g2 {
	width: 90px;
	height: 40px;
}

#g3 {
	width: 90px;
	height: 40px;
}

#g4 {
	width: 100%;
	height: inherit;
	position:relative;
	padding:10px 0 10px 11px;
}

#gg {
	text-align: center;
	text-decoration: underline;
}

#h1, #h2 {
	width: 90px;
	height: 80px;
	padding-left: 20px;
}
button{ border-radius: 3px;}
#ii{text-align: center; font-size: 2em; font-family: 'Noto Sans KR', sans-serif; color: rgb(55, 58, 54); font-weight: bold;}

#incontent{
   display:inline-block;
   top:0px;
   left:0px;
   position:relative;
   padding:20px;
}
#g4>img{
   display:inline-block;
   padding:20px;
   width:auto;
   height:auto;
   top:0px;
   left:0px;
   margin-left:0px;
}
</style>
</head>
<body>
<c:set var="url" value="/board/faq"/>
<br>
<header style="height:130px;">
<jsp:include page="../hammenu.jsp">
	<jsp:param value="${url }" name="url"/>
</jsp:include>
</header>
<section>
	<div id="ccc" style="background-color: rgb(234, 170, 0);">

       
		<img src="${root }resources/images/board01.jpg"><br>

		<table border="1">
			<tr>
				<td id="g" colspan="3" rows="3" style="text-align: center;">주의사항</td>
			</tr>

			<tr>
				<td id="g4" colspan="3" rows="3">
					문의 게시판은 철저히 비밀글로 유지되며, <br>
					본인 글의 열람은 가능하지만,<br>
					다른 대상이 글을 열람 하실 수 없습니다.<br>
					문의 사항을 남겨주시면, 신속 정확히 응답해 드릴 것을 약속합니다. 
				</td>
			</tr>

		</table>
		<button id="c8" onclick="location.href='qna'">돌아가기</button>
</div>
</section>
<jsp:include page="../footer.jsp"/>
</body>
</html>