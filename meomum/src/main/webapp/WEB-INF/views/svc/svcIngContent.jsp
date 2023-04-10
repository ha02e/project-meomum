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
	<script>
	var IMP = window.IMP; 
	IMP.init("imp51432774"); 

	function requestPay() {
	  var svcIdx = document.getElementById('svc_idx').value;
	  console.log(svcIdx);
	  var total = document.getElementById('total').value;
	  console.log(total);
	  var user_name = document.getElementById('user_name').value;
	  console.log(user_name);
	  var user_tel = document.getElementById('user_tel').value;
	  console.log(user_tel);
	  var user_email = document.getElementById('user_email').value;
	  console.log(user_email);
	  var url = "http://localhost:9090/meomum/svcIngContent.do?svc_idx=" + svcIdx;
	  
	  event.preventDefault();

	  IMP.request_pay({
	    pg : "html5_inicis",//kakaopay
	    pay_method : 'card',
        merchant_uid: '00006', 
        name : '정리일상',
        amount : total,
        buyer_email : user_email,
        buyer_name : user_name,
        buyer_tel : user_tel,
        /* buyer_addr : '서울특별시 강남구 삼성동',
        buyer_postcode : '123-456' */
	  }, function (rsp) { // callback
	    if (rsp.success) {
	      console.log(rsp);
	      alert('성공');
	    } else {
	      console.log(rsp);
	      alert('실패');
	    }
	  });
	}
</script>
</head>
<body>
	<%@include file="../header.jsp"%>
	<h1>방문 견적 예약</h1>
	
		<h3>예약 정보</h3>
		<ul>
			<input type="hidden" id="user_email" value="${sessionScope.ssInfo.user_id}">
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
<%-- 			<li>포인트 <input type="text" id="result" value="${rdto.result}"></li> --%>
			<li>총 결제 금액<input type="text" id="real_total"></li>
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

	<%@include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>