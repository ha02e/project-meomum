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
	<div class="jumbotron bg-transparent text-dark text-center mb-4">
		<h1 class="mb-0">공지사항</h1>
	</div>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<table class="table table-bordered table-hover">
					<thead class="thead-light">
						<tr>
							<th scope="col">번호</th>
							<th scope="col">제목</th>
							<th scope="col">카테고리</th>
							<th scope="col">작성자</th>
							<th scope="col">등록일</th>
							<th scope="col">조회</th>
						</tr>
					</thead>
					<tbody>
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
										<c:url var="contentUrl" value="ntcContent.do">
											<c:param name="ntc_idx" value="${lists.ntc_idx}" />
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
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>