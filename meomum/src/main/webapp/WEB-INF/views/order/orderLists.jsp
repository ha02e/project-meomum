<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>머뭄 주문/결제</title>
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
	function findaddra() {
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
	function findaddrb() {
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

<style>
#user_info {
	display: block;
}

#user_info.hidden {
	display: none;
}

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
@font-face {
    font-family: 'KimjungchulGothic-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/KimjungchulGothic-Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

.useTitle{
    font-family: 'KimjungchulGothic-Bold';
	color : #478368;
	
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

	<div class="container" style="margin-bottom: 50px;margin-top: 50px;">
		<div class="row">
			<h2 class="mb-4 text-center">주 문 상 품</h2>
		
			<div class="border">
				<table class="table" >
					<thead>
						<tr>
							<th scope="col">상품 이미지</th>
							<th scope="col">상품명</th>
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
								<td><img alt="pro_img" class="thumbimg"
									src="/meomum/images/items/${dto.pro_thumb}"></td>
								<td>${dto.pro_name}</td>
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
							<input type="hidden" name="pro_amount"
								value="${dto.cart_amount}">
						</c:forEach>
					</c:if>
				</tbody>
			</table>
				<!-- 총 상품 정보 -->
				<c:if test="${!empty total}">
					<div>
						<div class="text-end">
							월 구독 가격 :
							<fmt:formatNumber type="number" maxFractionDigits="3"
								value="${total.totalSub }" />
							원
						</div>
						<div class="text-end">구매 상품 수 : ${total.totalCount } 개</div>
						<div class="text-center">
							총 배송비 : <span style="color: red;"><fmt:formatNumber
									type="number" maxFractionDigits="3" value="${total.totalDel }" /></span>원
						</div>
						<div class="text-center" style = "font-size:20px;">
							월 구독 가격 + 총 배송비 :
							<span style="color:red;">
								<fmt:formatNumber type="number" maxFractionDigits="3"
								value="${total.finalTotalPrice }" />
								</span>원
						</div>
					</div>
				</c:if>
				<!-- 총 상품정보 끝  -->
			</div><!-- 테이블 보더 -->
		</div>
	<hr>

		<hr style="margin-top: 50px;">
			<form name="ordersForm" id="ordersForm">

			<h2 class="text-center mb-4" style="margin-top: 50px;">배송 정보 입력</h2>
	<div class="container bg-light" style="width:70%">
		<div>

			<h4 class="useTitle text-center my-3">계약자 정보</h4>
			<input type="hidden" name="user_idx" 
				value="${sessionScope.ssInfo.user_idx}">
		</div>
		<div class="mb-3">
			<label for="order_name">고객명</label> <input type="text"
				class="form-control" id="order_name" name="order_name"
				value="${sessionScope.ssInfo.user_name}" placeholder="이름을 입력해주세요">
		</div>
		<div  class="mb-3">
			<label for="order_tel">연락처</label> <input type="text"
				class="form-control" id="order_tel" name="order_tel"
				value="${sessionScope.ssInfo.user_tel}" placeholder="연락처 -제외 하고 입력">
		</div>
		<div  class="mb-3">
			<label for="order_pcode">우편번호</label>
			<div class="input-group mb-3">
				<input type="text" class="form-control" id="order_pcode"
					name="order_pcode" value="${sessionScope.ssInfo.user_pcode}"
					placeholder="우편번호" readonly="readonly" onclick="findaddra()">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button"
						onclick="findaddra()">우편번호 검색</button>
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
	</div>
</div>
	<div class="container bg-light" style="width:70%">
		<h4 class="useTitle text-center my-3">사용자 정보</h4>
		<div >
			<input type="checkbox" value="y"
				onclick="copyUserInfo();"> <label style="color :#C45630; ">계약자와
				동일</label>
		</div>
		<div id="user_info" class="mb-3">
			<label for="buyer_name">고객명</label> <input type="text"
				class="form-control" id="buyer_name" name="buyer_name"  required="required" pattern="[가-힣]{2,5}"
				placeholder="이름을 입력해주세요"> <label for="buyer_tel" >연락처</label>
			<input type="text" class="form-control" id="buyer_tel"
				name="buyer_tel" value="" placeholder="연락처 -제외 하고 입력" required="required" pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}"> <label
				for="buyer_pcode">우편번호</label>
			<div class="input-group mb-3">
				<input type="text" class="form-control" id="buyer_pcode"
					name="buyer_pcode"  placeholder="우편번호" readonly="readonly" required="required"
					onclick="findaddrb()">
				<div class="input-group-append">
					<button class="btn btn-outline-secondary" type="button"
						onclick="findaddrb()">우편번호 검색</button>
				</div>
			</div>
			<label for="buyer_addr">기본주소</label> <input type="text"
				class="form-control" id="buyer_addr" name="buyer_addr" value=""
				placeholder="기본주소" readonly="readonly" required="required"> <label
				for="buyer_detail">상세주소</label> <input type="text"
				class="form-control" id="buyer_detail" name="buyer_detail" 
				placeholder="상세주소" required="required">

		<div>
			<label for="order_msg">배송 메세지</label> <input type="text"
				class="form-control" id="order_msg" name="order_msg"
				placeholder="배송메세지">
		</div>
		</div>
		</div>
	
		<div>
		<div class="container bg-light my-5" style="width:70%">
		
			<label for="checkbox"> 개인정보이용동의 </label>
			
			<div class="form-control"> 
			<input class="form-check-input" type="checkbox"
					id="checkbox" value="Y" name="order_tos" class="form-control"
					required="required">
			
			개인정보이용에 동의합니다.<a href="#" data-bs-toggle="modal" data-bs-target="#usecheckModal">[내용]
				</a>
			</div>
		</div>
</div>
		<h2 class="text-center mb-4">결제 금액</h2>
	<div class="container bg-light" style="width:70% ;">
	
		<div class="mb-3">
			<label for="orderPay">주문 금액</label> <input type="text" name="total"
				id="total"
				value="${total.finalTotalPrice}"
				class="form-control">
		</div>
		<div class="mb-3">
			<label for="point_total">사용 가능포인트</label> <input type="text"
				id="point_total" value="${result}" readonly> <input
				type="checkbox" id="check" onclick="checkPt()">전액사용
		</div>
		<div class="mb-3">
			<label for="point_num">포인트 사용</label> <input type="text"
				id="point_num" oninput="getTotal()">
		</div>
		<div class="mb-3">
			<label for="amount">최종 결제금액</label> <input type="text" id="amount"
				readonly="readonly">
		</div>
	</div>
		<!-- 결제하기 버튼 생성 -->
					<div class="d-grid d-md-flex justify-content-center mx-auto">
					<button type="button" class="btn btn-primary mb-2 mb-md-0"
						onclick="requestPay();">결제하기</button> 
						  <span style="margin: 0 10px;"></span>
						<button type="button" class="btn btn-outline-secondary" onclick="location.href='proList.do'"
						>목록으로</button>
					</div>
					</form>
		</div>
		


	<%@include file="../footer.jsp"%>
<!-- -------------------------------------------------------------------------------------- -->
<!-- 이용약관 Modal -->
	<div class="modal fade" id="usecheckModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">머뭄 개인정보 처리 방침</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					여러분을 환영합니다. <br>
					머뭄서비스 및 제품(이하 ‘서비스’)을
					이용해 주셔서 감사합니다. 본 약관은 다양한  머뭄 서비스의 이용과 관련하여  머뭄 서비스를 제공하는  머뭄
					주식회사(이하 ‘ 머뭄’)와 이를 이용하는  머뭄 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러
					여러분의  머뭄 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.  머뭄 서비스를 이용하시거나  머뭄
					서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어
					주의 깊게 살펴봐 주시기 바랍니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>




<!-- ------------------------------------------------------------------------------- -->
		<!-- 포인트 조회 및 사용-->
		<script src="js/point.js">
			console.log(amount)
		</script>



		<script>

		function copyUserInfo() {
			var checked = document
					.querySelector('input[type="checkbox"][value="y"]').checked;
			if (checked) {
				document.querySelector('#buyer_name').value = document.querySelector('#order_name').value;
				document.querySelector('#buyer_tel').value = document.querySelector('#order_tel').value;
				document.querySelector('#buyer_pcode').value = document.querySelector('#order_pcode').value;
				document.querySelector('#buyer_addr').value = document.querySelector('#order_addr').value;
				document.querySelector('#buyer_detail').value = document.querySelector('#order_detail').value;
			    document.getElementById('user_info').classList.remove('hidden');
			    var userInfoDiv = document.getElementById("user_info");
			    userInfoDiv.classList.add("hidden");

			}else{
				document.querySelector('#buyer_name').value = '';
		        document.querySelector('#buyer_tel').value = '';
		        document.querySelector('#buyer_pcode').value = '';
		        document.querySelector('#buyer_addr').value = '';
		        document.querySelector('#buyer_detail').value = '';
		        var userInfoDiv = document.getElementById("user_info");
		        userInfoDiv.classList.remove("hidden");

			}
		}

		
	</script>


		<script>
			var IMP = window.IMP;
			IMP.init("imp77686458");

			
            function validateForm() {
                var form = document.ordersForm;
                  if (!form.checkValidity()) { // HTML5 폼 유효성 검사
                        form.querySelector(':invalid').focus(); // 유효하지 않은 입력 필드에 포커스
                        alert('입력을 하지 않았거나\n올바른 값을 입력하지 않았습니다.');

                    return false;
                  }
                  return true;
            }
            
			
			function requestPay() {
                if (!validateForm()) {
                    return;
                  }
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

						var lists = [];
						<c:forEach var="dto" items="${lists}">
						    lists.push({
						       
						        pro_idx: ${dto.pro_idx},
						        pro_amount: ${dto.cart_amount}
						    });
						</c:forEach>
						
						var OrderProDTOs = [];
						for (var i = 0; i < lists.length; i++) {
						    var list = lists[i];
						    var OrderProDTO = {
						        order_idx: rsp.merchant_uid, //주문번호
						        user_idx: uidx, //유저번호
						        pro_idx: list.pro_idx, //상품번호
						        pro_amount: list.pro_amount, //수량
						    };
						    OrderProDTOs.push(OrderProDTO);
						}
	


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
							url : "totalOrderss.do",
							data : JSON.stringify({
								paydto : PaymentDTO,
								odto : OrderProDTOs, // 배열 객체 전달
								pdto : PointDTO,
								ordto : OrderDTO
							}),
							contentType : "application/json; charset=utf-8",
							dataType : "json",
							success : function(data) {
								console.log(data);
								location.href="index.do";
							},
							error : function(xhr, status, error) {
								alert('결제는 되었으나 주문이 되지 않았습니다. 고객센터로 문의바랍니다.');
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
</body>
</html>