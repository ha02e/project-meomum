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
.row {
    --bs-gutter-x: 0;
}

.card{
	width:500px;
	margin:10px auto;
}
hr{
	margin:30px 0;
}

.orderMsg{
	resize:none;
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
	margin:20px 10px 10px 10px;
}
</style>

</head>
  
<body> 
	<div class="row">
		<div class="col-sm-12">
	    <div class="card mb-4">
	    
			<div class="card-header d-flex justify-content-between align-items-center">
	        	<h5 class="mb-0">배송처리</h5> <small class="text-muted float-end">주문번호&nbsp;:&nbsp;${param.order_idx}</small>
	      	</div>
	      
			
			<div class="card-body">
			<form action="shipInsert.do" name="shipInsert" method="post">
			
				<input type="hidden" name="user_idx" value="${dto.user_idx}">
				<input type="hidden" name="order_idx" value="${param.order_idx}">
				<input type="hidden" name="pro_idx" value="${dto.pro_idx}">
				
	          	<div class="form-row mb-3">
	            	<label class="form-label" for="ship_info">택배사</label>
	            	<select class="custom-select form-control" name="ship_info" id="shipInfo" readonly>
						<option value="CJ대한통운" selected>CJ대한통운</option>
					</select>
	          	</div>
	          	<div class="form-row mb-3">
	            	<label class="form-label" for="ship_num">운송장번호</label>
	            	<input type="text" class="form-control" name="ship_num" placeholder="운송장 번호 - 없이 입력(12자리)"
	            			maxlength="12" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
	          	</div>
	          
				<hr class="row mb-3">
	          
				<div class="form-row mb-3">
					<div class="col-md-6 mb-3">
			          	<div class="form-group">
			          		<label class="form-label" for="user_name">주문자</label>
			            	<input type="text" class="form-control" name="user_name" value="${dto.user_name}" readonly>
			            </div>
		            </div>
		          	<div class="col-md-6 mb-3">
		          		<div class="form-group">
			          		<label class="form-label" for="receiver">수취인</label>
			            	<input type="text" class="form-control" name="receiver" value="${dto.receiver}">
		            	</div>
		            </div>
				</div>
				
				<div class="form-row mb-3">
	           		<label class="form-label" for="ship_addr">배송지</label>
	           		<input type="text" class="form-control" name="ship_addr" value="${dto.ship_addr}">
				</div>
				
				<div class="form-row mb-3">
	           		<label class="form-label" for="order_msg">배송메시지</label>
	           		<textarea name="order_msg" class="form-control h-25 orderMsg" rows="4" readonly>${dto.order_msg}</textarea>
				</div>
				
				<hr class="row mb-3">
	          
				<div class="form-row mb-3">
					<label class="form-label" for="man_name">배송기사</label>
					<input type="text" class="form-control" name="man_name">
				</div>
				
				<div class="form-row mb-3">
					<label class="form-label" for="man_tel">배송기사 연락처</label>
					<input type="text" class="form-control" name="man_tel" pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}"
						oninput="autoHyphen(this)" maxlength="13" placeholder="연락처를 입력해주세요.">
					 <script>
						const autoHyphen = (target) => {
							target.value = target.value
								.replace(/[^0-9]/g, '')
								.replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3").replace(/(\-{1,2})$/g, "");
						}
					 </script>
				</div>
				
				<div class="form-row mb-3 form-btn d-flex justify-content-center">
					<button type="button" class="btn btn-secondary" onclick="self.close()">닫기</button>
	          		<button type="submit" class="btn btn-primary">배송처리</button>
	          	</div>
	          	
	        </form>
	      	</div>
	        
      
    	</div>
		</div>   
	</div>
    


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
	