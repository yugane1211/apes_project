<%@page import="com.spring.beans.BoardPages"%>
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
       }
       #c{
           margin-left: 30px;
           font-size: 3em;
          
           margin-top: -70px;
           font-family: 'Black Han Sans', sans-serif;
       }
   
   
   .menu-trigger {
     margin-right: 70px;
     margin-bottom: 50px;
     position: relative;
     width: 50px;
     height: 44px;
   }
   .menu-trigger,
   .menu-trigger span {
     display: inline-block;
     transition: all .4s;
     box-sizing: border-box;
   }
    header{margin: 0; height: 100px;}
   section{width: 100%; height: auto;}
   
   .menu-trigger span {
     position: absolute;
     left: 0;
     width: 100%;
     height: 4px;
     background-color: rgb(55, 58, 54);
     border-radius: 4px;
     margin-left: 1450px;
     margin-top: 30px;
     
   }
   
   .menu-trigger span:nth-of-type(1) {
     top: 10px;
   }
   
   .menu-trigger span:nth-of-type(2) {
     top: 20px;
   }
   
   .menu-trigger span:nth-of-type(3) {
       top: 30px;
     bottom: 0;
   }
   
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
       margin-left: 13.5%;
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
       	left:-43%;  
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
   </style>
</head>
<body>
<% BoardPages pages=(BoardPages)request.getAttribute("pages");//페이지 작업을 한 숫자들을 저장한 빈을 pages라는 속성으로 저장했었는데, 이걸 가져오는 코드
	int number=pages.getContent_num();//화면에 띄울 글 번호 
%>
<c:set var="url" value="/board/freedom"/>
<br>
<header style="height:130px;">
	<jsp:include page="../hammenu.jsp">
		<jsp:param value="${url }" name="url"/>
	</jsp:include>
</header> 
<section>
        <div id="ccc" style="background-color: rgb(234, 170, 0);">
        <div id="ii">자유게시판</div><br><br>
          <img src="${root }resources/images/board02.jpg"><br>
          <select id="setPageSize" onchange="location.href=this.value"><!-- 선택을 했을 때 바로 실행 -->
          	  <option selected="selected">페이지당 글 수</option>	
              <option value="freedom?pageSize=5">5개</option>
              <option value="freedom?pageSize=10">10개</option>
              <option value="freedom?pageSize=15">15개</option>
          </select>
<br><br>
          <table border="1">
           <tr><th id="c3">글 번호</th><th id="c4">제목</th><th id="c5" style="background-color: rgb(55, 58, 54); color: rgb(234, 170, 0);">작성자</th><th id="c5" style="background-color: rgb(55, 58, 54); color: rgb(234, 170, 0);">날짜</th></tr>
           <tr><th id="c5">공지</th><td id="c6" style="color: blue;"><a href="notice">게시글 작성 전 주의사항</a></td><td id="c5">운영자</td><td id="c5">21.05.10</td></tr>
           
           <c:forEach var="readboard" items="${list }">
           		<tr>
	           		<th><%= number-- %></th>
	           		<td><a href="read?post_num=${readboard.post_num }">${readboard.post_sub }&nbsp;&nbsp;[${readboard.replyCount }]</a></td>
	           		<td id="c5">${readboard.user_nickname}</td>
	           		<td id="c5">${readboard.post_date }</td>
           		</tr>
           </c:forEach>
          </table>
          <input type="button" onclick="location.href='fdwrite'" value="글쓰기" id="d2">
          
          <p align="center" id="pageidx"><%	
			if(pages.getStartPage()>10){
				%><a href="freedom?pageNum=<%=pages.getStartPage()-10 %>" id="d5">[이전]</a>&nbsp;
				<%
			}
			for(int i=pages.getStartPage();i<=pages.getEndPage();i++){
				%><a href="freedom?pageNum=<%=i %>" id="d5">[<%= i%>]</a>&nbsp;
				<%
			}
			if(pages.getEndPage()<pages.getPageCount()){
				%><a href="freedom?pageNum=<%=pages.getStartPage()+10 %>" id="d5">[다음]</a>&nbsp;
				<%
			}
		
	%>
	</p>
       
<br>
<br>

</div>
</section>
<jsp:include page="../footer.jsp"/>
</body>
</html>