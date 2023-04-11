<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
.card{
	width:500px;
	margin:10px auto;
}

.form-label{
	font-weight: bold;
}

hr{
	margin:30px 0;
}

.orderMsg{
	resize:none;
}

.form-btn button{
	margin:10px;
}

.btn-primary {
    --bs-btn-color: #fff;
    --bs-btn-bg: #85745D;
    --bs-btn-border-color: #85745D;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #4F4538;
    --bs-btn-hover-border-color: #4F4538;
    --bs-btn-focus-shadow-rgb: 49,132,253;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #FE8A7F;
    --bs-btn-active-border-color: #FFC1B4;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #fff;
    --bs-btn-disabled-bg: #85745D;
    --bs-btn-disabled-border-color: #85745D;
}
</style>
</head>

<body>
	<div class="row">
		<div class="col-sm-12">
	    <div class="card mb-4">
	    
			<div class="card-header d-flex justify-content-between align-items-center">
	        	<h5 class="mb-0">주문번호&nbsp;${param.order_idx}</h5> <small class="text-muted float-end">${dto.order_date}</small>
	      	</div>
	      
			
			<div class="card-body">
			<form action="shipInsert.do" name="shipInsert" method="post">
			
				<input type="hidden" name="user_idx" value="${dto.user_idx}">
				<input type="hidden" name="order_idx" value="${param.order_idx}">
				<input type="hidden" name="pro_idx" value="${dto.pro_idx}">
				
	          	<div class="form-row mb-3 mb-4">
	            	<label class="form-label" for="ship_info">주문상품</label>
					<input type="text" class="form-control form-row mb-2" id="inputCity" value="상품명~~">
	            	<div class="form-row d-flex jusify-content-between">
					  <div class="col-md-8">
							<input type="text" class="form-control" id="inputCity" value="가격~">
					  </div>
					  <div class="col-md-4">
					    <input type="text" class="form-control" id="inputZip" value="수량">
					  </div>
	            	</div>
	          	</div>
	          
				<hr class="row mb-4">
				
	          	<div class="form-row mb-3 mb-4">
	            	<label class="form-label" for="ship_num">배송지 정보</label>
	            	<div class="form-row mb-2 d-flex jusify-content-between">
					  <div class="col-md-4">
					    <input type="text" class="form-control" id="inputZip" value="수취인">
					  </div>
					  <div class="col-md-8">
							<input type="text" class="form-control" id="inputCity" value="휴대폰번호">
					  </div>
	            	</div>
	            	<input type="text" class="form-control" name="ship_num" value="배송지">
	          	</div>
	          
				<hr class="row mb-4">
				
				<div class="form-row mb-3 mb-4">
	           		<label class="form-label" for="receiver">결제 정보</label>
	           		<div class="input-group mb-2">
						  <span class="input-group-text" id="basic-addon1">총 주문금액</span>
						  <input type="text" class="form-control" value="총 주문금액">
					</div>
	           		<div class="input-group">
						  <span class="input-group-text" id="basic-addon1">결제방법</span>
						  <input type="text" class="form-control" value="카드결제">
					</div>
				</div>
				
				<hr class="row mb-4">
				
				<div class="form-row mb-3">
	           		<label class="form-label" for="receiver">구독 정보</label>
	           		<div class="input-group mb-2">
						  <span class="input-group-text" id="basic-addon1">구독개월</span>
						  <input type="text" class="form-control" value="총 주문금액">
					</div>
	           		<div class="form-row mb-2 d-flex jusify-content-between">
					  <div class="input-group mb-2">
						  <span class="input-group-text" id="basic-addon1">구독시작일</span>
						  <input type="text" class="form-control" value="총 주문금액">
					</div>
					  <div class="input-group mb-2">
						  <span class="input-group-text" id="basic-addon1">구독종료일</span>
						  <input type="text" class="form-control" value="총 주문금액">
						</div>
	            	</div>
				</div>
				
				<div class="form-row mb-3 form-btn text-center">
					<button type="button" class="btn btn-primary">닫기</button>
	          	</div>
				
	          	
	        </form>
	      	</div>
	        
      
    	</div>
		</div>   
	</div>
    


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>