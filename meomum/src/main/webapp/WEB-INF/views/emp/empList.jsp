<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>모든 사원 내역</h1>
<table border="1" width="550" cellspacing="0">
	<thead>
		<th>사원번호</th>
		<th>사원이름</th>
		<th>E-mail</th>
		<th>부서명</th>
	</thead>
	<tbody>
		<c:if test="${empty dtos}">
			<tr>
				<td colspan="4" align="center">
				등록된 사원이 없습니다.
			</td>
		</c:if>
		<c:forEach var="dtos" items="${dtos}">
			<tr>
				<td>${dtos.idx}</td>
				<td>${dtos.name}</td>
				<td>${dtos.email}</td>
				<td>${dtos.dept}</td>
			</tr>
		</c:forEach>
	</tbody>

</table>
</body>
</html>