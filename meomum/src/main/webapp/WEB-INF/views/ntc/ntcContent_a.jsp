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
	<h1>공지사항 본문</h1>
	<div>
		<a href="/meomum/ntcList_a.do">공지사항></a>
	</div>
	<form action="ntcUpdateForm.do" method="post">
		<!--- 수정버튼 클릭 시 전달되는 파라미터 ---> 
		<input type="hidden" name="ntc_title" value="${list.ntc_title}">
		<input type="hidden" name="ntc_content" value="${list.ntc_content}">
		<input type="hidden" name="ntc_ctg" value="${list.ntc_ctg}"> 
		<input type="hidden" name="ntc_img" value="${list.ntc_img}">
		<!--- 수정버튼 클릭 시 전달되는 파라미터 끝 --->
		<c:choose>
			<c:when test="${empty list}">
				<div>삭제되었거나 존재하지 않는 게시글입니다.</div>
			</c:when>
			<c:otherwise>
				<table border="1">
					<tr>
						<th>번호</th>
						<td>${list.ntc_idx}</td>
						<th>작성일</th>
						<td>${list.ntc_date}</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>관리자</td>
						<th>카테고리</th>
						<td>${list.ntc_ctg}</td>
					</tr>
					<tr>
						<th colspan="3">제목</th>
						<td>${list.ntc_title}</td>
					</tr>
					<c:if test="${not empty list.ntc_img}">
						<tr>
							<td colspan="4"><img src="/meomum/ntcImages/${list.ntc_img}"></td>
						</tr>
					</c:if>
					<tr>
						<td colspan="4">${list.ntc_content}</td>
					</tr>
				</table>
			</c:otherwise>
		</c:choose>
		<c:if test="${not empty list}">
			<div>
				<a href="/meomum/ntcContentDel.do?ntc_idx=${list.ntc_idx}"><input
					type="button" value="삭제"></a> <input type="submit" value="수정">
			</div>
		</c:if>
	</form>
	<%@include file="/WEB-INF/views/footer_a.jsp"%>
</body>
</html>