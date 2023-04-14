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
.thumb-box{
	margin:0.2rem;
	width:50px;
	height:50px;
	background-color:#eeeeee;
	position:relative;
	overflow: hidden;
}
.thumb-box img{
    object-fit: cover;
    width:100%;
    position:absolute;
  	top: 50%; 
  	left: 50%;
  	transform: translate(-50%, -50%);
  	border-radius: 0.5rem;
}
.truncate{
	margin-left:0.6rem;
}
.pro_amount {
    border-radius: 0rem;
    border: 1px solid #bcc1cb;
    padding : 0.1rem 0.4rem;
    width:60px;
    height:24px;
    margin-right:0.2rem;
}
.state-box {
    border-radius: 0rem;
    border: 1px solid #bcc1cb;
    padding : 0.1rem 0.4rem;
    width:50px;
    height:24px;
    margin-right:0.2rem;
}
</style>

</head>
<body class="app"> 

<%@include file="../header_a.jsp"%>  

<div class="app-wrapper">
	    
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container pt-5">
			<h1 class="text-center mb-4">상품 재고 관리</h1>
			    <form name="proAmount" action="proAmount_a.do">
			<div class="row g-3 mb-4 align-items-center justify-content-center">
				    <div class="col-auto">
					     <div class="page-utilities">
						    <div class="row g-2 justify-content-end justify-content-md-end align-items-center">
							    <div class="col-auto">
								    <select class="form-select w-auto" name="cate" id="cate">
										  <option selected value="0" onclick="location.href='proAmount_a.do';">전체보기</option>
										  <option value="1" ${cate == '1' ? 'selected' : ''}>침대</option>
										  <option value="2" ${cate == '2' ? 'selected' : ''}>테이블</option>
										  <option value="3" ${cate == '3' ? 'selected' : ''}>의자</option>
										  <option value="4" ${cate == '4' ? 'selected' : ''}>소파</option>
										  <option value="5" ${cate == '5' ? 'selected' : ''}>조명</option>
									</select>
							    </div>
							    <div class="col-auto">
								    <div class="table-search-form row gx-1 align-items-center">
					                    <div class="col-auto">
					                        <input type="text" id="fvalue" name="fvalue" class="form-control search-orders" placeholder="검색어를 입력해주세요." value="${fvalue }">
					                    </div>
					                    <div class="col-auto">
					                        <button type="submit" class="btn app-btn-secondary btn-primary">검색</button>
					                    </div>
					                </div>
					                
							    </div><!--//col-->
						    </div><!--//row-->
					    </div><!--//table-utilities-->
				    </div><!--//col-auto-->
			    </div><!--//row-->
			  </form>
					    <div class="app-card app-card-orders-table shadow-sm mb-5">
						    <div class="app-card-body">
							    <div class="table-responsive">
							        <table class="table app-table-hover mb-0 text-center">
										<thead>
											<tr>
												<th class="cell">상품번호</th>
												<th class="cell">상품명</th>
												<th class="cell">카테고리</th>
												<th class="cell">기존수량</th>
												<th class="cell">재고수정</th>
												<th class="cell">판매상태</th>
											</tr>
										</thead>
										<tbody>
											<c:if test="${empty lists}">
												<tr>
													<td class="align-middle" colspan="6">등록된 상품이 없습니다.</td>
												</tr>
											</c:if>
											<c:forEach var="dto" items="${lists}">
												<tr>
													<td class="cell">${dto.pro_idx}</td>
													<td class="cell proname">
														<div class="d-flex justify-content-start align-items-center">
														<div class="thumb-box">
															<img src="/meomum/images/items/${dto.pro_thumb}" alt="IMG-PRODUCT">
														</div>
														<span class="truncate">${dto.pro_name}</span>
														</div>
													</td>
													<td class="cell">
														<span class="badge bg-success">
															<c:choose>
																<c:when test="${dto.pro_cate eq 1}">침대</c:when>
																<c:when test="${dto.pro_cate eq 2}">테이블</c:when>
																<c:when test="${dto.pro_cate eq 3}">의자</c:when>
																<c:when test="${dto.pro_cate eq 4}">소파</c:when>
																<c:when test="${dto.pro_cate eq 5}">조명</c:when>
															</c:choose>
														</span>
													</td>
													<td class="cell">${dto.pro_amount}</td>
													<td class="cell">
														<form action="proAmountUpdate.do?pro_idx=${dto.pro_idx}" name="proAmountUpdate" 
																method="post" onsubmit="return validate()" class="d-flex justify-content-center align-items-center">
															<input class="pro_amount" id="pro_amount" type="number" size="2" min="0" max="100" 
																	name="pro_amount" value="${dto.pro_amount}" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
															<input type="submit" class="btn-sm app-btn-secondary" value="수정">
														</form>
													</td>
													<td class="cell">
														<form action="proStateUpdate.do?pro_idx=${dto.pro_idx}" name="proStateUpdate" method="post"
																class="d-flex justify-content-center align-items-center">
															<select class="state-box w-auto" name="pro_state">
																<option ${dto.pro_state==0?"selected":""} value="0">판매중</option>
																<option ${dto.pro_state==1?"selected":""} value="1">품절</option>
															</select>
															<input type="submit" class="btn-sm app-btn-secondary" value="수정">
														</form>
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
			    
	</div>

<%@include file="../footer_a.jsp"%>    
</div><!--//app-wrapper-->    					

<!-- Javascript -->          
<!-- <script src="assets/plugins/popper.min.js"></script> -->

<!-- Page Specific JS -->
<!-- <script src="assets/js/app.js"></script> --> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>