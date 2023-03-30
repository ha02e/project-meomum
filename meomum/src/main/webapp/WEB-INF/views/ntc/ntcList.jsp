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
	<h1>공지사항</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회</th>
		</tr>
		<c:if test="${empty lists}">
			<tr>
				<td colspan="5">등록된 게시글이 없습니다.</td>
			</tr>
		</c:if>
		<c:forEach var="lists" items="${lists}">
			<tr>
				<td>${lists.ntc_idx}</td>
				<c:url var="contentUrl" value="ntcContent.do">
					<c:param name="ntc_idx">${lists.ntc_idx}</c:param>
				</c:url>
				<td><a href="${contentUrl }">${lists.ntc_title}</a></td>
				<td>관리자</td>
				<td>${lists.ntc_date}</td>
				<td>${lists.ntc_viewCnt}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>