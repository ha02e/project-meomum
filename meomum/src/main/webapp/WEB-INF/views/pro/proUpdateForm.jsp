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
	<form name="proUpdate" action="proUpdate.do" method="post">
	
	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container pt-5">
				<h2 class="text-center mb-4">상품 수정하기</h2>
	
		<input type="hidden" name="pro_idx" value="${lists[0].pro_idx}">
		<ul>
			<li>대표 사진
			<img alt="thumbnail" src="/meomum/images/items/${lists[0].pro_thumb}" style="width:40px; height:40px;">
			</li>
			
			<li>이미지 1
			<img alt="img1" src="/meomum/images/items/${lists[0].pro_img1}" style="width:40px; height:40px;">
			</li>
			
			<li>이미지 2
			<img alt="img2" src="/meomum/images/items/${lists[0].pro_img2}" style="width:40px; height:40px;">
			</li>
			
			<li>카테고리
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
			</li>
			
			
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