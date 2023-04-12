<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
<script>
	function findaddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				document.getElementById("buyer_pcode").value = data.zonecode;
				document.getElementById("buyer_addr").value = data.address;
				document.getElementById("buyer_detail").focus();
			},
			autoClose : true
		// 팝업 자동 닫힘
		}).open();
	}
</script>

</head>

<body>
	<%@include file="../header.jsp"%>
	<!-- 헤더 이미지 넣을때 css도 가져갈것...  -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h1 class="page-title">주문/결제</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="form-group">


		<h2>구매 상품 정보</h2>
		<c:if test="${empty dto}">
			<div>존재하지 않거나 삭제된 상품입니다.</div>
		</c:if>

		<div>
			상품번호:${dto.pro_idx} <input type="hidden" name="pro_idx"
				value="${dto.pro_idx}" />
		</div>
		<input type="hidden" name="order_idx" id="orderIdxInput" value="">
		<div>
			<div>상품이름:${dto.pro_name}</div>
			<div>
				<img alt="pro_img" src="/meomum/items/${dto.pro_thumb}">
			</div>
		</div>
		<div>
			상품 가격:
			<fmt:formatNumber type="number" maxFractionDigits="3"
				value="${dto.pro_subprice}" />
			원
		</div>
		<div>
			배송비:
			<fmt:formatNumber type="number" maxFractionDigits="3"
				value="${dto.pro_delprice*param.cart_amount}" />
			원
		</div>
		<div>
			수량:${param.cart_amount}개 <input type="hidden" name="pro_amount"
				value="${param.cart_amount}" />
		</div>
		<div>
			합계:
			<fmt:formatNumber type="number" maxFractionDigits="3"
				value="${(dto.pro_subprice*param.cart_amount)+dto.pro_delprice}" />
			원
		</div>

		<div>

			<h2>배송 정보를 입력해주세요.</h2>
			<h3>계약자 정보</h3>
			<input type="hidden" name="user_idx"
				value="${sessionScope.ssInfo.user_idx}">
		</div>
		<div>
			<label for="order_name">고객명</label> <input type="text"
				class="form-control" id="order_name" name="order_name"
				value="${sessionScope.ssInfo.user_name}" placeholder="이름을 입력해주세요">
		</div>
		<div>
			<label for="order_tel">연락처</label> <input type="text"
				class="form-control" id="order_tel" name="order_tel"
				value="${sessionScope.ssInfo.user_tel}" placeholder="연락처 -제외 하고 입력">
		</div>
		<div>
			<label for="order_pcode">우편번호</label>
			<div class="input-group mb-3">
				<input type="text" class="form-control" id="order_pcode"
					name="order_pcode" value="${sessionScope.ssInfo.user_pcode}"
					placeholder="우편번호" readonly="readonly" onclick="findaddr()">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button"
						onclick="findaddr()">우편번호 검색</button>
				</div>
			</div>
		</div>
		<div>
			<label for="order_addr">기본주소</label> <input type="text"
				class="form-control" id="order_addr" name="order_addr"
				value="${sessionScope.ssInfo.user_addr}" placeholder="기본주소"
				readonly="readonly">
		</div>
		<div>
			<label for="order_detail">상세주소</label> <input type="text"
				class="form-control" id="order_detail" name="order_detail"
				value="${sessionScope.ssInfo.addr_detail}" placeholder="상세주소"
				required="required">
		</div>


		<h3>사용자 정보</h3>
		<div>
			계약자와 동일<input type="checkbox" value="y" onclick="copyUserInfo()">
		</div>
		<div>
			<label for="buyer_name">고객명</label> <input type="text"
				class="form-control" id="buyer_name" name="buyer_name"
				value="" placeholder="이름을 입력해주세요">
		</div>
		<div>
			<label for="buyer_tel">연락처</label> <input type="text"
				class="form-control" id="buyer_tel" name="buyer_tel" value=""
				placeholder="연락처 -제외 하고 입력">
		</div>
		<div>
			<label for="buyer_pcode">우편번호</label>
			<div class="input-group mb-3">
				<input type="text" class="form-control" id="buyer_pcode"
					name="buyer_pcode" value="" placeholder="우편번호"
					readonly="readonly" onclick="findaddr()">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button"
						onclick="findaddr()">우편번호 검색</button>
				</div>
			</div>
		</div>
		<div>
			<label for="buyer_addr">기본주소</label> <input type="text"
				class="form-control" id="buyer_addr" name="buyer_addr"
				value="" placeholder="기본주소" readonly="readonly">
		</div>
		<div>
			<label for="buyer_detail">상세주소</label> <input type="text"
				class="form-control" id="buyer_detail" name="buyer_detail"
				value="" placeholder="상세주소" required="required">
		</div>

		<div>
			<label for="order_msg">배송 메세지</label> <input type="text"
				class="form-control" id="order_msg" name="order_msg"
				placeholder="배송메세지">
		</div>
		<div>
			<label for="checkbox"> 개인정보이용동의 </label>
			<div class="form-control">
				개인정보 이용동의합니다.<input class="form-check-input" type="checkbox"
					id="checkbox" value="Y" name="order_tos" class="form-control"
					required="required">
			</div>
		</div>

		<div>
			<h3>결제 금액</h3>
		</div>
		<div>
			<label for="orderPay">주문 금액</label> <input type="text" name="total"
				id="total"
				value="${dto.pro_subprice * param.cart_amount + dto.pro_delprice}"
				class="form-control">
		</div>
		<div>
			<label for="point_total">사용 가능포인트</label> <input type="text"
				id="point_total" value="${result}" readonly> <input
				type="checkbox" id="check" onclick="checkPt()">전액사용
		</div>
		<div>
			<label for="point_num">포인트 사용</label> <input type="text"
				id="point_num" oninput="getTotal()">
		</div>
		<div>
			<label for="amount">최종 결제금액</label> <input type="text" id="amount"
				readonly="readonly">
		</div>

		<!-- 결제하기 버튼 생성 -->
		<button onclick="requestPay()">결제하기</button>

		<!-- 포인트 조회 및 사용-->
		<script src="js/point.js">
			console.log(amount)
		</script>


		<script>
			var IMP = window.IMP;
			IMP.init("imp77686458");

			function requestPay() {

				var today = new Date();
				var year = today.getFullYear().toString();
				var month = (today.getMonth() + 1).toString().padStart(2, "0"); // 월은 0부터 시작하므로 1을 더해줌
				var day = today.getDate().toString().padStart(2, "0");
				var hours = today.getHours().toString();
				var minutes = today.getMinutes().toString();
				var seconds = today.getSeconds().toString();
				var milliseconds = today.getMilliseconds().toString();
				var makeMerchantUid = year + month + day + hours + minutes
						+ seconds;
				
				//계약자 및 사용자 정보//
				var oName = document.getElementById("order_name").value;
				var uid = "OMM" + makeMerchantUid;

				var tp = document.getElementById("amount").value;
				var bName = document.getElementById("buyer_name").value;
				if (!bName) {
				    bName = document.getElementById("order_name").value;
				}
				var bTel = document.getElementById("buyer_tel").value;
				if (!bTel) {
					bTel = document.getElementById("order_tel").value;
				}
				var bPcode = document.getElementById("buyer_pcode").value;
				if (!bPcode) {
					bPcode = document.getElementById("order_pcode").value;
				}
				var bAddr = document.getElementById("buyer_addr").value;
				if (!bAddr) {
					bAddr = document.getElementById("order_addr").value;
				}
				var bAddr_detail = document.getElementById("buyer_detail").value;
				if (!bAddr_detail) {
					bAddr_detail = document.getElementById("order_detail").value;
				}
				var order_msg = document.getElementById("order_msg").value;
				var order_tos = document.getElementById("checkbox").value;
				var point_num = document.getElementById("point_num").value;
				//계약자및 사용자 정보 끝//
				
				var uidx = ${sessionScope.ssInfo.user_idx};//유저번호
				var pidx = ${dto.pro_idx};//상품번호
				var pAmount = ${param.cart_amount};//상품수량
			
				IMP.request_pay({
					pg : "kakaopay", //"html5_inicis",
					pay_method : 'card',
					merchant_uid : uid,
					name : oName,
					amount : tp,
					buyer_name : bName,
					buyer_tel : bTel,
					buyer_addr : bAddr,
					buyer_postcode : bPcode
				}, function(rsp) { // callback
					if (rsp.success) {
						console.log(rsp);

						var PaymentDTO = {
							payment_idx : rsp.imp_uid, //payment_idx로 들어갈 값
							cate_idx : rsp.merchant_uid, //인식번호(cate_idx)
							payment_cate : 2, //payment_cate 카테고리
							pay_method : rsp.pay_method, //pay_mehtod 지불수단
							amount : rsp.paid_amount, //amount 금액
							pay_buydate : rsp.paid_at, //pay_buydate 결제일
							pay_cancleDate : null,//pay_cancleDate 취소일(임시'-'로 지정)
							pay_state : rsp.status,//pay_stat

						};

						var OrderProDTO = {
							order_idx : rsp.merchant_uid, //주문번호
							user_idx : uidx, //유저번호
							pro_idx : pidx, //상품번호
							pro_amount : pAmount, //수량		
						};

						var PointDTO = {
							cate_idx : rsp.merchant_uid,
							user_idx : uidx,
							point_use : 1,
							point_info : '구독일상 결제',
							point_num : $("#point_num").val()
						};

						var OrderDTO = {
							order_idx : rsp.merchant_uid,
							user_idx : uidx,
							order_name : bName,
							sub_start : makeMerchantUid,
							sub_end : makeMerchantUid,//수정 필요
							order_pcode : bPcode,
							receiver : bName,
							receiver_tel : bName,
							order_addr : bAddr,
							order_detail : bAddr_detail,
							order_msg : order_msg,
							using_point : point_num,
							pay_date : makeMerchantUid,
							amount : tp,
							order_status : 1,
							order_date : makeMerchantUid,
							order_tos : order_tos
						};

						$.ajax({
							type : "POST",
							url : "totalOrders.do",
							data : JSON.stringify({
								paydto : PaymentDTO,
								odto : OrderProDTO,
								pdto : PointDTO,
								ordto : OrderDTO
							}),
							contentType : "application/json; charset=utf-8",
							dataType : "json",
							success : function(data) {
								console.log(data);
								alert('전송 성공!');
							},
							error : function(xhr, status, error) {
								alert('전송 실패: ' + error);
							}
						});

						var msg = '결제가 완료되었습니다.';

					} else {
						console.log(rsp);
						var msg = '결제가 실패되었습니다.';
					}

					alert(msg);
				});

			}
		</script>

	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>