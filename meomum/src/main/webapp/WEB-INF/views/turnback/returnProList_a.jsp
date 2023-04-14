<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">


<!-- App CSS -->  
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">

<style>
.proname div{
    display: inline-block;
}

.table td{
	padding:16px 0 !important;
}

.truncate{
	margin-left:0.6rem;
}

.button .btn-sm{
	padding: 0.3rem 0.6rem !important;
	margin-left: 0.6rem;
}
</style>

<script>
function orderInfoOpen(url, name, options) {
	  window.open(url, name, options);
	}
function returnSubmitForm(url, name, options) {
  window.open(url, name, options);
}
</script>  

</head>
<body class="app"> 

<%@include file="../header_a.jsp"%>  

<div class="app-wrapper">
	    
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container pt-5">
			<h1 class="text-center mb-4">구독 반납 내역</h1>
			    
			<div class="row g-3 mb-4 align-items-center justify-content-center">
				    <div class="col-auto">
					     <div class="page-utilities">
						    <div class="row g-2 justify-content-end justify-content-md-end align-items-center">
							    <div class="col-auto">
								    <select class="form-select w-auto" >
										  <option selected value="option-1">전체보기</option>
										  <option value="option-2">반납신청</option>
										  <option value="option-3">반납진행</option>
										  <option value="option-4">반납완료</option>
										  <option value="option-5">반납보류</option>
									</select>
							    </div>
							    <div class="col-auto">
								    <form class="table-search-form row gx-1 align-items-center">
					                    <div class="col-auto">
					                        <input type="text" id="search-orders" name="searchorders" class="form-control search-orders" placeholder="검색어를 입력해주세요.">
					                    </div>
					                    <div class="col-auto">
					                        <button type="submit" class="btn app-btn-secondary">검색</button>
					                    </div>
					                </form>
					                
							    </div><!--//col-->
						    </div><!--//row-->
					    </div><!--//table-utilities-->
				    </div><!--//col-auto-->
			    </div><!--//row-->
			   
				<div class="app-card app-card-orders-table shadow-sm mb-5">
					<div class="app-card-body">
						<div class="table-responsive">
							<table class="table app-table-hover mb-0 text-center">
								<thead>
									<tr>
										<th class="cell" style="width:10%">반품번호</th>
										<th class="cell" style="width:16%">주문번호</th>
										<th class="cell" style="width:8%">주문자</th>
										<th class="cell" style="width:22%">반납상품</th>
										<th class="cell" style="width:10%">반납신청일자</th>
										<th class="cell" style="width:10%">회수날짜</th>
										<th class="cell" style="width:10%">반납완료날짜</th>
										<th class="cell" style="width:14%">상태</th>
									</tr>
								</thead>
								
								<tbody>
									<c:if test="${empty lists}">
										<tr>
											<td class="align-middle" colspan="6">구독 반납 내역이 없습니다.</td>
										</tr>
									</c:if>
									<c:forEach var="dto" items="${lists}">
										<tr>
											<td class="cell">${dto.return_idx}</td>
											<td class="cell">
											<c:url var="orderDetailUrl" value="orderInfoDetail.do">
												<c:param name="order_idx">${dto.order_idx}</c:param>
												<c:param name="pro_idx">${dto.pro_idx}</c:param>
											</c:url>
											<a href="#" onclick="orderInfoOpen('${orderDetailUrl}', 'orderInfoDetail', 'width=540,height=600'); return false;">
											${dto.order_idx}
											</a>
											</td>
											<td class="cell">
											${dto.order_name}
											</td>
											<td class="cell proname">
												<div class="d-flex justify-content-start align-items-center">
													<span class="truncate">${dto.pro_name}</span>
												</div>
											</td>
											<td class="cell">${dto.return_date}</td>
											<td class="cell">${dto.return_start_date}</td>
											<td class="cell">${dto.return_end_date}</td>
											<td class="cell button">
												<c:choose>
													<c:when test="${dto.order_status eq 5}">						
															<span class="text-danger">반납신청</span>
															<c:url var="returnSubmitUrl" value="returnSubmitForm.do">
																<c:param name="order_idx">${dto.order_idx}</c:param>
															</c:url>
															<a href="#" class="btn-sm app-btn-secondary" 
																		onclick="returnSubmitForm('${returnSubmitUrl}', 'returnSubmitForm', 'width=540,height=600'); return false;">
																		반납처리
															</a>
													</c:when>
													<c:when test="${dto.order_status eq 6}">반납진행</c:when>
													<c:when test="${dto.order_status eq 7}">반납완료</c:when>
													<c:when test="${dto.return_ok eq 'N'}">반납보류</c:when>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div><!--//table-responsive-->
						       
					</div><!--//app-card-body-->		
				</div><!--//app-card-->
						
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm justify-content-center">
						${pageStr}
					</ul>
				</nav>

		</div>        
	</div><!--//tab-content-->


<%@include file="../footer_a.jsp"%>    
</div><!--//app-wrapper-->    					

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" ></script>

</body>
</html>