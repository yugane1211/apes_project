<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�̿�� ����</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous"></script> 
    <link rel="stylesheet" href="${root }resources/css/all.css">
    <link rel="stylesheet" href="${root }resources/css/hammenu.css">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100&display=swap" rel="stylesheet">
<script>
  
  $(document).ready(function(){
      $("#ccc").show();
      $("#cc").hide();

      $("#cl").click(function(){
          $("#cc").show();
          $("#ccc").hide();
         });

          $("#cr").click(function(){
          $("#ccc").show();
          $("#cc").hide();
      });
  });

  $(document).ready(function() {
  $('#selectBox').change(function() {
    var result = $('#selectBox option:selected').val();
    if (result == 'option0') {
      $('#m0').show();
    } else {
      $('#m0').hide();
    }
  }); 
}); 

$(document).ready(function() {
  $('#selectBox').change(function() {
    var result = $('#selectBox option:selected').val();
    if (result == '7,60,3000') {
      $('#m1').show();
    } else {
      $('#m1').hide();
    }
  }); 
}); 

$(document).ready(function() {
  $('#selectBox').change(function() {
    var result = $('#selectBox option:selected').val();
    if (result == '30,60,5000') {
      $('#m2').show();
    } else {
      $('#m2').hide();
    }
  }); 
}); 



$(document).ready(function() {
  $('#selectBox').change(function() {
    var result = $('#selectBox option:selected').val();
    if (result == '7,120,4000') {
      $('#m3').show();
    } else {
      $('#m3').hide();
    }
  }); 
}); 

$(document).ready(function() {
  $('#selectBox').change(function() {
    var result = $('#selectBox option:selected').val();
    if (result == '30,120,7000') {
      $('#m4').show();
    } else {
      $('#m4').hide();
    }
  }); 
}); 



$(document).ready(function() {
  $('#selectBoxs').change(function() {
    var result = $('#selectBoxs option:selected').val();
    if (result == 'option10') {
      $('#n0').show();
    } else {
      $('#n0').hide();
    }
  }); 
}); 


$(document).ready(function() {
  $('#selectBoxs').change(function() {
    var result = $('#selectBoxs option:selected').val();
    if (result == '1,60,1000') {
      $('#n1').show();
    } else {
      $('#n1').hide();
    }
  }); 
}); 

$(document).ready(function() {
  $('#selectBoxs').change(function() {
    var result = $('#selectBoxs option:selected').val();
    if (result == '1,120,2000') {
      $('#n2').show();
    } else {
      $('#n2').hide();
    }
  }); 
}); 


</script>
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
 #cc{
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
       
        margin-top: -100px;
        font-family: 'Black Han Sans', sans-serif;
    }

#a3{
    text-decoration: none;
}


#jk{
    font-family: 'Noto Sans KR', sans-serif; 
    text-align: center;
    font-size: 2.3em;
    font-weight: bold;
    color: rgb(55, 58, 54);
   
}
#d1{
    margin-left: 1100px;
  margin-top: -40px;
    font-size: 1.3em;
    font-family: 'Noto Sans KR', sans-serif; 
    color: rgb(55, 58, 54);
}

#jks{
    font-family: 'Noto Sans KR', sans-serif; 
    font-weight: bold;
    font-size: 1.7em;
   
}
#jksr{
    margin-top: 60px;
    margin-left: 250px;
   
}
#jks1{
    font-family: 'Noto Sans KR', sans-serif; 
    font-weight: bold;
    font-size: 1.7em;
}
#jksr1{
    margin-top: -183px;
    margin-left: 900px;
}
ul{
    margin-left: 200px;
    margin-top: 70px;
    font-family: 'Noto Sans KR', sans-serif; 
    color: rgb(55, 58, 54);
}
select{
    width: 300px;
    height: 40px;
    border-radius: 3px;
    background-color: rgb(55, 58, 54);
    color: rgb(234, 170, 0);
    font-family: 'Noto Sans KR', sans-serif; 
    font-size: 16px;
    font-weight: bold;

}
#qq{
    font-family: 'Noto Sans KR', sans-serif; 
    font-size: 1.2em;
    font-weight: bold;
}
#jm{ margin-left: 200px; margin-top: 60px; position:relative; width: 450px;}

#jm>#kakao {
    position: absolute;
    top: 65%;
    right: 54%;
}
#jm>#npay {
    position: absolute;
    top: 65%;
    right: 30%;
}

#ha{ border: 3px solid rgb(55, 58, 54); width: 400px;
 margin-left: 850px;
 margin-top: -380px; padding-left: 20px; padding-top: 20px; padding-right: 20px; padding-bottom: 20px;
 z-index:2;
 }
 
 #ha>input{
 	z-index:5;
 }

[type=button]{
  background-color: rgb(55, 58, 54);
  color: rgb(234, 170, 0);
  margin-left: 140px;
  font-size: 20px;
  border-radius: 3px;
  font-weight: bold; width: 150px; height: 45px;
}
#m0,#m1,#m2,#m3,#m4,#n0,#n1,#n2{color: green; font-size: 40px; font-weight: bold;}

    #m1,#m2,#m3,#m4,#n1,#n2{display: none;}
    
.kind_image{
	cursor:pointer;
}
.container:nth-of-type(2){
	height:50px;
}

.container:nth-of-type(2) *{
	height:25px;
}


</style>
</head>
<body>
	<c:set var="url" value="/pass/ticket"/>
	<br>
    <header style="height:130px; z-index:1;">
   		<jsp:include page="../hammenu.jsp">
   			<jsp:param value="${url }" name="url"/>
   		</jsp:include>
    </header>
<section>
<form action="/" name="ePay" method="post" style="z-index:-1;">
<input type="hidden" name="user_id" value="${sessionScope.userlogin.user_id }">
<input type="hidden" name="user_nickname" value="${sessionScope.userlogin.user_nickname }">
<input type="hidden" name="user_login" value="${sessionScope.userlogin.user_login }">
<div>
 <div id="ccc" style="background-color: rgb(242, 169, 0);">
       
          <div id="jk">�̿�� ����</div>
          <div id="jksr"><span id="jks">�����</span>
          <br>
          <span style=" color: rgb(55, 58, 54);">1�ð���, 2�ð����� �����Ͻ� �� �ֽ��ϴ�.</span>
          <br><br>
          <img src="${root }resources/images/session.JPG" width="200px" height="100px" class="kind_image" ></div>



          <div id="jksr1"><span id="jks1">���ϱ�</span>
            <br>
            <span style=" color: rgb(55, 58, 54);">1�ð���, 2�ð����� �����Ͻ� �� �ֽ��ϴ�.</span>
            <br><br>
            <img src="${root }resources/images/oneday.JPG" width="200px" height="100px" id="cl" class="kind_image"></div>

            
                <ul>
                <li>1ȸ 1�ž� ���Ű� �����մϴ�.</li>
                <li>�⺻�뿩�ð��� 1�ð���(60��), 2�ð���(120��)�Դϴ�.</li>
                    <li>�ʰ��� 5�и��� �߰����(200��)���ݵ˴ϴ�.</li>
                        <li>����) �⺻ �ʰ� 1�� ~ 5�� : 0��, 6�� ~ 10�� : 200��</li>
                            <li>�߰������ �̿�� ������������ �ڵ������˴ϴ�.</li></ul>
            
                 <div id="jm"><span id="qq">����� ���� ����</span><br><br>
                 <select id="selectBox" name="pass"><!-- selectBox = "7,120" -> split�Լ� ��� -> [7,120] -->
                     <option value="option0" selected="selected" disabled>����</option>
                     <option value="7,60,3000">7��(1�ð���)</option>
                     <option value="30,60,5000">30��(1�ð���)</option>
                     <option value="7,120,4000">7��(2�ð���)</option>
                     <option value="30,120,7000">30��(2�ð���)</option>
                 </select>
                </div>          

                <div id="jm"><span id="qq">���� ������ ����</span><br><br>
                �ſ�/üũī��&nbsp;
                <img src="${root }resources/images/payment_icon_yellow_medium.png" width="70" height="30" id="kakao">&nbsp;
                <img src="${root }resources/images/npay_32.png" width="70" height="30" id="npay">
                </div>

               <div id="ha"><span id="qq">�� �����ݾ�</span><br><br>
               <hr color="rgb(55, 58, 54);"><br>
               <span id="m0">0</span>
               <span id="m1">3000</span>
               <span id="m2">5000</span>
               <span id="m3">4000</span>
               <span id="m4">7000</span>��<br><br>
               <input type="checkbox" name="agree" value="1">�߰� ����ڵ�����, ȯ�ұ���, �̿�����<br>
               �����ϸ� ������ �����մϴ�.(�̿�� ���ȳ�)<br><br>
               <input type="checkbox" name="agree" value="2">�� 13�� �̸��� �̼����ڰ� ���񽺸� �̿���<br>
               �� ���, ���߻� �� ���� ������ ���� �� ���� ��<br>
               �� �������� ������ �� �ֽ��ϴ�.(�� 15�� �̸��� <br>
               ��� ��� ��732���� �ǰ��Ͽ� ��� ���� ���� �Ұ�)<br><br><br><br>
            <input type="button" onclick="creditWindow()" value="�����ϱ�">
            </div>

        </div>

        <div id="cc" style="background-color: rgb(234, 170, 0);">
              <div id="jk">�̿�� ����</div>
              <div id="jksr"><span id="jks">�����</span>
              <br>
              <span style=" color: rgb(55, 58, 54);">1�ð���, 2�ð����� �����Ͻ� �� �ֽ��ϴ�.</span>
              <br><br>
              <img src="${root }resources/images/session.JPG" width="200px" height="100px" id="cr" class="kind_image"></div>
    
    
    
              <div id="jksr1"><span id="jks1">���ϱ�</span>
                <br>
                <span style=" color: rgb(55, 58, 54);">1�ð���, 2�ð����� �����Ͻ� �� �ֽ��ϴ�.</span>
                <br><br>
                <img src="${root }resources/images/oneday.JPG" width="200px" height="100px" class="kind_image" ></div>
    
                
                    <ul>
                    <li>1ȸ 1�ž� ���Ű� �����մϴ�.</li>
                    <li>�⺻�뿩�ð��� 1�ð���(60��), 2�ð���(120��)�Դϴ�.</li>
                        <li>�ʰ��� 5�и��� �߰����(200��)���ݵ˴ϴ�.</li>
                            <li>����) �⺻ �ʰ� 1�� ~ 5�� : 0��, 6�� ~ 10�� : 200��</li>
                                <li>�߰������ �̿�� ������������ �ڵ������˴ϴ�.</li></ul>
                
                     <div id="jm"><span id="qq">���ϱ� ���� ����</span><br><br>
                     <select id="selectBoxs" name="pass">
                         <option value="option10" selected="selected" disabled>����</option>
                         <option value="1,60,1000">����ȸ��(1�ð���)</option>
                         <option value="1,120,2000">����ȸ��(2�ð���)</option>
                     </select> 
                    </div>          
    
                    <div id="jm"><span id="qq">���� ������ ����</span><br><br>
	                �ſ�/üũī��&nbsp;
	                <img src="${root }resources/images/payment_icon_yellow_medium.png" width="70" height="30" id="kakao">&nbsp;
	                <img src="${root }resources/images/npay_32.png" width="70" height="30" id="npay">
	                </div>
                   <div id="ha"><span id="qq">�� �����ݾ�</span><br><br>
                   <hr color="rgb(55, 58, 54);"><br>
                  	<span id="n0">0</span>
               		<span id="n1">1000</span>
               		<span id="n2">2000</span>��<br><br>
                   <input type="checkbox" name="agree" value="1">�߰� ����ڵ�����, ȯ�ұ���, �̿�����<br>
                   �����ϸ� ������ �����մϴ�.(�̿�� ���ȳ�)<br><br>
                   <input type="checkbox" name="agree" value="2">�� 13�� �̸��� �̼����ڰ� ���񽺸� �̿���<br>
                   �� ���, ���߻� �� ���� ������ ���� �� ���� ��<br>
                   �� �������� ������ �� �ֽ��ϴ�.(�� 15�� �̸��� <br>
                   ��� ��� ��732���� �ǰ��Ͽ� ��� ���� ���� �Ұ�)<br><br><br><br>
                <input type="button" onclick="creditWindow()" value="�����ϱ�">
                </div>

            </div>
 </div>
</form>
</section>
<jsp:include page="../footer.jsp"/>
<!-- submit �� �˾�â ���·� -->
<script type="text/javascript">
function creditWindow(){
	var winCre=window.open('about:blank','creditCard','width=600,height=300,left=100,top=100');
	var frm=document.ePay;
	frm.action='/apes_project/pass/ticket_proc';
	frm.target="creditCard";
	frm.submit();
}

</script>


</body>
</html>