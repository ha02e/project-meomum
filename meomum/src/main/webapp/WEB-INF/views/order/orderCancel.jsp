<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>결제취소</h1>
<button onclick="cancelPay()">환불하기</button>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script>  
function cancelPay() {
	  const impUid = 'imp_370418922567'; // 결제 승인 번호
	  const merchantUid = "OMM2023041222017"; // 주문 번호
	  const cancelAmount = 48338; // 취소할 금액
	  const reason = "테스트 결제 취소"; // 취소 사유

	  $.ajax({
	    url: '/cancel-payment',
	    type: 'POST',
	    contentType: 'application/json',
	    data: JSON.stringify({
	      impUid: impUid,
	      merchantUid: merchantUid,
	      cancelAmount: cancelAmount,
	      reason: reason
	    }),
	    success: function(response) {
	      console.log(response);
	      alert('결제가 취소되었습니다.');
	      // 취소가 완료된 후 처리할 작업을 추가할 수 있습니다.
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	      console.log(textStatus, errorThrown);
	      alert('결제 취소가 실패하였습니다. 다시 시도해주세요.');
	    }
	  });
	}



</script>
</body>
</html>