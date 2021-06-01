<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
          <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시글 읽기</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
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
	height: 40px;
	width:50px;
	position:relative;
	right:-6.1%;
	bottom:0%;
}

#c7 {
	width: 50px;
	margin-left: 17px;
	position:relative;
	right:-4.7%;
	bottom:0%;
}
#c8{
	position:relative;
	right:-4.4%;
	bottom:0%;
}


button {
	height: 40px;
	margin-right: 10px;
	color: rgb(234, 170, 0);
	background-color: rgb(55, 58, 54);
	border-radius: 3px;
}

table {
	border: 2px solid rgb(55, 58, 54);
	border-collapse: collapse;
	margin-left: 23.7%;
	margin-top: 25px;
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
	text-align:center;
}

#g2 {
	width: 250px;
	height: 40px;
	text-indent: 20px;
}

#g3 {
	width: 250px;
	height: 40px;
	text-indent:20px;
}

#g4 {
	width: 100%;
	height: inherit;
	position:relative;
}


#gg {
	text-align: center;
	text-decoration: underline;
}

#h1, #h2 {
	width: 90px;
	height: 60px;
	text-align:center;
}

#ii{text-align: center; font-size: 2em; font-family: 'Noto Sans KR', sans-serif; color: rgb(55, 58, 54); font-weight: bold; margin-bottom:15px;}
#rep{
	text-indent:20px;
	font-size:1.2em;
	height:50px;
}

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
	top:0px;
	left:0px;
	margin-left:0px;
	width:650px;
	height:360px;	
}
#repcont{
	text-indent:20px;
}
#repcont>span{
	font-size:0.8em;
}
#content{
	vertical-align: middle;
}
</style>
</head>
<body>
<script type="text/javascript">
function deleteCheck(){
	var conf=confirm("정말로 삭제하시겠습니까?");
	if(conf==true){
		location.href='deleteProc?postNum=${board.post_num }&userId=${user.user_id }&postId=${board.user_id }';
	}
}
	
</script>
<c:set var="url" value="/board/read"/>
<br>
<header style="height:130px;">
<jsp:include page="../hammenu.jsp">
	<jsp:param value="${url }" name="url"/>
</jsp:include>
</header>
<section>
<div id="ccc" style="background-color: rgb(234, 170, 0);">
 
        <div id="ii">게시글 읽기</div>
			<img src="${root }resources/images/board01.jpg"><br>
		<table border="1">
			<tr>
				<td id="g" colspan="4" rows="3">${board.post_sub}</td>
			</tr>
			<tr>
				<td id="g1">작성자</td>
				<td id="g2">${board.user_nickname}</td>
				<td id="g1">작성일</td>
				<td id="g3">${board.post_date}</td>
			</tr>
			<tr>
				<td id="g4" colspan="4"><img src="${root }resources/upload_images/${board.post_img }" width="200" height="150"><br><span id="incontent">${board.post_content}</span></td>
			</tr>

			<tr>
				<td colspan="4" id="rep">댓글보기</td>
			</tr>
			<c:forEach var="replyboard" items="${reply}">
			<tr>
			
				<td id="h1">${replyboard.user_nickname}<br>
				</td>
				<td colspan="3" rows="2" id="repcont">${replyboard.re_content}&nbsp;&nbsp;<span>${replyboard.re_date }</span><br>
				</td>
			
			</tr>
			</c:forEach>
			<tr>
			
				<td id="h2">${user.user_nickname}</td>
				<td colspan="3" rows="2"><form action="writeReply" method="post">
					<textarea id="content" name="re_content" cols="80" rows="2" style="background-color: transparent;"></textarea>
					<input type="hidden" name="post_num" value="${board.post_num }">
					<button id="button" type="submit">댓글쓰기</button>
					<c:if test="${user.user_login==false }">
						<script type="text/javascript">
							var con=document.getElementById("content");
							con.innerHTML="로그인 후에 입력하세요.";
							$("#content").attr("readonly", true);
							var button=document.getElementById("button");
							button.disabled=true;
						</script>
					</c:if>
					
					
					
					</form>
				</td>
			
			</tr>
		</table>
		<button id="c6" onclick="location.href='fdupdate?post_num=${board.post_num}&userId=${user.user_id }&postId=${board.user_id }'">수정</button>
		<button id="c7" onclick="deleteCheck()">삭제</button>

		<button id="c8" onclick="history.go(-1);">돌아가기</button><!-- 이쪽 주소 수정 -->


	</div>
	</section>
	<jsp:include page="../footer.jsp"/>
</body>
</html>