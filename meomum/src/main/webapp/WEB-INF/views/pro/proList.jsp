<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[사용자] 상품 리스트</title>
<style>
.block2-pic {
  text-align: center;
  position: relative;
}

.block2-btn {
  margin: 10px auto;
  display: block;
}

.add-space {
  padding-right: 30px; /* 적절한 크기로 값 조정 가능 */
}

.panel-search {
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.panel-search a {
  margin-right: 10px;
}
.search-cancel {
  margin-right: auto;
}

.search-input {
  display: flex;
  align-items: center;
}
</style>

<!--=============================================-->
	<link rel="stylesheet" type="text/css" href="css/proUtil.css">
	<link rel="stylesheet" type="text/css" href="css/proMain.css">
<!--=============================================-->
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<%@include file="/WEB-INF/views/header.jsp" %>
<body class="animsition">

	<div style="height: 80px;"></div>

<!-- BEST PRODUCTS -->
		<c:if test="${!empty proF }">
		<div class="container text-center" style="max-width: 960px;">
				 <div class="row justify-content-center mtext-112">
					     '${proF }'에 대한 검색 결과입니다.
				</div>
			</div>   
		</c:if>
		
		<c:if test="${empty proF}">
				<div class="container">
					<div class="p-b-45">
						<h3 class="ltext-106 cl5 txt-center">
							BEST ITEM
						</h3>
					</div>
				</div>

	<div class="container text-center" style="max-width: 970px;">
		 <div class="row justify-content-center">
		  <c:forEach var="list2" items="${lists2}">
		    <div class="col-sm-6 col-md-3 col-lg-3 mx-auto" >
		      <div class="block2-pic hov-img0">
		        <a href="proContent.do?pro_idx=${list2.pro_idx}"><img src="/meomum/images/items/${list2.pro_thumb}" alt="best-img"></a>
		     	 </div>
			      <div class="block2-txt flex-w flex-t p-t-14 mx-auto">
			      
			        <div class="col-sm-6 mx-auto text-center">
			          <a href="proContent.do?pro_idx=${list2.pro_idx}" class="stext-104 cl4 hov-cl1 trans-04 js-name-b2 p-b-6 d-block mx-auto">
			            ${list2.pro_name}
			          </a>
			          <span class="stext-105 cl3 d-block mx-auto">
			            <fmt:formatNumber type="number" maxFractionDigits="3" value="${list2.pro_subprice }" />원
			          </span>
			          
			        </div>
			      </div>
			   	</div>
			  </c:forEach>
			</div>
		</div>   
</c:if>

	<div style="height: 30px;"></div>
	
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
      
      
    <!-- Search product -->
		 <form name="itemFind" action="itemFind.do">
			 
			  <div class="panel-search w-full p-t-10 p-b-15">
			    <div class="search-cancel" >
			      <c:if test="${!empty proF }">
			        <a href="proList.do" class="stext-104" style="color:#FF6A89; border: 1px solid #FF6A89;">검색 취소</a>
			      </c:if>
			    </div>
			    
		    <div class="search-input">
			     <input class="form-control me-sm-2" type="text" name="proF" placeholder="Search" required
			     <c:if test="${!empty proF}">value="${proF}"</c:if>>
		     
		      <button type="submit" class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04">
		       <i class="bi bi-search"></i>
		      </button>
		    </div>
		  </div>
		</form>
		</div>

	
	<!-- products -->
		<div class="row isotope-grid">
		    <c:forEach var="list" items="${lists}">
				<div style="margin-bottom: 40px;" class="col-sm-6 col-md-4 col-lg-4 p-b-35 isotope-item ${list.pro_cate}">
		            <!-- Block2 -->
		            <div class="block2">
		                <div class="block2-pic hov-img1">
		                    <a href="proContent.do?pro_idx=${list.pro_idx}"><img src="/meomum/images/items/${list.pro_thumb}" alt="IMG-PRODUCT"></a>
		
		                    <a href="proContent.do?pro_idx=${list.pro_idx}" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1">
		                       ${list.pro_month }개월
		                    </a>
		                </div>
		
	                <div class="block2-txt flex-w flex-t p-t-14">
	                    <div class="block2-txt-child1 flex-col-l ">
	                        <a href="proContent.do?pro_idx=${list.pro_idx}" class="stext-106 cl4 hov-cl1 trans-04 js-name-b2 p-b-6">
	                            ${list.pro_name}
	                        </a>
				
	                        <span class="stext-105 cl3">
	                        <fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pro_subprice }" />원
	                        </span>
	                    </div>
							
							
							<input type="hidden" id="pro_idx" name="pro_idx" value="${list.pro_idx }">
	                        <input type="hidden" id="user_idx" name="user_idx" value="${sessionScope.ssInfo.user_idx}">
	                   
	                    <div class="block2-txt-child2 flex-r p-t-3">
	                        <a href="javascript:void(0)" class="btn-addwish-b2 dis-block pos-relative js-addwish-b2" onclick="loveInsert(${list.pro_idx },${sessionScope.ssInfo.user_idx})">
	                            <img class="icon-heart1 dis-block trans-04" src="images/icon/icon-heart-01.png" alt="ICON">
	                            <img class="icon-heart2 dis-block trans-04 ab-t-l" src="images/icon/icon-heart-02.png" alt="ICON">
	                        </a>
	                    </div>
	                </div>
	            </div>
	        </div>
	   			 </c:forEach>
			</div>
			
			<div style="height: 40px;"></div>
			
			<!-- page -->
				<div class="container-xl paging">
	               <nav aria-label="Page navigation example">
	                  <div class="pagination pagination-sm justify-content-center">
	                  ${pageStr}
	                  </div>
	               </nav>
	          </div>
		</div>
	</div>


<!--=============================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
<!--=========페이지 모양 유지해줌===========-->
	<script src="vendor/isotope/isotope.pkgd.min.js"></script>
	<script src="vendor/animsition/js/animsition.min.js"></script>
<!--=========아마 찜하기 팝업이었을 거임==========-->
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

<!-- 
<script>
function loveInsert(pro_idx,user_idx) {
//찜 추가
	$.ajax({
	    type: "POST",
	    url: "loveInsert.do",
	    data: {
	      pro_idx: pro_idx,
	      user_idx: user_idx
	    },
	    success: function(data) {
	      alert("찜 완료");
	    },
	    error: function(jqXHR, textStatus, errorThrown) {
	      alert("찜 실패");
	    }
	  });
	}
</script>
 -->
<script>
//전체 외 페이징 숨기기
const allBtn = document.querySelector('[data-filter="*"]');
const filterBtns = document.querySelectorAll('.filter-tope-group button:not([data-filter="*"])');
const pagination = document.querySelector('.paging');

// 전체 카테고리를 선택했을 때
allBtn.addEventListener('click', () => {
  pagination.style.display = 'block'; // 페이징을 보이도록 설정
});

// 다른 카테고리를 선택했을 때
filterBtns.forEach(btn => {
  btn.addEventListener('click', () => {
    pagination.style.display = 'none'; // 페이징을 숨기도록 설정
  });
});
</script>

<script src="js/main.js"></script>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>