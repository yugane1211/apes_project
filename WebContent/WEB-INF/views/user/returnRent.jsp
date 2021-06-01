<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

#bu{background-color: rgb(55, 58, 54); color: rgb(234, 170, 0); width: 90px; height: 40px; margin-top: 20px; font-size: 15px; border-radius: 10px;}
body{background-color: rgb(242, 169, 0); margin-left:5%; color: rgb(55, 58, 54); width: 700px; height: 700px;}
#fontc{font-family: 'Noto Sans KR', sans-serif; font-weight: bold; }
.renoff_num, .verify {width: 300px; height: 40px; border-radius: 10px;}
.ble{border-right: 1px solid rgb(55, 58, 54); width:100px;}
.ta{border-bottom: 1px solid rgb(55, 58, 54); width:100px;}
#renstart{
	width:250px;
}
div>p:first-of-type {
	font-size:1.7em;
}
table{margin-left:7%;}
table th{
	font-size:1.3em;
}
table td{
	font-size:1.1em;
	text-align: center;
}
table th:first-of-type {
	width:112px;
}
table th:nth-of-type(2) {
	width:260px;
}
table th:nth-of-type(3) {
	width:105px;
}
table th:nth-of-type(4) {
	width:105px;
}

#overAmount{
	font-size:1.5em;
}
#overAmount span:nth-of-type(2){
	color:green;
}
</style>


</head>
<body>
<div id="fontc">
<fmt:formatDate value="${bikeRental.rental_start}" var="bikeParse" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
<fmt:formatDate value="${kickRental.rental_start}" var="kickParse" pattern="yyyy년 MM월 dd일 HH시 mm분"/>
<p align="center">${ride } 반납</p>

<table align="center">
<tr>
<th class="ta ble">${ride } 번호</th>
<th class="ta ble">대여 일시</th>
<th class="ta ble">대여 시간</th>
<th class="ta">초과 시간</th>
</tr>
<tr>
<td class="ble">${bikeRental.bic_num }${kickRental.kick_num }</td>
<td class="ble" id="renstart"><c:out value="${bikeParse }"/><c:out value="${kickParse }"/></td>
<td class="ble">${bikeRental.using_time }${kickRental.using_time }분</td>
<td>${(bikeRental.over_time>=0?bikeRental.over_time:0)+(kickRental.over_time>=0?kickRental.over_time:0) }분</td>
</tr>
</table>

<fmt:parseNumber value="${bikeRental.over_time/5 }" integerOnly="true" var="bikeFee"/>
<fmt:parseNumber value="${kickRental.over_time/5 }" integerOnly="true" var="kickFee"/>

<p align="center" id="overAmount"><span>추가 요금 :</span>&nbsp;&nbsp;<span>${((bikeFee*200>=0)?bikeFee*200:0)+((kickFee*200>=0)?kickFee*200:0 )}</span><span>&nbsp;원</span></p>

<p>이용권에 명시된 시간을 초과해서 대여하였을 경우, 최초 5분까지는 무료, 이후에는 5분마다 200원씩 추가요금이 부과됩니다.</p>
<form action="return_proc" method="post">
<p>반납하고자 하는 대여소의 번호를 입력하세요.</p>
<input type="text" name="renoff_num" class="renoff_num"><br>
<p>대여소에서 받은 인증번호(숫자 6자리)를 입력하세요.</p>
<input type="text" name="verify" class="verify"><br>
<input type="hidden" name="bikefee" value="${(bikeFee*200>=0)?bikeFee*200:0}">
<input type="hidden" name="kickfee" value="${(kickFee*200>=0)?kickFee*200:0}"><!-- 추가 요금 -->
<input type="hidden" name="bike_num" value="${bikeRental.bic_num }"><!-- 자전거 번호 -->
<input type="hidden" name="kick_num" value="${kickRental.kick_num }"><!-- 킥보드 번호 -->
<input type="hidden" name="kind" value="${ride }"><!-- 종류 -->
<input type="hidden" name="cer_num" value="${dice }"><!-- 인증 번호 -->
<input type="hidden" name="k_rental_num" value="${kickRental.rental_num }"><!-- 킥보드 렌탈 번호 -->
<input type="hidden" name="b_rental_num" value="${bikeRental.rental_num }"><!-- 자전거 렌탈 번호 -->



<button type="submit" id="bu">반납하기</button>
</form>
</div>




</body>
</html>