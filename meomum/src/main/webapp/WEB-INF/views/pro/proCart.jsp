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
					<form name="cartForm" method="get" action="orderListss.do">
		<table>
			
			<tr>
				<td>
					<div class="all_check_input_div">
						<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
					</div>
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
			
		
		
			<c:forEach var="list" items="${lists}">		
					<tr>
						<td class="cart_info_td">
							<input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked" name="cart_idx" value="${list.cart_idx}">		
							<input type="hidden" class="individual_cartamount_input" value="${list.cart_amount }">
							<input type="hidden" class="individual_prosubprice_input" value="${list.pro_subprice }">
							<input type="hidden" class="individual_prodelprice_input" value="${list.pro_delprice }">
						</td>
						
						<td>
							<div>
								<img src="/meomum/images/items/${list.pro_thumb}" alt="IMG-PRODUCT">
							</div>
						</td>
						
						<td>${list.pro_name}</td>
						
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pro_subprice }" />원</td>
						<td>${list.pro_month }개월
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
						<td><div>월 구독 가격: <span class="totalSub"></span>원 | </div></td>
						<td><div>총 구매 개수: <span class="totalCount"></span>개 | </div></td>	
						<td><div>총 배송비: <span class="totalDel"></span>원 | </div></td>	
						<td>월 구독 가격+총 배송비: <span class="finalTotalPrice"></span>원</td>
						
					</tr>
		
					<tr>
						<td colspan="5">
						<input type="hidden" name="totalSub" id="totalSub" >
						<input type="hidden" name="totalCount" id="totalCount" >
						<input type="hidden" name="totalDel" id="totalDel" >
						<input type="hidden" name="finalTotalPrice" id="finalTotalPrice" >	
						<button type="submit">결제하기</button>
						</td>
					</tr>
				</table>
					</form>		
				
				
<script>
$(document).ready(function() {
	
	setTotalInfo();
	
});


$(".individual_cart_checkbox").on("change", function(){
	//총 주문 정보 세팅
	setTotalInfo($(".cart_info_td"));
});


$(".all_check_input").on("click", function(){
	
	if($(".all_check_input").prop("checked")){
		$(".individual_cart_checkbox").prop('checked',true);
	} else{
		$(".individual_cart_checkbox").prop('checked',false);
	}
	
	setTotalInfo($(".cart_info_td"));
	
});


function setTotalInfo(){
	  let totalSub = 0; // 총 가격 (총 구독 가격)
	  let totalCount = 0; // 총 갯수
	  let totalDel = 0; // 총 배송비
	  let finalTotalPrice = 0; // 최종 가격 (배송비+구독가)

	  $(".cart_info_td").each(function(index, element) {
		  
		if($(element).find(".individual_cart_checkbox").is(":checked")==true){
	    let cart_amount = parseInt($(element).find(".individual_cartamount_input").val());
	    let pro_subprice = parseInt($(element).find(".individual_prosubprice_input").val());
	    let pro_delprice = parseInt($(element).find(".individual_prodelprice_input").val());
	    
	 	totalCount += cart_amount
	    totalSub += cart_amount * pro_subprice;
	    totalDel += cart_amount * pro_delprice;
	    finalTotalPrice = totalSub + totalDel;

	    
		}
	  });
	  
	  // 배송비 출력
	  $(".totalDel").text(totalDel.toLocaleString());
	    $("#totalDel").val(totalDel);

	  // 총 가격 출력
	  $(".totalSub").text(totalSub.toLocaleString());
	   $("#totalSub").val(totalSub);

	  // 총 구매 개수
	  $(".totalCount").text(totalCount.toLocaleString());
	   $("#totalCount").val(totalCount);

	  // 배송비+월 구독 가격
	  $(".finalTotalPrice").text(finalTotalPrice.toLocaleString());
	    $("#finalTotalPrice").val(finalTotalPrice);

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