<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
          <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <c:set var='root' value='${pageContext.request.contextPath}/'/>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자유게시판</title>
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
<c:set var="url" value="/board/notice"/>
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
				<td id="g" colspan="3" rows="3" style="text-align: center;">알려드립니다!</td>
			</tr>

			<tr>
				<td id="g4" colspan="3" rows="3">
				 2021년 5월 13일(목) 부터 적용되는 개정된 도로교통법 안내<br>
				 헬멧착용(벌금 2만원 동승자 과태료 2만원)<br>
				 1인 승차 (4만원)<br>
				 음주 운전 금지 (10만원)<br>
				 무면허 운전 금지 (10만원)<br>
				 13세 미만 어린이 운전금지 (10만원 보호자 대상)<br>
				<br>
				<br>
				안전한 라이딩을 위해 아래 안전 약속을 꼭 확인해주세요!<br>
				 1. 1인 탑승하기 둘이타면 속도제어가 힘들어져요!<br>
				 2. 바른주차하기 다음에 이용할 라이더들을 위해 지정한 장소 (킥스팟), 안전한 장소에 주차하기<br>
				 3. 음주운전 금지! 음주운전 하지마세요<br>
				 4. 라이딩시 헬멧 착용 안전을 위해 헬멧 착용하기<br>
				 5. 안전운전하기 보행자, 이동차량 조심해서 운전하기<br>
				</td>
			</tr>

		</table>
		<button id="c8" onclick="location.href='freedom'">돌아가기</button>
	</div>
	</section>
	<jsp:include page="../footer.jsp"/>
</body>
</html>