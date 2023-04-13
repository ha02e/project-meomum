<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
<body class="app">
	<%@include file="/WEB-INF/views/header_a.jsp"%>

	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container pt-5">
				<h1 class="text-center mb-4">공지사항</h1>

				<div class="container my-5">
					<div class="row justify-content-center">
						<div class="col-md-8">
							<form action="ntcList_a.do" class="form-inline">
								<div class="input-group">
									<input type="text" name="fvalue" id="fvalue"
										class="form-control" placeholder="검색어를 입력하세요">
									<div class="input-group-append ml-2">
										<button type="submit" class="btn btn-primary"
											style="margin-left: 5px">검색</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
				<p class="mb-0" style="font-weight: bold;">
					전체 글 수 : <span id="total-users">${totalCnt}</span>개
					<c:if test="${!empty param.fvalue}"> | <span
							style="color: #4B4A54;"> 검색 내용 : ${param.fvalue } <a
							href="ntcList_a.do"
							style="color: #FF6A89; border: 1px solid #FF6A89;">검색 취소</a>
						</span>
					</c:if>
				</p>



				<table class="table table-striped text-center">
					<thead >
						<tr>
							<th scope="col" style="width: 10%;">번호</th>
							<th scope="col" style="width: 30%;">제목</th>
							<th scope="col" style="width: 15%;">카테고리</th>
							<th scope="col" style="width: 15%;">작성자</th>
							<th scope="col" style="width: 15%;">등록일</th>
							<th scope="col" style="width: 15%;">조회</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
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
										<td class="text-start"><a href="${contentUrl }">${lists.ntc_title}</a></td>
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



				<div class="text-end">
					<a href="ntcWrite.do" class="btn btn-primary">글쓰기</a>
				</div>





				<div
					class="col-12 justify-content-center align-items-start text-center">
					<span class="pagination pagination-sm justify-content-center">
						${pageStr} </span>
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/views/footer_a.jsp"%>
	</div>







	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>