<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.4.slim.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">



<style>

/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://images.unsplash.com/photo-1617104551722-3b2d51366400?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1400&q=80)
		no-repeat center;
	background-size: cover;
	margin: 0;
	border-bottom: none;
	padding-bottom: 0px;
}

.page-caption {
	padding: 90px 0px;
	position: relative;
	z-index: 1;
	color: #fff;
	text-align: center;
}


.nav-link{
    color: #85745D !important;
}

.nav-pills .nav-link.active, .nav-pills .show>.nav-link {
    color: #ffffff !important;
    background-color: #85745D !important;
}


.users-table table {
	margin-top:10px;
  	width: 100%;
  	text-align: left;
  	border-collapse: collapse;
  	line-height: 1.4;
  	letter-spacing: -0.3px;
  	color: #555555;
  	transition: none;
	background-color:fcfcfc;
}

.users-table-info {
  line-height: 1.4;
  letter-spacing: -0.3px;
  color: #767676;
  height: 48px;
  border-bottom: 1.2px solid #dadbe4;
  font-size: 14px;
}

thead tr{
	background-color: #f8f9fa;
	border-top: 1.2px solid #dadbe4;
}

.users-table-info th {
	color:#333333;
	text-align: center;
	font-size: 0.95rem;
}

.users-table td {
	background-color: #fff;
	border-top: 1px solid #dddddd;
	border-bottom: 1px solid #dddddd;
	padding-top: 15px;
	padding-bottom: 15px;
	text-align: center;
	font-family: initial;
}

.users-table td:first-child {
  padding-left: 20px;
}

.users-table tbody {
  font-size: 14px;
}

.users-table tbody tr.active td {
  background-color: rgba(47, 73, 209, 0.1);
}


.categories-table-img{
	position: relative;
	overflow: hidden;
	margin: 0 10px;
  	width: 40px;
  	height: 40px;
}
.users-table img {
	position: absolute;
  	width: 100%;
  	top: 50%; 
  	left: 50%;
  	transform: translate(-50%, -50%);
  	border-radius: 0.5rem;
}
.subsPro p{
	line-height: 40px;
	margin:0;
}

.table-wrapper {
  overflow-x: auto;
  overflow-y: hidden;
  margin-bottom: 20px;
}


tbody{
	background:#eeeeee;
}
.orderNum{
	color:#E6694C;
}

.buttons a{
	color: #E6694C;
	border: 1px solid #E6694C;
	padding: 0.3rem 0.5rem;
	display: inline-block;
}
.buttons a:hover{
	color: #82745d;
	border: 1px solid #82745d;
}

.paging{
	margin:20px;
}

</style>

<script>
function orderInfoOpen(url, name, options) {
	  window.open(url, name, options);
}
</script>

<!-- jQuery와 Ajax를 사용한 탭메뉴 스크립트 -->
<script>
  $(document).ready(function(){
    $('.nav-link').click(function(e){
      e.preventDefault();
      $(this).tab('show');
      var tabTarget = $(this).attr("data-bs-target");
      $.ajax({
        url: '/tabContent.do',
        type: 'GET',
        data: {tabTarget:tabTarget},
        success: function(result){
          $(tabTarget).html(result);
        },
        error: function(){
          alert('탭메뉴를 불러오는 데 실패했습니다.');
        }
      });
    });
  });
</script>

</head>
<body>
<%@include file="/WEB-INF/views/header.jsp"%> 

<!-- 헤더 이미지 시작 -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">구독 중인 상품</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 헤더 이미지 끝 -->

<section class="shop spad">
<div class="container">
<div class="row"> 
	<%@include file="../myMenu.jsp"%> 
	<div class="col-xl-9 col-md-9">	
		<!-- ---------- 마이페이지 작업한 파일 페이지 여기에 넣어주세요!!(include) ---------- -->

		<div class="container-xl text-center">
		
		  <div class="users-table table-wrapper">
		  
		  <table class="posts-table" id="order-list">
				<thead>
					<tr class="users-table-info">
						<th style="width:24%;">주문번호</th>
						<th style="width:28%;">구독상품</th>
						<th style="width:12%;">구독시작일</th>
						<th style="width:12%;">구독종료일</th>
						<th style="width:12%;">자동납부일</th>
						<th style="width:12%;"></th>
					</tr>
				</thead>
				
				<tbody id="tableBody">
					<c:if test="${empty list}">
						<tr>
								<td class="text-center" colspan="6">구독 중인 상품이 없습니다.</td>
						</tr>
					</c:if>
					<c:forEach var="dto" items="${list}">
							<tr>
								<td>
									<c:url var="orderDetailUrl" value="orderInfoDetail.do">
										<c:param name="order_idx">${dto.order_idx}</c:param>
										<c:param name="pro_idx">${dto.pro_idx}</c:param>
									</c:url>
									<a href="#" class="orderNum" onclick="orderInfoOpen('${orderDetailUrl}', 'orderInfoDetail', 'width=540,height=600'); return false;">
									${dto.order_idx}
									</a>
									<script>
									function orderInfoOpen(url, name, options) {
										  window.open(url, name, options);
									</script>
								</td>
								<td>
									<c:url var="proContentUrl" value="proContent.do">
										<c:param name="pro_idx">${dto.pro_idx}</c:param>
									</c:url>
									<a href="${proContentUrl}" target="blank" class="subsPro d-flex jusify-content-center align-items-center">
					                	<div class="categories-table-img">
					                    	<img src="/meomum/images/items/${dto.pro_thumb}" alt="category">
					                	</div>
					                	<p class="text-truncate" style="max-width: 170px;">${dto.pro_name}</p>
				                	</a>
								</td>
			                    <td>${dto.sub_start}</td>
			                    <td>${dto.sub_end}</td>
			                    <td>
			                    ${dto.pay_date}
			                    
			                    </td>
			                    <td>
			                    	<div class="buttons">
				                    	<c:url var="returnFormUrl" value="returnForm.do">
											<c:param name="order_idx">${dto.order_idx}</c:param>
											<c:param name="pro_idx">${dto.pro_idx}</c:param>
										</c:url>
										<a href="#" class="orderNum" onclick="orderInfoOpen('${returnFormUrl}', 'orderInfoDetail', 'width=540,height=510'); return false;">
											<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
											  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
											  <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
											</svg>&nbsp;반납신청
										</a>
										<script>
										function returnFormOpen(url, name, options) {
											  window.open(url, name, options);
										}
										</script>
									</div>
			                    </td>
	                  		</tr>
						</c:forEach>
 
  
  </tbody>
</table>
		  
	
				<div class="container-xl paging">
					<nav aria-label="Page navigation example">
						<ul class="pagination pagination-sm justify-content-center">
						${pageStr}
						</ul>
					</nav>
				</div>
              
            </div>
		  
		  
		  
		  
		  
		  </div>
	

		<!-- ---------- 마이페이지 각 페이지 여기에 넣어주세요!! 끝 지점 ---------- -->
	</div>
		
</div>
</div>
</section>

<%@include file="../footer.jsp"%> 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>