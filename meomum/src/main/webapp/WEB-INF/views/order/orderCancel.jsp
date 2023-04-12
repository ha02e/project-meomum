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
	    url: 'https://coros-anywhere.herokuapp.com/https://api.iamport.kr/payments/cancel',
	    type: 'POST',
	    headers: {
	      'Content-Type': 'application/json',
	      'Authorization': 'Basic ' + btoa('2724123558676304' + ':' + 'L2qa7rXItwowgMPwNsjJDz6DI77vzK5cYuKLSAazaEf2B7HGZVi5cGvcBsVufR76ItpGoyBiW0RYvBH7')
	    },
	    data: JSON.stringify({
	      imp_uid: impUid,
	      merchant_uid: merchantUid,
	      amount: cancelAmount,
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

function cancelPay() {
	  const impUid = 'imp_370418922567'; // 결제 승인 번호
	  const merchantUid = "OMM2023041222017"; // 주문 번호
	  const cancelAmount = 48338; // 취소할 금액
	  const reason = "테스트 결제 취소"; // 취소 사유
	  
	  // 액세스 토큰 발급 API 호출
	  $.ajax({
	    url: 'https://api.iamport.kr/users/getToken',
	    type: 'POST',
	    data: {
	      imp_key: '2724123558676304', // 본인의 아임포트 API 키
	      imp_secret: 'L2qa7rXItwowgMPwNsjJDz6DI77vzK5cYuKLSAazaEf2B7HGZVi5cGvcBsVufR76ItpGoyBiW0RYvBH7' // 본인의 아임포트 API 시크릿키
	    },
	    dataType: 'json',
	    success: function(response) {
	      const accessToken = response.response.access_token; // 발급된 액세스 토큰
	      // 결제 취소 API 호출
	      $.ajax({
	        url: 'https://api.iamport.kr/payments/cancel',
	        type: 'POST',
	        headers: {
	          'Content-Type': 'application/json',
	          'Authorization': accessToken // 액세스 토큰 추가
	        },
	        data: JSON.stringify({
	          imp_uid: impUid,
	          merchant_uid: merchantUid,
	          amount: cancelAmount,
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
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	      console.log(textStatus, errorThrown);
	      alert('액세스 토큰 발급에 실패하였습니다.');
	    }
	  });
	}


</script>
</body>
</html>