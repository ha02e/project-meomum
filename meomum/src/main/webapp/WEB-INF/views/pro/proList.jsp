<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[사용자] 상품 리스트</title>
<style>
.block2-pic {
  text-align: center;
}

.block2-btn {
  margin: 10px auto;
  display: block;
}
</style>
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icon/favicon.png"/>
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
<!--===============================================================================================-->
</head>
<%@include file="/WEB-INF/views/header.jsp" %>
<body class="animsition">

	<div style="height: 50px;"></div>
<!-- BEST PRODUCTS -->

		<div class="container">
			<div class="p-b-45">
				<h3 class="ltext-106 cl5 txt-center">
					BEST ITEM
				</h3>
			</div>
			</div>


<div class="container text-center" style="max-width: 960px;">
  <div class="row justify-content-center">
    <div class="col-sm-6 col-md-3 col-lg-3">
      <div class="block2-pic hov-img0">
        <img src="/meomum/items/image1.jpg" alt="IMG-PRODUCT">
      </div>
      <div class="block2-txt flex-w flex-t p-t-14">
        <div class="block2-txt-child1 flex-col-l text-center">
          <a href="#" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6 d-block mx-auto">
            Product Name
          </a>
          <span class="stext-105 cl3 d-block mx-auto">
            $100.00
          </span>
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-md-3 col-lg-3">
      <div class="block2-pic hov-img0">
        <img src="/meomum/items/image2.jpg" alt="IMG-PRODUCT">
      </div>
       <div class="block2-txt flex-w flex-t p-t-14">
        <div class="block2-txt-child1 flex-col-l text-center">
          <a href="#" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6 d-block mx-auto">
            Product Name
          </a>
          <span class="stext-105 cl3 d-block mx-auto">
            $100.00
          </span>
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-md-3 col-lg-3">
      <div class="block2-pic hov-img0">
        <img src="/meomum/items/image3.jpg" alt="IMG-PRODUCT">
      </div>
       <div class="block2-txt flex-w flex-t p-t-14">
        <div class="block2-txt-child1 flex-col-l text-center">
          <a href="#" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6 d-block mx-auto">
            Product Name
          </a>
          <span class="stext-105 cl3 d-block mx-auto">
            $100.00
          </span>
        </div>
      </div>
    </div>
    <div class="col-sm-6 col-md-3 col-lg-3">
      <div class="block2-pic hov-img0">
        <img src="/meomum/items/image3.jpg" alt="IMG-PRODUCT">
      </div>
       <div class="block2-txt flex-w flex-t p-t-14">
        <div class="block2-txt-child1 flex-col-l text-center">
          <a href="#" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6 d-block mx-auto">
            Product Name
          </a>
          <span class="stext-105 cl3 d-block mx-auto">
            $100.00
          </span>
        </div>
        </div>
      </div>
    </div>
	</div>

	<div style="height: 70px;"></div>
	
<!-- CATEGORY -->
<div class="bg0 m-t-23 p-b-140">
  <div class="container" style="max-width: 1100px">
    <div class="flex-w flex-sb-m p-b-52">
     
      <div class="flex-w flex-l-m filter-tope-group m-tb-10">
        <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1" data-filter="*">
          전체
        </button>
        <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".1">
          침대
        </button>
        <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".2">
          테이블
        </button>
        <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".3">
          의자
        </button>
        <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".4">
          소파
        </button>
        <button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" data-filter=".5">
          조명
        </button>
      </div>
      
      
      
       <div class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
        <i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
        <i class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
        Search
      </div>
      
      	

       <!-- Search product -->
      <form name="itemFind" action="itemFind.do">
      <div class="dis-none panel-search w-full p-t-10 p-b-15">
        <div class="bor8 dis-flex p-l-15">
          <button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
            <i class="zmdi zmdi-search"></i>
          </button>
          <input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text" name="search-product" placeholder="Search">
          
        </div>
      </div>
    </form>
   </div>


	
<!-- products -->
<div class="row isotope-grid">
    <c:forEach var="list" items="${lists}">
        <div class="col-sm-6 col-md-4 col-lg-4 p-b-35 isotope-item ${list.pro_cate}" >
            <!-- Block2 -->
            <div class="block2">
                <div class="block2-pic hov-img0">
                    <img src="/meomum/items/${list.pro_thumb}" alt="IMG-PRODUCT">

                    <a href="#" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
                        킵
                    </a>
                </div>

                <div class="block2-txt flex-w flex-t p-t-14">
                    <div class="block2-txt-child1 flex-col-l ">
                        <a href="proContent.do?pro_idx=${list.pro_idx}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
                            ${list.pro_name}
                        </a>

                        <span class="stext-105 cl3">
                            ${list.pro_subprice }원
                        </span>
                    </div>

                    <div class="block2-txt-child2 flex-r p-t-3">
                        <a href="#" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
                            <img class="icon-heart1 dis-block trans-04" src="images/icon/icon-heart-01.png" alt="ICON">
                            <img class="icon-heart2 dis-block trans-04 ab-t-l" src="images/icon/icon-heart-02.png" alt="ICON">
                        </a>
                    </div>
                </div>
            </div>
        </div>
   			 </c:forEach>
		</div>
		<!-- page -->
		<div class="flex-c-m flex-w w-full p-t-38">
				${pageStr }
			</div>		
	</div>
</div>

	
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
				swal(nameProduct, "찜 완료", "success");

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