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
    padding-bottom:70px;
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
    width: 600px;
    height: 400px;
}
    #a9{
      font-size: 1.5em;
      font-weight: bold;
      padding-left: 380px;
      font-family: 'Noto Sans KR', sans-serif; 
      color: rgb(55, 58,54);
     
    }
    hr{opacity: 0.2;}
    #gu{ padding-left: 200px; display: inline-block;}

/* Slideshow container */
.slideshow-container {
  max-width: 600px;
  max-height: 400px;
  position: relative;
  margin: auto;
}
.slideshow-container .mySlides img {
  height: 400px;
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

var slideIndex1 = 0; //slide index
var slideIndex2 = 0; //slide index
var slideIndex3 = 0; //slide index
var slideIndex4 = 0; //slide index
var slideIndex5 = 0; //slide index
var slideIndex6 = 0; //slide index

// HTML 로드가 끝난 후 동작
window.onload=function(){
	$(".menuG>a").click(function(){
        // 현재 클릭한 태그가 a 이기 때문에
        // a 옆의 태그중 ul 태그에 hide 클래스 태그를 넣던지 빼던지 한다.
        $(this).next("ul").toggleClass("hide");
    });
	
	
	
  showSlides1(slideIndex1);
  showSlides2(slideIndex2);
  showSlides3(slideIndex3);
  showSlides4(slideIndex4);
  showSlides5(slideIndex5);
  showSlides6(slideIndex6);


  /*// Auto Move Slide
  var sec = 3000;
  setInterval(function(){
    slideIndex++;
    showSlides(slideIndex);

  }, sec);*/
}
// Thumbnail image controls
function currentSlide(n) {
  slideIndex = n;
  showSlides(slideIndex);
}

// Next/previous controls
function moveSlides1(n) {
  slideIndex1 = slideIndex1 + n
  showSlides1(slideIndex1);
}

function showSlides1(n) {

  var slides = document.getElementsByClassName("mySlides1");
  var dots = document.getElementsByClassName("dot");
  var size = slides.length;

  if ((n+1) > size) {
    slideIndex1 = 0; n = 0;
  }else if (n < 0) {
    slideIndex1 = (size-1);
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
//Next/previous controls
function moveSlides2(n) {
  slideIndex2 = slideIndex2 + n
  showSlides2(slideIndex2);
}

function showSlides2(n) {

  var slides = document.getElementsByClassName("mySlides2");
  var dots = document.getElementsByClassName("dot");
  var size = slides.length;

  if ((n+1) > size) {
    slideIndex2 = 0; n = 0;
  }else if (n < 0) {
    slideIndex2 = (size-1);
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
//Next/previous controls
function moveSlides3(n) {
  slideIndex3 = slideIndex3 + n
  showSlides3(slideIndex3);
}

function showSlides3(n) {

  var slides = document.getElementsByClassName("mySlides3");
  var dots = document.getElementsByClassName("dot");
  var size = slides.length;

  if ((n+1) > size) {
    slideIndex3 = 0; n = 0;
  }else if (n < 0) {
    slideIndex3 = (size-1);
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
//Next/previous controls
function moveSlides4(n) {
  slideIndex4 = slideIndex4 + n
  showSlides4(slideIndex4);
}

function showSlides4(n) {

  var slides = document.getElementsByClassName("mySlides4");
  var dots = document.getElementsByClassName("dot");
  var size = slides.length;

  if ((n+1) > size) {
    slideIndex4 = 0; n = 0;
  }else if (n < 0) {
    slideIndex4 = (size-1);
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
//Next/previous controls
function moveSlides5(n) {
  slideIndex5 = slideIndex5 + n
  showSlides5(slideIndex5);
}

function showSlides5(n) {

  var slides = document.getElementsByClassName("mySlides5");
  var dots = document.getElementsByClassName("dot");
  var size = slides.length;

  if ((n+1) > size) {
    slideIndex5 = 0; n = 0;
  }else if (n < 0) {
    slideIndex5 = (size-1);
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
//Next/previous controls
function moveSlides6(n) {
  slideIndex6 = slideIndex6 + n
  showSlides6(slideIndex6);
}

function showSlides6(n) {

  var slides = document.getElementsByClassName("mySlides6");
  var dots = document.getElementsByClassName("dot");
  var size = slides.length;

  if ((n+1) > size) {
    slideIndex6 = 0; n = 0;
  }else if (n < 0) {
    slideIndex6 = (size-1);
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
<div id="ccc" style="background-color: rgb(242, 169, 0);">

            <div id="jk" style="color: rgb(55, 58, 54);">이용안내</div><br><br><br>
            <ul>
       <li class="menuG">
           <a><div id="a9">이용권 구매 안내</div></a>
           <ul class="hide">
               <br>
               <li id="gu">1. 메인페이지에서 상단바 클릭, 이용권 구매 클릭<br>2. 정기권을 원하면 정기권 티켓 클릭, 일일권을 원하면 일일권 티켓 클릭 한 후 정기권(일일권)종류 선택에서 이용하고 싶은 시간을 선택</li>
               <li>
    <div class="slideshow-container">

      <!-- Full-width images with number and caption text -->
      <div class="mySlides1 fade">
        <div class="numbertext">1 / 3</div>
        <img src="${root}resources/images/이구1.png" >
         
      </div>

      <div class="mySlides1 fade">
        <div class="numbertext">2 / 3</div>
        <img src="${root}resources/images/이구2.png" >
         
      </div>

      <div class="mySlides1 fade">
        <div class="numbertext">3 / 3</div>
        <img src="${root}resources/images/이구3.png">
         
      </div>
 
      <!-- Next and previous buttons -->
      <a class="prev" onclick="moveSlides1(-1)">&#10094;</a>
      <a class="next" onclick="moveSlides1(1)">&#10095;</a>
    </div>
    <br/>

</li>
</ul>
</li>
<hr width="800px" color="gray">




    <li class="menuG">
        <a><div id="a9">문의게시판 서비스</div></a>
        <ul class="hide">
            <br>
            <li li id="gu">1. 메인페이지에서 문의게시판 클릭<br> 2. 문의게시판에서 글쓰기 클릭하면 문의게시글 작성으로 넘어간다.<br>3. 문의게시글 작성 페이지를 작성 한 후 등록하면 글이 등록되고
              문의게시판에 업로드되어 확인해 볼 수 있다.<br>4. 문의게시글에 미처 쓰지 못한 말이나 운영자의 답변에 더 궁금한게 있을 시 댓글쓰기를 이용할 수 있다.</li>
            <li>
<div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides2 fade">
    <div class="numbertext">1 / 2</div>
    <img src="${root}resources/images/문의게시판.png"  >
     
  </div>

  <div class="mySlides2 fade">
    <div class="numbertext">2 / 2</div>
    <img src="${root}resources/images/문의2.png"  >
     
  </div>

  <!-- Next and previous buttons -->
  <a class="prev" onclick="moveSlides2(-1)">&#10094;</a>
  <a class="next" onclick="moveSlides2(1)">&#10095;</a>
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
</li>
<hr width="800px" color="gray">


    <li class="menuG">
        <a><div id="a9">자유게시판 서비스</div></a>
        <ul class="hide">
            <br>
            <li li id="gu">1. 메인페이지에서 자유게시판 클릭<br> 2. 자유게시판에서 글쓰기를 클릭하면 자유게시글 작성으로 넘어간다.<br>3. 자유게시글 작성 페이지를 작성 한 후 등록하면 글이 등록되고
              자유게시판에 업로드되어 확인해 볼 수 있다.<br>4. 자유게시글에 미처 쓰지 못한 말이나 운영자의 답변에 더 궁금한게 있을 시 댓글쓰기를 이용할 수 있다.</li>
            <li>
<div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides3 fade">
    <div class="numbertext">1 / 4</div>
    <img src="${root}resources/images/자게3.png"  >
    
  </div>

  <div class="mySlides3 fade">
    <div class="numbertext">2 / 4</div>
    <img src="${root}resources/images/자게1.png"  >

  </div>

  <div class="mySlides3 fade">
    <div class="numbertext">3 / 4</div>
    <img src="${root}resources/images/자게2.png"  >

  </div>

  <div class="mySlides3 fade">
    <div class="numbertext">4 / 4</div>
    <img src="${root}resources/images/자게4.png"  >

  </div>

  <!-- Next and previous buttons -->
  <a class="prev" onclick="moveSlides3(-1)">&#10094;</a>
  <a class="next" onclick="moveSlides3(1)">&#10095;</a>
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
</li>
<hr width="800px" color="gray">




  <li class="menuG">
      <a><div id="a9">테마코스 안내</div></a>
      <ul class="hide">
          <br>
         
          <li>
<div class="slideshow-container">

<!-- Full-width images with number and caption text -->
<div class="mySlides4 fade">
  <div class="numbertext">1 / 2</div>
  <img src="${root}resources/images/테마1.png"  >
   
</div>

<div class="mySlides4 fade">
  <div class="numbertext">2 / 2</div>
  <img src="${root}resources/images/테마2.png"  >
   
</div>

<!-- Next and previous buttons -->
<a class="prev" onclick="moveSlides4(-1)">&#10094;</a>
<a class="next" onclick="moveSlides4(1)">&#10095;</a>
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
</li>
<hr width="800px" color="gray">




  <li class="menuG">
      <a><div id="a9">마이페이지 안내</div></a>
      <ul class="hide">
          <br>
       
          <li>
<div class="slideshow-container">

<!-- Full-width images with number and caption text -->
<div class="mySlides5 fade">
  <div class="numbertext">1 / 4</div>
  <img src="${root}resources/images/마이페이지1.png"  >
   
</div>

<div class="mySlides5 fade">
  <div class="numbertext">2 / 4</div>
  <img src="${root}resources/images/마이페이지2.png"  >
   
</div>

<div class="mySlides5 fade">
  <div class="numbertext">3 / 4</div>
  <img src="${root}resources/images/마이페이지3.png"  >
   
</div>

<div class="mySlides5 fade">
  <div class="numbertext">4 / 4</div>
  <img src="${root}resources/images/마이페이지4.png"  >
   
</div>

<!-- Next and previous buttons -->
<a class="prev" onclick="moveSlides5(-1)">&#10094;</a>
<a class="next" onclick="moveSlides5(1)">&#10095;</a>
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
</li>
<hr width="800px" color="gray">




  <li class="menuG">
      <a><div id="a9">위치찾기, 반납, 대여 서비스 안내</div></a>
      <ul class="hide">
          <br>
       
          <li>
<div class="slideshow-container">

<!-- Full-width images with number and caption text -->
<div class="mySlides6 fade">
  <div class="numbertext">1 / 3</div>
  <img src="${root}resources/images/위치찾기.png"  >
   
</div>

<div class="mySlides6 fade">
  <div class="numbertext">2 / 3</div>
  <img src="${root}resources/images/대여.png"  >
   
</div>


<div class="mySlides6 fade">
  <div class="numbertext">3 / 3</div>
  <img src="${root}resources/images/반납.png"  >
   
</div>
<!-- Next and previous buttons -->
<a class="prev" onclick="moveSlides6(-1)">&#10094;</a>
<a class="next" onclick="moveSlides6(1)">&#10095;</a>
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
</li>
</ul>
    </div>
</section>     
    <jsp:include page="footer.jsp"/>
   
</body>
</html>