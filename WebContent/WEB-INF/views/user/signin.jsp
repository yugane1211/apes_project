<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
   <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${root }resources/css/all.css">


    <style>
    body{background-color: rgb(242, 169, 0); margin:8px 0 0 0;}
    section{width: 100%; height: auto; margin-bottom:70px; color: rgb(55, 58, 54); margin-top: 50px;}
    footer{
    	top:750px;
    }
        #aaa{
        display: inline-block;  
     width: 40%;
    height: inherit;
    margin: -50px;
    position: absolute;
    left:50%;
    margin-left:-20%;
 
   background-size: cover;

    }

    #c{
        font-size: 4em;
        text-align: center;
       margin-top: 30px;
        font-family: 'Black Han Sans', sans-serif;
        margin-bottom:50px;
    }
    #a3{
        text-decoration: none;
    }

    #jk{
        font-size: 1.7em;
        matgin-bottom:60px;
       
    }
    #user_id, #user_nickname, #user_password, #user_password2, #user_phone{
        width: 300px;
        height: 40px;
        margin-left: 30px;
        border-radius: 10px;
    }
 p{
     margin-top: -20px;
 }
 #h4{
     margin-left: -28px;
 }
 #h5{
     margin-left: -93px;
 }
#h6{
    margin-left: -29px;
}
#bu1,#bu2{
    background-color: rgb(55, 58, 54);
    color: rgb(234, 170, 0);
    font-size: 1.3em;
    border-radius: 10px;
    width: 130px;
       height: 40px;
       margin-left: 40px;
}
#bu2{
    margin-left: 160px;
}
#bu{
    background-color: rgb(55, 58, 54);
    color: rgb(234, 170, 0);
    margin-left: 20px;
    width: 80px;
       height: 30px;
       border-radius: 10px;
}

    </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
   <script>
	function checkUserIdExist(){
		
		var user_id = $("#user_id").val();
		
		if(user_id.length == 0){
			alert('아이디를 입력해주세요');
			return
			}
		
		
		 if(user_id.indexOf("@") > -1){

				$.ajax({
					url : '${root}user/checkUserIdExist?user_id=' + user_id,
					type : 'post',
					dataType : 'text',
					data:user_id,
					success : function(result){
						if(result.trim()=='true'){
							alert('사용할 수 있는 아이디입니다.');
							$("#idExist").val('true');
							
						}
						else{
							alert('사용할 수 없는 아이디입니다.');
							$("#idExist").val('false');
							
						}
					}
				})
			 
				return		
			}
			else{
				alert("이메일 형식에 맞게 입력하세요.");
			}	
	
	}
</script>
</head>
<body>
<section>
<div id="aaa" style="background-color: rgb(234, 170, 0);">
        <a href="${root }" id="a3"><nav style="color: rgb(55, 58, 54);" id="c">혹성<br>탈출</nav></a>


<form:form action="signin_proc" modelAttribute="usersignin"><!-- action : 경로값이어서 나중에 필요시 바꿀 수 있음 -->
<div id="jk">
<p>아이디 : <form:input path="user_id" placeholder="이메일을 입력하세요"/> <button type="button" onclick="checkUserIdExist()" id="bu">중복확인</button><br>
<form:errors path="user_id" style="color:red;"/></p>
<p>닉네임 : <form:input path="user_nickname"/><br>
<form:errors path="user_nickname" style="color:red;"/></p>
<p id="h4">비밀번호 : <form:password path="user_password" showPassword="true"/><br>
<form:errors path="user_password" style="color:red;"/></p>
<p id="h5">비밀번호 확인 : <form:password path="user_password2" showPassword="true"/><br>
<form:errors path="user_password2" style="color:red;"/></p>
<p id="h6">전화번호 : <form:input path="user_phone"/><br>
<form:errors path="user_phone" style="color:red;"/></p>
<form:hidden path="idExist" />
</div>
<form:button type="submit" id="bu1">회원가입</form:button>
<form:button type="reset" id="bu2">초기화</form:button>
</form:form>
</div>
  </section>
<jsp:include page="../footer.jsp"/>

</body>
</html>