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
alert("�ݳ��� ���������� �Ϸ�Ǿ����ϴ�. �̿����ּż� �����մϴ�.");
window.opener.location.href="${pageContext.request.contextPath}";
window.close();
</script>
</body>
</html>