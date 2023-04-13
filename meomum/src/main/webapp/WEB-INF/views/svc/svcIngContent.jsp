<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    

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

#buy{
	justify-content: space-between;
}
ul.list-group-item{
	margin-left: 20px;
	
}


  li.list-group-item > div {
    text-align: left;
    margin-right: 40px;
  }
  
    li.list-group-item input[type="text"] {
    text-align: left;
    margin-right: 20px;
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

#total{
	display:inline-block;
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
			<div class="py-5 text-left">
				<h2>${dto.svc_state}</h2>
			</div>

			<div class="row g-5">
				<!-- 결제 div 시작 -->
				<%-- <c:if test="${dto.svc_state eq '견적완료'}"> --%>
				<div class="col-md-6 col-lg-4 order-md-last">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-primary" style="font-family: 'GmarketSansMedium';">결제금액(수정중)</span>
					</h4>
					<ul class="list-group mb-3">
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<!-- <div class="col d-flex justify-content-between"  id="buy"> -->
							<div class="col" id="buy">
								<span>견적금액</span>
							</div>
							<div class="col">
								<input type="text" id="total" value="${ingdto.total}" readonly >
							</div>
							
						</li>
						<li class="list-group-item d-flex justify-content-between lh-sm">
							<div style="white-space: nowrap;">
								<span>나의 포인트

								<input type="text" id="point_total" value="${result}" readonly><br>
								<input type="checkbox" id="check" onclick="checkPt()">전액사용
								</span>
							</div>
						</li>
						<li
							class="list-group-item d-flex justify-content-between bg-body-tertiary">
							<div class="text-success" style="white-space: nowrap;">
								<span>사용 포인트</span>
								<input type="text" id="point_num" oninput="getTotal()">점
						</li>
						<li class="list-group-item d-flex justify-content-between">
						<div style="white-space: nowrap;">
						<span>총 결제금액</span> 
						<strong> <input type="text" id="amount" style="width: 70%;" readonly>원</strong></li>
					</ul>
					<div class="form-check">
						<input class="form-check-input" type="checkbox" id="checkbox"
							required="required"> 
							<span style="font-size: 12px;">(필수)결제
							내용을 확인했으며, 정보 제공 등에 동의합니다</span><br> <a href="#"
							data-bs-toggle="modal" data-bs-target="#exampleModal"> <span
							style="font-size: 12px;">(내용보기)</span></a>
					</div>

					<div class="input-group">
						<button class="w-100 btn btn-primary" onclick="requestPay()">결제하기</button>
					</div>
				</div>
				<%-- </c:if> --%>
				<!-- 결제 div 끝 -->
				
				<!-- 예약 상세 내용 -->
				<div class="col-md-7 col-lg-8 order-md-first mx-auto">
					<h4 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-primary" style="font-family: 'GmarketSansMedium';">예약 상세 내용</span>
					</h4>
					
					<ul class="list-group mb-3">
						<input type="hidden" id="user_id" value="${sessionScope.ssInfo.user_id}">
						<input type="hidden" id="user_idx" value="${sessionScope.ssInfo.user_idx}">
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>예약번호</span>
							</div>
							<div div class="col">${ingdto.svc_idx}</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>서비스 일시</span>
							</div>
							<div class="col">
								<c:if test="${dto.svc_state ne '결제취소'}">
	      						${dto.svc_days}&nbsp;|&nbsp;${dto.svc_time}
	      						</c:if>
								<c:if test="${dto.svc_state eq '결제취소'}">
	      						${dto.svc_days.substring(1)} | ${dto.svc_time.substring(1)}
	      						</c:if>
							</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between bg-body-tertiary row">
							<div class="col">
								<strong><span>예약 상세 내용</span></strong>
							</div>

						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>지역</span>
							</div>
							<div class="col">${dto.user_addr}${dto.user_detail}</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>거주형태</span>
							</div>
							<div class="col">${dto.svc_type}</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>서비스 영역</span>
							</div>
							<div class="col">${dto.svc_area}</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>거주 평수(공급면적)</span>
							</div>
							<div class="col">${dto.svc_py}평</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>요청사항</span>
							</div>
							<div class="col">${dto.svc_req}</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between bg-body-tertiary row">
							<div class="col">
								<strong><span>예약자 정보</span></strong>
							</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>성함</span>
							</div>
							<div class="col">${dto.user_name}</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>휴대전화</span>
							</div>
							<div class="col">${dto.user_tel}
							</div>
						</li>
					</ul>
					<c:if test="${dto.svc_state eq '결제취소'}">
						<hr class="my-4">
						<a href="svc.do" class="w-100 btn btn-primary"></a>
					</c:if>
					<c:if test="${dto.svc_state eq '결제완료'}">
						<hr class="my-4">
						<input type="button" class="w-100 btn btn-primary" value="결제취소"
							onclick="canclePay()">
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

<!-- iamport.cancle.js -->
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<script>
	function cancelPay() {
		jQuery.ajax({
			// 예: http://www.myservice.com/payments/cancel
			//"url": "{환불정보를 수신할 가맹점 서비스 URL}", 
			"type" : "POST",
			"contentType" : "application/json",
			"data" : JSON.stringify({
				"merchant_uid" : "{imp_835474242464}", // 예: ORD20180131-0000011
				"cancel_request_amount" : 196500, // 환불금액
			//"reason": "테스트 결제 환불" // 환불사유
			// [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
			//"refund_holder": "홍길동", 
			// [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
			//"refund_bank": "88" 
			// [가상계좌 환불시 필수입력] 환불 수령계좌 번호
			//"refund_account": "56211105948400" 
			}),
			"dataType" : "json"
		});
	}
</script>




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