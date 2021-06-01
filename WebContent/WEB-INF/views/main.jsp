<%@page import="com.spring.beans.User"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>혹성탈출</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<style>
       #fontc{color: rgb(55, 58, 54); font-family: 'Noto Sans KR', sans-serif; font-weight: bold;}
        header{margin: 0; height: 100px;}
        .titleM{font-size: 3em; color: rgb(55, 58, 54); font-family: 'Black Han Sans', sans-serif; margin-left: 30px; float: left;}
        #maina{text-decoration: none; color: rgb(55, 58, 54);}
        body{background-color: rgb(242, 169, 0); margin:8px 0 0 0;}
        section{width: 100%; height: 600px;}

        ul{list-style: none; margin-left: 70%; padding: 0;}
        li{margin: 0; padding-left: 30px; border: 0; float: left;}
        a{text-decoration: none;}
        a:link{color: rgb(55, 58, 54);}

        .img{position: absolute; top: 80px; left: 47%; margin: -150px 0 0 -150px;}
        .mainbutton{position: relative; top: 67%; left: -24%; margin: -150px 0 0 -150px;}
        .bu{width: 200px; text-align: center;}
        .bu>button:hover{color:red; cursor:pointer;}
        #b1{width: 70px; height: 70px;}
        button{background-color: #fff; border-color: rgb(55, 58, 54); width: 130px; height: 130px; border-radius: 50%;}

        #show{position: relative; z-index: 5;}
        .left{animation-name: aleft; animation-duration: 4s; animation-delay: 1s; position: absolute; margin: 0%; padding: 0; float: left;
                animation-fill-mode: forwards; width: 1000px; width: 1100px; height:fit-content;}
        .right{animation-name: aright; animation-duration: 4s; animation-delay: 1s; position: absolute; margin-left: 44%; padding: 0; animation-fill-mode: forwards;}

      /* @keyframes aleft{
            from{
                margin-left: 0%;
            }
            to{
                margin-left: -100%;
            }
        }
        @keyframes aright{
            from{
                margin-left: 44%;
            }
            to{
                margin-left: 100%;
                
            }
        }*/
        #escape{animation: abcd 10s linear infinite; transform: 50% 50%;}
        @keyframes abcd{
            100%{
                transform: rotateY(360deg)
            }
        }
    .world{
    	position:relative;
        transform-style: preserve-3d;
        margin-top: 7%;
        top:13%;
        left:2%;
    }

    .escape{
        transform-style: preserve-3d;
        animation: logotext 15s linear infinite;
        margin-left: 48%;
        margin-top: 7%;
        top:23%;
        left:48%;
        font-size: 4em;
        color: white;
    }
    .escape span{
        position: absolute;
        top: 0;
        left: 0;
        transform-origin: center;
        transform-style: preserve-3d;
        padding: 5px ;
        transform: rotateY(calc(var(--a)*calc(360deg/10))) translateZ(200px);
        
    }
    @keyframes logotext{
        0%{
            transform: perspective(1000px) rotateY(360deg) rotateX(15deg) translateY(-30px);
        }
        100%{
            transform: perspective(1000px) rotateY(0deg) rotateX(15deg) translateY(-30px);
        }
    }
</style>

</head>
<body>
		<br>
    <header style="height:130px; z-index:1;">
   		<jsp:include page="hammenu.jsp">
   			<jsp:param value="" name="url"/>
   		</jsp:include>
    </header>

 <section>
        
    <div class="world">
        <div class="img">
            <img src="resources/images/main_logo.png">
        </div>
        <div class="escape titleM">
                <span style="--a:1;">&nbsp;</span>
                <span style="--a:2;">혹</span>
                <span style="--a:3;">성</span>
                <span style="--a:4;">탈</span>
                <span style="--a:5;">출</span>
                <span style="--a:6;">&nbsp;</span>
                <span style="--a:7;">혹</span>
                <span style="--a:8;">성</span>
                <span style="--a:9;">탈</span>
                <span style="--a:10;">출</span>
        </div>   
    </div>
        <table class="mainbutton" id="fontc">
        <tr>
            <td class="bu"><button onclick="location.href='rental/findspot'"><img src="resources/images/location.png" id="b1"><br>위치찾기</button></td>
            <td class="bu"><button onclick="location.href='board/freedom'"><img src="resources/images/edit-pencil.png" id="b1"><br>자유게시판</button></td>
            <td class="bu"><button onclick="location.href='board/qna'"><img src="resources/images/qna.png" id="b1"><br>문의게시판</button></td>
            <td class="bu"><button onclick="location.href='guide'"><img src="resources/images/info.jpg" id="b1"><br>이용안내</button></td>
        </tr>
    </table>
    </section>

    <jsp:include page="footer.jsp"/>






</body>
</html>