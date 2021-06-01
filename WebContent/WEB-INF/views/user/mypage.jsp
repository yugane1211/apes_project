<%@page import="com.spring.beans.Pass"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Date"%>
<%@page import="org.springframework.ui.Model"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>마이페이지</title>
 <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${root }resources/css/all.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
 <style>
 body{background-color: rgb(242, 169, 0); margin:8px 0 0 0;}
 header{margin: 0; height: 100px;}
section{width: 100%; height: auto; margin-bottom:40px;}
footer{
	top:600px;
}
        table{margin-left: 0%; margin-top: -3px;}
        #b1{width: 120px; height: 120px;}
        button{width: 150px; height: 150px; border-radius: 50%; background-color: rgba(256, 256, 256, 0); border-color: rgba(256, 256, 256, 0); cursor: pointer;}
        .a {color: rgb(55, 58, 54);}
        .loginfo{font-weight: bolder; font-size: 2em;}
        .main{position: absolute; top: 40%; left: 27%;
        	 margin: -150px 0 0 -150px;}
        .bu{width: 230px; height: 200px;}
        .b {display: none; height: 300px; background-color:rgba(55, 58, 54,.5); margin-top:-1px; }
        #updateUser, #recall{
        	height:50px;
        	border-radius:5%;
        	background-color:rgb(234, 170, 0);
        }
        #fontc{
        	border-bottom: none;
        }

        table th{color: rgb(254, 203, 139); border-top: none; border-left: none; border-right: none; border-bottom: 1px solid white;}
        table td{color: rgb(255, 198, 88); border-top: none; border-left: none; border-right: none; border-bottom: 1px solid white;}

     
#mytable1 *{
	height:100px;
}        
#mytable1 th:first-of-type{
	font-size:1.4em;
	width:545px;
}
#mytable1 th:last-of-type{
	display:none;
}
#mytable1 td{
	font-size:1.4em;
	width:380px;
}
#updateUser{
position:relative;
left:44%;
bottom:-4%;
font-size:1.15em;
}

#mytable2{
	height:100%;
}
#mytable2 th{
	font-size:1.3em;
}
#mytable2 th:nth-of-type(2) {
	width:530px;
}
#mytable2 th:nth-of-type(3) {
	width:310px;
}
#mytable2 td:nth-of-type(1) {
	text-align:center;
}
#mytable2 td:nth-of-type(2) {
	text-indent:8px;
	font-size:1.25em;
}
#mytable2 td:nth-of-type(3) {
	text-align:center;
}

#mytable3{
	height:100%;
}
#mytable3 *{
	text-align: center;
}
#mytable3 th{
	font-size:1.5em;
}
#mytable3 td{
	font-size:1.3em;
}
#mytable3 th:first-of-type{
	width:90px;
}
#mytable3 th:nth-of-type(2){
	width:245px;
}
#mytable3 th:nth-of-type(3) {
	width:291px;
} 
#mytable3 th:nth-of-type(4){
	width:291px;
}

#mytable4{
	height:100%;
}   
#mytable4 *{
	text-align: center;
} 
#mytable4 th{
	font-size:1.2em;
}
#mytable4 td{
	font-size:1.15em;
} 
#mytable4 th:first-of-type{
	width:60px;
}
#mytable4 th:nth-of-type(2){
	width:82px;
}
#mytable4 th:nth-of-type(3) {
	width:82px;
} 
#mytable4 th:nth-of-type(4){
	width:125px;
}
#mytable4 th:nth-of-type(5){
	width:119px;
}
#mytable4 th:nth-of-type(6) {
	width:82px;
} 
#mytable4 th:nth-of-type(7){
	width:82px;
}
#mytable4 th:last-of-type {
	width:157px;
}


  
</style>
    <script>
    $( document ).ready(function(){
        $( 'button#a3' ).click(function(){
          $( '.b' ).slideDown();
          $.ajax({
				url : '${root}user/mypage',
				type : 'get',
				dataType : 'text',
				success : function(result){
					
					$('.b').html('<table id="mytable1" border="1"><tr><th>닉네임<th><td>${sessionScope.userlogin.user_nickname }</td></tr><tr><th>휴대폰번호<th><td>${sessionScope.userlogin.user_phone }</td></tr></table><button onclick="changePop()" id="updateUser">회원정보 수정</button>');
				}
			});
        });
        $( 'button#a4' ).click(function(){
            $( '.b' ).slideDown();
            $.ajax({
  				url : '${root}user/mypage',
  				type : 'get',
  				dataType : 'text',
  				success : function(result){
  					
  					$('.b').html('<table id="mytable2" border="1"><tr><th>카테고리</th><th>글 제목</th><th>작성 날짜</th></tr><c:forEach var="read" items="${board }"><tr><td>${read.post_cate }</td><td><a href="${root }board/read?post_num=${read.post_num }">${read.post_sub }</a></td><td>${read.post_date }</td></tr></c:forEach></table>');
  				}
  			});
          });
        $( 'button#a2' ).click(function(){
            $( '.b' ).slideDown();
            $.ajax({
  				url : '${root}user/mypage',
  				type : 'get',
  				dataType : 'text',
  				success : function(result){
  					
  					$('.b').html('<table id="mytable3" border="1"><tr><th>기간(일)</th><th>일당 이용가능시간(분)</th><th>사용 시작일</th><th>사용 종료일</th></tr><c:forEach var="pass" items="${pass }"><tr><td>${pass.pass_type }</td><td>${pass.pass_time }</td><td><fmt:parseDate var="dateStart" pattern="yyyy-MM-dd HH:mm:ss" value="${pass.pass_start}"/><fmt:formatDate value="${dateStart }" var="dateStartParse" pattern="yyyy년 MM월 dd일 HH시 mm분"/><c:out value="${dateStartParse }"/></td><td><fmt:parseDate var="dateFinish" pattern="yyyy-MM-dd HH:mm:ss" value="${pass.pass_finish}"/><fmt:formatDate value="${dateFinish }" var="dateFinishParse" pattern="yyyy년 MM월 dd일 HH시 mm분"/><c:out value="${dateFinishParse }"/></td></tr></c:forEach></table>');
  				}
  			});
          });
        $( 'button#a1' ).click(function(){
            $( '.b' ).slideDown();
            $.ajax({
  				url : '${root}user/mypage',
  				type : 'get',
  				dataType : 'text',
  				success : function(result){
  					
  					$('.b').html('<table id="mytable4" border="1"><tr><th>종류</th><th>장비 번호</th><th>대여 장소</th><th>대여 일시</th><th>대여중인 시간</th><th>초과 시간</th><th>초과 금액</th><th>반납</th></tr><c:forEach var="bicycle" items="${bicycle }"><tr><td>자전거</td><td>${bicycle.bic_num}</td><td>${bicycle.renoff_name}</td><td><fmt:formatDate value="${bicycle.rental_start}" var="bikeParse" pattern="yyyy년 MM월 dd일 HH시 mm분"/><c:out value="${bikeParse }"/></td><td>${bicycle.using_time}분</td><td>${bicycle.over_time>0?bicycle.over_time:0}분</td><td><fmt:parseNumber value="${(bicycle.over_time/5)}" var="bAmount" integerOnly="true"/>${bAmount*200>0?bAmount*200:0}원</td><td><form action="/" method="post" name="returnb"><input type="hidden" name="ride" value="bike"/><input type="hidden" name="rental_num" value="${bicycle.rental_num}"/><button type="button" onclick="rentBPop()" id="recall">반납</button></form></td></tr></c:forEach><c:forEach var="kick" items="${kickboard }"><tr><td>킥보드</td><td>${kick.kick_num}</td><td>${kick.renoff_name}</td><td><fmt:formatDate value="${kick.rental_start}" var="kickParse" pattern="yyyy년 MM월 dd일 HH시 mm분"/><c:out value="${kickParse }"/></td><td>${kick.using_time}분</td><td>${kick.over_time>0?kick.over_time:0}분</td><td><fmt:parseNumber value="${kick.over_time/5}" var="kAmount" integerOnly="true"/>${kAmount*200>0?kAmount*200:0}원</td><td><form action="/" method="post" name="returnk"><input type="hidden" name="ride" value="kick"/><input type="hidden" name="rental_num" value="${kick.rental_num}"/><button type="button" onclick="rentKPop()" id="recall">반납</button></form></td></tr></c:forEach></table>');
  				}
  			});
          });
    });
    
    function changePop(){
    	window.open('changePop','개인정보 수정','width=750,height=750,left=100,top=100');
    }
    function rentBPop(){
    	var winCre=window.open('about:blank','반납','width=800,height=800,left=100,top=100');
    	var frm=document.returnb;
    	frm.action='/apes_project/user/returnRent';
    	frm.target="반납";
    	frm.submit();
    }
    function rentKPop(){
    	var winCre=window.open('about:blank','반납','width=800,height=800,left=100,top=100');
    	var frm=document.returnk;
    	frm.action='/apes_project/user/returnRent';
    	frm.target="반납";
    	frm.submit();
    }
    </script>

</head>
<body>
       <c:set var="url" value="/user/mypage"/>
       <br>
        <header style="height:130px;">
       <jsp:include page="../hammenu.jsp">
       		<jsp:param value="${url }" name="url"/>
       </jsp:include>
        </header>
 <section>
        <div class="main">
            <div class="loginfo" id="fontc">My Page</div>
            <table id="fontc">
                <tr>
                    <td class="bu"><button class="a" id="a1"><img src="${root }resources/images/saza.png" id="b1"><br>대여 현황</button></td>
                    <td class="bu"><button class="a" id="a2"><img src="${root }resources/images/twin.png" id="b1"><br>이용권 현황</button></td>
                    <td class="bu"><button class="a" id="a3"><img src="${root }resources/images/scol.png" id="b1"><br>개인정보 수정</button></td>
                    <td class="bu"><button class="a" id="a4"><img src="${root }resources/images/bow.png" id="b1"><br>내가 쓴 게시글/문의글</button></td>
                </tr>
            </table>
            <div class="b">



            </div>
        </div>
        
    </section>
<jsp:include page="../footer.jsp"/>
</body>
</html>