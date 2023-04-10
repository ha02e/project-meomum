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

function addConfirm() {
    return confirm('정말 등록하시겠습니까?');
}
</script>
</head>
<body class="app">
	<%@include file="/WEB-INF/views/header_a.jsp"%>
	<!-- 본문 시작 -->
	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container pt-5">
				<h2 class="text-center mb-4">상품 등록</h2>
			
				<form name="addPro" action="proAdd.do" enctype="multipart/form-data" method="post" onsubmit="return addConfirm();">
		<ul>
			<li>대표 사진
			<input type="file" name="pro_thumb">
			</li>
			
			<li>이미지 1
			<input type="file" name="pro_img1">
			</li>
			
			<li>이미지 2
			<input type="file" name="pro_img2">
			</li>
			
			<li>카테고리
				<select name="pro_cate">
				<option value="1">침대</option>				
				<option value="2">테이블</option>				
				<option value="3">의자</option>				
				<option value="4">소파</option>				
				<option value="5">조명</option>				
				</select>
			</li>
			
			<li>상품명
				<input type="text" name="pro_name">
			</li>
			<li>정가
				<input type="text" id="pro_price" name="pro_price">
			</li>
			<li>재고 수량
				<input type="text" name="pro_amount">
			</li>
			
			<li>재고 상태
			<input type="radio" name="pro_state" value="0">판매 중
			<input type="radio" name="pro_state" value="1">품절
			</li>
			
			<li>구독 개월 수
			<input type="radio" name="pro_month" value="1" onclick="calPrice()">1
			<input type="radio" name="pro_month" value="6" onclick="calPrice()">6
			<input type="radio" name="pro_month" value="12" onclick="calPrice()">12
			</li>
			
			<li>월 구독 가격
			<input type="text" id="pro_subprice" name="pro_subprice">
			</li>
			
			<li>총 구독 가격
			<input type="text" id="pro_allprice" name="pro_allprice">
			</li>
			
			<li>상세 내용
			<input type="file" name="pro_content">
			</li>
			<li><input type="submit" value="등록하기"><input type="reset" value="다시 작성"></li>
			</ul>
				</form>
			</div>
		</div>
	</div>
		<!-- 본문 끝 -->
		<%@include file="/WEB-INF/views/footer_a.jsp"%>
	<!-- app-wrapper 끝-->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
</body>
</html>