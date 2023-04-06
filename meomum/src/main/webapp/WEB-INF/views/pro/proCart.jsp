<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>[사용자] 장바구니 목록</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/proUtil.css">
	<link rel="stylesheet" type="text/css" href="css/proMain.css">
<!--===============================================================================================-->
</head>
<style>
td.column-3 img {
  width: 10px;
  height: 10px;
}
</style>
<body class="animsition">
</head>
<body>
<%@include file="../header.jsp"%> 
	
	
	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="index.do" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				Shoping Cart
			</span>
		</div>
	</div>
	
		
	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-8 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart" style="text-align:center;">
							
				<tr>
					<td>
						<label for="selectAll" class="form-check-label">
				        <input type="checkbox" id="selectAll" name="selectAll">
				       </label>
			       	</td>
				</tr>
							
								<tr class="table_head">
									<th></th>
									<th class="column-1">Product</th>
									<th class="column-2"></th>
									<th class="column-3">Price</th>
									<th class="column-3">Month</th>
									<th class="column-5">Quantity</th>
									<th class="column-5">Total</th>
								</tr>
								
								
						<c:if test="${empty lists }">
							<tr>
								<td colspan="11" rowspan="2" align="center" class="stext-102 cl3 p-t-23">
								담긴 상품이 없습니다
								</td>
							</tr>
						</c:if>
								
								
								<c:forEach var="list" items="${lists}">
								
								<tr class="table_row">
									
									<td>
									<input type="checkbox" id="selectOne" name="selectOne" value="ok">
									</td>
									
									<td class="column-1">
										<div class="how-itemcart1">
											<img src="/meomum/items/${list.pro_thumb}" alt="IMG-PRODUCT">
										</div>
									</td>
									
									<td class="column-2">${list.pro_name}</td>
									
									<td class="column-3"><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pro_subprice }" />원</td>
									
									<td class="column-3">${list.pro_month }개월</td>
									<td class="column-4">
										<div class="wrap-num-product flex-w m-l-auto m-r-0">
										
										<!-- 마이너스 -->
											<div class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

										<!-- 수량 조절 -->
											<input class="mtext-104 cl3 txt-center num-product" type="number" 
						     				 value="${list.cart_amount }" 
						     				 name="cart_amount" 
						     				 data-cart-idx="${list.cart_idx }"
						  				     onchange="cartAmountUpdate(this)" 
						  				     id="cart_amount">
										
										
										<!-- 플러스 -->
											<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
											
										</div>
									</td>
									
									<td class="column-5">
										<div>구독가 입력</div>
										<div>총 <fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pro_allprice }" />원</div>
									</td>
									
									<!-- 장바구니 삭제 -->
									<td class="column-3">
										 <a href="#" onclick="deleteCartItem(${list.cart_idx})">
											<img src="images/icon/icon-close2.png" alt="DELETE" class="delete-icon">
										</a>
									</td>

								</tr>
								</c:forEach>
							</table>
						</div>


						<div class="flex-w flex-sb-m bor15 p-t-18 p-b-15 p-lr-40 p-lr-15-sm">
							<div class="flex-w flex-m m-r-20 m-tb-5">
								<input class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5" type="text" name="coupon" placeholder="쿠폰 코드">
							</div>

							<div class="flex-c-m column-3">
								<div>총 구독 가격 ()원</div>
							</div>
							
							<div class="flex-c-m column-3">
								<div>총 배송비 ()원</div>
							</div>
							
						</div>
					</div>
				</div>
				
				
								<!-- 오른쪽 구역 -->
							<div class="col-sm-9 col-lg-6 col-xl-4 m-lr-auto m-b-50">
							  <div class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
							    <h4 class="mtext-109 cl2 p-b-30">
							      Cart Totals
							    </h4>
							
							    <div class="flex-w flex-t bor12 p-b-13">
							      <div class="size-208">
							        <span class="stext-110 cl2">
							          구독 금액
							        </span>
							      </div>
							
							      <div class="size-209">
							        <span class="mtext-110 cl2">
							          월 ()원
							        </span>
							      </div>
							    </div>
							
							    <div class="flex-w flex-t p-t-27 p-b-33 justify-content-center">
							      <div class="size-208">
							        <span class="mtext-101 cl2">
							          배송비
							        </span>
							      </div>
							
							      <div class="size-209 p-t-1">
							        <span class="mtext-110 cl2">
							          (배송비)
							        </span>
							      </div>
							    </div>
							
							    <button class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer"
							    type="submit" formaction="proPayment.do">
							      구매하기
							    </button>
							  </div>
							</div>
						</div>
					</div>
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
function cartAmountUpdate(cart_amount) {
	  const cartIdx = cart_amount.getAttribute("data-cart-idx");
	  const cartAmount = input.value;

	  alert(cartIdx);
	  
	  $.ajax({
		    url: 'cartNumUpdate.do',
		    type: 'POST',
		    dataType: 'json',
		    data: {cart_idx: cartIdx, cart_amount: cartAmount},
		    success: function (data) {
		    	console.log(data);
		    	alert(data);
		      }
		    },
		    error: function (xhr, status, error) {
		      alert("수량 변경에 실패하였습니다.");
		    },
		  });
	  
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