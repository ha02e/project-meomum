<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>구독상품</h1>
	<c:if test="${empty list }">
	구독한 상품이 없습니다.
	</c:if>
	<c:forEach var="list" items="${list }">
	<ul>
		<li>구독시작일:${list.sub_start}</li>
	</ul>
	</c:forEach>
</body>
</html>