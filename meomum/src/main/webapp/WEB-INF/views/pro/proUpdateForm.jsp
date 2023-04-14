<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>[관리자] 상품 수정</title>

<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- App CSS -->  
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">

<style>
input:invalid {
  border-color: red;
  outline: none;
}

img {
  width: 120px;
  height: 120px;
}

#pro_content{
 width: 300px !important;
  height: 300px !important;
}

input[readonly] {
  background-color: white !important;
  color: black;
}

input:not([readonly]) {
  font-weight: bold;
}
</style>
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
</head>
<body class="app">
	<%@include file="/WEB-INF/views/header_a.jsp"%>

	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container pt-5">
				
				<h1 class="text-center mb-4">상품 수정</h1>
			
	<div class="container"  style="margin-bottom: 50px;">

	 	 <div class="row">
	   		 <div class="col-8 mx-auto">
		
		<div class="input-group mb-3" style="display: flex; justify-content: space-between;">
		  <label class="input-group-text col-2 text-center" for="pro_thumb">대표 사진</label>
		  <img alt="thumbnail" src="/meomum/images/items/${lists[0].pro_thumb}">
		  <label class="input-group-text col-2 text-center" for="pro_img1">이미지1</label>
		  <img alt="img1" src="/meomum/images/items/${lists[0].pro_img1}">
		  <label class="input-group-text col-2 text-center" for="pro_img2">이미지2</label>
		  <img alt="img2" src="/meomum/images/items/${lists[0].pro_img2}">
		</div>
        
         <div class="input-group mb-3">
          <label class="input-group-text col-2 text-center" for="pro_content">상세 이미지</label>
          <img id="pro_content" alt="content" src="/meomum/images/items/${lists[0].pro_content}">
        </div>
        
        <div class="input-group mb-3">
		  <label class="input-group-text col-2 text-center" for="pro_cate">카테고리</label>
		  <input type="text" class="form-control input-group-text-fixed" id="pro_cate" 
		  name="pro_cate" required="required" readonly value="<c:choose><c:when test='${lists[0].pro_cate eq 1}'>침대</c:when><c:when test='${lists[0].pro_cate eq 2}'>테이블</c:when><c:when test='${lists[0].pro_cate eq 3}'>의자</c:when><c:when test='${lists[0].pro_cate eq 4}'>소파</c:when><c:when test='${lists[0].pro_cate eq 5}'>조명</c:when></c:choose>">
		</div>
		
		<!-- 폼 시작 -->
		<form name="proUpdate" action="proUpdate.do" method="post">
	
	  <input type="hidden" name="pro_idx" value="${lists[0].pro_idx}">
	  
        <div class="input-group mb-3">
          <label for="pro_name" class="input-group-text col-2 text-center">상품명</label>
	          <input type="text" class="form-control input-group-text-fixed" name="pro_name" 
	          required="required" value="${lists[0].pro_name}" placeholder="상품명을 입력해주세요"  maxlength="30">
        </div>
        
        <div class="input-group mb-3">
          <label for="pro_price" class="input-group-text col-2 text-center">정가</label>
	          <input type="text" class="form-control input-group-text-fixed" id="pro_price"
	          name="pro_price" required="required" value="${lists[0].pro_price}" placeholder="정가를 입력해주세요" 
   	          pattern="[0-9]+" minlength="2" maxlength="12">
   	          <span class="input-group-text">원</span>
        </div>
        
        <div class="input-group mb-3">
          <label for="pro_amount" class="input-group-text col-2 text-center">재고 수량</label>
	          <input type="text" class="form-control input-group-text-fixed" id="pro_amount" 
	          name="pro_amount" required="required" value="${lists[0].pro_amount}" placeholder="재고 수량을 입력해주세요"  
	          minlength="1" maxlength="3" pattern="[0-9]+" readonly>
	          <span class="input-group-text">개</span>
        </div>
        
        
        <div class="input-group mb-3">
		  <label for="pro_state" class="input-group-text col-2 text-center">재고 상태</label>
		  &nbsp;&nbsp;&nbsp;
		  
		  <div class="form-check form-check-inline">
		    <input class="form-check-input" type="radio" name="pro_state" id="pro_state" value="0" 
		    ${lists[0].pro_state == 0 ? 'checked' : ''}> 
		    <label class="form-check-label" for="pro_state">판매 중</label>
		  </div>
		  
		  <div class="form-check form-check-inline">
		    <input class="form-check-input" type="radio" name="pro_state" id="pro_state" value="1" 
		    ${lists[0].pro_state == 1 ? 'checked' : ''}> 
		    <label class="form-check-label" for="pro_state">품절</label>
		  </div>
		</div>
        
      
      
        <div class="input-group mb-3">
          <label for="pro_month" class="input-group-text col-2 text-center">구독 개월 수</label>
          &nbsp;&nbsp;&nbsp;
          
		<div class="form-check form-check-inline">
		    <input class="form-check-input" type="radio" name="pro_month" value="1" onclick="calPrice()"
		     ${lists[0].pro_month == 1 ? 'checked' : ''}> 
		    <label class="form-check-label">1개월</label>
		  </div>
		  
		  <div class="form-check form-check-inline">
		    <input class="form-check-input" type="radio" name="pro_month" value="6" onclick="calPrice()"
		    ${lists[0].pro_month == 6 ? 'checked' : ''}> 
		    <label class="form-check-label">6개월</label>
		  </div>
		  
		  	<div class="form-check form-check-inline">
		    <input class="form-check-input" type="radio" name="pro_month" value="12" onclick="calPrice()"
		    ${lists[0].pro_month == 12 ? 'checked' : ''}> 
		    <label class="form-check-label">12개월</label>
		  </div>
		</div>
          
        
        <div class="input-group mb-3">
          <label for="pro_subprice" class="input-group-text col-2 text-center">월 구독 가격</label>
          
          <input type="text" class="form-control input-group-text-fixed" id="pro_subprice" name="pro_subprice" 
         placeholder="정가와 구독 개월 수를 입력하면 자동으로 월 구독 가격이 입력됩니다" required="required"
         value="${lists[0].pro_subprice }">
         <span class="input-group-text">원</span>
         
        </div>
        
        <div class="input-group mb-3">
          <label for="pro_allprice" class="input-group-text col-2 text-center">총 구독 가격</label>
          
          <input type="text" class="form-control input-group-text-fixed" id="pro_allprice" name="pro_allprice" 
          placeholder="정가와 구독 개월 수를 입력하면 자동으로 총 구독 가격이 입력됩니다" required="required"
          value="${lists[0].pro_allprice }">
          <span class="input-group-text">원</span>
          
        </div>
		</div>
		

		<!-- 버튼 구역 -->
		<div style="margin-top: 10px" class="d-flex justify-content-center">
		   
		    <input type="reset" value="되돌리기" class="btn btn-outline-secondary">
		    <span style="margin-left: 10px"></span>
		   
		    <a href="proAdmin.do"><button type="button" class="btn btn-outline-secondary">목록으로</button></a>
		    <span style="margin-left: 10px"></span>
		   
		    <button type="submit" class="btn btn-primary">수정하기</button>
		</div>
		
	      	    </div>
		    </form>
		  </div>
	   </div>
	</div>
</div>
	

		
		
		<%@include file="/WEB-INF/views/footer_a.jsp"%>	
		
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous">
</script>	
</body>
</html>