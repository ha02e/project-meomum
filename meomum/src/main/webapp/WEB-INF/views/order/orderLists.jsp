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

	<div class="container">
		<div class="row">
			<form name="orderForm" action="orderForm.do" method="post">
				<input type="hidden" name="user_idx"
					value="${sessionScope.ssInfo.user_idx}"> 
				<input type="hidden" id="orderIdxInput" name="order_idx" value="${uid}" />
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
				          <td><img alt="pro_img" src="/meomum/items/${dto.pro_thumb}"></td>
				          <td>${dto.pro_price}원</td>
				          <td>${dto.pro_month}월</td>
				          <td>${dto.pro_delprice}원</td>
				          <td>${dto.cart_amount}개</td>
				          <td>${dto.pro_subprice * dto.cart_amount}원</td>
				        </tr>
				      </c:forEach>
				    </c:if>
				  </tbody>

				</table>
				    <c:if test="${!empty total}">
				    	<div>
					  		<div>월 구독 가격 : ${total.totalSub }원</div>
							<div> 월 구매 개수 : ${total.totalCount } 개</div>
						     <div> 총 배송비 : ${total.totalDel }원</div>
						     <div> 월 구독 가격 + 총 배송비 : ${total.finalTotalPrice }원</div>
						</div>
				    </c:if>
		<hr>

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
					<label for="receiver_tel">연락처</label> <input type="text"
						class="form-control" id="receiver_tel" name="receiver_tel"
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
						value="${sessionScope.ssInfo.addr_detail}" placeholder="상세주소" required="required">
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
	 					id="checkbox" value="Y"  name="order_tos" class="form-control" required="required">
						</div>
				</div>
				<div>
					<label for="using_point">포인트</label> <input type="number"
						name="using_point" value="${0}" class="form-control">
				</div>
	
	
			<!-- 결제하기 버튼 생성 -->
			<button onclick="requestPay()">결제하기</button>
			

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

			var name = "${sessionScope.ssInfo.user_name}";
			var tp = ${total.finalTotalPrice };
			var addr=document.getElementById("order_addr").value;
			var uid = "OMM" + makeMerchantUid

			document.getElementById('orderIdxInput').setAttribute('value', uid);

			function requestPay() {
				IMP.request_pay({
					pg : "kakaopay", //"html5_inicis",
					pay_method : 'card',
					merchant_uid : uid,
					name : document.getElementById("order_name").value,
					amount : tp,
					buyer_email : "",
					buyer_name : document.getElementById("order_name").value,
					buyer_tel : document.getElementById("receiver_tel").value,
					buyer_addr : addr,
					buyer_postcode : document.getElementById("order_pcode").value
				}, function(rsp) { // callback
					if (rsp.success) {
						console.log(rsp);

						var msg = '결제가 완료되었습니다.';
						
						document.orderForm.submit();
						
						

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