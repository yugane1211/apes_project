<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<c:set var='root' value='${pageContext.request.contextPath}/'/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>이용안내</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>


<link rel="stylesheet" href="${root }resources/css/hammenu.css">
<link rel="stylesheet" href="${root }resources/css/all.css">
<style>

body{background-color: rgb(242, 169, 0); margin:8px 0 0 0;}
section{width: 100%; height: auto;}
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
    margin-top: -60px;
    font-family: 'Black Han Sans', sans-serif;
}

#a3 {
    text-decoration: none;
}

        .menuG a {
            cursor: pointer;
        }

        .menuG .hide {
            display: none;
        }


        ul {
            display: inline;
        }


#jk {
    text-align: center;
    font-size: 2em;
    font-weight: 900;
}

img {
    width: 700px;
    height: 500px;
}

/* Slideshow container */
.slideshow-container {
  max-width: 1200px;
  max-height: 750px;
  position: relative;
  margin: auto;
}
.slideshow-container .mySlides img {
  height: 500px;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}




</style>
    <script>
  //슬라이드 스크립

var slideIndex = 0; //slide index

// HTML 로드가 끝난 후 동작
window.onload=function(){
	$(".menuG>a").click(function(){
        // 현재 클릭한 태그가 a 이기 때문에
        // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
        $(this).next("ul").toggleClass("hide");
    });
	
	
	
  showSlides(slideIndex);

  /*// Auto Move Slide
  var sec = 3000;
  setInterval(function(){
    slideIndex++;
    showSlides(slideIndex);

  }, sec);*/
}


// Next/previous controls
function moveSlides(n) {
  slideIndex = slideIndex + n
  showSlides(slideIndex);
}

// Thumbnail image controls
function currentSlide(n) {
  slideIndex = n;
  showSlides(slideIndex);
}

function showSlides(n) {

  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  var size = slides.length;

  if ((n+1) > size) {
    slideIndex = 0; n = 0;
  }else if (n < 0) {
    slideIndex = (size-1);
    n = (size-1);
  }

  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }

  slides[n].style.display = "block";
  dots[n].className += " active";
}

    </script> 
</head>
<body>
<c:set var="url" value="/guide"/>
       <br>
        <header style="height:130px;">
       <jsp:include page="hammenu.jsp">
       		<jsp:param value="${url }" name="url"/>
       </jsp:include></header>
<section>      
<div id="ccc" style="background-color: rgb(234, 170, 0);">

            <div id="jk" style="color: rgb(55, 58, 54);">이용안내</div><br><br><br>
            <ul>
	    <li class="menuG">
	        <a><div id="a9">이용권 구매 안내</div></a>
	        <ul class="hide">
	            <br>
	            <li>1. 메인페이지에서 상단바 클릭, 이용권 구매 클릭<br>2. 정기권을 원하면 정기권 티켓 클릭, 일일권을 원하면 일일권 티켓 클릭 한 후 정기권(일일권)종류 선택에서 이용하고 싶은 시간을 선택</li>
	            <li>
    <div class="slideshow-container">

      <!-- Full-width images with number and caption text -->
      <div class="mySlides fade">
        <div class="numbertext">1 / 3</div>
        <img src="${root }resources/images/ticket_first.png" style="width:100%">
        <div class="text">ACNE STUDIO</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">2 / 3</div>
        <img src="${root }resources/images/ticket_second.PNG" style="width:100%">
        <div class="text">ACNE STUDIO</div>
      </div>

      <div class="mySlides fade">
        <div class="numbertext">3 / 3</div>
        <img src="${root }resources/images/ticket_third.PNG" style="width:100%">
        <div class="text">ACNE STUDIO</div>
      </div>

      <!-- Next and previous buttons -->
      <a class="prev" onclick="moveSlides(-1)">&#10094;</a>
      <a class="next" onclick="moveSlides(1)">&#10095;</a>
    </div>
    <br/>

    <!-- The dots/circles -->
    <div style="text-align:center">
      <span class="dot" onclick="currentSlide(0)"></span>
      <span class="dot" onclick="currentSlide(1)"></span>
      <span class="dot" onclick="currentSlide(2)"></span>

    </div>
</li>
</ul>

    </div>
</section>     
    <jsp:include page="footer.jsp"/>
   
</body>
</html>