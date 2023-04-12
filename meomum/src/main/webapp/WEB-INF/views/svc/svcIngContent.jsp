<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html>
<head>
<script src="/docs/5.3/assets/js/color-modes.js"></script>

<meta charset="UTF-8">

<title>정리일상 진행 현황</title>
	<!-- jQuery -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<link rel="canonical" href="https://getbootstrap.com/docs/5.3/examples/checkout/">

<link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet" >
   
  <style>
      .b-example-divider {
        width: 100%;
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
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
      
      .list-group-item input[type="text"],
	.list-group-item input[type="text"]:focus {
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
<div class="container">
  <main>
    <div class="py-5 text-center">
      <h2>정리일상 진행 현황</h2>
    </div>

    <div class="row g-5">
    <!-- 결제 div 시작 -->
    <%-- <c:if test="${dto.svc_state eq '견적완료'}"> --%>
<div class="col-md-5 col-lg-4 order-md-last">
	  <h4 class="d-flex justify-content-between align-items-center mb-3">
	    <span class="text-primary">결제금액</span>
	  </h4>
	  <ul class="list-group mb-3">
	    <li class="list-group-item d-flex justify-content-between lh-sm">
	      <div>
	        <h6 class="my-0">견적금액</h6>
	      </div>
	      <div>
	        <input type="text" id="total" value="${ingdto.total}" readonly>
	      </div>
	    </li>
	    <li class="list-group-item d-flex justify-content-between lh-sm">
	      <div>
	        <h6 class="my-0">나의 포인트</h6> 
	      </div>
	      <div class="d-flex align-items-center">
	        <input type="text" id="point_total" value="${result}" readonly>
	        <input type="checkbox" id="check" onclick="checkPt()">전액사용
	      </div>
	    </li>
	    <li class="list-group-item d-flex justify-content-between bg-body-tertiary">
	      <div class="text-success">
	        <h6 class="my-0">사용 포인트</h6>
	      </div>
	      <div>
	        <input type="text" id="point_num" oninput="getTotal()">
	      </div>
	    </li>
	    <li class="list-group-item d-flex justify-content-between">
	      <span>총 결제금액</span>
	      <strong>
	        <input type="text" id="amount" readonly>
	      </strong>
	    </li>
	  </ul>
	  <div class="form-check">
	    <input class="form-check-input" type="checkbox" id="checkbox" required="required">
	    (필수)결제 내용을 확인했으며, 정보 제공 등에 동의합니다
	    <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"> (내용보기)</a>
	  </div>
	  
	    <div class="input-group">
	      <button class="btn btn-primary" onclick="requestPay()">결제하기</button>
	    </div>
	 
	</div>


        <%-- </c:if> --%>
       <!-- 결제 div 끝 -->
       
       <!-- 예약 상세 내용 시작 -->
      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">신청 상세 내용</h4>
        <form class="needs-validation" >
        <input type="hidden" id="user_email" value="${sessionScope.ssInfo.user_id}">
		<input type="hidden" id="user_idx" value="${rdto.user_idx}">
          <div class="row g-3">
            <div class="col-12">
              <label for="svc_idx" class="form-label">예약번호</label><br>
			 <input type="text" class="form-control" id="svc_idx" value="${ingdto.svc_idx}" readonly>
              <%-- <medium class="text-body-secondary" id="svc_idx">${dto.svc_idx}</medium> --%>
            </div>
            
			<c:if test="${dto.svc_state ne '결제취소'}">
            <div class="col-12">
              <label for="svc_days_time" class="form-label">방문 예약 일시</label><br>
              <medium class="text-body-secondary">${dto.svc_days}&nbsp;|&nbsp;${dto.svc_time}</medium>
            </div>
            </c:if>
            
            <c:if test="${dto.svc_state eq '결제취소'}">
            <div class="col-12">
              <label for="svc_days_time" class="form-label">방문 예약 일시</label><br>
              <medium class="text-body-secondary">${dto.svc_days.substring(1)} | ${dto.svc_time.substring(1)}</medium>
            </div>
            </c:if>

            <div class="col-12">
              <label for="addr" class="form-label">지역</label><br>
              <medium class="text-body-secondary">${dto.user_addr}${dto.user_detail}</medium>
            </div>
            
            <div class="col-12">
              <label for="svc_type" class="form-label">거주형태</label><br>
              <medium class="text-body-secondary">${dto.svc_type}</medium>
            </div>
            
           <div class="col-12">
              <label for="svc_area" class="form-label">서비스 영역</label><br>
              <medium class="text-body-secondary">${dto.svc_area}</medium>
            </div>
            
             <div class="col-12">
              <label for="svc_py" class="form-label">거주 평수(공급면적)</label><br>
              <medium class="text-body-secondary">${dto.svc_py}평</medium>
            </div>
            
             <div class="col-12">
              <label for="svc_req" class="form-label">요청사항</label><br>
              <medium class="text-body-secondary">${dto.svc_req}</medium>
            </div>
            
			<!-- 아코디언
			<div class="accordion" id="accordionPanelsStayOpenExample">
			  <div class="accordion-item">
			    <h2 class="accordion-header">
			      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#panelsStayOpen-collapseOne" aria-expanded="true" aria-controls="panelsStayOpen-collapseOne">
			        Accordion Item #1
			      </button>
			    </h2>
			    <div id="panelsStayOpen-collapseOne" class="accordion-collapse collapse show" >
			      <div class="accordion-body" >
			        <strong>This is the first item's accordion body.</strong> It is shown by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
			      </div>
			    </div>
			  </div>
			  <div class="accordion-item">
			</div>
			아코디언 끝 -->

			<hr class="my-4">
			<h4 class="mb-3">예약자 정보</h4>
            <div class="col-12">
              <label for="user_name" class="form-label">성함 <br>
               <input type="text" class="form-control" id="user_name" value="${dto.user_name}">
              <%-- <medium class="text-body-secondary" id="user_name">${dto.user_name}</medium> --%>
            </div>

            <div class="col-12">
              <label for="user_tel" class="form-label">휴대전화</label>
               <input type="text" class="form-control" id="user_tel" value="${dto.user_tel}">
              <%-- <medium class="text-body-secondary"vid="user_tel">${dto.user_tel}</medium> --%>
            </div>
          </div>

          <hr class="my-4">
          
          <!-- svc_state에 따른 버튼 변경 -->
          	<c:if test="${dto.svc_state eq '결제취소'}">
				<a href="svc.do" class="w-100 btn btn-primary"></a>
			</c:if>
			<c:if test="${dto.svc_state eq '결제완료'}">				
				<input type="button" class="w-100 btn btn-primary" value="결제취소" onclick="canclePay()">
			</c:if>
			
			<c:if test="${dto.svc_state eq '작업완료'}">
			<c:url var="contentUrl" value="reviewWrite.do">
 			 	<c:param name="activity_idx">${ingdto.svc_idx}</c:param>
  				<c:param name="writer">${dto.user_name}</c:param>
  				<c:param name="category">정리일상</c:param>                     
  			</c:url>
            <a href="${contentUrl}" class="w-100 btn btn-primary">후기 작성하기</a>
			</c:if>
        </form>
      </div>
    </div>
  </main>

</div>


   
  </body>
</html>
		
<!-- 포인트 조회 및 사용-->
<script src="js/point.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="js/svc/payment.js"></script>

<!-- iamport.cancle.js -->
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script>
  function cancelPay() {
    jQuery.ajax({
      // 예: http://www.myservice.com/payments/cancel
      //"url": "{환불정보를 수신할 가맹점 서비스 URL}", 
      "type": "POST",
      "contentType": "application/json",
      "data": JSON.stringify({
        "merchant_uid": "{imp_835474242464}", // 예: ORD20180131-0000011
        "cancel_request_amount": 196500, // 환불금액
        //"reason": "테스트 결제 환불" // 환불사유
        // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
        //"refund_holder": "홍길동", 
        // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
        //"refund_bank": "88" 
        // [가상계좌 환불시 필수입력] 환불 수령계좌 번호
        //"refund_account": "56211105948400" 
      }),
      "dataType": "json"
    });
  }
</script>




<%@include file="../footer.jsp"%>
	<!-- 필수 개인정보 제공 동의 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">필수 개인정보 제공 동의</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					1. 개인정보를 제공받는 자 : 머뭄<br>
					2. 제공하는 개인정보 항목 : 이름, 아이디, (휴대)전화번호, 상품 구매정보,결제수단, 정리일상 진행 주소)<br>
					3. 개인정보를 제공받는 자의 이용목적 :  본인의사의 확인, 고객상담 및 불만처리/부정이용 방지 등의 고객관리, 새로운 상품/서비스 정보와 고지사항의 안내, 상품/서비스 구매에 따른 혜택 제공, 서비스 개선·통계·분석<br>
					4. 개인정보를 제공받는 자의 개인정보 보유 및 이용기간 : 개인정보 이용목적 달성 시까지 보존합니다. 단, 관계 법령의 규정에 의하여 일정 기간 보존이 필요한 경우에는 해당 기간만큼 보관 후 삭제합니다.<br>
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