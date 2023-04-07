<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 
<!-- App CSS -->  
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css"> <!-- 관리자헤더 css -->
<link href="assets/css/jquery.orderReport.min.css" rel="stylesheet"> <!-- 관리자주문배송내역 css -->
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">

<style>

/** 정렬 화살표 관련 */
table.dataTable thead .sorting {
    background-image: url(images/icon/sort_both.png);
}
table.dataTable thead .sorting_asc {
    background-image: url(images/icon/sort_asc.png);
}

table.dataTable thead .sorting_desc {
    background-image: url("images/icon/sort_desc.png")
}

table.dataTable thead .sorting_asc_disabled {
    background-image: url("images/icon/sort_asc_disabled.png")
}

table.dataTable thead .sorting_desc_disabled {
    background-image: url("images/icon/sort_desc_disabled.png")
}


/** 페이징 관련 */
.dataTables_wrapper .dataTables_paginate .paginate_button.current {
  border-radius: 50%;
  color: #593bdb !important;
  background: rgba(89, 59, 219, 0.1);
  border: 0 !important; }

.dataTables_wrapper .dataTables_paginate .paginate_button:hover {
  border-radius: 50%;
  color: #593bdb !important;
  background: rgba(89, 59, 219, 0.1);
  border: 0; }

.dataTables_wrapper .dataTables_paginate .paginate_button {
  border: 0; }

.dataTables_wrapper .dataTables_paginate .paginate_button.previous:hover {
  background: transparent; }

.dataTables_wrapper .dataTables_paginate .paginate_button.next:hover {
  background: transparent; }


/** 검색 관련 */
.dataTables_wrapper input[type="search"], .dataTables_wrapper input[type="text"], .dataTables_wrapper select {
  border: 1px solid #e2e2e2;
  padding: .3rem 0.5rem;
  color: #715d5d;
  border-radius: 5px; }
  [data-theme-version="dark"] .dataTables_wrapper input[type="search"], [data-theme-version="dark"] .dataTables_wrapper input[type="text"], [data-theme-version="dark"] .dataTables_wrapper select {
    background: #2A2C32;
    border-color: #424D63;
    color: #fff; }
    
</style>

</head>

<body class="app"> 

<%@include file="../header_a.jsp"%>  

<div class="app-wrapper">
	    
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl">
			<h2 class="title">주문/배송 내역</h2>
			<div class="card">
				<div class="card-body">
					<div class="table-responsive">
						<div id="example_wrapper" class="dataTables_wrapper">
						
						<table id="example" class="display dataTable" style="min-width: 845px" role="grid" aria-describedby="example_info">
							<thead>
								<tr role="row" class="text-center">
									<th class="sorting_desc" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-sort="descending" aria-label="Name: activate to sort column descending">주문번호</th>
									<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Position: activate to sort column ascending">구독상품</th>
									<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Office: activate to sort column ascending">주문자</th>
									<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Age: activate to sort column ascending">연락처</th>
									<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Start date: activate to sort column ascending">총주문액</th>
									<th class="sorting" tabindex="0" aria-controls="example" rowspan="1" colspan="1" aria-label="Salary: activate to sort column ascending">상태</th>
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
								<c:forEach var="dto" items="${lists}">
									<tr class="odd text-center" role="row">
										<td class="sorting_1">${dto.order_idx}</td>
										<td>상품이름 불러올 예정</td>
										<td>회원번호${dto.user_idx}로 불러올 예정</td>
										<td>회원번호${dto.user_idx}로 불러올 예정</td>
										<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.amount}" />원</td>
										<td>
											<c:choose>
												<c:when test="${dto.order_status eq 1}">
													<span>상품준비중</span>
													<button class="btn btn-sm btn-outline-success"><i class="bi bi-x-circle"></i>&nbsp;배송처리</button>
												</c:when>
												<c:when test="${dto.order_status eq 2}">
													<span>배송중</span>
													<button class="btn btn-sm btn-outline-success"><i class="bi bi-x-circle"></i>&nbsp;배송조회</button>
												</c:when>
												<c:when test="${dto.order_status eq 3}">
													<span>주문취소</span>
												</c:when>
												<c:when test="${dto.order_status eq 4}">
													<span>배송완료</span>
													<button class="btn btn-sm btn-outline-success"><i class="bi bi-x-circle"></i>&nbsp;배송조회</button>
												</c:when>
												<c:when test="${dto.order_status eq 5}">
													<span>반납신청</span>
													<button class="btn btn-sm btn-outline-success"><i class="bi bi-x-circle"></i>&nbsp;반납처리</button>
												</c:when>
												<c:when test="${dto.order_status eq 5}">반납진행</c:when>
												<c:when test="${dto.order_status eq 5}">반납완료</c:when>
											</c:choose>
										</td>
									</tr>
								</c:forEach>
							</tbody>
							
							<tfoot>
								<tr>
									<th colspan="6" class="text-center">
										<nav aria-label="Page navigation example">
											<ul class="pagination pagination-sm justify-content-center">
												${pageStr}
											</ul>
										</nav>
									</th>

								</tr>
							</tfoot>
                                    </table>
                                    <!--
                                    <div class="dataTables_info" id="example_info" role="status" aria-live="polite"></div>
                                    
                                    <div class="dataTables_paginate paging_simple_numbers" id="example_paginate">
                                    	<nav aria-label="Page navigation example">
											<ul class="pagination pagination-sm justify-content-center">
												${pageStr}
											</ul>
										</nav>
                                    </div>  -->
                                    
                                </div>
                            </div>
                        </div>


			</div>
		</div>
	</div>

<%@include file="../footer_a.jsp"%>    
</div><!--//app-wrapper-->    					

<!-- Javascript -->          
<script src="assets/js/orderReport-global.min.js"></script>  <!-- 정렬 관련 js -->
<script src="assets/js/jquery.orderReport.min.js"></script>
<script src="assets/js/orderReport.init.js"></script>

<!-- Page Specific JS -->
<!-- <script src="assets/js/app.js"></script> --> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>