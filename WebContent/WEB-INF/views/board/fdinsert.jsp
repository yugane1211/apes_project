<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var='root' value='${pageContext.request.contextPath}/'/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>자유게시판-글쓰기</title>
</head>
<body>
<script type="text/javascript">
	alert("게시글이 등록되었습니다!");
	location.href="${root}board/freedom";

</script>

</body>
</html>