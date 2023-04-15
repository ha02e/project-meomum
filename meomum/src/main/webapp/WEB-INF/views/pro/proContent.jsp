<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[사용자] 상세 페이지</title>

<style>
.bi-check2-circle {
   color: #198754;
}

.dJduHI {
    display: grid;
    grid-template-columns: minmax(150px, auto) minmax(120px, auto) 1fr;
    gap: 4px 8px;
    place-items: center start;
}
.hlJovE {
    display: flex;
        -webkit-box-align: center;
    align-items: center;
    line-height: 1.923;
}

.flHQIV {
    display: grid;
    grid-template-columns: 100px auto;
    gap: 12px;
}

.lloHzk {
    margin-bottom: 8px;
    color: rgb(161, 161, 161);
}
.jWCprc {
    display: flex;
    -webkit-box-align: center;
    align-items: center;
}

.jeiRgB {
    margin-bottom: 5px;
    color: rgb(17, 17, 17);
}
.djsDA {
    padding: 5px 0px;
}

.jWCprc {
  position: relative;
}

.jeiRgB .bi-question-circle {
  position: absolute;
  top: 0;
  right: 0;
  font-size: 1.5rem;
  color: gray;
  cursor: help;
}

.tooltip {
  visibility: hidden;
  width: max-content;
  background-color: #333;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px;
  position: absolute;
  z-index: 1;
  bottom: 150%;
  left: 50%;
  transform: translateX(-50%);
  opacity: 0;
  transition: opacity 0.3s;
}

.jeiRgB .bi-question-circle:hover .tooltip {
  visibility: visible;
  opacity: 1;
}

.button-container {
  display: grid;
  grid-template-columns: repeat(2, 1fr);
  grid-column-gap: 10px;
}


.totalPrice {
    display: flex;
    -webkit-box-pack: justify;
    justify-content: space-between;
    padding: 0px 15px;
}

.rightPrice {
    display: flex;
    flex-direction: column;
}

.right {
    display: flex;
    -webkit-box-pack: end;
    justify-content: end;
    margin-bottom: 20px;
    -webkit-box-align: center;
    align-items: center;
}

.del {
    font-size: 1.4rem;
    color: rgb(112, 112, 112);
    flex-shrink: 0;
}

.right2 {
    display: flex;
    -webkit-box-pack: end;
    justify-content: end;
    gap: 4px;
}

.sub {
    font-size: 2.2rem;
    color: rgb(0, 0, 0);
}

.all {
    font-size: 1.4rem;
    font-weight: 400;
}

#cart_amount {
    display: block;
    width: 50px;
    font-weight: 800;
    text-align: center;
    color: #198754;
    border: none;
    background: none;
}

</style>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/proUtil.css">
	<link rel="stylesheet" type="text/css" href="css/proMain.css">
	<link rel="stylesheet" type="text/css" href="vendor/slick/slick.css">
	<link rel="stylesheet" type="text/css" href="vendor/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<%@include file="/WEB-INF/views/header.jsp" %>
<body class="animsition">

	<!-- breadcrumb -->
	<div style="margin-top: 20px;" class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
		
			<a href="index.do" class="stext-109 cl8 hov-cl1 trans-04">
				Home
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true">></i>
			</a>
			
			<a href="proList.do" class="stext-109 cl8 hov-cl1 trans-04">
				${lists[0].pro_cate == 1 ? '침대' : lists[0].pro_cate == 2 ? '테이블' : 
				lists[0].pro_cate == 3? '의자' : lists[0].pro_cate == 4? '소파' : '조명'}
				<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true">></i>
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
							  <div class="slick3-prev"></div>
							 
							<div class="slick3 gallery-lb">
								<div class="item-slick3" data-thumb="/meomum/images/items/${lists[0].pro_thumb}">
									<div class="wrap-pic-w pos-relative">
										<img src="/meomum/images/items/${lists[0].pro_thumb}" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="/meomum/images/items/${lists[0].pro_thumb}">
											<i class="bi bi-arrows-angle-expand"></i>
										</a>
									</div>
								</div>
				
				
								<div class="item-slick3" data-thumb="/meomum/images/items/${lists[0].pro_img1}">
									<div class="wrap-pic-w pos-relative">
										<img src="/meomum/images/items/${lists[0].pro_img1}" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="/meomum/images/items/${lists[0].pro_img1}">
											<i class="bi bi-arrows-angle-expand"></i>
										</a>
									</div>
								</div>
					
					
								<div class="item-slick3" data-thumb="/meomum/images/items/${lists[0].pro_img2}">
									<div class="wrap-pic-w pos-relative">
										<img src="/meomum/images/items/${lists[0].pro_img2}" alt="IMG-PRODUCT">

										<a class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04" href="/meomum/images/items/${lists[0].pro_img2}">
											<i class="bi bi-arrows-angle-expand"></i>
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
						<div class="flex-w flex-r-m p-b-10">
							<div class="block2-txt-child2 flex-r p-t-3">
		                        <a href="javascript:void(0)" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2" onclick="loveInsert(${list.pro_idx },${sessionScope.ssInfo.user_idx})">
		                            <img class="icon-heart1 dis-block trans-04" src="images/icon/icon-heart-01.png" alt="ICON">
		                            <img class="icon-heart2 dis-block trans-04 ab-t-l" src="images/icon/icon-heart-02.png" alt="ICON">
		                        </a>
		                    </div>
						</div>	
						
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">
								${lists[0].pro_name}
							</h4>
							
							<i class="bi bi-check2-circle"> ${lists[0].pro_month}개월 구독 상품</i> 
							<br>
							
						<div class="bor18"></div>
						
						<div class="dis-block stext-107 cl6 p-tb-8 p-lr-4">
						정가 <fmt:formatNumber type="number" maxFractionDigits="3" value="${lists[0].pro_price}" />원
						</div>
						
						<div class="bor18"></div>
						
						<div class="dJduHI">
							<div class="hlJovE mtext-106">
							월 <fmt:formatNumber type="number" maxFractionDigits="3" value="${lists[0].pro_subprice}" />원
							</div>
							<div class="hlJovE stext-107 cl6 p-tb-8">
							총 <fmt:formatNumber type="number" maxFractionDigits="3" value="${lists[0].pro_allprice}" />원
							</div>
						</div>
						
						<div class="bor18"></div>
						
						<div class="djsDA">
							<div class="flHQIV cl6 p-tb-8">
								
								<div class="jWCprc">
								<div class="lloHzk">배송비</div>
								</div>
								
								<div class="jWCprc">
								  <div class="jeiRgB">
								    <fmt:formatNumber type="number" maxFractionDigits="3" value="${lists[0].pro_delprice}" />원
								    <i class="bi bi-question-circle" aria-label="배송비는 개당 부과됩니다">
								      <span class="tooltip">배송비는 개당 부과됩니다</span>
								    </i>
								  </div>
								</div>
								
							</div>
						</div>
						
						<div class="bor18"></div>
						
						<!-- 가격 변경 구역 -->
					<form name="contentForm" method="get" action="orderList.do">	
						<div class="flex-w flex-r-m p-b-8">
							<div class="flex-w m-r-20 m-tb-10">
							
								<!-- 마이너스 -->
								<div id="minus-button">
									<i class="bi bi-dash-lg"></i>
								</div>
	
								<!-- 수량 조절 -->
								<input class="txt-center c13 mtext-104 num-product" 
								id="cart_amount" 
								type="number" 
								name="cart_amount" 
								value="1" 
								min="1" max="10">
													
								<!-- 플러스 -->
								<div id="plus-button">
									<i class="bi bi-plus-lg"></i>
								</div>
							</div>
						</div>
	
			
						 <input type="hidden" name="pro_idx" value="${lists[0].pro_idx}">
						 <input type="hidden" name="pro_name" value="${lists[0].pro_name}">
						 <input type="hidden" name="pro_amount" value="${lists[0].pro_amount}">
						 <input type="hidden" name="pro_subprice" value="${lists[0].pro_subprice}">
						 <input type="hidden" name="pro_delprice" value="${lists[0].pro_delprice }">
						 <input type="hidden" name="pro_month" value="${lists[0].pro_month }">
						 
				
			<div class="totalPrice">
	 			 <p class="total mtext-106 c12">총 주문 금액</p>
				<div class="rightPrice">
				  
				   <div class="right">
				   	 <p class="del stext-102"><span id="delPrice">배송비 <fmt:formatNumber type="number" maxFractionDigits="3" value="${lists[0].pro_delprice}" />원</span></p>
				   </div>
				   
				   <div class="right2">
				     <span class="sub mtext-108"><span id="subPrice">월 <fmt:formatNumber type="number" maxFractionDigits="3" value="${lists[0].pro_subprice}" />원</span></span>
				     
				   </div>
				   	 
				   	 <p class="right2 all stext-107"><span id="allPrice">총 <fmt:formatNumber type="number" maxFractionDigits="3" value="${lists[0].pro_allprice}" />원</span></p>
				</div>
			</div>
				
						<div class="bor18 cl3 p-t-23"></div>
						
						<!-- 버튼 구역 -->
						<div class="button-container">
						  <button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04" type="submit" formaction="cartInsert.do">장바구니</button>
						  <button class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04" type="submit" formaction="orderList.do">구매하기</button>
						</div>
							</form>
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
    subPrice.innerText = "월 "+ new Intl.NumberFormat('ko-KR').format(subPriceValue) + "원";
    allPrice.innerText = "총 " + new Intl.NumberFormat('ko-KR').format(allPriceValue) + "원";
    delPrice.innerText = "배송비 " + new Intl.NumberFormat('ko-KR').format(delPriceValue) + "원";
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

<!--=========지우면 안됨===========-->
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--======================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===========이미지 슬라이드 효과==========================-->
	<script src="vendor/slick/slick.min.js"></script>
	<script src="js/slick-custom.js"></script>
<!--===============================================================================================-->

<!--========================이미지 갤러리================================-->
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

		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "찜 추가되었습니다");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

</script>
<!--===============================================================================================-->
	<script src="js/main.js"></script>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>