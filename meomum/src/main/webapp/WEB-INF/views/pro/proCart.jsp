<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<title>[사용자] 장바구니 목록</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
	
</head>
<style>
td.column-3 img {
  width: 50px;
  height: 50px;
}
table {
witdh: 600px;
height: 500px;
border-collapse: collapse;
margin: 0 auto;
text-align: center;
}
td, th {
  border: 1px solid black;
}
img {
  width: 10px;
  height: 10px;
}
</style>
<script>
function updateShippingCost() {
    let totalShippingCost = 0;
    let amountInputs = document.querySelectorAll('.num-product');
    let delPriceInputs = document.querySelectorAll('.pro-delprice');
    for(let i = 0; i < amountInputs.length; i++) {
      let amount = parseInt(amountInputs[i].value);
      let delPrice = parseFloat(delPriceInputs[i].value);
      totalShippingCost += amount * delPrice;
    }
    document.getElementById('shipping-cost').innerText = totalShippingCost.toFixed(3) + '원';
  }

  let amountInputs = document.querySelectorAll('.num-product');
  for(let i = 0; i < amountInputs.length; i++) {
    amountInputs[i].addEventListener('change', function() {
      updateShippingCost();
    });
  }
</script>
<body>
<%@include file="../header.jsp"%> 

	<!-- Shoping Cart -->
		<table>
			
			<tr>
				<td>
				<label for="selectAll" class="form-check-label">전체 선택
				<input type="checkbox" id="selectAll" name="selectAll">
				</label>
				</td>
			</tr>
			
			<tr>
				<th></th>
				<th>이미지</th>
				<th>상품명</th>
				<th>월 가격</th>
				<th>구독 월 수</th>
				<th>수량</th>
				<th>총 가격</th>
			</tr>
			
			<c:if test="${empty lists }">
				<tr>
					<td colspan="11" rowspan="2" align="center" class="stext-102 cl3 p-t-23">
					담긴 상품이 없습니다
					</td>
				</tr>
			</c:if>
			
		<form name="cartForm" method="get" action="orderList.do">
			<c:forEach var="list" items="${lists}">		
			<c:set var="totalSub" value="${totalSub + (list.cart_amount * list.pro_subprice)}" />
			<c:set var="totalDel" value="${totalDel + (list.cart_amount * list.pro_delprice)}" />
					<tr>
						<td>
						<input type="checkbox" id="selectOne" name="selectOne" value="ok">
						</td>
						
						<td>
							<div>
								<img src="/meomum/items/${list.pro_thumb}" alt="IMG-PRODUCT">
							</div>
						</td>
						
						<td>${list.pro_name}</td>
						
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pro_subprice }" />원</td>
						<td>${list.pro_month }개월</td>
						
						<td>
							<div class="wrap-num-product flex-w m-l-auto m-r-0">
							
							<!-- 마이너스 -->
								<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
									<i class="fs-16 zmdi zmdi-minus"></i>
								</div>

							<!-- 수량 조절 -->
								
								<input class="mtext-104 cl3 txt-center num-product" type="number" min="1" max="10" name="cart_amount"
								value="${list.cart_amount }" onchange="updatePrice(this, ${list.pro_subprice}, ${list.pro_allprice})">
								<input type="hidden" name="cart_idx" value="${list.cart_idx }">
								
							
							<!-- 플러스 -->
								<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
									<i class="fs-16 zmdi zmdi-plus"></i>
								</div>
							
							</div>
							<button type="submit" formaction="cartNumUpdate.do">수량 변경</button>
						</td>
						<td>
						<div><span id="subPrice-${list.cart_idx}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.cart_amount * list.pro_subprice}" />원
						</span></div>
    					<div><span id="allPrice-${list.cart_idx}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.cart_amount * list.pro_allprice}" />원</span></div>
						</td>
						
						<!-- 장바구니 삭제 -->
						<td>
							 <a href="#" onclick="deleteCartItem(${list.cart_idx})">
								<img src="images/icon/icon-close2.png" alt="DELETE" class="delete-icon">
							</a>
						</td>
					</tr>
					</c:forEach>				
					<tr>
						<td><div id="totalSub-${list.cart_idx }">월 구독 가격 <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalSub}" />원</div></td>
						<td><div id="totalDel-${list.cart_idx}">| 총 배송비 <fmt:formatNumber type="number" maxFractionDigits="3" value="${totalDel}" />원</div></td>
					</tr>
					<tr>
						<td>
						<input type="hidden" name="pro_idx" value="${list.pro_idx}" >
						<input type="hidden" name="cart_amount" value="${list.cart_amount}" >
						<input type="hidden" name="totalSubPrice" value="${totalSubPrice}" >
						<input type="hidden" name="totalDel" value="${totalDel}" >	
						<button type="submit" formaction="orderList.do">결제하기</button>
						</td>
					</tr>
				</table>
			</form>		



<script>
  function deleteCartItem(cartIdx) {
    $.ajax({
      url: "cartDelete.do",
      type: "POST",
      data: {cart_idx: cartIdx},
      success: function (data) {
        alert("상품이 삭제되었습니다.");
        location.reload();
      },
      error: function (xhr, status, error) {
        alert("상품 삭제에 실패하였습니다.");
      },
    });
  }
</script>

<script>
function updatePrice(input, subprice, allprice) {
    var cartIdx = input.nextElementSibling.value;
    var cartAmount = input.value;
    var subPrice = cartAmount * subprice;
    var allPrice = cartAmount * allprice;
    
    // 하위 요소에서 ID를 이용하여 값을 업데이트합니다.
    document.getElementById("subPrice-" + cartIdx).innerHTML = subPrice + "원";
    document.getElementById("allPrice-" + cartIdx).innerHTML = allPrice + "원";
}
</script>


<script>
  const allCheckbox = document.querySelector('#selectAll');
  const selectOneCheckboxes = document.querySelectorAll('input[name=selectOne]');

  allCheckbox.addEventListener('click', () => {
    selectOneCheckboxes.forEach((checkbox) => {
      checkbox.checked = allCheckbox.checked;
    });
  });

  // 모든 체크박스를 선택하도록 설정
  allCheckbox.checked = true;
  selectOneCheckboxes.forEach((checkbox) => {
    checkbox.checked = true;
  });
</script>

	<script src="js/main.js"></script>
<%@include file="../footer.jsp"%> 
</body>
</html>