<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
 
<!-- 관리자 헤더 CSS -->  
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">

<!-- 데이터테이블 css&js -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
	  var table = document.getElementById("order-table");
	  if (table) {
	    $(table).DataTable({
	    	lengthChange: false,
	    	info: false,
	    	paging: false,
	    	order: [ [ 0, "desc" ] ],
	    	responsive: true,
	    	searching: false
	    });
	  }
});
</script>

<style>
.datatable-input{
	margin:0 4px 0 10px;
	width:250px;
	height:40px;
}
.datatable-selector{
	height:40px;
}
.button{
	border-radius:2px;
	height:40px;
}


.datatable-table{
	margin:20px 0 10px 0;
}
.datatable-table > tbody > tr > th{
	padding:1rem 0;
}
.datatable-table > tbody > tr > td{
	font-size: .875rem;
	padding:1rem 0;
}
thead th a{
	text-align: center;
	cursor: pointer;
}
.order-num{
	color: #0055FF;
}
.state div{
	padding: 0.2rem 0;
	width:40%;
	text-align: center;
}
.btn-sm{
	padding: 0.2rem 0.8rem;
}

.paging{
	margin:20px;
}


.modal{
	width:100%;
}
.modal-body hr{
	margin:30px 0 20px 0;
	color:#000000;
}
.modal-body label{
	color: #333333;
}
#orderMsg{
	resize:none;
}
</style>

<script>
function trackingOpen(){
	window.open('http://info.sweettracker.co.kr/tracking/4','tracking','width=400px,height=600px');
}
</script>
</head>

<body class="app"> 

<%@include file="../header_a.jsp"%>  

<div class="app-wrapper">
	    
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl">
			<h2 class="title">주문/배송 내역</h2>
			<div class="card">
			<div class="card-body">
			
				<div class="datatable-container">
				<div class="datatable-top d-flex justify-content-center align-items-center">
					<div class="datatable-dropdown">
			        	<select class="datatable-selector">
				        	<option value="a" selected>전체</option>
				        	<option value="b">주문번호</option>
				        	<option value="c">구독상품</option>
				        	<option value="d">주문자</option>
			      		</select>
			        </div>
					<div class="datatable-search">
			            <input class="datatable-input" placeholder="검색어를 입력해주세요..." type="search">
			            <button type="submit" class="btn app-btn-secondary button">검색</button>
			        </div>
			    </div>  
			    
				<table class="datatable-table" id="order-table">
				<thead>
					<tr>
						<th data-sortable="true"style="width:14%;" aria-sort="descending" class="datatable-descending" >
							<a href="#" class="datatable-sorter">주문번호</a>
						</th>
						<th data-sortable="true" style="width:22%;">
							<a href="#" class="datatable-sorter">구독상품</a>
						</th>
						<th data-sortable="true" style="width:10%">
							<a href="#" class="datatable-sorter">주문자</a></th>
						<th data-sortable="true" style="width:16%">
							<a href="#" class="datatable-sorter">주문자 연락처</a>
						</th>
						<th data-sortable="true" style="width:10%">
							<a href="#" class="datatable-sorter">주문날짜</a>
						</th>
						<th data-sortable="true" style="width:12%">
							<a href="#" class="datatable-sorter">총주문액</a>
						</th>
						<th data-filterable="true" style="width: 16%;">
							<a href="#" class="datatable-filter">상태</a>
						</th>
					</tr>
				</thead>
				
				<tbody>
					<c:if test="${empty lists}">
						<tr>
							<td colspan="6" class="text-center">
								주문/배송 내역이 없습니다.
							</td>
						</tr>
					</c:if>
					
					<c:forEach var="dto" items="${lists}" varStatus="status">
						<tr data-index="${status.count}">
							<td class="sorting_${status.count} order-num text-center">${dto.order_idx}</td>
							<td>${dto.pro_name}</td>
							<td class="text-center">${dto.user_name}</td>
							<td class="text-center">${dto.user_tel}</td>
							<td class="text-center">${dto.order_date}</td>
							<td class="text-center"><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.amount}" />원</td>
							<td class="state d-flex justify-content-around">
								<c:choose>
									<c:when test="${dto.order_status eq 1}">
										<div class="text-warning">상품준비중</div>
										<button type="button" class="btn-sm app-btn-secondary" data-bs-toggle="modal" data-bs-target="#shippingModal" data-bs-whatever="@mdo">배송처리</button>
									</c:when>
									<c:when test="${dto.order_status eq 2}">
										<div class="text-success">배송중</div>
										<a class="btn-sm app-btn-secondary" href="#">배송조회</a>
									</c:when>
									<c:when test="${dto.order_status eq 3}">
										<div class="text-danger">주문취소</div>
									</c:when>
									<c:when test="${dto.order_status eq 4}">
										<div>배송완료</div>
										<button class="btn-sm app-btn-secondary" onclick="trackingOpen()">배송조회</button>										</c:when>
												<c:when test="${dto.order_status eq 5}">
													<div class="text-danger">반납신청</div>
													<a class="btn-sm app-btn-danger" href="#">반납처리</a>
												</c:when>
												<c:when test="${dto.order_status eq 6}">반납진행</c:when>
												<c:when test="${dto.order_status eq 7}">반납완료</c:when>
											</c:choose>
							</td>
						</tr>
									
						<!-- 배송처리 모달 콘텐츠 -->
						<div class="modal fade" id="shippingModal" tabindex="-1" aria-labelledby="shippingModalLabel" aria-hidden="true">
							<div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
								<div class="modal-content">
									<div class="modal-header">
										<h1 class="modal-title fs-5" id="shippingModalLabel">배송처리</h1>
										<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
									</div>
									
									<form action="shipping.do" name="shipping" method="post">
									<div class="modal-body">
										<div class="mb-3">
											<label for="recipient-name" class="col-form-label">택배사</label>
												<select class="custom-select form-control" id="shipInfo" disabled>
													<option selected="">CJ대한통운</option>
												</select>
										</div>
										<div class="mb-3">
											<label for="message-text" class="col-form-label">운송장번호</label>
											<input type="text" class="form-control" id="shipNum">
										</div>
													          
										<hr>
											          
										<div class="mb-3">
											<label for="message-text" class="col-form-label">수취인</label>
											<input type="text" class="form-control" id="receiver">
										</div>
										<div class="mb-3">
											<label for="message-text" class="col-form-label">수취인 연락처</label>
											<input type="text" class="form-control" id="receiverTel">
										</div>
										<div class="mb-3">
											<label for="message-text" class="col-form-label">배송지</label>
											<input type="text" class="form-control" id="receiver">
										</div>
										<div class="mb-3">
								        	<label for="message-text" class="col-form-label">배송 메시지</label>
								        	<textarea class="form-control h-25" id="orderMsg" rows="4" readonly></textarea>
								        </div>
								        
										<hr>
													          
										<div class="mb-3">
											<label for="message-text" class="col-form-label">배송기사</label>
											<input type="text" class="form-control" id="receiver">
										</div>
										<div class="mb-3">
											<label for="message-text" class="col-form-label">배송기사 연락처</label>
											<input type="text" class="form-control" id="receiverTel">
										</div>
									</div>
									
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
										<button type="submit" class="btn btn-primary">배송처리</button>
									</div>
									</form>
												
								</div>
							</div>
						</div><!-- 배송처리 모달 콘텐츠 부분 -->											
							
						</c:forEach>
						
					</tbody>
				</table>
			
				</div>
			
			</div>
			</div>
				
				
							
		</div>
			
			
		<div class="container-xl paging">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm justify-content-center">
					${pageStr}
					</ul>
				</nav>

		</div>
		
	</div>

<%@include file="../footer_a.jsp"%>    
</div><!--//app-wrapper-->    					

<!-- Javascript -->          
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>