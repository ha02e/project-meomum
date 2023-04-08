<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body onload="setValue()">
	<h2>결제</h2>
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
					<option value="결제대기">결제대기</option>
					<option value="결제완료">결제완료</option>
					<option value="결제취소">결제취소</option>
			</select>
			</li>
		</ul>

		<div>
			<input type="submit" value="저장">
			<input type="button" value="닫기" onclick="popupClose()">
		</div>
	</form>
	
	<script>
	/**a_svcConted.jsp에 입력된 값 입력하기*/
	function setValue(){
		document.getElementById("svc_idx").value = opener.document.getElementById("svc_idx").value;
		document.getElementById("user_idx").value = opener.document.getElementById("user_idx").value;
	}
	
	/**견적금액과 할인금액을 계산해서 결제금액 출력*/
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

	/**datetime-local 오늘 이전 날짜는 불가하도록 지정*/
	var dateElement = document.getElementById('svc_datetime');
	var now = new Date();
	var date = new Date(now.getTime() - now.getTimezoneOffset() * 60000).toISOString().slice(0,-8);
	dateElement.value = date;
	dateElement.setAttribute("min", date);

	function setMinDate() {
		if (dateElement.value < date) {
			dateElement.value = date;
		}
	}
	
	/**a_svcContent.jsp에 값 보내기*/
	 function sendValue(){
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
	
	function popupClose(){
		window.opener.location.reload();
		window.close();
	}
	</script>

</body>

</body>
</html>