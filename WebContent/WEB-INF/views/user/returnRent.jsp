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
<fmt:formatDate value="${bikeRental.rental_start}" var="bikeParse" pattern="yyyy�� MM�� dd�� HH�� mm��"/>
<fmt:formatDate value="${kickRental.rental_start}" var="kickParse" pattern="yyyy�� MM�� dd�� HH�� mm��"/>
<p align="center">${ride } �ݳ�</p>

<table align="center">
<tr>
<th class="ta ble">${ride } ��ȣ</th>
<th class="ta ble">�뿩 �Ͻ�</th>
<th class="ta ble">�뿩 �ð�</th>
<th class="ta">�ʰ� �ð�</th>
</tr>
<tr>
<td class="ble">${bikeRental.bic_num }${kickRental.kick_num }</td>
<td class="ble" id="renstart"><c:out value="${bikeParse }"/><c:out value="${kickParse }"/></td>
<td class="ble">${bikeRental.using_time }${kickRental.using_time }��</td>
<td>${(bikeRental.over_time>=0?bikeRental.over_time:0)+(kickRental.over_time>=0?kickRental.over_time:0) }��</td>
</tr>
</table>

<fmt:parseNumber value="${bikeRental.over_time/5 }" integerOnly="true" var="bikeFee"/>
<fmt:parseNumber value="${kickRental.over_time/5 }" integerOnly="true" var="kickFee"/>

<p align="center" id="overAmount"><span>�߰� ��� :</span>&nbsp;&nbsp;<span>${((bikeFee*200>=0)?bikeFee*200:0)+((kickFee*200>=0)?kickFee*200:0 )}</span><span>&nbsp;��</span></p>

<p>�̿�ǿ� ��õ� �ð��� �ʰ��ؼ� �뿩�Ͽ��� ���, ���� 5�б����� ����, ���Ŀ��� 5�и��� 200���� �߰������ �ΰ��˴ϴ�.</p>
<form action="return_proc" method="post">
<p>�ݳ��ϰ��� �ϴ� �뿩���� ��ȣ�� �Է��ϼ���.</p>
<input type="text" name="renoff_num" class="renoff_num"><br>
<p>�뿩�ҿ��� ���� ������ȣ(���� 6�ڸ�)�� �Է��ϼ���.</p>
<input type="text" name="verify" class="verify"><br>
<input type="hidden" name="bikefee" value="${(bikeFee*200>=0)?bikeFee*200:0}">
<input type="hidden" name="kickfee" value="${(kickFee*200>=0)?kickFee*200:0}"><!-- �߰� ��� -->
<input type="hidden" name="bike_num" value="${bikeRental.bic_num }"><!-- ������ ��ȣ -->
<input type="hidden" name="kick_num" value="${kickRental.kick_num }"><!-- ű���� ��ȣ -->
<input type="hidden" name="kind" value="${ride }"><!-- ���� -->
<input type="hidden" name="cer_num" value="${dice }"><!-- ���� ��ȣ -->
<input type="hidden" name="k_rental_num" value="${kickRental.rental_num }"><!-- ű���� ��Ż ��ȣ -->
<input type="hidden" name="b_rental_num" value="${bikeRental.rental_num }"><!-- ������ ��Ż ��ȣ -->



<button type="submit" id="bu">�ݳ��ϱ�</button>
</form>
</div>




</body>
</html>