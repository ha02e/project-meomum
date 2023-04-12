<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- iamport.cancle.js -->
<script
  src="https://code.jquery.com/jquery-3.3.1.min.js"
  integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
  crossorigin="anonymous"></script>
<script>
 
  
  /* ... model/payments.js ... (MongDB와 Mongoose를 사용하여 결제 정보를 관리하는 모델 코드)*/
  var mongoose = require('mongoose');
  var Schema = mongoose.Schema;
  ...
  var PaymentsSchema = new Schema({
    imp_uid: String, // 포트원 `unique key`(환불 요청시 `unique key`로 사용)
    merchant_uid: String, // 주문번호(결제정보 조회시 사용)
    amount: { type: Number, default: 0 }, // 결제 금액(환불 가능 금액 계산시 사용)
    // 환불 된 총 금액(환불 가능 금액 계산시 사용)
    cancel_amount: { type: Number, default: 0 }, 
    ...
  });
  ...
  module.exports = mongoose.model('Payments', PaymentsSchema);
  
  /* ... 중략 ... */
  var Payments = require('./models/payments');
  app.post('/payments/cancel', async (req, res, next) => {
    try {
      /* 액세스 토큰(access token) 발급 */
      /* ... 중략 ... */
      /* 결제정보 조회 */
      const { body } = req;
      const { merchant_uid } = body; // 클라이언트로부터 전달받은 주문번호
      Payments.find({ merchant_uid }, async function(err, payment) { 
        if (err) {
          return res.json(err);
        }
        const paymentData = payment[0]; // 조회된 결제정보
        /* 포트원 REST API로 결제환불 요청 */
        ...
      });
    } catch (error) {
      res.status(400).send(error);
    }
  });
  
  /* ... 중략 ... */
  app.post('/payments/cancel', async (req, res, next) => {
    try {
      /* 액세스 토큰(access token) 발급 */
      /* ... 중략 ... */
      /* 결제정보 조회 */
      Payments.find({ merchant_uid }, async function(err, payment) { 
        /* ... 중략 ... */
        /* 포트원 REST API로 결제환불 요청 */
        /* ... 중략 ... */
        const { response } = getCancelData.data; // 환불 결과
        /* 환불 결과 동기화 */
        const { merchant_uid } = response; // 환불 결과에서 주문정보 추출
        Payments.findOneAndUpdate({ merchant_uid }, response, { new: true }, function(err, payment) { // 주문정보가 일치하는 결제정보를 추출해 동기화
          if (err) {
            return res.json(err);
          }
          res.json(payment); // 가맹점 클라이언트로 환불 결과 반환
        });
      });
    } catch (error) {
      res.status(400).send(error);
    }
  });
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
</body>
</html>