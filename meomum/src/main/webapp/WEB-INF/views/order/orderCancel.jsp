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
	  const impUid = 'imp_130195580435'; // 결제 승인 번호
	  const merchantUid = "OMM2023041401956"; // 주문 번호
	  const cancelAmount = 68500; // 취소할 금액
	  const reason = "테스트 결제 취소"; // 취소 사유

	  // getToken API 호출
	  fetch('https://api.iamport.kr/users/getToken', {
	    method: 'POST',
	    headers: {
	      'Content-Type': 'application/json'
	    },
	    body: JSON.stringify({
	      imp_key: '2724123558676304', // [아임포트 관리자]에서 발급받은 REST API 키
	      imp_secret: 'L2qa7rXItwowgMPwNsjJDz6DI77vzK5cYuKLSAazaEf2B7HGZVi5cGvcBsVufR76ItpGoyBiW0RYvBH7' // [아임포트 관리자]에서 발급받은 REST API secret key
	    }),
	  })
	  .then(response => response.json())
	  .then(data => {
	    console.log(data);
	    // 액세스 토큰을 성공적으로 받아왔을 경우, 해당 토큰을 사용하여 결제 취소 API를 호출합니다.
	    fetch('https://api.iamport.kr/payments/cancel', {
	      method: 'POST',
	      headers: {
	        'Content-Type': 'application/json',
	        'Authorization': `Bearer ${data.response.access_token}` // getToken API에서 발급받은 액세스 토큰
	      },
	      body: JSON.stringify({
	        imp_uid: impUid,
	        merchant_uid: merchantUid,
	        amount: cancelAmount,
	        reason: reason
	      }),
	    })
	    .then(response => response.json())
	    .then(data => {
	      console.log(data);
	      alert('결제가 취소되었습니다.');
	      // 취소가 완료된 후 처리할 작업을 추가할 수 있습니다.
	    })
	    .catch(error => {
	      console.log(error);
	      alert('결제 취소가 실패하였습니다. 다시 시도해주세요.');
	    });
	  })
	  .catch(error => {
	    console.log(error);
	    alert('액세스 토큰 발급이 실패하였습니다. 다시 시도해주세요.');
	  });
	}





</script>
</body>
</html>