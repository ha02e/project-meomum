<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>공지사항 본문</h1>
<table>
<c:if test="${empty list}">
	<tr>
		<td colspan="5"></td>	
	</tr>
</c:if>
<c:forEach var="list" items="${list}">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일</th>
		<th>이미지</th>
	</tr>
	<tr>
		<td>${list.ntc_idx}</td>
		<td>${list.ntc_title}</td>
		<td>관리자</td>
		<td>${list.ntc_date}</td>
		<td><img src="/meomum/ntcImages/${list.ntc_img}"> </td>
	</tr>
</c:forEach>	
</table>
</body>
</html>