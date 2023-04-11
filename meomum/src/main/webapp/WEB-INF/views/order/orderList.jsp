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

	<div class="form-group">
		<form name="orderForm" action="orderForm.do" method="post"
			onsubmit="return validateForm()">

			<h2>구매 상품 정보</h2>
			<c:if test="${empty dto}">
				<div>존재하지 않거나 삭제된 상품입니다.</div>
			</c:if>

			<div>
				상품번호:${dto.pro_idx} <input type="hidden" name="pro_idx"
					value="${dto.pro_idx}" />
			</div>
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
					value="${dto.pro_delprice}" />
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
					value="${sessionScope.ssInfo.addr_detail}" placeholder="상세주소"
					required="required">
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
		</form>
		<div>
			<h3>결제 금액</h3>
		</div>
		<div>
			<label for="orderPay">주문 금액</label> <input type="number"
				name="orderPay"
				value="${dto.pro_subprice * param.cart_amount + dto.pro_delprice}"
				class="form-control">
		</div>
		<div>
			<label for="point_total">사용 가능포인트</label> <input type="text" id="point_total" value="${result}" readonly> 
			<input type="checkbox" id="check" onclick="checkPt()">전액사용
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

		<script>
	
	 var total = document.getElementById('orderPay'); //견적금액
	 var point_total = document.getElementById('point_total'); //사용가능 포인트
	 var point_num = document.getElementById('point_num');//사용 포인트
	 var real_total = document.getElementById('amount');//총 결제 금액
	 point_num.value = 0;
	 real_total.value = total.value;
	 
		function checkPt() {
			if (document.getElementById('check').checked) {
				point_num.value = point_total.value;
				point_num.disabled = true;
			} else {
				point_num.value = 0;
				point_num.disabled = false;
				
			}
			getTotal();
		}

		function getTotal() {
			var remainingPoint = point_total.value; 
			var usePoint = point_num.value;
			if (!document.getElementById('check').checked) {
				remainingPoint -= usePoint;
				if (remainingPoint < 0) {
					window.alert("사용 가능한 포인트를 초과하였습니다.");
					point_num.value = 0;
					real_total.value = total.value;
					console.log(total.value);
					console.log(real_total.value);
				}
				else{
					real_total.value = total.value - usePoint;
				}
			}
			
		}
</script>


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

			var tp = ${dto.pro_subprice * param.cart_amount + dto.pro_delprice};
			var bName =document.getElementById("order_name").value
			var bTel= document.getElementById("receiver_tel").value
			var addr= document.getElementById("order_addr").value;
			var bPcode= document.getElementById("order_pcode").value
			
			var uidx = ${sessionScope.ssInfo.user_idx};
			var pidx = ${dto.pro_idx};
			var pAmount = ${param.cart_amount};

			document.getElementById('orderIdxInput').setAttribute('value', uid);
			
			var uidx= ${sessionScope.ssInfo.user_idx};
			var pidx= ${dto.pro_idx};
			var amount = ${param.cart_amount};
			
			function requestPay() {
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
						
						var PointDTO = {
			    			  	cate_idx: uid,
					            user_idx: uidx,
					           	point_use: 1,
					          	point_info:'구독일상 결제',
					          	point_num: $("#point_num").val()
			    	  };
						
						
						$.ajax({
					          type: 'POST',
					          url: "orderPay.do",
					          data: JSON.stringify(PaymentDTO),
					          contentType: "application/json",
					          success: function (data) {
					        	 console.log(data);
					            alert('payment 테이블 성공');
					            
					            $.ajax({
							          type: 'POST',
							          url: "orderPro.do",
							          data: JSON.stringify(OrderProDTO),
							          contentType: "application/json",
							          success: function (data) {
							        	 console.log(data);
							            alert('orderPro 테이블 성공');
							            $.ajax({
							    	          type: 'POST',
							    	          url: "orderPoint.do",
							    	          data: JSON.stringify(PointDTO),
							    	          contentType: "application/json",
							    	          success: function (data) {
							    	            console.log(data);
							    	            alert('완료:point테이블');
							    	          },
							    	          error: function (xhr, status, error) {
							    	            alert('PointDTO insert 실패');
							    	          }
							    	        });
							    	      },
							    	      error: function (xhr, status, error) {
							    	        alert('PaymentDTO insert 실패');
							    	      }
							    	    });
							           
							          },
							          error: function (xhr, status, error) {
							            alert('orderPro 테이블 실패');
							            
							          }
							        });
					           
					          },
					          error: function (xhr, status, error) {
					            alert('payment 테이블 실패');
					            
					          }
					        });
				    	   
				        alert('결제가 완료되었습니다');
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