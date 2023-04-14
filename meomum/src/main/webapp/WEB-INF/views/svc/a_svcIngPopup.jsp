<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"> 

<!-- 관리자 헤더 CSS -->
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">

<!-- 데이터테이블 css&js 
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css"
	rel="stylesheet" type="text/css">-->
</head>
<style>
body{
font-family: 'GmarketSansMedium';
}
</style>

<body class="app" onload="getValue()">
	<div class="container mt-5">
	
		<h2 class="text-center mb-4">결제</h2>
		<form name="svcIngInsert" action="svcIngInsert.do" method="post" onsubmit="sendValue()" onkeypress="return event.keyCode != 13;">
			<input type="hidden" name="svc_idx" id="svc_idx"> <input
				type="hidden" name="user_idx" id="user_idx">
			<div class="row justify-content-center">
				<div class="col-md-6">
					<div class="form-group mb-3">
						<label for="svc_datetime">서비스 일자</label> <input
							type="datetime-local" class="form-control" id="svc_datetime"
							name="svc_datetime" onclick="setMinDate()">
					</div>
					<div class="form-group mb-3">
						<label for="estimated">견적금액</label> <input type="text"
							class="form-control" id="estimated" name="estimated"
							oninput="getTotal()">
					</div>
					<div class="form-group mb-3">
						<label for="discount">할인금액</label> <input type="text"
							class="form-control" id="discount" name="discount" value="0"
							oninput="getTotal()">
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group mb-3">
						<label for="type">결제방식</label> <select class="form-control"
							id="type" name="type">
							<option value="카드결제">카드결제</option>
							<option value="계좌이체">계좌이체</option>
						</select>
					</div>
					<div class="form-group mb-3">
						<label for="total">결제금액</label> <input type="text"
							class="form-control" id="total" name="total" readonly>
					</div>
					<div class="form-group mb-3">
						<label for="pay_state">결제상태</label> <select class="form-control"
							id="pay_state" name="pay_state">
							<option value="견적완료">견적완료</option>
							<option value="결제완료">결제완료</option>
							<option value="결제취소">결제취소</option>
							<option value="작업완료">작업완료</option>
						</select>
					</div>
				</div>
			</div>
			<div class="text-center">
				<button type="submit" class="btn app-btn-primary button">저장</button>
				<button type="button" class="btn app-btn-secondary button"
					onclick="popupClose()">닫기</button>
			</div>
		</form>
	</div>







	<!-- 원본 <h2>결제</h2>
	<form name="svcIngInsert" action="svcIngInsert.do" method="post"  onsubmit="sendValue()">
	<input type="hidden" name="svc_idx" id="svc_idx" >
	<input type="hidden" name="user_idx" id="user_idx">
		<ul>
			<li>서비스 일자 <input type="datetime-local" name="svc_datetime" id="svc_datetime" onclick="setMinDate()"></li>

			<li>견적금액 <input type="text" name="estimated" id="estimated" oninput="getTotal()"></li>

			<li>할인금액 
				<input type="text" name="discount" id="discount" value="0" oninput="getTotal()"> 
			</li>

			<li>결제방식 <select name="type" id="type">
					<option value="카드결제">카드결제</option>
					<option value="계좌이체">계좌이체</option>
			</select>
			</li>

			<li>결제금액<input type="text" name="total" id="total"></li>

			<li>결제상태 <select name="pay_state" id="pay_state">
					<option value="견적완료">견적완료</option>
					<option value="결제완료">결제완료</option>
					<option value="결제취소">결제취소</option>
					<option value="작업완료">작업완료</option>
			</select>
			</li>
		</ul>

		<div>
			<input type="submit" value="저장">
			<input type="button" value="닫기" onclick="popupClose()">
		</div>
	</form> -->

	<script>
		/**a_svcConted.jsp에 입력된 값 입력하기*/
		function getValue() {
			document.getElementById("svc_idx").value = opener.document
					.getElementById("svc_idx").value;
			document.getElementById("user_idx").value = opener.document
					.getElementById("user_idx").value;
		}
	</script>

	<!-- 견적금액과 할인금액을 계산해서 결제금액 출력 -->
	<script src="js/svc/getTotal.js"></script>

	<!-- datetime-local 오늘 이전 날짜는 불가하도록 지정 -->
	<script src="js/svc/setMinDatetimeLocal.js"></script>

	<script>
		/**a_svcContent.jsp에 값 보내기*/
		function sendValue() {
			var svcDatetime = document.getElementById('svc_datetime').value;
			var type = document.getElementById('type').value;
			var estimated = document.getElementById('estimated').value;
			var discount = document.getElementById('discount').value;
			var total = document.getElementById('total').value;
			var payState = document.getElementById('pay_state').value;

			opener.document.getElementById('svc_datetime').value = svcDatetime;
			opener.document.getElementById('type').value = type;
			opener.document.getElementById('estimated').value = estimated;
			opener.document.getElementById('discount').value = discount;
			opener.document.getElementById('total').value = total;
			opener.document.getElementById('pay_state').value = payState;
		}

		function popupClose() {
			window.opener.location.reload();
			/* opener.document.getElementById('pay_state').value = pdocument.getElementById('pay_state').value; */
			window.close();
		}
	</script>

</body>

</body>
</html>