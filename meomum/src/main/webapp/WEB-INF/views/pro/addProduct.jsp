<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function calPrice(){
	const proprice = Number(document.getElementById("proprice").value);
    //const subMonth = Number(document.querySelector('input[name="subMonth"]:checked').value);
    const subprice = Math.floor(proprice / 15);
    document.getElementById("subprice").value = subprice;
}
</script>
</head>
<body>
	<h2>상품 등록하기</h2>
	<form name="addProduct" action="addProduct.do">
		<ul>
			<li>대표 사진
			
			</li>
			
			<li>카테고리
				<select name="category">
				<option value="1">침구</option>				
				<option value="2">테이블</option>				
				<option value="3">의자</option>				
				<option value="4">소파</option>				
				<option value="5">조명</option>				
				</select>
			</li>
			
			<li>상품명
				<input type="text" name="proname">
			</li>
			<li>정가
				<input type="text" id="proprice" name="proprice">
			</li>
			<li>재고 수량
				<input type="text" name="proamount">
			</li>
			
			<li>재고 상태
			<input type="radio" name="proState" value="0">판매 중
			<input type="radio" name="proState" value="1">품절
			</li>
			
			<li>구독 개월 수
			<input type="radio" name="subMonth" value="1" onclick="calPrice()">1
			<input type="radio" name="subMonth" value="6" onclick="calPrice()">6
			<input type="radio" name="subMonth" value="12" onclick="calPrice()">12
			</li>
			<li>월 구독 가격
			<input type="text" id="subprice" name="subprice">
			</li>
			<li>상세 내용</li>
			<li><input type="reset" value="다시 작성"><input type="submit" value="등록하기"></li>
		</ul>
	</form>
</body>
</html>