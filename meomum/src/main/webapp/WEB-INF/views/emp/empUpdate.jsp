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
<form name="empUpdate" action="empUpdate.do" method="post">
<fieldset>
<legend>${idx}번 사원 정보 수정</legend>
	<c:if test="${empty empDTO}">
		등록된 사원이 없습니다
	</c:if>
	<!--<c:forEach var="dto" items="${empDTO}">-->
		사원 번호: <input type="text" name="idx" value="${idx}" readonly><br>
		이름:<input type="text" name="name" value="${name}"><br>
		이메일:<input type="text" name="email" value="${email}"><br>
		부서:<input type="text" name="dept" value="${dept}">
	<!-- </c:forEach>-->
	<div>
	<input type="submit" value="수정">
	</div>
</fieldset>
</form>
</body>
</html>