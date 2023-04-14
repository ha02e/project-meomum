<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>주문취소 페이지</h1>

<hr>
<h3>취소사유를 선택해주세요</h3>
<div><select name="cancel_rs">
	<option value="1">상품이 마음에 들지 않음(단순변심)</option>
	<option value="2">다른 상품 추가 후 재주문 예정</option>
	<option value="3">판매자로부터 품절 안내 받음</option>
</select></div>
<div><button onclick="orderCancel()">신청하기</button></div>



<script>
function orderCancel() {
	  // 선택한 옵션의 값을 가져옴
	  var cancelRs = document.querySelector('select[name="cancel_rs"]').value;

	  // XMLHttpRequest 객체 생성
	  var xhr = new XMLHttpRequest();

	  // 요청 설정
	  xhr.open('POST', 'orderCancel.do', true);
	  xhr.setRequestHeader('Content-Type', 'application/json');

	  // 요청 전송
	  xhr.send(JSON.stringify({ cancel_rs: cancelRs }));

	  // 응답 처리
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === XMLHttpRequest.DONE) {
	      if (xhr.status === 200) {
	        // 서버로부터 성공적인 응답을 받았을 때 처리할 코드 작성
	      } else {
	        // 서버로부터 응답을 받지 못했을 때 처리할 코드 작성
	      }
	    }
	  }
	}
</script>
</body>


</html>