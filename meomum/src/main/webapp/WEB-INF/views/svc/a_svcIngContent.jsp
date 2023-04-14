<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<!-- 관리자 헤더 CSS -->
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">

</head>
<style>
body{
font-family: 'GmarketSansMedium';
}
</style>
</head>
<body class="app">

<div class="container mt-5">
	
<h2 class="text-center mb-4">결제</h2>
	<form name="svcIngUpdate" action="asvcIngUpdate.do" method="post" onkeypress="return event.keyCode != 13;" >
	<input type="hidden" name="svc_idx" id="svc_idx" value="${ingdto.svc_idx}" >
	<input type="hidden" name="user_idx" id="user_idx" value="${ingdto.user_idx}" >
		<div class="row justify-content-center">
			<div class="form-group mb-3">
				<label>서비스 일자</label>
 				<input type="datetime-local" class="form-control" name="svc_datetime" id="svc_datetime" value="${ingdto.svc_datetime}" onclick="setMinDate()"></li>
			</div>
			<div class="form-group mb-3">
				<label>견적금액</label>
				<input type="text" class="form-control" name="estimated" id="estimated" value="${ingdto.estimated}" oninput="getTotal()" >
			</div>
			<div class="form-group mb-3">
				<label>할인금액</label>
				<input type="text" class="form-control" name="discount" id="discount" value="${ingdto.discount}" oninput="getTotal()"> 
			</div>
			<div class="form-group mb-3">
				<label>결제방식</label>
				<select name="type" id="type" class="form-control" >
					<option value="카드결제" ${ingdto.type =="카드결제"?"selected":""}>카드결제</option>
					<option value="계좌이체" ${ingdto.type =="계좌이체"?"selected":""}>계좌이체</option>
				</select>
			</div>
			<div class="form-group mb-3">
				<label>결제금액</label>
				<input type="text" class="form-control" name="total" id="total" value="${ingdto.total}" readonly>
			</div>
			<div class="form-group mb-3">
				<label>결제상태</label>
				<select name="pay_state" id="pay_state" class="form-control">
					<option value="견적완료" ${ingdto.pay_state =="견적완료"?"selected":""}>견적완료</option>
					<option value="결제완료" ${ingdto.pay_state =="결제완료"?"selected":""}>결제완료</option>
					<option value="결제취소" ${ingdto.pay_state =="결제취소"?"selected":""}>결제취소</option>
					<option value="작업완료" ${ingdto.pay_state =="작업완료"?"selected":""}>작업완료</option>
				</select>
			</div>
		<div class="text-center">
			<input type="submit" class="btn app-btn-primary button" value="수정">
			<input type="button" class="btn app-btn-secondary button" value="닫기" onclick="popupClose()">
		</div>
		
	</form>
	</div>
	 
	<!-- 견적금액과 할인금액을 계산해서 결제금액 출력 -->
	<script src="js/svc/getTotal.js"></script>
	
	<!-- datetime-local 오늘 이전 날짜는 불가하도록 지정 -->
	<script src="js/svc/setMinDatetimeLocal.js"></script>
	
	<script>
		function popupClose() {
			window.opener.location.reload();
			window.close();
		}
	</script>

</body>
</html>