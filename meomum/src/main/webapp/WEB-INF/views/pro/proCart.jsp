<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>[사용자] 장바구니 목록</title>
</head>
<body>
<%@include file="../header.jsp"%> 


	<!-- Shoping Cart -->
	<input type="checkbox" name="selectAll"> 전체 선택
	<table style="width : 800; border:1px">
	<tr>
		<td><input type="checkbox" name="selectOne"></td>
		
		<td>썸네일</td>
		
		<td>이름</td>
		
		<td>구독 월 수</td>
		
		<td>
		<div class="wrap-num-product flex-w m-l-auto m-r-0">
			<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
				<i class="fs-16 zmdi zmdi-minus"></i>
			</div>
			<input class="mtext-104 cl3 txt-center num-product" type="number" name="buyNum" value="1">
			<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
				<i class="fs-16 zmdi zmdi-plus"></i>
			</div>
		</div>
		</td>
		
		<td>구독 월 금액</td>
		<td>구독 총 금액</td>
		<td><img src="images/icons/icon-close2.png" alt="CLOSE"></td>
	</tr>
	</table>
		

<%@include file="../footer.jsp"%> 
</body>
</html>