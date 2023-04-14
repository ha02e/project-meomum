<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[사용자] 상세 페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/proUtil.css">
	<link rel="stylesheet" type="text/css" href="css/proMain.css">
	<link rel="stylesheet" type="text/css" href="css/profont-awesome.min.css">
<!--===============================================================================================-->
</head>
<%@include file="/WEB-INF/views/header.jsp" %>
<body class="animsition">

	<!-- breadcrumb -->
	<div style="margin-top: 20px;" class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		
			<a href="index.do" class="stext-109 cl8 hov-cl1 trans-04">
				Home >
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
			
			<a href="proList.do" class="stext-109 cl8 hov-cl1 trans-04">
				${lists[0].pro_cate == 1 ? '침대' : lists[0].pro_cate == 2 ? '테이블' : 
				lists[0].pro_cate == 3? '의자' : lists[0].pro_cate == 4? '소파' : '조명'} >
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>

			<span class="stext-109 cl4">
				${lists[0].pro_name}
			</span>
		</div>
	</div>
		


	<!-- Product Detail -->
	<section class="sec-product-detail bg0 p-t-65 p-b-60">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-7 p-b-30">
					<div class="p-l-25 p-r-30 p-lr-0-lg">
						<div class="wrap-slick3 flex-sb flex-w">
							<div class="wrap-slick3-dots"></div>
							<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

							<div class="slick3 gallery-lb">
								<div class="item-slick3" data-thumb="/meomum/images/items/${lists[0].pro_thumb}">
									<div class="wrap-pic-w pos-relative">
										<img src="/meomum/images/items/${lists[0].pro_thumb}" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="/meomum/images/items/${lists[0].pro_thumb}">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
				
				
								<div class="item-slick3" data-thumb="/meomum/images/items/${lists[0].pro_img1}">
									<div class="wrap-pic-w pos-relative">
										<img src="/meomum/images/items/${lists[0].pro_img1}" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="/meomum/images/items/${lists[0].pro_img1}">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
					
					
								<div class="item-slick3" data-thumb="/meomum/images/items/${lists[0].pro_img2}">
									<div class="wrap-pic-w pos-relative">
										<img src="/meomum/images/items/${lists[0].pro_img2}" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="/meomum/images/items/${lists[0].pro_img2}">
											<i class="fa fa-expand"></i>
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 상품 정보 -->
				<div class="col-md-6 col-lg-5 p-b-30">
					<div class="p-r-50 p-t-5 p-lr-0-lg">
						
						<h4 class="mtext-105 cl2 js-name-detail p-b-14">
							${lists[0].pro_name}
						</h4>

						<span class="mtext-106 cl2">
							정가 <fmt:formatNumber type="number" maxFractionDigits="3" value="${lists[0].pro_price}" />원
						</span>
						
						<div class="mtext-106 cl2">
							월 <fmt:formatNumber type="number" maxFractionDigits="3" value="${lists[0].pro_subprice}" />원 | ${lists[0].pro_month}개월 구독 가격
						</div>

						<p class="stext-102 cl3 p-t-23">
							개당 배송비 <fmt:formatNumber type="number" maxFractionDigits="3" value="${lists[0].pro_delprice}" />원
						</p>
						
						<span class="mtext-106 cl2">
							총 구독 가격 <fmt:formatNumber type="number" maxFractionDigits="3" value="${lists[0].pro_allprice}" />원
													
						</span>
						
						<!-- 수량 부분 -->
						<form name="contentForm" method="get" action="orderList.do">	
						 <input type="hidden" name="pro_idx" value="${lists[0].pro_idx}">
						 <input type="hidden" name="pro_name" value="${lists[0].pro_name}">
						 <input type="hidden" name="pro_subprice" value="${lists[0].pro_subprice}">
						 <input type="hidden" name="pro_delprice" value="${lists[0].pro_delprice }">
						 
						<div class="flex-w m-r-20 m-tb-10">
							<!-- 마이너스 -->
							<div id="minus-button">
								<i class="fs-16 zmdi zmdi-minus"></i>
							</div>

							<!-- 수량 조절 -->
							<input class="txt-center num-product" 
							id="cart_amount" 
							type="number" 
							name="cart_amount" 
							value="1" 
							min="1" max="10">
												
							<!-- 플러스 -->
							<div id="plus-button">
								<i class="fs-16 zmdi zmdi-plus"></i>
							</div>
						</div>
						<div><span id="subPrice">월 가격:<fmt:formatNumber type="number" maxFractionDigits="3" value="${lists[0].pro_subprice}" />원</span></div>
    					<div><span id="allPrice">총 가격:<fmt:formatNumber type="number" maxFractionDigits="3" value="${lists[0].pro_allprice}" />원</span></div>
    					<div><span id="delPrice">총 배송비:<fmt:formatNumber type="number" maxFractionDigits="3" value="${lists[0].pro_delprice}" />원</span></div>
						<br>
							
							<div class="flex-w flex-r-m p-b-10">
								<div class="size-204 flex-w flex-m respon6-next">
									<button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
									type="submit" formaction="cartInsert.do">장바구니</button>
									
									 <button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail"
									 type="submit" formaction="orderList.do">구매하기</button>
								</div>
							</div>	
						</form>
					</div>
						
						

						<!-- 뭐 기타 등등 -->
						<div class="flex-w flex-m p-l-100 p-t-40 respon7">
							<div class="flex-m bor9 p-r-10 m-r-11">
								<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100" data-tooltip="Add to Wishlist">
									<i class="zmdi zmdi-favorite"></i>
								</a>
							</div>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Facebook">
								<i class="fa fa-facebook"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Twitter">
								<i class="fa fa-twitter"></i>
							</a>

							<a href="#" class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100" data-tooltip="Google Plus">
								<i class="fa fa-google-plus"></i>
							</a>
						</div>
					</div>
				</div>
			</div>


	<!-- 상품 설명, 이용 안내, 배송 안내 -->
	<div class="bor10 m-t-50 p-t-43 p-b-40">
		<!-- Tab01 -->
		<div class="tab01">
			<!-- Nav tabs -->
			<ul class="nav nav-tabs" role="tablist">
				<li class="nav-item p-b-10">
					<a class="nav-link active" data-toggle="tab" href="#description" role="tab">상품 설명</a>
				</li>

				<li class="nav-item p-b-10">
					<a class="nav-link" data-toggle="tab" href="#information" role="tab">이용 안내</a>
				</li>

				<li class="nav-item p-b-10">
					<a class="nav-link" data-toggle="tab" href="#reviews" role="tab">배송 안내</a>
				</li>
			</ul>

		<!-- Tab panes -->
		<div class="tab-content p-t-43">
			<!-- 상품 설명 -->
			<div class="tab-pane fade show active" id="description" role="tabpanel">
				<div class="how-pos2 p-lr-15-md text-center">
					<p>
					<img class="stext-102 cl6" src="/meomum/images/items/${lists[0].pro_content}" alt="CONTENT-DETAIL">
					</p>
				</div>
			</div>



	<!-- 이용 안내 -->
	<div class="tab-pane fade" id="information" role="tabpanel">
		<div class="row">
			<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
				<ul class="p-lr-28 p-lr-15-sm">
					<li class="flex-w flex-t p-b-7">
					<img class="stext-102 cl6" src="/meomum/images/meomum_how_to_use01.png" alt="CONTENT-USE">
					</li>
				</ul>
			</div>
		</div>
	</div>

		<!-- 배송 안내 -->
		<div class="tab-pane fade" id="reviews" role="tabpanel">
			<div class="row">
				<div class="col-sm-10 col-md-8 col-lg-6 m-lr-auto">
					<div class="p-b-30 m-lr-15-sm">
						<img class="stext-102 cl6" src="/meomum/images/meomum_how_to_use02.png" alt="CONTENT-DEL">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>



<script>
  
  const minusBtn = document.getElementById('minus-button');
  const plusBtn = document.getElementById('plus-button');
  const cartAmount = document.getElementById('cart_amount');
  
  const subPrice = document.getElementById('subPrice');
  const allPrice = document.getElementById('allPrice');
  const delPrice = document.getElementById('delPrice');
  
  // 현재 재고 수량 가져오기
  const proAmount = parseFloat("${lists[0].pro_amount}")

  // 수량 및 가격 변경 함수
  const changeQuantity = (amount) => {
    const subPriceValue = parseFloat("${lists[0].pro_subprice}") * amount;
    const allPriceValue = parseFloat("${lists[0].pro_allprice}") * amount;
    const delPriceValue = parseFloat("${lists[0].pro_delprice}") * amount;
    cartAmount.value = amount;
    subPrice.innerText = "월 구독 가격: "+ new Intl.NumberFormat('ko-KR').format(subPriceValue) + "원";
    allPrice.innerText = "총 구독 가격: " + new Intl.NumberFormat('ko-KR').format(allPriceValue) + "원";
    delPrice.innerText = "총 배송비 가격: " + amount+"개 "+ new Intl.NumberFormat('ko-KR').format(delPriceValue) + "원";
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
    if (currentAmount < proAmount-1) {
      changeQuantity(currentAmount + 1);
    }
  });

  // 초기값 설정
  changeQuantity(1);
</script>
<!--===============================================================================================-->	
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
<!--===============================================================================================-->
	<script src="vendor/daterangepicker/moment.min.js"></script>
	<script src="vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
<!--===============================================================================================-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="vendor/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2, .js-addwish-detail').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>
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
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>