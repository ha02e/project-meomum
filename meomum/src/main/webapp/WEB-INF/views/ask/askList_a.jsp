<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>간단문의 관리하기</title>
<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">

<!-- App CSS -->
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">

</head>
<body>
	<%@include file="/WEB-INF/views/header_a.jsp"%>
	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container pt-5">
				<h1 class="text-center mb-4">간단문의 게시글 관리 </h1>
				<div class="row justify-content-center mb-3">
					<div class="col-md-6">
						<div class="input-group">
							<input type="text" class="form-control" placeholder="전체 사용자 검색">
							<button class="btn btn-primary" type="button">검색</button>
						</div>
					</div>
					<table class="table table-striped table-hover table-sm text-center">
						<thead>
							<tr>
								<th scope="col" style="width: 10%;">No.</th>
								<th scope="col" style="width: 45%;">제목</th>
								<th scope="col" style="width: 15%;">작성자</th>
								<th scope="col" style="width: 15%;">진행상태</th>
								<th scope="col" style="width: 15%;">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty lists}">
								<tr>
									<td colspan="5" class="text-center">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="ask" items="${lists}">
								<tr>
									<td>${ask.ask_idx}</td>
									<c:url var="askContentUrl" value="askContent_a.do">
										<c:param name="ask_idx">${ask.ask_idx }</c:param>
									</c:url>
									<td align="left"><a href="${askContentUrl}">
											${ask.ask_title} <c:if test="${ask.newicon}">
												<img src="/meomum/images/icon/icon_new.png" alt="new"
													style="">
											</c:if>
									</a></td>
									<td>${ask.ask_writer}</td>
									<td><c:if test="${ask.ask_ask>0}">
											<button type="button"
												class="btn btn-success btn-sm align-middle disabled">답변완료</button>
										</c:if> <c:if test="${ask.ask_ask==0}">
											<button type="button"
												class="btn btn-outline-danger btn-sm align-middle disabled">진행중</button>
										</c:if></td>

									<td>${ask.ask_date}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>

				<nav class="d-flex justify-content-between align-items-center">
					<div
						class="col-12 justify-content-center align-items-start text-center">
						<span class="pagination pagination-sm justify-content-center">
							${pageStr} </span>
					</div>
				</nav>
				</div>
			</div>
		</div>
	</div>







	<%@include file="/WEB-INF/views/footer_a.jsp"%>
	
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
</body>
</html>