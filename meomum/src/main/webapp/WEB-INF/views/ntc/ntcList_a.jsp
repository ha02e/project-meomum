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
	<%@include file="/WEB-INF/views/header_a.jsp"%>
	<h1>공지사항</h1>
	<table>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>카테고리</th>
			<th>작성자</th>
			<th>등록일</th>
			<th>조회</th>
		</tr>
		<c:choose>
			<c:when test="${empty lists}">
				<tr>
					<td colspan="6">등록된 게시글이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="lists" items="${lists}">
					<tr>
						<td>${lists.ntc_idx}</td>
						<c:url var="contentUrl" value="ntcContent_a.do">
							<c:param name="ntc_idx">${lists.ntc_idx}</c:param>
						</c:url>
						<td><a href="${contentUrl }">${lists.ntc_title}</a></td>
						<td>${lists.ntc_ctg}</td>
						<td>관리자</td>
						<td>${lists.ntc_date}</td>
						<td>${lists.ntc_viewCnt}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	<div>
		<a href="ntcWrite.do">글쓰기</a>
	</div>
	<%@include file="/WEB-INF/views/footer_a.jsp"%>
</body>
</html>