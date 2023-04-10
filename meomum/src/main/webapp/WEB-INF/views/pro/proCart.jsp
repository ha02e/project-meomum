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

<body>
<%@include file="../header.jsp"%> 

	<!-- Shoping Cart -->
		<table>
			
			<tr>
				<td>
				<label for="selectAll" class="form-check-label">전체 선택
				<input type="checkbox" id="selectAll" name="selectAll" checked="checked">
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
			
		
			<c:set var="totalSub" value="0" />
			<c:set var="totalDel" value="0" />
			<c:forEach var="list" items="${lists}">		
			<c:set var="totalSub" value="${totalSub + (list.cart_amount * list.pro_subprice)}" />
			<c:set var="totalDel" value="${totalDel + (list.cart_amount * list.pro_delprice)}" />
					<tr>
						<td>
						<input type="checkbox" name="selectOne" id="selectOne" checked="checked">
						</td>
						
						<td>
							<div>
								<img src="/meomum/images/items/${list.pro_thumb}" alt="IMG-PRODUCT">
							</div>
						</td>
						
						<td>${list.pro_name}</td>
						
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pro_subprice }" />원</td>
						<td>${list.pro_month }개월
						<input type="hidden"  data-cart_idx="${list.cart_idx }" id="cart_idx" >
						</td>
						
						<td>
							<div class="wrap-num-product flex-w m-l-auto m-r-0">
							
							<!-- 마이너스 -->
								<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
									<i class="fs-16 zmdi zmdi-minus"></i>
								</div>

							<!-- 수량 조절 -->
								
								<input class="mtext-104 cl3 txt-center num-product update_amount_${list.cart_idx}" 
								type="number" min="1" max="10" name="cart_amount"
								value="${list.cart_amount}" id="update_amount_${list.cart_idx}" 
								onchange="updatePrice(this, ${list.pro_subprice}, ${list.pro_allprice})">
								
								
							
							<!-- 플러스 -->
								<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
									<i class="fs-16 zmdi zmdi-plus"></i>
								</div>
							
							</div>
							<input type="button" onclick="cartNumUpdate(${list.cart_idx}, document.querySelectorAll('.update_amount_${list.cart_idx}')[0].value)" value="수량 변경">

						</td>
						<td>
						<div>월 <span id="subPrice-${list.cart_idx}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.cart_amount * list.pro_subprice}" />원
						</span></div>
    					<div>총 <span id="allPrice-${list.cart_idx}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.cart_amount * list.pro_allprice}" />원</span></div>
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
					<td colspan="2">
						<div id="checkSub">체크한 상품의 총 구독 가격:</div>
						<div id="checkDel"> | 체크한 상품의 배송비:</div>
					</td>
					</tr>
					<form name="cartForm" method="get" action="orderList.do">
					<tr>
						<td>
						<input type="hidden" name="pro_idx" id="pro_idx" value="${list.pro_idx}" >
						<input type="hidden" name="cart_amount" value="${list.cart_amount}" >
						<input type="hidden" name="totalSubPrice" value="${totalSubPrice}" >
						<input type="hidden" name="totalDel" value="${totalDel}" >	
						<button type="submit" formaction="orderList.do">결제하기</button>
						</td>
					</tr>
					</form>		
				</table>
				
				
<script>
$('#selectAll').click(function() {
	  $('input[name="selectOne"]').prop('checked', $(this).prop('checked'));
	  updateTotalPrice();
	});

	// 각 상품 체크박스 클릭 시, 총 가격 업데이트
	$('input[name="selectOne"]').click(function() {
	  updateTotalPrice();
	});

	// 총 가격 업데이트 함수
	function updateTotalPrice() {
		
	  var totalSub = 0;
	  var totalDel = 0;
	  
	  $('input[name="selectOne"]:checked').each(function() {
		var cartIdx = $(this).data('cart_idx');
	    var cartAmount = parseInt($('#update_amount_'+cartIdx).val());
	    var subPrice = parseInt($('#subPrice-' + cartIdx).text().replace(/[^0-9.]/g, ''));

	    alert(cartIdx);
	    alert(cartAmount);
	    alert(subPrice);
	    
	    totalSub += subPrice * cartAmount;
	    totalDel += 20000 * cartAmount;
	  
	  });
	  $('#checkSub').text('체크한 상품의 총 구독 가격: ' + totalSub.toLocaleString() + '원');
	  $('#checkDel').text(' | 체크한 상품의 배송비: ' + totalDel.toLocaleString() + '원');
	}
</script>

<script>
function updateShippingCost() {
//전체 월 구독 가격, 전체 배송비인 듯
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

<script>
//수량 변경
function cartNumUpdate(update_idx,update_amount) {
	  $.ajax({
	    url: "cartNumUpdate.do",
	    type: "POST",
	    data: {
	      cart_idx: update_idx,
	      cart_amount: update_amount
	    },
	    success: function (response) {
	      alert("수량이 변경되었습니다.");
	      location.reload();
	    },
	    error: function (xhr, status, error) {
	      alert("실패하였습니다. 고객 센터로 연락해 주세요.");
	    },
	  });
	}
</script>

<script>
//장바구니 삭제
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



	<script src="js/main.js"></script>
<%@include file="../footer.jsp"%> 
</body>
</html>