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

<script type="text/javascript">
	// 이름 입력 필드를 가져옴
	var nameInput = document.getElementById("order_name");

	// 사용자가 새로운 이름을 입력했는지 확인
	if (nameInput.value !== "${sessionScope.ssInfo.user_name}") {
		// 입력된 이름 값을 폼 데이터에 있는 이름 필드에 할당
		document.getElementsByName("order_name")[0].value = nameInput.value;
	}

	var nameInput = document.getElementById("receiver_tel");

	if (nameInput.value !== document.getElementById("receiver_tel")) {

		document.getElementsByName("receiver_tel")[0].value = nameInput.value;
	}

	var nameInput = document.getElementById("buyer_email");

	if (nameInput.value !== document.getElementById("buyer_email")) {

		document.getElementsByName("buyer_email")[0].value = nameInput.value;
	}
</script>
<style>
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://images.unsplash.com/photo-1513694203232-719a280e022f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80)
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

.thumbimg{
width: 60px;
  height: 60px;
  object-fit: cover;
}
/**헤더 이미지용 끝*/


input:invalid {
  border-color: red;
  outline: none;
}
</style>
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
	<br><br>
	<div class="container">
		<div class="row">
			<form name="ordersForm" action="ordersForm.do" method="post">
				<input type="hidden" name="user_idx"
					value="${sessionScope.ssInfo.user_idx}"> <input
					type="hidden" id="orderIdxInput" name="order_idx"  />
				<div class="border">

					<table class="table">
						<thead>
							<tr>
								<th scope="col">상품명</th>
								<th scope="col">상품 이미지</th>
								<th scope="col">상품 가격</th>
								<th scope="col">구독월수</th>
								<th scope="col">배송비</th>
								<th scope="col">수량</th>
								<th scope="col">결제 금액</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty lists}">
								<tr>
									<td colspan="7">존재하지 않거나 삭제된 상품입니다.</td>
								</tr>
							</c:if>
							<c:if test="${!empty lists}">
								<c:forEach var="dto" items="${lists}">
									<tr>
										<td>${dto.pro_name}</td>
										<td><img alt="pro_img" class="thumbimg"
											src="/meomum/images/items/${dto.pro_thumb}">
											</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${dto.pro_price}" />원</td>
										<td>${dto.pro_month}개월</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${dto.pro_delprice}" />원</td>
										<td>${dto.cart_amount}개</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${dto.pro_subprice * dto.cart_amount}" />원</td>
									</tr>
									<input type="hidden" name="pro_idx" value="${dto.pro_idx}">
									<input type="hidden" name="pro_amount" value="${dto.cart_amount}">
								</c:forEach>
							</c:if>
						</tbody>
					</table>

					<c:if test="${!empty total}">
						<div>
							<div class="text-end">
								월 구독 가격 :
								<fmt:formatNumber type="number" maxFractionDigits="3"
									value="${total.totalSub }" />
								원
							</div>
							<div class="text-end">월 구매 개수 : ${total.totalCount } 개</div>
							<div class="text-center">
								총 배송비 : <span style="color: red;"><fmt:formatNumber
										type="number" maxFractionDigits="3" value="${total.totalDel }" /></span>원
							</div>
							<div class="text-center">
								월 구독 가격 + 총 배송비 :
								<fmt:formatNumber type="number" maxFractionDigits="3"
									value="${total.finalTotalPrice }" />
								원
							</div>
						</div>
					</c:if>
				</div>
				<hr>

				<div class="container">
					<h2 class="text-center mb-4">배송 정보 입력</h2>

					<input type="hidden" name="user_idx"
						value="${sessionScope.ssInfo.user_idx}">
					<div class="mb-3">
						<label for="order_name" class="form-label">고객명</label> <input
							type="text" class="form-control" id="order_name"
							name="order_name" value="${sessionScope.ssInfo.user_name}"
							placeholder="이름을 입력해주세요" required pattern="[가-힣]{2,5}">
					</div>
					<div class="mb-3">
						<label for="receiver_tel" class="form-label">연락처</label> <input
							type="text" class="form-control" id="receiver_tel"
							name="receiver_tel" value="${sessionScope.ssInfo.user_tel}"
							placeholder="연락처 -제외 하고 입력" required pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}">
					</div>
					<div class="mb-3">
						<label for="order_pcode" class="form-label">우편번호</label>
						<div class="input-group">
							<input type="text" class="form-control" id="order_pcode"
								name="order_pcode" value="${sessionScope.ssInfo.user_pcode}"
								placeholder="우편번호" readonly="readonly" onclick="findaddr()">
							<button class="btn btn-outline-secondary" type="button"
								onclick="findaddr()">우편번호 검색</button>
						</div>
					</div>
					<div class="mb-3">
						<label for="order_addr" class="form-label">기본주소</label> <input
							type="text" class="form-control" id="order_addr"
							name="order_addr" value="${sessionScope.ssInfo.user_addr}"
							placeholder="기본주소" readonly="readonly">
					</div>
					<div class="mb-3">
						<label for="order_detail" class="form-label">상세주소</label> <input
							type="text" class="form-control" id="order_detail"
							name="order_detail" value="${sessionScope.ssInfo.addr_detail}"
							placeholder="상세주소" required="required">
					</div>
					<div class="mb-3">
						<label for="order_msg" class="form-label">배송 메세지</label> <input
							type="text" class="form-control" id="order_msg" name="order_msg"
							placeholder="배송메세지">
					</div>
					<div class="mb-3">
						<div class="form-check">
							<input class="form-check-input" type="checkbox" id="checkbox"
								value="Y" name="order_tos" required="required"> <label
								class="form-check-label" for="checkbox">개인정보 이용동의합니다.</label>
						</div>
					</div>
					<div class="mb-3">
						<label for="using_point" class="form-label">포인트</label> <input
							type="number" name="using_point" value="${0}"
							class="form-control">
					</div>
					<div class="d-grid gap-2 col-4 mx-auto">
					<button type="button" class="btn btn-primary"
						onclick="requestPay()">결제하기</button> 
						<a href="proList.do"><button type="button" class="btn btn-primary"
						>목록으로</button></a>
					</div>
						<br><br>

				</div>
			</form>
		</div>






		<script>
			var IMP = window.IMP;
			IMP.init("imp77686458");

			var today = new Date();
			var year = today.getFullYear().toString();
			var month = (today.getMonth() + 1).toString().padStart(2, "0"); // 월은 0부터 시작하므로 1을 더해줌
			var day = today.getDate().toString().padStart(2, "0");
			var hours = today.getHours().toString();
			var minutes = today.getMinutes().toString();
			var seconds = today.getSeconds().toString();
			var milliseconds = today.getMilliseconds().toString();
			var makeMerchantUid = year + month + day + hours + minutes
					+ seconds + milliseconds;

			var oName = document.getElementById("order_name").value;
			var uid = "OMM" + makeMerchantUid
			
			var tp = ${total.finalTotalPrice};
			var bName =document.getElementById("order_name").value
			var bTel= document.getElementById("receiver_tel").value
			var addr= document.getElementById("order_addr").value;
			var bPcode= document.getElementById("order_pcode").value
			
			var uidx = ${sessionScope.ssInfo.user_idx};
			var pidx = [<c:forEach var="product" items="${lists}"><c:out value="${product.pro_idx}"/>, </c:forEach>];
			var pAmount = [<c:forEach var="product" items="${lists}"><c:out value="${product.cart_amount}"/>, </c:forEach>];
			
			document.getElementById('orderIdxInput').setAttribute('value', uid);

			function validateForm() {
				var form = document.ordersForm;
				  if (!form.checkValidity()) { // HTML5 폼 유효성 검사
					    form.querySelector(':invalid').focus(); // 유효하지 않은 입력 필드에 포커스

				    return false;
				  }
				  return true;
			}
			function requestPay() {
				if (!validateForm()) {
				    return;
				  }
	
				IMP.request_pay({
					pg : "kakaopay", //"html5_inicis",
					pay_method : 'card',
					merchant_uid : uid,
					name : oName,
					amount : tp,
					buyer_email : "",
					buyer_name : bName,
					buyer_tel : bTel,
					buyer_addr : addr,
					buyer_postcode : bPcode
				}, function(rsp) { // callback
					if (rsp.success) {
						console.log(rsp);

						var PaymentDTO ={
			    			  	payment_idx: rsp.imp_uid, //payment_idx로 들어갈 값
					            cate_idx: rsp.merchant_uid, //인식번호(cate_idx)
					            payment_cate: 2, //payment_cate 카테고리
					            pay_method: rsp.pay_method, //pay_mehtod 지불수단
					            amount: rsp.paid_amount, //amount 금액
					            pay_buydate: rsp.paid_at, //pay_buydate 결제일
					            pay_cancleDate:null,//pay_cancleDate 취소일(임시'-'로 지정)
					            pay_state: rsp.status,//pay_stat

			    	  };
						
					var OrderProDTO = {
								order_idx: uid, //주문번호
								user_idx: uidx, //유저번호
								pro_idx: pidx, //상품번호
								pro_amount: pAmount, //수량		
					};
						$.ajax({
					          type: 'POST',
					          url: "orderPay.do",
					          data: JSON.stringify(PaymentDTO),
					          contentType: "application/json",
					          success: function (data) {
					        	 console.log(data);
					            alert('컨트롤러 성공');
					           
					          },
					          error: function (xhr, status, error) {
					            alert('컨트롤러 실패');
					            
					          }
					        });
				    	   
				        alert('결제가 완료되었습니다');
						var msg = '결제가 완료되었습니다.';
						
						document.ordersForm.submit();				

					} else {
						console.log(rsp);
						var msg = '결제가 실패되었습니다.';
						location.href = "/meomum/proList.do";
					}

					alert(msg);
				});

			}
		</script>

	</div>
	<%@include file="../footer.jsp"%>
</body>
</html>