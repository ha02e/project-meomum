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
		url(https://images.unsplash.com/photo-1635321350281-e2a91ecffd00?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2623&q=80)
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

#accordionFlushExample {
	width: 80%;
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
				<form action="ntcList.do" class="form-inline">
					<div class="input-group">
						<input type="text" name="fvalue" id="fvalue" class="form-control"
							placeholder="검색어를 입력하세요">
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
				<div
					class="col-10 d-flex justify-content-between align-items-center mb-3">
					<p class="mb-0" style="font-weight: bold;">
						전체 글 수 : <span id="total-users">${totalCnt}</span>개
						<c:if test="${!empty param.fvalue}"> | <span
								style="color: #FF6A89;"> 검색 내용 : ${param.fvalue } <a
								href="ntcList.do"
								style="color: #FF6A89; border: 1px solid #FF6A89;">검색 취소</a>
							</span>
						</c:if>
					</p>

				</div>

				<div class="table-responsive">
					<table class="table table-hover mx-auto sticky-header">
						<thead class="thead-light text-center">
							<tr>
								<th scope="col" style="width: 10%;">번호</th>
								<th scope="col" style="width: 15%;">카테고리</th>
								<th scope="col" style="width: 35%;">제목</th>
								<th scope="col" style="width: 15%;">작성자</th>
								<th scope="col" style="width: 15%;">등록일</th>
								<th scope="col" style="width: 10%;">조회</th>
							</tr>
						</thead>
						<tbody class="table-group-divider">
							<c:choose>
								<c:when test="${empty lists}">
									<tr>
										<td colspan="6" class="text-center">등록된 게시글이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach items="${lists}" var="lists">
										<c:choose>

											<c:when test="${lists.ntc_ctg == 'FAQ'}">
												<tr>
													<td>&nbsp;</td>
													<td class="text-center" style="vertical-align:middle;">${lists.ntc_ctg}</td>
													<td colspan="4">
														<div class="accordion accordion-flush"
															id="accordion-${lists.ntc_idx}" style="width: 100%;">
															<div class="accordion-item ">
																<span class="accordion-header text-center"
																	style="width: 100%;">
																	<button class="accordion-button collapsed"
																		type="button" data-bs-toggle="collapse"
																		data-bs-target="#collapse-${lists.ntc_idx}"
																		aria-expanded="false"
																		aria-controls="collapse-${lists.ntc_idx}"
																		style="padding-left: 0;">
																		<span class="text-center">${lists.ntc_title}</span>
																	</button>

																</span>
																<div id="collapse-${lists.ntc_idx}"
																	class="accordion-collapse collapse"
																	data-bs-parent="#accordion-${lists.ntc_idx}">
																	<div class="accordion-body">${lists.ntc_content}</div>
																</div>
															</div>
														</div>
													</td>

												</tr>
											</c:when>
											<c:otherwise>
												<tr>
													<td class="text-center">${lists.ntc_idx}</td>
													<c:url var="contentUrl" value="ntcContent.do">
														<c:param name="ntc_idx" value="${lists.ntc_idx}" />
													</c:url>
													<td class="text-center">${lists.ntc_ctg}</td>
													<td><a href="${contentUrl}">${lists.ntc_title}</a></td>
													<td class="text-center">관리자</td>
													<td class="text-center">${lists.ntc_date}</td>
													<td class="text-center">${lists.ntc_viewCnt}</td>
												</tr>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="container my-5">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="pagination justify-content-center">${pageStr}</div>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>