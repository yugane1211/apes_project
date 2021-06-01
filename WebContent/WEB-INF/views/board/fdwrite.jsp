<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    #c{
        margin-left: 30px;
        font-size: 3em;
       
        margin-top: -90px;
        font-family: 'Black Han Sans', sans-serif;
    }


img{
    margin-left: 360px;
    width: 800px;
    height: 300px;
  
}

table{
    border: 2px solid rgb(55, 58, 54);
    border-collapse: collapse;
    margin-left: 355px;
    margin-top: 30px;
    font-family: 'Noto Sans KR', sans-serif; 
    font-weight: bold;
}
#d1{
    margin-left: 1100px;
  margin-top: -40px;
    font-size: 1.5em;
    font-family: 'Noto Sans KR', sans-serif; 
}

#a3{
	text-decoration: none;
}
    #c1{
  height: 50px;
  color: rgb(234, 170, 0);
        background-color: rgb(55, 58, 54);
        font-size: 20px;
        text-align:center;
    }
    #c2,#c4{
        padding-left: 60px;
        padding-right: 20px;
    }
    #c3{
        padding-left: 40px;
        padding-right: 40px;
        font-size: 16px;
        height: 60px;
    }

    #c4{
        height: 40px;
        font-size: 17px;
        
    }
    #c2{
        height: 300px;
        font-size: 17px;
    }

    #c5{
       float: left;
    }
 
    div>button{
        height: 40px;
        margin-right: 10px;
        color: rgb(234, 170, 0);
        background-color: rgb(55, 58, 54);
        
    }
  
  textarea{
   margin-top: -14px;
      margin-bottom: -10px;
     border: transparent;
  }
  #che{ font-size: 1.9em;  font-family: 'Noto Sans KR', sans-serif; 
  color: rgb(55, 58, 54); text-align: center; font-weight: bold;}
   
   button{
    color: rgb(234, 170, 0);
        background-color: rgb(55, 58, 54);
        border-radius: 3px;
   }
   [type=text]{
       width: 620px;
       height: 28px;
       border-color: transparent;
   }
   input[type=button]{ height: 40px; padding-left: 10px; padding-right: 10px; font-size: 15px; margin: 10px;}
 #sub{height: 40px; padding-left: 10px; padding-right: 10px; font-size: 15px; margin: 10px;}
   #c6{
        margin-left: 650px;
        margin-top: 20px;
        height: 40px; padding-left: 10px; padding-right: 10px; font-size: 15px;
       
    } 
 #imgUpload{
	position:absolute;
	bottom:9.5%;
	right:50%; 
 
 }
  #buttons{
  display:inline-block;
	position:relative;
	bottom:-7%;
	right:-19%; 
 
 }

   
</style>
</head>
<body>
<c:set var="url" value="/board/fdwrite"/>
<br>
 <header style="height:130px;">
<jsp:include page="../hammenu.jsp">
		<jsp:param value="${url }" name="url"/>
</jsp:include>
</header>
<section>
    <div id="ccc" style="background-color: rgb(234, 170, 0);">

        <div id="che">게시글 작성</div>
        <br>
          <img src="${root }resources/images/board04.jpg"><br>
          <form action="pictureUpload" method="post" enctype="multipart/form-data"> <input name="path_img" type="file" id="imgUpload"/><button type="submit" id="imgUpload">첨부</button></form>
          <form action="fdinsert" method="post">
          <table border="1">
              <tr><td style=" background-color: rgb(55, 58, 54);" id="c1" colspan="2">글 작성</td></tr>
              <tr><td id="c4">제목</td><td><input type="text" name="post_sub" style="background-color: transparent;"/>    </td></tr>
              <tr><td id="c2">본문</td><td><textarea name="post_content" cols="90" rows="19" style="background-color: transparent;"></textarea> </td></tr>
              <tr><td id="c3">사진첨부</td><td></td></tr>
          </table>
          
          <input type="hidden" name="user_id" value="${sessionScope.user_id }"/>
          <div id="buttons">
          <button id="c6" type="button" onclick="location.href='freedom'">뒤로가기</button>
			<button type="button" onclick="location.href='fdwrite'" style="margin-right:0px;">초기화</button>
			<button type="submit" id="sub">등록</button>
		 </div>
          </form>
          </div>
</section>
<jsp:include page="../footer.jsp"/>


</body>
</html>