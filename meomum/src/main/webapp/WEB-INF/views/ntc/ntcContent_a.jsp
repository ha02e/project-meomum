<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- App CSS -->
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<!-- 관리자헤더 css -->
<link rel="stylesheet" href="assets/css/style.min_review_a.css">
<!-- 관리자후기관리 css -->
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">
</head>
<body>
	<%@include file="/WEB-INF/views/header_a.jsp"%>
	<div class="container mt-5">
		<h1 class="display-5 mb-3">공지사항 본문</h1>
		<div class="mb-3">
			<a href="/meomum/ntcList_a.do" class="text-decoration-none">공지사항
				&gt;</a>
		</div>
		<form action="ntcUpdateForm.do" method="post">
			<c:choose>
				<c:when test="${empty list}">
					<div>삭제되었거나 존재하지 않는 게시글입니다.</div>
				</c:when>
				<c:otherwise>
					<table class="table table-bordered">
						<tr>
							<th class="w-25">번호</th>
							<td>${list.ntc_idx}</td>
							<!--- 수정버튼 클릭 시 전달되는 파라미터 --->
							<input type="hidden" name="ntc_idx" value="${list.ntc_idx}">
							<!--- 수정버튼 클릭 시 전달되는 파라미터 끝 --->
							<th class="w-25">작성일</th>
							<td>${list.ntc_date}</td>
						</tr>
						<tr>
							<th class="w-25">작성자</th>
							<td>관리자</td>
							<th class="w-25">카테고리</th>
							<td>${list.ntc_ctg}</td>
						</tr>
						<tr>
							<th colspan="3" class="w-25">제목</th>
							<td>${list.ntc_title}</td>
						</tr>
						<c:if test="${not empty list.ntc_img}">
							<tr>
								<td colspan="4" style="text-align: center;"><img
									src="/meomum/ntcImages/${list.ntc_img}" class="img-fluid"></td>
							</tr>
						</c:if>
						<tr>
							<td colspan="4" style="text-align: center;">${list.ntc_content}</td>
						</tr>

					</table>
				</c:otherwise>
			</c:choose>
			<c:if test="${not empty list}">
				<div class="text-end mt-3">
					<a href="/meomum/ntcContentDel.do?ntc_idx=${list.ntc_idx}"><input
						type="button" class="btn btn-outline-danger me-2" value="삭제"></a>
					<input type="submit" class="btn btn-outline-primary" value="수정">
				</div>
			</c:if>


		</form>
		<%@include file="/WEB-INF/views/footer_a.jsp"%>
</body>
</html>