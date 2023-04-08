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
<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet">
 
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
	    	responsive: true
	    	searching: false;
	    });
	  }
});
</script>

<style>

.state div{
	width:40%;
	text-align: center;
}
.datatable-table td{
	cursor: pointer;
}
thead th a{
	text-align: center;
}
.order-num{
	color: #0055FF;
}
.state div{
	padding: 0.2rem 0;
}
.btn-sm{
	padding: 0.2rem 0.8rem;
}
.button{
	border-radius:2px;
}
</style>

<script>
function trackingOpen(){
	window.open('http://info.sweettracker.co.kr/tracking/4');
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
				<div class="datatable-top d-flex justify-content-end align-middle">
					<div class="datatable-dropdown">
			        	<select class="datatable-selector">
				        	<option value="a" selected="">전체</option>
				        	<option value="b">주문번호</option>
				        	<option value="c">구독상품</option>
				        	<option value="d">주문자</option>
			      		</select>
			        </div>
					<div class="datatable-search">
			            <input class="datatable-input" placeholder="검색어를 입력해주세요" type="search">
			            <button type="submit" class="btn app-btn-secondary button">검색</button>
			        </div>
			    </div>  
				<table class="datatable-table" id="order-table">
				<thead>
					<tr>
						<th data-sortable="true"style="width:12%;" aria-sort="descending" class="datatable-descending" >
							<a href="#" class="datatable-sorter">주문번호</a>
						</th>
						<th data-sortable="true" style="width:26%;">
							<a href="#" class="datatable-sorter">구독상품</a>
						</th>
						<th data-sortable="true" style="width:10%">
							<a href="#" class="datatable-sorter">주문자</a></th>
						<th data-sortable="true" style="width:14%">
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
													<a class="btn-sm app-btn-secondary" href="#">배송처리</a>
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
													<button class="btn-sm app-btn-secondary" onclick="trackingOpen()">배송조회</button>
												</c:when>
												<c:when test="${dto.order_status eq 5}">
													<div class="text-danger">반납신청</div>
													<a class="btn-sm app-btn-danger" href="#">반납처리</a>
												</c:when>
												<c:when test="${dto.order_status eq 6}">반납진행</c:when>
												<c:when test="${dto.order_status eq 7}">반납완료</c:when>
											</c:choose>
										</td>
									</tr>
					</c:forEach>
						
				</tbody>
						
			</table>
			</div>
				
				</div>
				</div>
				
				
							
			</div>
			
			
			<div class="container-xl">
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