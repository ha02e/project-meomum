<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[관리자] 상품 등록</title>

<script>
function calPrice(){
	const proprice = Number(document.getElementById("pro_price").value);
    //const subMonth = Number(document.querySelector('input[name="subMonth"]:checked').value);
    const subprice = Math.floor(proprice / 15);
    document.getElementById("pro_subprice").value = subprice;
}

function addConfirm() {
    return confirm('정말 등록하시겠습니까?');
}
</script>
</head>
<body>
<%@include file="../header_a.jsp"%>  
	<h2>상품 등록하기</h2>
	<form name="addPro" action="addPro.do" enctype="multipart/form-data" method="post" onsubmit="return addConfirm();">
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
			
			<li>상세 내용
			<input type="file" name="pro_content">
			</li>
			<li><input type="reset" value="다시 작성"><input type="submit" value="등록하기"></li>
		</ul>
	</form>
<%@include file="../footer_a.jsp"%>    
</body>
</html>