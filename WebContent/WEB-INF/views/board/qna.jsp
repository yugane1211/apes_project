<%@page import="com.spring.beans.BoardPages"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>문의게시판</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous"></script> 
<link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
   <style>
   body{background-color: rgb(242, 169, 0); margin:8px 0 0 0;}
#ccc{
	display: inline-block;  
	width: 100%;
	height: inherit;
	margin: -10px;
	position: relative;
	background-size: cover;
	padding-bottom:50px;
}
       #c{
           margin-left: 30px;
           font-size: 3em;
          
           margin-top: -70px;
           font-family: 'Black Han Sans', sans-serif;
       }
   header{margin: 0; height: 100px;}
   section{width: 100%; height: auto;}

   
   img{
       margin-left: 370px;
       width: 800px;
       height: 300px;
      
   }
   #c4{
     padding-left: 310px;
     padding-right: 310px;
     background-color: rgb(55, 58, 54);
       color: rgb(234, 170, 0);
   }
   
   #c3{
       padding-right: 22px;
       padding-left: 22px;
       background-color: rgb(55, 58, 54);
       color: rgb(234, 170, 0);
   }
   #c5{ 
       padding-right: 32px;
       padding-left: 32px;
     
   }
   #c6{
       text-decoration: underline;
   }
   td span{
     font-size: 8px;
    
     text-decoration: underline;
    
   }
   table{
       margin-left: 15.5%;
       border: 2px solid rgb(55, 58, 54);
       border-collapse: collapse;

   }
   #d1{
       margin-left: 1100px;
     margin-top: -40px;
       font-size: 1.5em;
   }
   
   #d2{
       font-size: 1.3em;
       margin-left: 1240px;
       margin-top: 10px;
       position:relative;
       bottom :-1%;
   }
   #pageidx{
		position:relative;
       	bottom :-1%; 
       	left:-40%;  
       	display:inline-block;
   }
   
   
   
   #d5{
       
       margin-left: 10px;
      font-size: 15px;
      text-decoration: underline;

   }
   
   select{
       margin-left: 1200px;
       background-color: rgb(55, 58, 54);
       color: rgb(234, 170, 0);
       height: 30px;
       width: 130px;
   }
   

   #ii{ font-size: 2em; text-align: center; color: rgb(55, 58, 54);  font-family: 'Noto Sans KR', sans-serif; 
   font-weight: bold; }
   
   [type=button]{  background-color: rgb(55, 58, 54);
       color: rgb(234, 170, 0); border-radius: 3px;}
       
/* 자주 하는 질문 */ 
       
   #jk{
    font-family: 'Noto Sans KR', sans-serif; 
    text-align: center;
    font-size: 2em;
    font-weight: bold;
   
}
#d1{
    margin-left: 1100px;
  margin-top: -40px;
    font-size: 1.3em;
    font-family: 'Noto Sans KR', sans-serif; 
}

.menuqna a{cursor:pointer;}
    .menuqna .hide{display:none;}

    li li{
        background-color: rgb(245, 210, 115);
        color: rgb(55, 58, 54);
        border-radius: 5px;
        height: 120px;
        width: 1400px;
        font-family: 'Noto Sans KR', sans-serif;
    font-size: 1.2em;

    }

#a9, #a10, #a11, #a12, #a13, #a14, #a15, #a16, #a17{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 1.5em;
}

#pp, #ppp, #p4, #p5, #p6, #p7, #p8, #p9, #p10 {
	font-weight: bold;
}
#pa{
    font-weight: bold; 
}
li{
    display: inline-block;
}

#jkk{
    background-color: rgb(245, 210, 115);
        color: rgb(55, 58, 54);
        border-radius: 5px;
        height: 200px;
        width: 1400px;
        font-family: 'Noto Sans KR', sans-serif;
    font-size: 1.2em;
}

#jks{ background-color: rgb(245, 210, 115);
        color: rgb(55, 58, 54);
        border-radius: 5px;
        height: 169px;
        width: 1400px;
        font-family: 'Noto Sans KR', sans-serif;
    font-size: 1.2em;}

    #jksr{
        background-color: rgb(245, 210, 115);
        color: rgb(55, 58, 54);
        border-radius: 5px;
        height: 140px;
        width: 1400px;
        font-family: 'Noto Sans KR', sans-serif;
    font-size: 1.2em;
    }    
 
#jksrr {

	height: 200px;

}  
.moom{
	height: 200px;
}    
    #changeChange{
    	position:relative;
    	height:150px;
    	font-family: 'Noto Sans KR', sans-serif;
    }   
#changeChange>button{
   width: 40%;
   height: 85%;
   position: absolute;
   cursor: pointer;
   color: white;
   font-size: 60px;
   font-weight: bold;
   text-shadow: 4px 4px 4px gray;
} 
    #boardButton{
    	left:7%;
    	top:0%;
    	background-size:contain;
    } 
    #frequencyButton{
    	right:7%;
    	top:0%;
    	background-size:contain;
    }   
       
       
   </style>
   <script type="text/javascript">
   // html dom 이 다 로딩된 후 실행된다.
   $(document).ready(function(){
       // menu 클래스 바로 하위에 있는 a 태그를 클릭했을때
       $(".menuqna>a").click(function(){
           var submenu = $(this).next("ul");

           // submenu 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
           if( submenu.is(":visible") ){
               submenu.slideUp();
           }else{
               submenu.slideDown();
           }
       });
   });
  	//두 내용 서로 맞바꾸기
   $(document).ready(function(){
    $("#qnaBoard").show();
    $("#qnaFrequency").hide();

    $("#frequencyButton").click(function(){
        $("#qnaFrequency").show();
        $("#qnaBoard").hide();
          });

    $("#boardButton").click(function(){
        $("#qnaBoard").show();
        $("#qnaFrequency").hide();
    });
});

  	   $(function(){
      var i=0;
       $("#a9").click(function(){
           if(i==0){
               $("#pp").css("color","green");
               i=1;
           }
           else if(i==1){
               $("#pp").css("color","black");
               i=0;
           }
       });
   });

   
   $(function(){
      var i=0;
       $("#a10").click(function(){
           if(i==0){
               $("#ppp").css("color","green");
               i=1;
           }
           else if(i==1){
               $("#ppp").css("color","black");
               i=0;
           }
       });
   })

   
   $(function(){
      var i=0;
       $("#a11").click(function(){
           if(i==0){
               $("#p4").css("color","green");
               i=1;
           }
           else if(i==1){
               $("#p4").css("color","black");
               i=0;
           }
       });
   });

   
   $(function(){
      var i=0;
       $("#a12").click(function(){
           if(i==0){
               $("#p5").css("color","green");
               i=1;
           }
           else if(i==1){
               $("#p5").css("color","black");
               i=0;
           }
       });
   });
   
   $(function(){
      var i=0;
       $("#a13").click(function(){
           if(i==0){
               $("#p6").css("color","green");
               i=1;
           }
           else if(i==1){
               $("#p6").css("color","black");
               i=0;
           }
       });
   });
   $(function(){
		var i=0;
	    $("#a14").click(function(){
	        if(i==0){
	            $("#p7").css("color","green");
	            i=1;
	        }
	        else if(i==1){
	            $("#p7").css("color","black");
	            i=0;
	        }
	    });
	});
	
	$(function(){
		var i=0;
	    $("#a15").click(function(){
	        if(i==0){
	            $("#p8").css("color","green");
	            i=1;
	        }
	        else if(i==1){
	            $("#p8").css("color","black");
	            i=0;
	        }
	    });
	});
	

   </script>

</head>
<body>
<% BoardPages pages=(BoardPages)request.getAttribute("pagesqna");//페이지 작업을 한 숫자들을 저장한 빈을 pages라는 속성으로 저장했었는데, 이걸 가져오는 코드
	int number=pages.getContent_num();//화면에 띄울 글 번호 
%>

       <c:set var="url" value="/board/qna"/>
       <br>
        <header style="height:130px; background-color: rgb(234, 170, 0);">
       <jsp:include page="../hammenu.jsp">
       		<jsp:param value="${url }" name="url"/>
       </jsp:include>
        </header>
        <section>
 <div id="ccc" style="background-color: rgb(234, 170, 0);">
          <div id="changeChange">
          	<button id="boardButton" style="background-image:url(${root }resources/images/img5.jpg)">Q&A</button>
          	<button id="frequencyButton" style="background-image:url(${root }resources/images/img6.jpg)">FAQ</button>
          </div>

          <div id="qnaBoard" style="background-color: rgb(234, 170, 0);">
          <div id="jk" style="color: rgb(55, 58, 54);">문의 게시판</div>
          
          <select id="setPageSize" onchange="location.href=this.value"><!-- 선택을 했을 때 바로 실행 -->
          	  <option selected="selected">페이지당 글 수</option>	
              <option value="qna?pageSize=5">5개</option>
              <option value="qna?pageSize=10">10개</option>
              <option value="qna?pageSize=15">15개</option>
          </select>
<br><br>
          <table border="1">
           <tr><th id="c3">글 번호</th><th id="c4">제목</th><th id="c5" style="background-color: rgb(55, 58, 54); color: rgb(234, 170, 0);">작성자</th><th id="c5" style="background-color: rgb(55, 58, 54); color: rgb(234, 170, 0);">날짜</th></tr>
           <tr><th id="c5">공지</th><td id="c6" style="color: blue;"><a href="faq">게시글 작성 전 주의사항</a></td><td id="c5">운영자</td><td id="c5">21.05.10</td></tr>
           
           <c:forEach var="readboard" items="${listqna}">
           		<c:if test="${sessionScope.userlogin.user_id==readboard.user_id }">
           		<tr>
	           		<th><%= number-- %></th>
	           		<td><a href="read?post_num=${readboard.post_num }">${readboard.post_sub }&nbsp;&nbsp;[${readboard.replyCount }]</a></td>
	           		<td id="c5">${readboard.user_nickname}</td>
	           		<td id="c5">${readboard.post_date }</td>
           		</tr>
           		
           		</c:if>
           
           		<c:if test="${sessionScope.userlogin.user_id!=readboard.user_id }">
           		<tr>
	           		<th><%= number-- %></th>
	           		<td>비밀글입니다.</td>
	           		<td id="c5">******</td>
	           		<td id="c5">${readboard.post_date }</td>
           		</tr>
           		
           		</c:if>
           
           		
           </c:forEach>
          </table>
          <input type="button" onclick="location.href='Qnawrite'" value="글쓰기" id="d2">
          
          <p align="center" id="pageidx"><%	
			if(pages.getStartPage()>10){
				%><a href="qna?pageNum=<%=pages.getStartPage()-10 %>" id="d5">[이전]</a>&nbsp;
				<%
			}
			for(int i=pages.getStartPage();i<=pages.getEndPage();i++){
				%><a href="qna?pageNum=<%=i %>" id="d5">[<%= i%>]</a>&nbsp;
				<%
			}
			if(pages.getEndPage()<pages.getPageCount()){
				%><a href="qna?pageNum=<%=pages.getStartPage()+10 %>" id="d5">[다음]</a>&nbsp;
				<%
			}
		
	%>
	</p>
       </div>
       
       <div id="qnaFrequency" style="background-color: rgb(234, 170, 0);">
        <div id="jk" style="color: rgb(55, 58, 54);">자주하는 질문</div>
 
         				<div>
					<ul>
						<li class="menuqna">
							<a id="a9">
								<div>
									<span id="pp">Q.</span>서비스 이용 자격이 어떻게 되나요?
								</div>
							</a>
							<ul class="hide">
								<li class = moom><br>
								<span style="color: green;" id="pa">A.</span>
								 자전거는 이용자격은 따로 없으나, 킥보드는 아래와 같은 자격 요건이 충당 되어야 합니다.<br>
								 &nbsp;&nbsp;&nbsp;&nbsp;- 현재 만 13세 이상 이용 가능합니다.<br>
 								 &nbsp;&nbsp;&nbsp;&nbsp;- 다만 원동기 면허, 운전 면허가 없으실 경우 보험혜택을 받을 수가 없습니다.<br> 
								 &nbsp;&nbsp;&nbsp;&nbsp;- 원동기 면허 미소지시, 운행 과정에서 부적절한 운행을 하였을 경우, 벌금이 부가가 될 수 있습니다.<br>
								 </li>
							</ul></li>
						<br>
						<br>
						<li class="menuqna"><a id="a10"><div>
									<span id="ppp">Q.</span>서비스 이용은 어디서 가능한가요?
								</div></a>
							<ul class="hide">
								<li id="jkk"><br>
								<span style="color: green;" id="pa">A.</span>
								혹성탈출 모든 대여소에서 이용가능하며,<br>
								&nbsp;&nbsp;&nbsp;&nbsp;대여소내 반납을 원칙으로 하며, 대여소 반납이 아닌 곳에 반납을 하실 경우 패널티가 부가 됩니다.
								</li>
							</ul></li>

						<br>
						<br>
						<li class="menuqna" ><a id="a11"><div>
									<span id="p4">Q.</span>이동수단 사용방법이 궁금합니다.(킥보드)
								</div></a>
							<ul class="hide">
								<li id="jks"><br>
								<span style="color: green;" id="pa">A.</span>					
  								&nbsp;- 전체적인 이용수단 상태 확인 후, 상단 일련번호 입력 후 사용 가능해 집니다.<br>
  								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 한발을 올리고 반대발로 힘차게 밀고 오른쪽 손잡이의 스로틀을 서서히 내려주면 출발 합니다.<br> 
  								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 속도를 줄일때 왼쪽 손잡이 앞 브레이크를 통하여 속도를 줄 일 수 있습니다.<br>
 							    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 운행 종료 후, 대여소에 반납해주세요. (다른 지점에 반납도 가능합니다.)<br><br>						   
 							    
									</li>
							</ul></li>
							
						<br>
						<br>
						<li class="menuqna" ><a id="a15"><div>
									<span id="p8">Q.</span>이동수단 사용방법이 궁금합니다.(자전거)
								</div></a>
							<ul class="hide">
								<li id="jks"><br>
								<span style="color: green;" id="pa">A.</span>
  								&nbsp;&nbsp;- 이용자에 맞춰 안장을 조정 해주세요<br>
  								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 왼쪽 손잡이 브레이크는 앞 바퀴 , 오른쪽은 뒷 바퀴 브레이크 입니다<br>
  								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 오른쪽 손잡이 스로틀을 통해 기어를 조정 할 수 있습니다.<br>
  								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;- 운행 종료 후, 대여소에 반납해주세요. (다른 지점에 반납도 가능합니다.)
				   
									</li>
							</ul></li>

						<br>
						<br>
						<li class="menuqna"><a id="a12"><div>
									<span id="p5">Q.</span>이용도중 긴급 상황이 발생하였습니다. 
								</div></a>
							<ul class="hide">
								<li id="jksr"><br>
								<span style="color: green;" id="pa">A.</span>
								위급한 사항이 발생 시 112나 119에 먼저 연락 부탁드립니다.<br>
  								&nbsp;&nbsp;&nbsp;&nbsp;동시에 혹성탈출 고객 지원 센터에 꼭 연락하여 상황을 알려주시면 저희가 최대한 도와드리겠습니다.
									</li>
							</ul></li>

						<br>
						<br>
						<li class="menuqna"><a id="a13"><div>
									<span id="p6">Q.</span>대여소 설치 요청을 하고 싶어요.
								</div></a>
							<ul class="hide">
								<li id="jksr"><br>
								<span style="color: green;" id="pa">A.</span>
								➀단계: 대여소 개설에 관한 의견 수렴은 해당 구청 담당부서(교통행정과)에서 실시합니다.<br>
   								&nbsp;&nbsp;&nbsp;&nbsp;➁단계: 구청에서 의견수렴을 거쳐 대여소 후보지를 통보하여 주면 공단은 기술적인 가능성여부를 검토후, 최종 후보지를 협의, 선정합니다.<br>
   								&nbsp;&nbsp;&nbsp;&nbsp;➂단계: 최종 후보지에 대하여 다시한번 현장 시민의견 수렴 후  대여소를 최종설치 합니다.
									</li>
							</ul></li>
							
						<br>
						<br>
						<li class="menuqna"><a id="a14"><div>
									<span id="p7">Q.</span>자주가던 대여소가 갑자기 폐쇄 되었어요. 언제 다시 운영하나요?
								</div></a>
							<ul class="hide">
								<li id="jksrr"><br>
								<span style="color: green;" id="pa">A.</span>
								대여소 영구폐쇄가 아닌 임시폐쇄의 경우 추 후, 재개통 됩니다.<br>
								&nbsp;&nbsp;&nbsp;&nbsp;폐쇄기간은 홈페이지 "공지사항"에 게시되어 있습니다. <br>
   								&nbsp;&nbsp;&nbsp;&nbsp;임시폐쇄는 관할 지방자치단체의 행사나 공사등의 사유를 접수받아 진행하므로, <br>
   								&nbsp;&nbsp;&nbsp;&nbsp;공공대여소에서 임시폐쇄기간의 연장, 단축이 불가한점 양해 부탁드립니다. <br>
									</li>
							</ul></li>								
					</ul>

				</div>    
       </div>
</div>
</section>
<jsp:include page="../footer.jsp"/>
</body>