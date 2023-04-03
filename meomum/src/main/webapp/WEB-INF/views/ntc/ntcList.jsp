<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 CSS 파일 추가 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9gVRbX+6ePRepvpODvJy27JQ+wh2StsQJz9TYs2X0Pm6Rc8IljaUksdQRVvoxv3"
	crossorigin="anonymous">
<style>
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://cdn.aitimes.com/news/photo/202210/147215_155199_1614.jpg)
		no-repeat center;
	background-size: cover;
	margin: 0;
	border-bottom: none;
	padding-bottom: 0px;
}

.page-caption {
	padding: 90px 0px;
	position: relative;
	z-index: 1;
	color: #fff;
	text-align: center;
}

.page-title {
	color: #fff;
	font-size: 40px;
	font-weight: 400;
	letter-spacing: -1px;
}
/**헤더 이미지용 끝*/
</style>
<style type="text/css">
.input-group-append ml-2 {
	margin-left: 8px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<!-- 헤더 이미지 넣을때 css도 가져갈것...  -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">공지사항</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container my-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<form action="ntcSerch.do" class="form-inline">
					<div class="input-group">
						<input type="text" name="keyword" id="keyword"
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

	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<table class="table table-bordered table-hover mx-auto">
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
	<div class="container my-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<ul class="pagination justify-content-center">${pageStr}
				</ul>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>