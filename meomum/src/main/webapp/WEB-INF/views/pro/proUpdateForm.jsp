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
img {
  width: 50px;
  height: 50px;
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
	
	<form name="proUpdate" action="proUpdate.do" method="post">
	  <input type="hidden" name="pro_idx" value="${lists[0].pro_idx}">
	 	 <div class="row">
	   		 <div class="col-8 mx-auto">
		
		<div class="input-group mb-3">
          <label class="input-group-text col-2 text-center" for="pro_thumb">대표 사진</label>
          <img alt="thumbnail" src="/meomum/images/items/${lists[0].pro_thumb}">
        </div>
        
        <div class="input-group mb-3">
          <label class="input-group-text col-2 text-center" for="pro_img1">이미지1</label>
          <img alt="img1" src="/meomum/images/items/${lists[0].pro_img1}">
        </div>
        
        <div class="input-group mb-3">
          <label class="input-group-text col-2 text-center" for="pro_img2">이미지2</label>
          <img alt="img2" src="/meomum/images/items/${lists[0].pro_img2}">
        </div>
        
         <div class="input-group mb-3">
          <label class="input-group-text col-2 text-center" for="pro_content">상세 이미지</label>
          <img alt="content" src="/meomum/images/items/${lists[0].pro_content}">
        </div>
        
        <div class="input-group mb-3">
		  <label class="input-group-text col-2 text-center" for="pro_cate">카테고리</label>
		  <select class="form-select" id="pro_cate" name="pro_cate" required="required" >
		    <option value="1" selected disabled <c:if test="${lists[0].pro_cate == 1}">selected</c:if>>침대</option>
		    <option value="2" selected disabled <c:if test="${lists[0].pro_cate == 2}">selected</c:if>>테이블</option>
		    <option value="3" selected disabled <c:if test="${lists[0].pro_cate == 3}">selected</c:if>>의자</option>
		    <option value="4" selected disabled <c:if test="${lists[0].pro_cate == 4}">selected</c:if>>소파</option>
		    <option value="5" selected disabled <c:if test="${lists[0].pro_cate == 5}">selected</c:if>>조명</option>
		  </select>
		</div>
		
		카테고리
			<c:choose> 
				<c:when test="${lists[0].pro_cate == 1}">
					침대
				</c:when>
				<c:when test="${lists[0].pro_cate == 2}">
					테이블
				</c:when>
				<c:when test="${lists[0].pro_cate == 3}">
					의자
				</c:when>
				<c:when test="${lists[0].pro_cate == 4}">
					소파
				</c:when>
				<c:when test="${lists[0].pro_cate == 5}">
					조명
				</c:when>
			</c:choose>
		
        <div class="input-group mb-3">
          <label for="pro_name" class="input-group-text col-2 text-center">상품명</label>
	          <input type="text" class="form-control input-group-text-fixed" name="pro_name" 
	          required="required" placeholder="상품명을 입력해주세요"  maxlength="30">
        </div>
        
        <div class="input-group mb-3">
          <label for="pro_price" class="input-group-text col-2 text-center">정가</label>
	          <input type="text" class="form-control input-group-text-fixed" id="pro_price"
	          name="pro_price" required="required" placeholder="정가를 입력해주세요" 
   	          pattern="[0-9]+" minlength="2" maxlength="12">
        </div>
        
        <div class="input-group mb-3">
          <label for="pro_amount" class="input-group-text col-2 text-center">재고 수량</label>
	          <input type="text" class="form-control input-group-text-fixed" id="pro_amount" 
	          name="pro_amount" required="required" placeholder="재고 수량을 입력해주세요"  
	          minlength="1" maxlength="3" pattern="[0-9]+">
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
		    <input class="form-check-input" type="radio" name="pro_month" id="month1" value="1" onclick="calPrice()"> 
		    <label class="form-check-label" for="month1">1</label>
		  </div>
		  
		  <div class="form-check form-check-inline">
		    <input class="form-check-input" type="radio" name="pro_month" id="month2" value="6" onclick="calPrice()"> 
		    <label class="form-check-label" for="month2" >6</label>
		  </div>
		  
		  	<div class="form-check form-check-inline">
		    <input class="form-check-input" type="radio" name="pro_month" id="month3" value="12" onclick="calPrice()"> 
		    <label class="form-check-label" for="month3" >12</label>
		  </div>
		</div>
          
        
        <div class="input-group mb-3">
          <label for="pro_subprice" class="input-group-text col-2 text-center">월 구독 가격</label>
          
          <input type="text" class="form-control input-group-text-fixed" id="pro_subprice" name="pro_subprice" 
         placeholder="정가와 구독 개월 수를 입력하면 자동으로 월 구독 가격이 입력됩니다" required="required">
         
        </div>
        
        <div class="input-group mb-3">
          <label for="pro_allprice" class="input-group-text col-2 text-center">총 구독 가격</label>
          
          <input type="text" class="form-control input-group-text-fixed" id="pro_allprice" name="pro_allprice" 
          placeholder="정가와 구독 개월 수를 입력하면 자동으로 총 구독 가격이 입력됩니다" required="required">
          
        </div>
		</div>
		

		<!-- 버튼 구역 -->
		<div style="margin-top: 10px" class="d-flex justify-content-center">
		   
		    <input type="reset" value="다시 작성" class="btn btn-outline-secondary">
		    <span style="margin-left: 10px"></span>
		   
		    <a href="proAdmin.do"><button type="button" class="btn btn-outline-secondary">목록으로</button></a>
		    <span style="margin-left: 10px"></span>
		   
		    <button type="submit" onclick="return checkFile()" class="btn btn-primary">수정하기</button>
		</div>
          
   
	          </div>
		    </form>
		  </div>
		</div>
	</div>
</div>
	
	

			
			
			
			
			<li>상품명
				<input type="text" name="pro_name" value="${lists[0].pro_name}">
			</li>
			<li>정가
				<input type="text" name="pro_price" id="pro_price" value="${lists[0].pro_price}">
			</li>
			<li>재고 수량
				${lists[0].pro_amount}
			</li>
			
			<li>재고 상태
			${lists[0].pro_state == 0 ? '판매 중' : '품절'}
			</li>
			
			<li>구독 개월 수
			<input type="radio" name="pro_month" value="1" onclick="calPrice()" ${lists[0].pro_month == 1 ? 'checked' : ''}>1
			<input type="radio" name="pro_month" value="6" onclick="calPrice()" ${lists[0].pro_month == 6 ? 'checked' : ''}>6
			<input type="radio" name="pro_month" value="12" onclick="calPrice()" ${lists[0].pro_month == 12 ? 'checked' : ''}>12
			</li>
			 
			<li>월 구독 가격
			<input type="text" id="pro_subprice" name="pro_subprice" value="${lists[0].pro_subprice }">
			</li>
			
			<li>총 구독 가격
			<input type="text" id="pro_allprice" name="pro_allprice" value="${lists[0].pro_allprice }">
			</li>
			
			<li><input type="submit" value="등록하기"><input type="reset" value="다시 작성"></li>
		</ul>
		
		
				</div>
			</div>
		</div>
	</form>	
	
		<%@include file="/WEB-INF/views/footer_a.jsp"%>	
		
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous">
</script>	
</body>
</html>