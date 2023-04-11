<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
.row {
    --bs-gutter-x: 0;
}
.text-muted{
	color:#dc143c !important;
}

hr{
	margin:30px 0;
}

.reasonTitle{
	color:#dc143c;
	font-weight: bold;
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
.form-btn button{
	margin: 10px;
}
</style>

</head>
  
<body> 
	<div class="row">
		<div class="col-sm-12">
	    <div class="card mb-4">
	    
			<div class="card-header d-flex justify-content-between align-items-center">
	        	<h5 class="mb-0">반납신청</h5> <small class="text-muted float-end">* 관리자가 반납 승인 처리를 해야 반납 처리됩니다. *</small>
	      	</div>
	      
			
			<div class="card-body">
			<form action="returnApply.do" name="shipInsert" method="post">
			
				<input type="hidden" name="user_idx" value="${dto.user_idx}">
				<input type="hidden" name="order_idx" value="${param.order_idx}">
				<input type="hidden" name="pro_idx" value="${dto.pro_idx}">
				
	          	<div class="form-row mb-3">
	            	<label class="form-label" for="order_idx">주문번호</label>
					<input type="text" class="form-control" name="order_idx" value=${param.order_idx} readonly>
	          	</div>
	          	
	          	<div class="form-row mb-3">
	            	<label class="form-label" for="pro_name">주문상품</label>
	            	<input type="text" class="form-control" name="pro_name" value="${dto.pro_name}" readonly>
	          	</div>
	          	
				<div class="form-row mb-3">
	           		<label class="form-label" for="order_msg"><span class="reasonTitle">반품 사유(100자 이내)</span></label>
	           		<textarea name="order_msg" class="form-control h-25 orderMsg" rows="4" placeholder="반품 사유를 입력해주세요.&#13;&#10;관리자가 승인하면 반품이 진행됩니다."></textarea>
				</div>
				
				<div class="form-row mb-3 form-btn d-flex justify-content-center">
					<button type="button" class="btn btn-secondary" onclick="self.close()">닫기</button>
	          		<button type="submit" class="btn btn-primary">반품신청</button>
	          	</div>
	          	
	        </form>
	      	</div>
	        
      
    	</div>
		</div>   
	</div>
    


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>