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
<h1>${idx}번 사원 정보</h1>
<table border="1" width="550" cellspacing="0">
	<thead>
		<tr>
			<th>사원번호</th>
			<th>이름</th>
			<th>E-mail</th>
			<th>부서명</th>
		</tr>
	</thead>
	<tbody>
		<c:if test="${empty EmpDTO}">
			<tr>
				<td colspan="4" align="center">등록된 사원이 없습니다</td>
			</tr>
		</c:if>
		<%-- <c:forEach var="dto" items="${dto}"> --%>
			<tr>
				<td>${idx}</td>
				<td>${name}</td>
				<td>${email}</td>
				<td>${dept}</td>
			</tr>
	<%-- 	</c:forEach> --%>
	
	</tbody>

</table>
</body>
</html>