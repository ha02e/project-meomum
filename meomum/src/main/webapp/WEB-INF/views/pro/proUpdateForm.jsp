<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>[관리자] 상품 수정</title>
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
	<h2>상품 수정하기</h2>
	<form name="proUpdate" action="proUpdate.do" method="post">
		<input type="hidden" name="pro_idx" value="${lists[0].pro_idx}">
		<ul>
			<li>대표 사진
			<img alt="thumbnail" src="/meomum/items/${lists[0].pro_thumb}" style="width:40px; height:40px;">
			</li>
			
			<li>이미지 1
			<img alt="img1" src="/meomum/items/${lists[0].pro_img1}" style="width:40px; height:40px;">
			</li>
			
			<li>이미지 2
			<img alt="img2" src="/meomum/items/${lists[0].pro_img2}" style="width:40px; height:40px;">
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
				<input type="text" name="pro_price" value="${lists[0].pro_price}">
			</li>
			<li>재고 수량
				${lists[0].pro_amount}
			</li>
			
			<li>재고 상태
			<input type="radio" name="pro_state" value="0"  ${lists[0].pro_state == 0 ? 'checked' : ''}>판매 중
			<input type="radio" name="pro_state" value="1"  ${lists[0].pro_state == 1 ? 'checked' : ''}>품절
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
		</form>
</body>
</html>