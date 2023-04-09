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


</style>

<script>
function shipFormOpen(url, name, options) {
  window.open(url, name, options);
}

//function trackingOpen(){
//	window.open('http://info.sweettracker.co.kr/tracking/4','tracking','width=400px,height=600px');
//}

//        $(document).ready(function() {
//            $("#btnSubmit").click(function(event) {
//                event.preventDefault(); // 페이지 새로고침 방지
//
//               var trackingNumber = $("#trackingNumber").val(); // 입력값 가져오기
//                var apiUrl = "/deliveryTracker/" + trackingNumber; // API URL 생성

//                $.ajax({
//                    url: apiUrl,
//                    type: "GET",
//                    success: function(response) {
//                        // API 호출 성공 시 처리
//                        console.log(response);
//                        $("#result").text(response); // 결과 출력
//                    },
//                    error: function(xhr) {
//                        // API 호출 실패 시 처리
//                        console.log(xhr);
//                        alert("API 호출에 실패했습니다.");
//                    }
//               });
//           });
//       });

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
										<a href="#" onclick="shipFormOpen('shipForm.do?order_idx=${dto.order_idx}', 'shipForm', 'width=540,height=600'); return false;">배송처리</a>
										<!-- <button type="button" class="btn-sm app-btn-secondary" onclick="shipFormOpen()">배송처리</button>-->
									</c:when>
									<c:when test="${dto.order_status eq 2}">
										<div class="text-success">배송중</div>
										<form action="http://info.sweettracker.co.kr/tracking/4" method="post">
											<input type="hidden" id="t_key" name="t_key" value="sjLmbhJEhPXnO5neAx7FNg">
											<input type="hidden" id="t_code" name="t_code" value="04">
											<input type="hidden" id="t_invoice" name="t_invoice" value="566250609912">
											<button type="submit" class="btn-sm app-btn-secondary">배송조회</button>
										</form>
									</c:when>
									<c:when test="${dto.order_status eq 3}">
										<div class="text-danger">주문취소</div>
									</c:when>
									<c:when test="${dto.order_status eq 4}">
										<div>배송완료</div>
										<form action="http://info.sweettracker.co.kr/tracking/4" method="post">
											<input type="hidden" id="t_key" name="t_key" value="sjLmbhJEhPXnO5neAx7FNg">
											<input type="hidden" id="t_code" name="t_code" value="04">
											<input type="hidden" id="t_invoice" name="t_invoice" value="566250609912">
											<button type="submit" id="btnSubmit" class="btn-sm app-btn-secondary">배송조회</button>
										</form>
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