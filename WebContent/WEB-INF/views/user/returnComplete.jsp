<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
              <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
    <c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
alert("반납이 정상적으로 완료되었습니다. 이용해주셔서 감사합니다.");
window.opener.location.href="${pageContext.request.contextPath}";
window.close();
</script>
</body>
</html>