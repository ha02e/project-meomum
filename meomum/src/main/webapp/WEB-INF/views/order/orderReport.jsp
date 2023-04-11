<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
.title{
	text-align: center;
	font-weight: bold;
	margin-bottom: 30px;
}
</style>

</head>
<body>
<%@include file="../header.jsp"%> 
<section class="shop spad">
<div class="container">
<div class="row"> 
	<%@include file="../myMenu.jsp"%> 
	<div class="col-xl-9 col-md-9">	
		<!-- ---------- 마이페이지 작업한 파일 페이지 여기에 넣어주세요!!(include) ---------- -->
		
	<div class="row g-3 mb-4 align-items-center justify-content-between">
				    <div class="col-auto">
			            <h2 class="title">주문/배송내역</h2>
				    </div>
				    <div class="col-auto">
					     <div class="page-utilities">
						    <div class="row g-2 justify-content-start justify-content-md-end align-items-center">
							    <div class="col-auto">
								    <form class="table-search-form row gx-1 align-items-center">
					                    <div class="col-auto">
					                        <input type="text" id="search-orders" name="searchorders" class="form-control search-orders" placeholder="Search">
					                    </div>
					                    <div class="col-auto">
					                        <button type="submit" class="btn app-btn-secondary">Search</button>
					                    </div>
					                </form>
							    </div><!--//col-->
						    </div><!--//row-->
					    </div><!--//table-utilities-->
				    </div><!--//col-auto-->
			    </div><!--//row-->
			   
				
				<div class="tab-content" id="orders-table-tab-content">
			        <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
					    <div class="app-card app-card-orders-table shadow-sm mb-5">
						    <div class="app-card-body">
							    <div class="table-responsive">
							        <table class="table app-table-hover mb-0 text-left">
										<thead>
											<tr>
												<th class="cell">주문번호</th>
												<th class="cell">구독상품</th>
												<th class="cell">총주문액</th>
												<th class="cell">주문날짜</th>
												<th class="cell">상태</th>
											</tr>
										</thead>
										<tbody>
										<c:if test="${empty lists}">
											<tr>
												<td class="cell text-center" colspan="5">주문하신 상품이 없습니다.</td>
											</tr>
										</c:if>
										<c:forEach var="dto" items="${lists}">
											<tr>
												<td class="cell">${dto.order_idx}</td>
												<td class="cell">${dto.pro_name}</td>
												<td class="cell"><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.amount}" />원</td>
												<td class="cell">${dto.order_date}</td>
												<td class="cell">
													<c:choose>
														<c:when test="${dto.order_status eq 1}">
															<div class="text-warning">상품준비중</div>
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
															<button type="button" id="btnSubmit" class="btn-sm app-btn-secondary">후기 작성하기</button>
														</c:when>
														<c:when test="${dto.order_status eq 5}">										
															<div class="text-danger">반납신청</div>
														</c:when>
														<c:when test="${dto.order_status eq 6}">반납진행</c:when>
														<c:when test="${dto.order_status eq 7}">반납완료</c:when>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
										
										</tbody>
									</table>
						        </div><!--//table-responsive-->
						       
						    </div><!--//app-card-body-->		
						</div><!--//app-card-->
						<nav class="app-pagination">
							<ul class="pagination justify-content-center">
								
							</ul>
						</nav><!--//app-pagination-->
						
			        </div><!--//tab-pane-->
			        
			        
				</div><!--//tab-content-->	
	

		<!-- ---------- 마이페이지 각 페이지 여기에 넣어주세요!! 끝 지점 ---------- -->
	</div>
		
</div>
</div>
</section>

<%@include file="../footer.jsp"%> 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>