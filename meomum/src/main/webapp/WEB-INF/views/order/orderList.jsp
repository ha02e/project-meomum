<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Security-Policy"
	content="upgrade-insecure-requests">

<!-- 결제모듈 -->
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script>
	var IMP = window.IMP;
	IMP.init("imp77686458");

	var today = new Date();
	var hours = today.getHours(); // 시
	var minutes = today.getMinutes(); // 분
	var seconds = today.getSeconds(); // 초
	var milliseconds = today.getMilliseconds();
	var makeMerchantUid = hours + minutes + seconds + milliseconds;
	
	var tp = ${dto.pro_subprice * param.cart_amount + dto.pro_delprice};

	function requestPay() {
		IMP.request_pay({
			pg : "html5_inicis",
			pay_method : 'card',
			merchant_uid : "IMP" + makeMerchantUid,
			name : '${dto.pro_name}',
			amount : tp,
			buyer_email : 'Iamport@chai.finance',
			buyer_name : '아임포트 기술지원팀',
			buyer_tel : '010-1234-5678',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456'
		}, function(rsp) { // callback
			if (rsp.success) {
				console.log(rsp);
			} else {
				console.log(rsp);
			}
		});
	}
</script>

<!-- 우편번호 검색용 -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function findaddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("order_pcode").value = data.zonecode;
				document.getElementById("order_addr").value = data.address;
				document.getElementById("order_detail").focus();
			},
			autoClose : true
		// 팝업 자동 닫힘
		}).open();
	}
</script>
<meta charset="UTF-8">
<title>Sample Payment</title>
</head>
<body>
	<h1>주문 결제</h1>
	<c:if test="${empty dto}">
		<div>존재하지 않거나 삭제된 상품입니다.</div>
	</c:if>
	<div name="order_name">${user}</div>
	<div class="form-group">
		<label for="order_pcode">우편번호</label>
		<div class="input-group mb-3">
			<input type="text" class="form-control" id="order_pcode"
				name="order_pcode" placeholder="우편번호" readonly="readonly"
				onclick="findaddr()">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button"
					onclick="findaddr()">우편번호 검색</button>
			</div>
		</div>
	</div>
	<div class="form-group">
		<label for="order_addr">기본주소</label> <input type="text"
			class="form-control" id="order_addr" name="order_addr"
			placeholder="기본주소" readonly="readonly">
	</div>
	<div class="form-group">
		<label for="order_detail">상세주소</label> <input type="text"
			class="form-control" id="order_detail" name="order_detail"
			placeholder="상세주소">
	</div>
	<div class="form-group">
		<label for="receiver_tel">연락처</label> <input type="tel"
			class="form-control" id="receiver_tel" name="receiver_tel"
			placeholder="연락처 -제외 하고 입력">
	</div>

	<div>상품이름:${dto.pro_name}</div>
	<div><img alt="pro_img" src="/meomum/items/${dto.pro_thumb}"> </div>
	<div>상품 가격:${dto.pro_subprice}원</div>
	<div>배송비:${dto.pro_delprice}원</div>
	<div>수량:${param.cart_amount}개</div>

	<button onclick="requestPay()">결제하기</button>
	<!-- 결제하기 버튼 생성 -->
</body>
</html>