<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
          <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>추천코스</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${root }resources/css/hammenu.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
<style>
       .img{position: absolute; top: 45%; left: 40%; margin: -150px 0 0 -150px; z-index: -2;}
       .mainbutton{position: absolute; top: 50%; left: 25%; margin: -150px 0 0 -150px;}
       .right{position: absolute; top: 50%; left: 75%; margin: -150px 0 0 -150px;}
       .bu{width: 200px; text-align: center;}
       #b1{width: 80px; height: 80px; }
       button{background-color: #fff; border-color: rgb(55, 58, 54); width: 130px; height: 130px; border-radius: 50%; cursor:pointer;}
       button:hover{color:red;}
       table{border-spacing: 50px;}
      section{height:530px;}   
      #fontc{color: rgb(55, 58, 54); font-family: 'Noto Sans KR', sans-serif; font-weight: bold;}
      header{margin: 0; height: 100px;}
      body{background-color: rgb(242, 169, 0); margin:8px 0 0 0;}
      section{width: 100%; height: 600px;}
       .t1{border-top: 3px solid #fff; position: absolute; z-index: -1; width: 10px; margin-left: 50px; 
           transform-origin: 0%; transform: skew(-8deg, 8deg);}
       .t2{border-top: 3px solid #fff; position: absolute; z-index: -1; width: 10px; margin-left: 50px; 
           transform-origin: 0%; transform: skew(27deg, -27deg);}
       .t3{border-top: 3px solid #fff; position: absolute; z-index: -1; width: 10px; margin-left: 50px; 
           transform-origin: 0%; transform: skew(3deg, -3deg) rotateY(180deg); }
       .t4{border-top: 3px solid #fff; position: absolute; z-index: -1; width: 10px; margin-left: 50px; 
           transform-origin: 0%; transform: skew(-23deg, 23deg) rotateY(180deg);}
    </style>

    <script>
        $(document).ready(function() {
            $('.tb1').mouseover(function(){
                $('.t1').animate({width: '335px'}, 1000, 'linear');
            });
            $('.tb1').mouseleave(function(){
                $('.t1').animate({width: '0%'});
            });
        });

        $(document).ready(function(){
            $('.tb2').mouseover(function(){
                $('.t2').animate({width: '315px'}, 1000, 'linear');
            });
            $('.tb2').mouseleave(function(){
                $('.t2').animate({width: '0%'});
            });
        });

        $(document).ready(function(){
            $('.tb3').mouseover(function(){
                $('.t3').animate({width: '315px'}, 1000, 'linear');
            });
            $('.tb3').mouseleave(function(){
                $('.t3').animate({width: '0%'});
            });
        });

        $(document).ready(function(){
            $('.tb4').mouseover(function(){
                $('.t4').animate({width: '375px'}, 1000, 'linear');
            });
            $('.tb4').mouseleave(function(){
                $('.t4').animate({width: '0%'});
            });
        });       
        
    </script>
</head>
<body>
<c:set var="url" value="/tour01"/>
       <br>
        <header style="height:130px;">
       <jsp:include page="hammenu.jsp">
       		<jsp:param value="${url }" name="url"/>
       </jsp:include>
        </header>
    <section>
        <div class="img">
            <img src="${root }resources/images/seoulmap3.png" width="550px" height="410px">
        </div>
        <table class="mainbutton" id="fontc">
            <tr>
                <td><button class="tb1" onclick="location.href='tour_han'"><img src="${root }resources/images/earthagain.png" id="b1"><br>한강 코스<div class="t1"></div></button></td>
            </tr>
            <tr>
                <td><button class="tb2" onclick="location.href='tour_park'"><img src="${root }resources/images/planet2.png" id="b1"><br>공원 코스<div class="t2"></div></button></td>
            </tr>
        </table>
        
        <table class="mainbutton right" id="fontc">
            <tr>
                <td><button class="tb3" onclick="location.href='tour_fourdoors'"><img src="${root }resources/images/planet1.png" id="b1"><br>사대문 코스<div class="t3"></div></button></td>
            </tr>
            <tr>
                <td><button class="tb4" onclick="location.href='tour_ddm'"><img src="${root }resources/images/newearth.png" id="b1"><br>동대문 코스<div class="t4"></div></button></td>
            </tr>
        </table>
    </section>
<jsp:include page="footer.jsp"/>
</body>
</html>