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
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="container mt-4">
		<h1 class="text-center mb-4">공지사항 본문</h1>
		<div class="text-right">
			<a href="/meomum/ntcList.do" class="btn btn-secondary">목록</a>
		</div>
		<hr>
		<c:choose>
			<c:when test="${empty list}">
				<div class="alert alert-danger">삭제되었거나 존재하지 않는 게시글입니다.</div>
			</c:when>
			<c:otherwise>
				<div class="card mb-4">
					<div class="card-header">
						<h5 class="card-title">${list.ntc_title}</h5>
						<p class="card-text">${list.ntc_date}작성</p>
					</div>
					<div class="card-body">
						<table class="table table-bordered">
							<tbody>
								<tr>
									<th>작성자</th>
									<td>관리자</td>
									<th>카테고리</th>
									<td>${list.ntc_ctg}</td>
								</tr>
								<c:if test="${not empty list.ntc_img}">
									<tr>
										<td colspan="4"><img
											src="/meomum/ntcImages/${list.ntc_img}" class="img-fluid"></td>
									</tr>
								</c:if>
								<tr>
									<td colspan="4">${list.ntc_content}</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>