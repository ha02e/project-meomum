<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!doctype html>
<html>
<head>
<script src="/docs/5.3/assets/js/color-modes.js"></script>

<meta charset="UTF-8">

<title>정리일상 진행 현황</title>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/checkout/">

<link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
#buy {
	justify-content: space-between;
}

ul.list-group-item {
	margin-left: 20px;
}

li.list-group-item>div {
	text-align: left;
	margin-right: 10px;
}

li.list-group-item input[type="text"] {
	text-align: left;
	margin-right: 20px;
}

li.list-group-item div.col:last-child input {
	width: 100%;
}

.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://images.unsplash.com/photo-1618220048045-10a6dbdf83e0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80)
		no-repeat center;
	background-size: cover;
	margin: 0;
	border-bottom: none;
	padding-bottom: 0px;
	margin-bottom: 40px;
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

.btn-group .btn {
	margin-right: 10px;
}

#total {
	display: inline-block;
}

footer {
	margin-top: 20px;
}

.b-example-divider {
	width: 100%;
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.bd-mode-toggle {
	z-index: 1500;
}

.list-group-item input[type="text"], .list-group-item input[type="text"]:focus
	{
	border: none;
	box-shadow: none;
}

.form-control {
	border: none;
}

.checkbox-container {
	display: flex;
	align-items: center;
	position: relative;
	padding-left: 25px;
	cursor: pointer;
	font-size: 14px;
}

.checkbox-container input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
	height: 0;
	width: 0;
	vertical-align: middle;
}

.checkmark {
	position: absolute;
	top: 0;
	left: 0;
	height: 16px;
	width: 16px;
	background-color: #fff;
	border: 1px solid #ccc;
	border-radius: 2px;
}

.checkbox-container:hover input ~ .checkmark {
	background-color: #f2f2f2;
}

.checkbox-container input:checked ~ .checkmark {
	background-color: #2196f3;
}

.checkmark:after {
	content: "";
	position: absolute;
	display: none;
}

.checkbox-container input:checked ~ .checkmark:after {
	display: block;
}

.checkbox-container .checkmark:after {
	left: 6px;
	top: 2px;
	width: 3px;
	height: 7px;
	border: solid white;
	border-width: 0 2px 2px 0;
	transform: rotate(45deg);
}
</style>


<!-- Custom styles for this template -->
<link href="checkout.css" rel="stylesheet">
</head>
<body class="bg-body-tertiary">
	<%@include file="../header.jsp"%>
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">정리일상 진행 현황</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<main>
	
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<h2 class="d-flex justify-content-between align-items-center mb-3" >
				<span>${dto.svc_state}</span>
			</h2>
			</div>

			<div class="row g-5">
			<!------------------- 결제금액 내용 ------------------------------------>
			
				<c:if test="${dto.svc_state eq '견적완료'}">

				<div class="col-md-6 col-lg-4 order-md-last">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-primary"
							style="font-family: 'GmarketSansMedium';">결제금액</span>
					</h4>

					<ul class="list-group mb-3">
						<li
							class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col col-sm-4">
								<span>견적금액</span>
							</div>
							<div class="col">
								<input type="text" id="total" value="${ingdto.total}" readonly
									style="width: 70%;"><strong><span>원</span></strong>
							</div>
						</li>

						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col col-sm-4">
								<span>나의 포인트</span>
							</div>
							<div class="col">
								<div class="d-flex justify-content-between align-items-center">
									<input type="text" id="point_total" value="${result}" readonly>
									<label class="checkbox-container" style="font-size: 12px;">전액사용
										<input type="checkbox" id="check" onclick="checkPt()">
										<span class="checkmark"></span>
									</label>
								</div>
							</div>
						</li>

						<li class="list-group-item d-flex justify-content-between bg-body-tertiary row">
							<div class="col col-sm-4 text-success">
								<span>사용 포인트</span>
							</div>
							<div class="col">
								<input type="text" id="point_num" oninput="getTotal()"
									style="width: 70%;">
							</div>
						</li>

						<li class="list-group-item d-flex justify-content-between row">
							<div class="col col-sm-4" style="white-space: nowrap;">
								<span>총 결제금액</span>
							</div>
							<div class="col">
								<strong> <input type="text" id="amount"
									style="width: 70%;" readonly>원
								</strong>
							</div>
						</li>
					</ul>

					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="checkbox"
							required="required"> <span style="font-size: 12px;">(필수)결제
							내용을 확인했으며, 정보 제공 등에 동의합니다</span><br> <a href="#"
							data-bs-toggle="modal" data-bs-target="#exampleModal"> <span
							style="font-size: 12px;">(내용보기)</span>
						</a>
					</div>

					<div class="input-group">
						<button class="w-100 btn btn-primary" onclick="requestPay()">결제하기</button>
					</div>
				</div>
				</c:if>
				<!-- 결제 div 끝 -->
				

				<!------------------- 예약 상세 내용 시직 ------------------------------------>
				<div class="col-md-7 col-lg-8 order-md-first mx-auto">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-primary"
							style="font-family: 'GmarketSansMedium';">예약 상세 내용</span>
					</h4>

					<ul class="list-group mb-3">
						<input type="hidden" id="user_id"
							value="${sessionScope.ssInfo.user_id}">
						<input type="hidden" id="user_idx"
							value="${sessionScope.ssInfo.user_idx}">
						<li
							class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>예약번호</span>
							</div>
							<div class="col">
								<input type="text" id="svc_idx" value="${ingdto.svc_idx}"
									readonly>
							</div>
						</li>
						
						<li
							class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>서비스 일시</span>
							</div>
							<div class="col">
								<c:if test="${dto.svc_state ne '결제취소'}">
									<input type="text"
										value="${dto.svc_days}&nbsp;|&nbsp;${dto.svc_time}" readonly>
								</c:if>
								<c:if test="${dto.svc_state eq '결제취소'}">
									<%-- ${dto.svc_days.substring(1)} | ${dto.svc_time.substring(1)} --%>
									<input type="text"
										value="${dto.svc_days.substring(1)}&nbsp;|&nbsp;${dto.svc_time.substring(1)}"
										readonly>
								</c:if>
							</div>
						</li>
						
						<!-- -------------------------예약상세 내용--------------------------------- -->
						<li
							class="list-group-item d-flex justify-content-between bg-body-tertiary row">
							<div class="col">
								<strong><span>예약 상세 내용</span></strong>
							</div>

						</li>
				
						<li
							class="list-group-item d-flex flex-wrap justify-content-between lh-sm row">
							<div class="col">
								<span>지역</span>
							</div>
							<div class="col">
								<%-- ${dto.user_addr},${dto.user_detail} --%>
								<input type="text" value="${dto.user_addr},${dto.user_detail}"
									readonly>
							</div>
						</li>
						
						<li
							class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>거주형태</span>
							</div>
							<div class="col">
								<%-- ${dto.svc_type} --%>
								<input type="text" value="${dto.svc_type}" readonly>
							</div>
						</li>
						
						<li
							class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>서비스 영역</span>
							</div>
							<div class="col">
								<%-- ${dto.svc_area} --%>
								<input type="text" value="${dto.svc_area}" readonly>
							</div>
						</li>
						
						<li
							class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>거주 평수(공급면적)</span>
							</div>
							<div class="col">
								<%-- ${dto.svc_py}평 --%>
								<input type="text" value="${dto.svc_py}평" readonly>
							</div>
						</li>
						
						<li
							class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>요청사항</span>
							</div>
							<div class="col">
								<!--  -->
								<input type="text" value="${dto.svc_req}" readonly>
							</div>
						</li>
						<!-- --------------------------예약자 정보-------------------------------- -->
						<li class="list-group-item d-flex justify-content-between bg-body-tertiary row">
							<div class="col">
								<strong><span>예약자 정보</span></strong>
							</div>
						</li>
						
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>성함</span>
							</div>
							<div class="col">
								<input type="text" id="user_name" value="${dto.user_name}"
									readonly>
								<!-- ${dto.user_name}-->
							</div>
						</li>
						
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>휴대전화</span>
							</div>
							<div class="col">
								<input type="text" id="user_tel" value="${dto.user_tel}"
									readonly>
								<%-- ${dto.user_tel} --%>
							</div>
						</li>
						
						<!-- -----------------------결제 정보----------------------------------- -->
						<!--   결제 완료 시 결제 금액 출력 
						<c:if test="${dto.svc_state eq '결제완료'}">
							<li class="list-group-item d-flex justify-content-between bg-body-tertiary row">
								<div class="col">
									<strong><span>결제 정보</span></strong>
								</div>
							</li>
							
							<li class="list-group-item d-flex justify-content-between lh-sm row">
								<div class="col">
									<span>견적금액</span>
								</div>
								<div class="col">
									<input type="text" id="total" value="${ingdto.total}" readonly>
								</div>
							</li>
							
							<li class="list-group-item d-flex justify-content-between lh-sm row">
								<div class="col">
									<span>사용 포인트</span>
								</div>
								<div class="col">
									<input type="text" id="total" value="포인트" readonly>
								</div>
							</li>
							
							<li class="list-group-item d-flex justify-content-between lh-sm row">
								<div class="col">
									<span>총 결제 금액</span>
								</div>
								<div class="col">
									<input type="text" id="amount" value="${paydto.amount}" readonly>
								</div>
							</li>
						</c:if>-->
					</ul>
					
					<!-- --------------------버튼---------------------------------------- -->
					<c:if test="${dto.svc_state eq '결제취소'}">
						<hr class="my-4">
						<a href="svcIngList.do"
							class="w-100 btn btn-primary">목록</a>
					</c:if>
					<c:if test="${dto.svc_state eq '결제완료'}">
						<hr class="my-4">
						<c:url var="ingCancleUrl" value="ingCancle.do">
							<c:param name="svc_idx">${ingdto.svc_idx}</c:param>
						</c:url>
						<hr class="my-4">
						<a href="${ingCancleUrl}" class="w-100 btn btn-primary">결제취소</a>
						<!-- hidden: payment idx, 결제금액 -->
						<!-- <input type="button" class="w-100 btn btn-primary" value="결제취소"
							onclick="canclePay()"> -->
					</c:if>

					<c:if test="${dto.svc_state eq '작업완료'}">
						<c:url var="contentUrl" value="reviewWrite.do">
							<c:param name="activity_idx">${ingdto.svc_idx}</c:param>
							<c:param name="writer">${dto.user_name}</c:param>
							<c:param name="category">정리일상</c:param>
						</c:url>
						<hr class="my-4">
						<a href="${contentUrl}" class="w-100 btn btn-primary">후기 작성하기</a>
					</c:if>

				</div>
			</div>

		</main>
	</div>


</body>
</html>

<!-- 포인트 조회 및 사용-->
<script src="js/point.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="js/svc/payment.js"></script>



<%@include file="../footer.jsp"%>
<!-- 필수 개인정보 제공 동의 모달 -->
<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalLabel">필수 개인정보 제공
					동의</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				1. 개인정보를 제공받는 자 : 머뭄<br> 2. 제공하는 개인정보 항목 : 이름, 아이디, (휴대)전화번호,
				상품 구매정보,결제수단, 정리일상 진행 주소)<br> 3. 개인정보를 제공받는 자의 이용목적 : 본인의사의 확인,
				고객상담 및 불만처리/부정이용 방지 등의 고객관리, 새로운 상품/서비스 정보와 고지사항의 안내, 상품/서비스 구매에 따른
				혜택 제공, 서비스 개선·통계·분석<br> 4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : 개인정보
				이용목적 달성 시까지 보존합니다. 단, 관계 법령의 규정에 의하여 일정 기간 보존이 필요한 경우에는 해당 기간만큼 보관 후
				삭제합니다.<br>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary"
					data-bs-dismiss="modal">확인</button>
			</div>
		</div>
	</div>
</div>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</body>
</html>