<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>결제</h2>
	<form name="svcIngInsert" action="svcIngInsert.do" method="post">
	<input type="hidden" name="svc_idx">
	<input type="hidden" name="user_idx">
		<ul>
			<li>서비스 일자 <input type="datetime-local" name="svc_datetime" id="svc_datetime"></li>

			<li>견적금액 <input type="text" name="estimated" id="estimated" oninput="getTotal()"></li>

			<li>할인금액 
				<input type="text" name="discount" id="discount" value="0" oninput="getTotal()"> 
				<input type="button" value="사용자 포인트 확인" onclick=""></li>

			<li>결제방식 <select name="type">
					<option value="카드결제">카드결제</option>
					<option value="계좌이체">계좌이체</option>
			</select>
			</li>

			<li>결제금액<input type="text" name="total" id="pay_total"></li>

			<li>결제상태 <select name="pay_state">
					<option value="견적완료">견적완료</option>
					<option value="결제대기">결제대기</option>
					<option value="결제완료">결제완료</option>
					<option value="결제취소">결제취소</option>
			</select>
			</li>
		</ul>

		<div>
			<input type="submit" value="저장">
		</div>
	</form>
	
	
	<script>
		//견적금액과 할인금액을 계산해서 결제금액 출력
		function getTotal() {
			var estimated = document.getElementById('estimated').value;
			var discount = document.getElementById('discount').value;
			var total = document.getElementById('total');

			if (estimated && discount) {
				var result = parseInt(estimated) - parseInt(discount);
				total.value = result;
			} else {
				total.value = "";
			}
		}
	</script>

	<script>
		//datetime-local 오늘 이전 날짜는 불가하도록 지정
		var dateElement = document.getElementById('svc_datetime');
		var now = new Date();
		var date = new Date(now.getTime() - now.getTimezoneOffset() * 60000)
				.toISOString().split("T")[0];
		dateElement.value = date;
		dateElement.setAttribute("min", date);

		function setMinDate() {
			if (dateElement.value < date) {
				dateElement.value = date;
			}
		}
	</script>

</body>
</html>