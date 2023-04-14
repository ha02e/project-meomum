<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://images.unsplash.com/photo-1618221469555-7f3ad97540d6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80)
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

.btn-primary { -
	-bs-btn-color: #fff; -
	-bs-btn-bg: #85745D; -
	-bs-btn-border-color: #85745D; -
	-bs-btn-hover-color: #fff; -
	-bs-btn-hover-bg: #4F4538; -
	-bs-btn-hover-border-color: #4F4538; -
	-bs-btn-focus-shadow-rgb: 49, 132, 253; -
	-bs-btn-active-color: #fff; -
	-bs-btn-active-bg: #FE8A7F; -
	-bs-btn-active-border-color: #FFC1B4; -
	-bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125); -
	-bs-btn-disabled-color: #fff; -
	-bs-btn-disabled-bg: #85745D; -
	-bs-btn-disabled-border-color: #85745D;
}

.users-table table {
	margin-top: 10px;
	width: 100%;
	text-align: left;
	border-collapse: collapse;
	line-height: 1.4;
	letter-spacing: -0.3px;
	color: #555555;
	transition: none;
	background-color: fcfcfc;
}

.users-table-info {
	line-height: 1.4;
	letter-spacing: -0.3px;
	color: #767676;
	height: 48px;
	border-bottom: 1.2px solid #dadbe4;
	font-size: 14px;
}

.users-table-info th {
	color: #333333;
	text-align: center;
	font-size: 0.95rem;
}

.users-table td {
	background-color: #fff;
	border-top: 1px solid #dddddd;
	border-bottom: 1px solid #dddddd;
	padding-top: 15px;
	padding-bottom: 15px;
	font-family: initial;
}

.users-table td:first-child {
	padding-left: 20px;
}

.users-table tbody {
	font-size: 14px;
}

.users-table tbody tr.active td {
	background-color: rgba(47, 73, 209, 0.1);
}

.table-wrapper {
	overflow-x: auto;
	overflow-y: hidden;
	margin-bottom: 20px;
}

tbody {
	background: #eeeeee;
}

.orderNum {
	color: #E6694C;
}

.buttons a {
	color: #fff;
	padding: 0.3rem 0.6rem;
	margin-top: 0.2rem;
	display: inline-block;
	background-color: #fe847d;
}

.buttons a:hover {
	color: #fff;
	background-color: #c1564c;
}

.paging {
	margin: 20px;
}
</style>
<script>
	function showTracker(t_key, t_code, t_invoice) {
		var frmPop = document.getElementById('frmData');
		var url = 'http://info.sweettracker.co.kr/tracking/4';
		window.open(url, 'showTracker', 'width=460,height=600');

		frmPop.action = url;
		frmPop.target = 'showTracker';
		frmPop.t_key.value = t_key;
		frmPop.t_code.value = t_code;
		frmPop.t_invoice.value = t_invoice;
		frmPop.submit();

	}
</script>

</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>

	<!-- 헤더 이미지 시작 -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">주문/배송 내역</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 헤더 이미지 끝 -->

	<section class="shop spad">
		<div class="container">
			<div class="row">
				<%@include file="../myMenu.jsp"%>
				<div class="col-xl-9 col-md-9">
					<!-- ---------- 마이페이지 작업한 파일 페이지 여기에 넣어주세요!!(include) ---------- -->

					<div
						class="row g-3 mb-4 align-items-center justify-content-between">
						<div class="page-utilities">
							<div class="row g-2 justify-content-center align-items-center">
								<div class="col-auto">
									<form class="table-search-form row gx-1 align-items-center">
										<div class="col-auto">
											<input type="text" id="search-orders" name="searchorders"
												class="form-control search-orders"
												placeholder="검색어를 입력해주세요.">
										</div>
										<div class="col-auto">
											<button type="submit" class="btn btn btn-primary">검색</button>
										</div>
									</form>
								</div>
								<!--//col-->
							</div>
							<!--//row-->
						</div>
						<!--//table-utilities-->
					</div>
					<!--//row-->


					<div class="users-table table-wrapper">
						<table class="posts-table">
							<thead>
								<tr class="users-table-info">
									<th style="width: 22%;">주문번호</th>
									<th style="width: 28%;">구독상품</th>
									<th style="width: 20%;">총주문액</th>
									<th style="width: 10%;">주문날짜</th>
									<th style="width: 20%;">상태</th>
								</tr>
							</thead>

							<tbody>
								<c:if test="${empty lists}">
									<tr>
										<td class="cell text-center" colspan="5">주문하신 상품이 없습니다.</td>
									</tr>
								</c:if>
								<c:forEach var="dto" items="${lists}">
									<tr>
										<td class="cell text-center"><c:url var="orderDetailUrl"
												value="orderInfoDetail.do">
												<c:param name="order_idx">${dto.order_idx}</c:param>
											</c:url> <a href="#" class="orderNum"
											onclick="orderDetailOpen('${orderDetailUrl}', 'orderInfoDetail', 'width=540,height=600'); return false;">
												${dto.order_idx} </a> <script>
													function orderDetailOpen(
															url, name, options) {
														window.open(url, name,
																options);
													}
												</script></td>
										<td class="cell text-truncate text-left"
											style="max-width: 170px;">${dto.pro_name}</td>
										<td class="cell text-center"><fmt:formatNumber
												type="number" maxFractionDigits="3" value="${dto.amount}" />원</td>
										<td class="cell text-center">${dto.order_date}</td>
										<td class="cell text-center"><c:choose>
												<c:when test="${dto.order_status eq 1}">
													<div class="text-warning ">
														<strong>상품준비중</strong>
													</div>
													<div class="buttons">
														<c:url var="returnFormUrl" value="returnForm.do">
															<c:param name="order_idx">${dto.order_idx}</c:param>
														</c:url>
														<c:url var="cancelFormUrl" value="orderCancel.do">
															<c:param name="order_idx">${dto.order_idx}</c:param>
															<c:param name="pro_idx">${dto.pro_idx}</c:param>
														</c:url>
														<a href="#" class="orderNum"
															onclick="orderCancel('${cancelFormUrl}','orderCancelPop','width=540,height=600'); return false">
															<i class="bi bi-dash-circle"></i>&nbsp;주문취소
														</a>
														<script>
															function orderCancel(
																	cancelFormUrl,
																	name,
																	options) {
																window
																		.open(
																				cancelFormUrl,
																				name,
																				options);
															}
														</script>

														<script>
															function returnFormOpen(
																	url, name,
																	options) {
																window
																		.open(
																				url,
																				name,
																				options);
															}
														</script>
													</div>
												</c:when>
												<c:when test="${dto.order_status eq 2}">
													<div class="text-primary">
														<strong>배송중</strong>
													</div>
													<div class="buttons trackerBtn">
														<form name="frmData" id="frmData" method="post">
															<input type="hidden" id="t_key" name="t_key"
																value="sjLmbhJEhPXnO5neAx7FNg"> <input
																type="hidden" id="t_code" name="t_code" value="04">
															<input type="hidden" id="t_invoice" name="t_invoice"
																value="566250609912"> <a href="#"
																onclick="showTracker('sjLmbhJEhPXnO5neAx7FNg', '04', '566250609912'); return false;">
																<i class="bi bi-truck"></i>&nbsp;배송조회
															</a>
														</form>
													</div>
												</c:when>
												<c:when test="${dto.order_status eq 3}">
													<div class="text-danger">주문취소</div>
												</c:when>
												<c:when test="${dto.order_status eq 4}">
													<div class="text-success">
														<strong>배송완료</strong>
													</div>
													<div class="buttons">
														<c:url var="reviewWriteUrl" value="reviewWrite.do">
															<c:param name="activity_idx">${dto.order_idx}</c:param>
															<c:param name="writer">${dto.user_name}</c:param>
															<c:param name="category">구독일상</c:param>
														</c:url>
														<a href="${reviewWriteUrl}"><i class="bi bi-pencil"></i>&nbsp;후기쓰기</a>
													</div>
												</c:when>
												<c:when test="${dto.order_status eq 5}">
													<div class="text-danger">
														<strong>반납신청</strong>
													</div>
												</c:when>
												<c:when test="${dto.order_status eq 6}">
													<div class="text-primary">
														<strong>반납진행</strong>
													</div>
												</c:when>
												<c:when test="${dto.order_status eq 7}">
													<div class="text-success">
														<strong>반납완료</strong>
													</div>
												</c:when>
											</c:choose></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

						<div class="container-xl paging">
							<nav aria-label="Page navigation example">
								<ul class="pagination pagination-sm justify-content-center">
									${pageStr}
								</ul>
							</nav>
						</div>

					</div>



				</div>
				<!--//app-card-body-->
			</div>
			<!--//app-card-->
			<nav class="app-pagination">
				<ul class="pagination justify-content-center">

				</ul>
			</nav>
			<!--//app-pagination-->

		</div>
		<!--//tab-pane-->


		</div>
		<!--//tab-content-->


		<!-- ---------- 마이페이지 각 페이지 여기에 넣어주세요!! 끝 지점 ---------- -->
		</div>

		</div>
		</div>
	</section>

	<%@include file="../footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>
</html>