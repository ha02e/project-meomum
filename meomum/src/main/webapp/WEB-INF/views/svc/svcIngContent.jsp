<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
    
    <script>
    $(function(){
    	$('input[name="pointTotal"]')
    });
    </script>
    <!-- iamport.payment.js -->
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
	

	
		

</head>
<body>
	<%@include file="../header.jsp"%>
	<h1>방문 견적 예약</h1>
	
		<h3>예약 정보</h3>
		<ul>
			<input type="hidden" id="user_email" value="${sessionScope.ssInfo.user_id}">
			<input type="hidden" id="user_idx" value="${rdto.user_idx}">
			<li>${dto.svc_state}</li>
			<li>예약번호: <input type="text" id="svc_idx" value="${ingdto.svc_idx}" readonly></li>

			<c:if test="${dto.svc_state ne '예약취소'}">
			방문 예약 일시:${dto.svc_days}&nbsp;|&nbsp;${dto.svc_time}
			</c:if>
			<c:if test="${dto.svc_state eq '예약취소'}">
			방문 예약 일시:${dto.svc_days.substring(1)} | ${dto.svc_time.substring(1)}
			</c:if>

			<li>지역: ${dto.user_addr} ${dto.user_detail}</li>

			<li>거주형태: ${dto.svc_type}</li>

			<li>서비스 영역: ${dto.svc_area}</li>

			<li>거주 평수(공급면적): ${dto.svc_py}</li>

			<li>요청사항<br> ${dto.svc_req}
			</li>
			<hr>
			<h3>예약자 정보</h3>

			<li>성함: <input type="text" id="user_name" value="${dto.user_name}"></li>

			<li>휴대전화: <input type="text" id="user_tel" value="${dto.user_tel}"></li>
			
			<hr>
			<h3>견적금액</h3>

			<li>견적금액: <input type="text" id="total" value="${ingdto.total}"></li>
			<li>사용가능 포인트 :<input type="text" id="point_total" value="${rdto.result}" ><input type="checkbox" id="check" onclick="checkPt()">전액사용</li>
			<li>포인트 사용:<input type="text" id="point_num" oninput="getTotal()"></li>
			<li>총 결제 금액<input type="text" id="amount"></li>
		</ul>

		<div class="float-right">
			<c:if test="${dto.svc_state eq '견적완료' or dto.svc_state eq '결제대기'}">
				<button onclick="requestPay()">결제하기</button>
			</c:if>
			<c:if test="${dto.svc_state eq '결제취소'}">
				<a href="svc.do" class="btn btn-primary">재예약</a>
			</c:if>
<%-- 			<c:if test="${dto.svc_state eq '결제완료'}">				
				<c:url var="cancleUrl" value="svcCancle.do">
					<c:param name="svc_idx">${dto.svc_idx}</c:param>
					<c:param name="svc_days" value="${dto.svc_days}"/>
					<c:param name="svc_time" value="${dto.svc_time}"/>
				</c:url>
				<a href="${cancleUrl}" class="btn btn-dark">결제 취소</a>
			</c:if> --%>

		</div>
		
	<script>
	
	 var total = document.getElementById('total'); //견적금액
	 var point_total = document.getElementById('point_total'); //사용가능 포인트
	 var point_num = document.getElementById('point_num');//사용 포인트
	 var real_total = document.getElementById('amount');//총 결제 금액
	 
		function checkPt() {
			if (document.getElementById('check').checked) {
				point_num.value = point_total.value;
				point_num.disabled = true;
			} else {
				point_num.disabled = false;
				point_num.value = 0;
			}
			getTotal();
		}

		function getTotal() {
			var remainingPoint = point_total.value;
			if (!document.getElementById('check').checked) {
				remainingPoint -= point_num.value;
				if (remainingPoint < 0) {
					window.alert("사용 가능한 포인트를 초과하였습니다.");
					point_num.value = remainingPoint;
				}
			}
			real_total.value = total.value - remainingPoint;
		}
</script>
<script>
	  var IMP = window.IMP;
	  IMP.init("imp51432774"); 
	
	  function requestPay() {
		var today = new Date();
		var seconds = today.getSeconds().toString();
		var milliseconds = today.getMilliseconds().toString();
		var makeMerchantUid =seconds + milliseconds;  
		
	    var svcIdx = document.getElementById('svc_idx').value;
	    var amount = document.getElementById('amount').value;
	    var user_name = document.getElementById('user_name').value;
	    var user_tel = document.getElementById('user_tel').value;
	    var user_email = document.getElementById('user_email').value;
	    var user_idx= "${sessionScope.ssInfo.user_idx}";
	    
	    var uid = svcIdx + makeMerchantUid;
	    
	    console.log(user_idx);
	    console.log(uid);

	    event.preventDefault();
	
	    IMP.request_pay({
	      pg : "kakaopay", //html5_inicis
	      pay_method : 'card',
	      merchant_uid: uid, 
	      name : '정리일상',
	      amount : amount,
	      buyer_email : user_email,
	      buyer_name : user_name,
	      buyer_tel : user_tel,
	    }, function (rsp, event) { // callback
	      if (rsp.success) {
	    	  var PaymentDTO ={
	    			  	payment_idx: rsp.imp_uid, //payment_idx로 들어갈 값
			            cate_idx: rsp.merchant_uid, //인식번호(cate_idx)
			            payment_cate: 1, //payment_cate 카테고리
			            pay_method: rsp.pay_method, //pay_mehtod 지불수단
			            amount: rsp.paid_amount, //amount 금액
			            pay_buydate: rsp.paid_at, //pay_buydate 결제일
			            pay_cancleDate:'-',//pay_cancleDate 취소일(임시'-'로 지정)
			            pay_state: rsp.status,//pay_state

	    	  };
	    	 
	    	  var PointDTO = {
	    			  	cate_idx: svcIdx,
			            user_idx: user_idx,
			           	point_use: 0,
			          	point_info:'정리일상 결제',
			          	point_num: $("#point_num").val()
	    	  }
	    	  
	    	  console.log(PaymentDTO);
	    	  console.log(PointDTO);
	    	  
			 $.ajax({
		          type: 'POST',
		          url: "svcPay.do",
		          data: JSON.stringify(PaymentDTO,PointDTO),
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
	      } else {
	        alert('다시 시도해주세요');
	      }
	    });
	  }
	</script>

	<%@include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>