<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>[관리자] 상품 관리</title>
<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- App CSS -->  
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">



<script>
function calPrice(){
	 const proprice = Number(document.getElementById("pro_price").value);
	    const subMonth = Number(document.querySelector('input[name="pro_month"]:checked').value);
	    const subprice = Math.ceil(proprice / (15 * subMonth)) * subMonth;
	    document.getElementById("pro_subprice").value = subprice;
	    
	    const allprice = subprice*subMonth;
	    document.getElementById("pro_allprice").value = allprice;   
}
</script>

<script>
function addConfirm() {
    return confirm('정말 등록하시겠습니까?');
}

function checkFile() {
  var thumb = document.getElementById('pro_thumb').value;
  var img1 = document.getElementById('pro_img1').value;
  var img2 = document.getElementById('pro_img2').value;
  var content = document.getElementById('pro_content').value;
  
  if (thumb == '' || img1 == '' || img2 == '' || content == '') {
    alert('사진을 첨부해주세요.');
    return false;
  }
  
  return true;
}
</script>
<style>
input:invalid {
  border-color: red;
  outline: none;
}
</style>

</head>
<body class="app">
	<%@include file="/WEB-INF/views/header_a.jsp"%>
	<!-- 본문 시작 -->
	
	
	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container pt-5">
				
				<h1 class="text-center mb-4">상품 등록</h1>
			
	<div class="container"  style="margin-bottom: 30px;">
	
	<form name="addPro" action="proInsert.do" enctype="multipart/form-data" method="post" onsubmit="return addConfirm();">
	 
	 	 <div class="row">
	   		 <div class="col-8 mx-auto">
		
		<div class="input-group mb-3">
          <label class="input-group-text col-2 text-center" for="pro_thumb">대표 사진</label>
          <input type="file" class="form-control" id="pro_thumb" name="pro_thumb" accept="image/*">
        </div>
        
        <div class="input-group mb-3">
          <label class="input-group-text col-2 text-center" for="pro_img1">이미지1</label>
          <input type="file" class="form-control" id="pro_img1" name="pro_img1" accept="image/*">
        </div>
        
        <div class="input-group mb-3">
          <label class="input-group-text col-2 text-center" for="pro_img2">이미지2</label>
          <input type="file" class="form-control" id="pro_img2" name="pro_img2" accept="image/*">
        </div>
        
         <div class="input-group mb-3">
          <label class="input-group-text col-2 text-center" for="pro_content">상세 이미지</label>
          <input type="file" class="form-control" id="pro_content" name="pro_content" accept="image/*">
        </div>
        
        <div class="input-group mb-3">
		  <label class="input-group-text col-2 text-center" for="pro_cate">카테고리</label>
		  <select class="form-select" id="pro_cate" name="pro_cate" required="required" >
		    <option value="" selected disabled hidden>카테고리 선택</option>
				<option value="1">침대</option>				
				<option value="2">테이블</option>				
				<option value="3">의자</option>				
				<option value="4">소파</option>				
				<option value="5">조명</option>		
		  </select>
		</div>
		
        <div class="input-group mb-3">
          <label for="pro_name" class="input-group-text col-2 text-center">상품명</label>
	          <input type="text" class="form-control input-group-text-fixed" name="pro_name" 
	          required="required" placeholder="상품명을 입력해주세요"  minlength="7" maxlength="25">
        </div>
        
        <div class="input-group mb-3">
          <label for="pro_price" class="input-group-text col-2 text-center">정가</label>
	          <input type="text" class="form-control input-group-text-fixed" id="pro_price"
	          name="pro_price" required="required" placeholder="정가를 입력해주세요" 
   	          pattern="[0-9]+" minlength="2" maxlength="12">
   	          <span class="input-group-text">원</span>
        </div>
        
        <div class="input-group mb-3">
          <label for="pro_amount" class="input-group-text col-2 text-center">재고 수량</label>
	          <input type="text" class="form-control input-group-text-fixed" id="pro_amount" 
	          name="pro_amount" required="required" placeholder="재고 수량을 입력해주세요"  
	          minlength="1" maxlength="3" pattern="[0-9]+">
	          <span class="input-group-text">개</span>
        </div>
        
        
        <div class="input-group mb-3">
		  <label for="pro_state" class="input-group-text col-2 text-center">재고 상태</label>
		  &nbsp;&nbsp;&nbsp;
		  
		  <div class="form-check form-check-inline">
		    <input class="form-check-input" type="radio" name="pro_state" id="pro_state" value="0" checked> 
		    <label class="form-check-label" for="pro_state">판매 중</label>
		  </div>
		  
		  <div class="form-check form-check-inline">
		    <input class="form-check-input" type="radio" name="pro_state" id="pro_state" value="1"> 
		    <label class="form-check-label" for="pro_state">품절</label>
		  </div>
		</div>
        
      
      
        <div class="input-group mb-3">
          <label for="pro_month" class="input-group-text col-2 text-center">구독 개월 수</label>
          &nbsp;&nbsp;&nbsp;
          
		<div class="form-check form-check-inline">
		    <input class="form-check-input" type="radio" name="pro_month" id="month1" value="1"  disabled onclick="calPrice()"> 
		    <label class="form-check-label" for="month1">1</label>
		  </div>
		  
		  <div class="form-check form-check-inline">
		    <input class="form-check-input" type="radio" name="pro_month" id="month2" value="6"  disabled onclick="calPrice()"> 
		    <label class="form-check-label" for="month2" >6</label>
		  </div>
		  
		  	<div class="form-check form-check-inline">
		    <input class="form-check-input" type="radio" name="pro_month" id="month3" value="12" checked onclick="calPrice()"> 
		    <label class="form-check-label" for="month3" >12</label>
		  </div>
		</div>
          
        
        <div class="input-group mb-3">
          <label for="pro_subprice" class="input-group-text col-2 text-center">월 구독 가격</label>
          
          <input type="text" class="form-control input-group-text-fixed" id="pro_subprice" name="pro_subprice" 
         placeholder="정가와 구독 개월 수를 입력하면 자동으로 월 구독 가격이 입력됩니다" required="required">
         <span class="input-group-text">원</span>
         
        </div>
        
        <div class="input-group mb-3">
          <label for="pro_allprice" class="input-group-text col-2 text-center">총 구독 가격</label>
          
          <input type="text" class="form-control input-group-text-fixed" id="pro_allprice" name="pro_allprice" 
          placeholder="정가와 구독 개월 수를 입력하면 자동으로 총 구독 가격이 입력됩니다" required="required">
          <span class="input-group-text">원</span>
          
        </div>
		</div>
		

		<!-- 버튼 구역 -->
		<div style="margin-top: 10px" class="d-flex justify-content-center">
		   
		    <input type="reset" value="다시 작성" class="btn btn-outline-secondary">
		    <span style="margin-left: 10px"></span>
		   
		    <a href="proAdmin.do"><button type="button" class="btn btn-outline-secondary">목록으로</button></a>
		    <span style="margin-left: 10px"></span>
		   
		    <button type="submit" onclick="return checkFile()" class="btn btn-primary">등록하기</button>
		</div>
          
   
	          </div>
		    </form>
		  </div>
		</div>
	</div>
		
		<!-- 본문 끝 -->
		<%@include file="/WEB-INF/views/footer_a.jsp"%>
	<!-- app-wrapper 끝-->
</div>
	
	
	
	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
</body>
</html>