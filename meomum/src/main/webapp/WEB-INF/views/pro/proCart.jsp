<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>[사용자] 장바구니 목록</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="css/proUtil.css">
	<link rel="stylesheet" type="text/css" href="css/proMain.css">
	<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<!--===============================================================================================-->
	
</head>
<style>
.btn-group {
  display: flex;
  justify-content: space-between;
}
h3.ltext-106 {
  margin-top: 40px;
  margin-bottom: 40px;
}

#thumb {
  width: 100px;
  height: 100px;
  object-fit: cover;
}
.checkbox-parent {
  display: flex;
  justify-content: center;
  vertical-align: middle;
}

.cartColor {
    display: block;
    width: 50px;
    font-weight: 800;
    text-align: center;
    color: #198754;
    border: none;
    background: none;
}

.flex-w {
  display: flex;
  flex-wrap: wrap;
  justify-content: flex-end; /* 오른쪽 정렬 */
}

#priceArea{
border: none;
  border-top: 1px solid #ccc;
  padding-top: 10px;
  text-align: right;
}
</style>

<body class="animsition">
<%@include file="../header.jsp"%> 

	<!-- Shoping Cart -->
		<form class="bg0 p-t-75 p-b-85" name="cartForm" method="get" action="orderListss.do">
			<div class="container">
				<div class="row">
	
				<h3 class="ltext-106 cl5 txt-center">장바구니</h3>
						<div class="m-l-25 m-r--38 m-lr-0-xl">
				
				<!-- 전체 선택 영역 -->
				<div class="wrap-table-shopping-check">
					<div class="form-check"> 
					<input type="checkbox" class="all_check_input form-check-input" id="allCheck" checked="checked">
						<label for="allCheck" class="form-check-label" style="display: flex; align-items: center;">
							<span class="all_chcek_span">전체 선택</span>
						</label>
					</div>	
				</div>
							
							
				<div class="wrap-table-shopping-cart">
					<table class="table-shopping-cart" style="text-align:center;">
					
					<tr class="table_head">
						<th class="column-c"></th>
						<th class="column-1">이미지</th>
						<th class="column-2">상품명</th>
						<th class="column-1">월 가격</th>
						<th class="column-1">개월 수</th>
						<th class="column-1">수량</th>
						<th class="column-1">총 가격</th>
						<th class="column-0"></th>
					</tr>
					
					<c:if test="${empty lists }">
						<tr>
							<td colspan="11" rowspan="2" align="center" class="stext-102 cl3 p-t-23">
							담긴 상품이 없습니다
							</td>
						</tr>
					</c:if>
					
	
			<c:forEach var="list" items="${lists}">		
					<tr style="text-align:center;">
						<td class="cart_info_td table_row" style="text-align: center;">
							<input type="checkbox" class="individual_cart_checkbox form-check-input" 
							checked="checked" id="cart_idx" name="cart_idx" value="${list.cart_idx}">	
							<input type="hidden" class="individual_cartamount_input" value="${list.cart_amount }">
							<input type="hidden" class="individual_prosubprice_input" value="${list.pro_subprice }">
							<input type="hidden" class="individual_prodelprice_input" value="${list.pro_delprice }">
						</td>
						
						<td class="column-4">
							<div>
								<img src="/meomum/images/items/${list.pro_thumb}" alt="IMG-PRODUCT" id="thumb">
							</div>
						</td>
						
						<td><a href="proContent.do?pro_idx=${list.pro_idx}" target="_blank" class="hov-cl1 trans-04 js-name-b2 p-b-6 d-block mx-auto">${list.pro_name}</a></td>
						
						<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pro_subprice }" />원</td>
						<td>${list.pro_month }개월
						</td>
						
						<td>
							<div class="flex-w m-l-auto m-r-0" style="justify-content: center;">
							
							<!-- 마이너스 -->
								<div id="minus-button" class="btn-num-product-down">
									<i class="bi bi-dash-lg"></i>
								</div>

							<!-- 수량 조절 -->
								
								<input class="txt-center c13 mtext-104 num-product cartColor update_amount_${list.cart_idx}" 
								type="number" min="1" max="${list.pro_amount-1}" name="cart_amount"
								value="${list.cart_amount}" id="update_amount_${list.cart_idx}" 
								onchange="updatePrice(this, ${list.pro_subprice}, ${list.pro_allprice})">
								
								
							<!-- 플러스 -->
								<div id="plus-button" class="btn-num-product-up">
								 	<i class="bi bi-plus-lg"></i>
								</div>
						</div>
						
							<!-- 수정 버튼 -->
							<div>
							<input type="button" style="margin: 0 auto;" class="btn-sm app-btn-secondary stext-102" 
							onclick="cartNumUpdate(${list.cart_idx}, document.querySelectorAll('.update_amount_${list.cart_idx}')[0].value)" value="수량 변경">
							</div>
						</td>
						
						
						<td class="column-4">
						<div>월 <span id="subPrice-${list.cart_idx}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.cart_amount * list.pro_subprice}" />원</span></div>
    					<div>총 <span id="allPrice-${list.cart_idx}"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.cart_amount * list.pro_allprice}" />원</span></div>
						</td>
						
						<!-- 장바구니 삭제 -->
						<td class="column-0">
							 <a href="#" onclick="deleteCartItem(${list.cart_idx})">
							 <i class="bi bi-x-lg size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04"></i>
							</a>
						</td>
					</tr>
				</c:forEach>
				
				<tr>
					<td colspan="8" class="column-6" id="priceArea">
					<div class="stext-107">총 구매 개수 <span class="totalCount"></span>개</div>
					<div>월 구독 가격: <span class="totalSub"></span>원 + 
					배송비 <span class="totalDel"></span>원 = 
					<span class="mtext-108" style="font-weight: bold;">합계 <span class="finalTotalPrice mtext-108" style="color: red;"></span>원</span></div>
					
					<input type="hidden" name="totalSub" id="totalSub" >
					<input type="hidden" name="totalCount" id="totalCount" >
					<input type="hidden" name="totalDel" id="totalDel" >
					<input type="hidden" name="finalTotalPrice" id="finalTotalPrice" >		
					</td>
				</tr>
			</table>	
				</div>
					
						<div class="col-sm-9 col-lg-6 col-xl-4 m-lr-auto m-b-50">
						  <div class="p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						    <button class="stext-101 cl0 size-103 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer" onclick='location.href = "proList.do";'>취소하기</button>
						    <button class="flex-c-m stext-103 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04" type="submit">구매하기</button>
						  </div>
						</div>
				</div>
			</div>
		  </div>	
	</form>
				
	

				
<script>
const minusBtn = document.getElementById('minus-button');
const plusBtn = document.getElementById('plus-button');
const cartAmount = document.getElementById('update_amount_${list.cart_idx}');

const proAmount = parseFloat("${list.pro_amount}");

function changeQuantity(newAmount) {
  cartAmount.value = newAmount;
}

// 마이너스 버튼 클릭 시
minusBtn.addEventListener('click', () => {
  const currentAmount = parseInt(cartAmount.value);
  if (currentAmount > 1) {
    changeQuantity(currentAmount - 1);
  }
});

// 플러스 버튼 클릭 시
plusBtn.addEventListener('click', () => {
  const currentAmount = parseInt(cartAmount.value);
  if (currentAmount < proAmount) {
    changeQuantity(currentAmount + 1);
  }
});

</script>			
				
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

<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
<!--===============================================================================================-->


	<script src="js/main.js"></script>
<%@include file="../footer.jsp"%> 
</body>
</html>