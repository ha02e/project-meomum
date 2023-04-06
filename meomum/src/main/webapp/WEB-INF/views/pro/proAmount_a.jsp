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
}
.thumb-box img{
    object-fit: cover;
}
.truncate{
	margin-left:0.6rem;
}
.pro_amount {
    border-radius: 0rem;
    border: 1px solid #bcc1cb;
    padding : 0.1rem 0.4rem;
}
.state-box {
    border-radius: 0rem;
    border: 1px solid #bcc1cb;
    padding : 0.1rem 0.4rem;
}
</style>

<script>
function validate() {
	var pro_amount = document.getElementById("pro_amount").value;
	
		/*수량을 입력하지 않았을 경우*/
		if (pro_amount == null || pro_amount.trim() == "") {
			alert("수량을 입력해주세요.");
		    return false;
		}
		
		/*숫자로 입력하지 않았을 경우*/
		 if (isNaN(pro_amount)) {
			alert("수량은 숫자로만 입력 가능합니다.");
			return false;
		}
		
		/*문자열이 섞여있는 경우*/
		if (pro_amount.match(/[^0-9]/)) {
			alert("수량은 숫자로만 입력 가능합니다.");
			return false;
		}
		 
		return true;
}
</script>  

</head>
<body class="app"> 

<%@include file="../header_a.jsp"%>  

<div class="app-wrapper">
	    
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container-xl">
			    
			<div class="row g-3 mb-4 align-items-center justify-content-between">
				<div class="col-auto">
					<h1 class="app-page-title mb-0">상품 재고 관리</h1>
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
							    <div class="col-auto">
								    <select class="form-select w-auto" >
										  <option selected value="option-1">All</option>
										  <option value="option-2">This week</option>
										  <option value="option-3">This month</option>
										  <option value="option-4">Last 3 months</option>
									</select>
							    </div>
						    </div><!--//row-->
					    </div><!--//table-utilities-->
				    </div><!--//col-auto-->
			    </div><!--//row-->
			   
			    
			    <nav id="orders-table-tab" class="orders-table-tab app-nav-tabs nav shadow-sm flex-column flex-sm-row mb-4">
				    <a class="flex-sm-fill text-sm-center nav-link active" id="orders-all-tab" data-bs-toggle="tab" href="#orders-all" role="tab" aria-controls="orders-all" aria-selected="true">모두보기</a>
				    <a class="flex-sm-fill text-sm-center nav-link"  id="orders-paid-tab" data-bs-toggle="tab" href="#orders-paid" role="tab" aria-controls="orders-paid" aria-selected="false">판매중</a>
				    <a class="flex-sm-fill text-sm-center nav-link" id="orders-pending-tab" data-bs-toggle="tab" href="#orders-pending" role="tab" aria-controls="orders-pending" aria-selected="false">품절</a>
				</nav>
				
				
				<div class="tab-content" id="orders-table-tab-content">
			        <div class="tab-pane fade show active" id="orders-all" role="tabpanel" aria-labelledby="orders-all-tab">
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
															<img src="/meomum/items/${dto.pro_thumb}" alt="IMG-PRODUCT">
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
																method="post" onsubmit="return validate()">
															<input class="pro_amount" id="pro_amount" type="text" name="pro_amount" size="4">
															<input type="submit" class="btn-sm app-btn-secondary" value="수정">
														</form>
													</td>
													<td class="cell">
														<form action="proStateUpdate.do?pro_idx=${dto.pro_idx}" name="proStateUpdate" method="post">
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

			        </div><!--//tab-pane-->
			        
			        <div class="tab-pane fade" id="orders-paid" role="tabpanel" aria-labelledby="orders-paid-tab">
					    <div class="app-card app-card-orders-table mb-5">
						    <div class="app-card-body">
							    <div class="table-responsive">
								    
							        <div class="card mb-4">
                            <div class="card-header  ">
                                <div class="row">
                                    <div class=" col-lg-3 col-md-6">
                                        <input type="search" class="form-control " placeholder="Search Files...">

                                    </div>
                                    <div class="col-lg-4 col-md-6 d-flex align-items-center mt-3 mt-md-0">
                                        <label class="form-label me-2 mb-0">Status</label>
                                    <select class="form-select" aria-label="Default select example">
                                        <option selected="">Shipped</option>
                                        <option value="1">In Progress</option>
                                        <option value="2">Delivered</option>
                                      </select>
                                    </div>




                                <div class="col-lg-5 text-lg-end mt-3 mt-lg-0">

                                    <a href="#!" class="btn btn-primary me-2">+ Add New Order</a>
                                    <a href="#!" class="btn btn-light ">Export</a>
                                </div>
                            </div>
                            </div>
                  <div class="card-body">
                    <div class="table-responsive table-card">
                        <table class="table text-nowrap mb-0 table-centered table-hover">
                            <thead class="table-light">
                                <tr>
                                    <th class=" pe-0  ">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="checkAll">
                                            <label class="form-check-label" for="checkAll">

                                            </label>
                                        </div>
                                    </th>
                                    <th class="ps-1">Order ID</th>
                                    <th>Name</th>
                                    <th>Date</th>
                                    <th>Payment Status</th>
                                    <th>Total</th>
                                    <th>Order Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class=" pe-0">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="contactCheckbox2">
                                            <label class="form-check-label" for="contactCheckbox2">

                                            </label>
                                        </div>
                                    </td>
                                    <td class="ps-1">
                                        <a href="#!">#DU00017</a>
                                    </td>
                                    <td>Harold Gonzalez </td>
                                    <td>3 Oct, 2023 10:02 PM</td>
                                    <td><span class="badge bg-success">Paid</span></td>
                                    <td>$120.00</td>
                                    <td><span class="badge badge-info-soft">Shipped</span></td>
                                    <td>


                                            <div class="dropdown">
                                                <a class="btn btn-icon btn-sm btn-ghost rounded-circle" href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical icon-xs"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                                                </a>

                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Action</a></li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Another action</a>
                                                    </li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Something else
                                                            here</a></li>
                                                </ul>
                                            </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td class=" pe-0">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="contactCheckbox3">
                                            <label class="form-check-label" for="contactCheckbox3">

                                            </label>
                                        </div>
                                    </td>
                                    <td class="ps-1">
                                        <a href="#!">#DU00016</a>
                                    </td>
                                    <td>Anthony Anderson </td>
                                    <td>19 August, 2023 6:22 PM</td>
                                    <td><span class="badge bg-success">Paid</span></td>
                                    <td>$220.00</td>
                                    <td><span class="badge badge-warning-soft text-warning">In Progress</span></td>
                                    <td>


                                            <div class="dropdown">
                                                <a class="btn btn-icon btn-sm btn-ghost rounded-circle" href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical icon-xs"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                                                </a>

                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Action</a></li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Another action</a>
                                                    </li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Something else
                                                            here</a></li>
                                                </ul>
                                            </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td class=" pe-0">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="contactCheckbox4">
                                            <label class="form-check-label" for="contactCheckbox4">

                                            </label>
                                        </div>
                                    </td>
                                    <td class="ps-1">
                                        <a href="#!">#DU00015</a>
                                    </td>
                                    <td>Gary Faulkner</td>
                                    <td>8 August, 2023 8:13 AM</td>
                                    <td><span class="badge bg-success">Paid</span></td>
                                    <td>$113.42</td>
                                    <td><span class="badge badge-info-soft">In Shipped</span></td>
                                    <td>


                                            <div class="dropdown">
                                                <a class="btn btn-icon btn-sm btn-ghost rounded-circle" href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical icon-xs"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                                                </a>

                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Action</a></li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Another action</a>
                                                    </li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Something else
                                                            here</a></li>
                                                </ul>
                                            </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td class=" pe-0">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="contactCheckbox5">
                                            <label class="form-check-label" for="contactCheckbox5">

                                            </label>
                                        </div>
                                    </td>
                                    <td class="ps-1">
                                        <a href="#!">#DU00014</a>
                                    </td>
                                    <td>Steve Nelson</td>
                                    <td>26 July, 2023 10:19 AM</td>
                                    <td><span class="badge bg-success">Paid</span></td>
                                    <td>$425.31</td>
                                    <td><span class="badge badge-success-soft text-success">Delivered</span></td>
                                    <td>


                                            <div class="dropdown">
                                                <a class="btn btn-icon btn-sm btn-ghost rounded-circle" href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical icon-xs"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                                                </a>

                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Action</a></li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Another action</a>
                                                    </li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Something else
                                                            here</a></li>
                                                </ul>
                                            </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td class=" pe-0">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="contactCheckbox6">
                                            <label class="form-check-label" for="contactCheckbox6">

                                            </label>
                                        </div>
                                    </td>
                                    <td class="ps-1">
                                        <a href="#!">#DU00013</a>
                                    </td>
                                    <td>Kimberly Sullivan</td>
                                    <td>18 July, 2023 9:52 PM</td>
                                    <td><span class="badge bg-secondary">Refunded</span></td>
                                    <td>$113.00</td>
                                    <td><span class="badge badge-success-soft text-success">Delivered</span></td>
                                    <td>


                                            <div class="dropdown">
                                                <a class="btn btn-icon btn-sm btn-ghost rounded-circle" href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical icon-xs"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                                                </a>

                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Action</a></li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Another action</a>
                                                    </li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Something else
                                                            here</a></li>
                                                </ul>
                                            </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td class=" pe-0">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="contactCheckbox7">
                                            <label class="form-check-label" for="contactCheckbox7">

                                            </label>
                                        </div>
                                    </td>
                                    <td class="ps-1">
                                        <a href="#!">#DU00012</a>
                                    </td>
                                    <td>Susan Pugh</td>
                                    <td>2 July, 2023 8:00 AM</td>
                                    <td><span class="badge bg-success">Paid</span></td>
                                    <td>$831.99</td>
                                    <td><span class="badge badge-success-soft text-success">Delivered</span></td>
                                    <td>


                                            <div class="dropdown">
                                                <a class="btn btn-icon btn-sm btn-ghost rounded-circle" href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical icon-xs"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                                                </a>

                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Action</a></li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Another action</a>
                                                    </li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Something else
                                                            here</a></li>
                                                </ul>
                                            </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td class=" pe-0">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="contactCheckbox8">
                                            <label class="form-check-label" for="contactCheckbox8">

                                            </label>
                                        </div>
                                    </td>
                                    <td class="ps-1">
                                        <a href="#!">#DU00011</a>
                                    </td>
                                    <td>Elliott Potts</td>
                                    <td>23 June, 2023 8:14 PM</td>
                                    <td><span class="badge bg-danger">Cancel</span></td>
                                    <td>$113.00</td>
                                    <td><span class="badge badge-success-soft text-success">Delivered</span></td>
                                    <td>


                                            <div class="dropdown">
                                                <a class="btn btn-icon btn-sm btn-ghost rounded-circle" href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical icon-xs"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                                                </a>

                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Action</a></li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Another action</a>
                                                    </li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Something else
                                                            here</a></li>
                                                </ul>
                                            </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td class=" pe-0">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="contactCheckbox9">
                                            <label class="form-check-label" for="contactCheckbox9">

                                            </label>
                                        </div>
                                    </td>
                                    <td class="ps-1">
                                        <a href="#!">#DU00010</a>
                                    </td>
                                    <td>Richard Beaudry</td>
                                    <td>13 June, 2023 4:12 PM</td>
                                      <td><span class="badge bg-success">Paid</span></td>
                                    <td>$582.99</td>
                                    <td><span class="badge badge-success-soft text-success">Delivered</span></td>
                                    <td>


                                            <div class="dropdown">
                                                <a class="btn btn-icon btn-sm btn-ghost rounded-circle" href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical icon-xs"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                                                </a>

                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Action</a></li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Another action</a>
                                                    </li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Something else
                                                            here</a></li>
                                                </ul>
                                            </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td class=" pe-0">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="contactCheckbox10">
                                            <label class="form-check-label" for="contactCheckbox10">

                                            </label>
                                        </div>
                                    </td>
                                    <td class="ps-1">
                                        <a href="#!">#DU00009</a>
                                    </td>
                                    <td>Henry Saxton</td>
                                    <td>5 May, 2023 12:02 PM</td>
                                      <td><span class="badge bg-success">Paid</span></td>
                                    <td>$00.00</td>
                                    <td><span class="badge badge-success-soft text-success">Delivered</span></td>
                                    <td>


                                            <div class="dropdown">
                                                <a class="btn btn-icon btn-sm btn-ghost rounded-circle" href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical icon-xs"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                                                </a>

                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Action</a></li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Another action</a>
                                                    </li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Something else
                                                            here</a></li>
                                                </ul>
                                            </div>

                                    </td>
                                </tr>
                                <tr>
                                    <td class=" pe-0">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="contactCheckbox11">
                                            <label class="form-check-label" for="contactCheckbox11">

                                            </label>
                                        </div>
                                    </td>
                                    <td class="ps-1">
                                        <a href="#!">#DU00008</a>
                                    </td>
                                    <td>Juanita Diener</td>
                                    <td>4 April, 2023 5:02 PM</td>
                                      <td><span class="badge bg-success">Paid</span></td>
                                    <td>$25.23</td>
                                    <td><span class="badge badge-success-soft text-success">Delivered</span></td>
                                    <td>


                                            <div class="dropdown">
                                                <a class="btn btn-icon btn-sm btn-ghost rounded-circle" href="#!" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-more-vertical icon-xs"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
                                                </a>

                                                <ul class="dropdown-menu">
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Action</a></li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Another action</a>
                                                    </li>
                                                    <li><a class="dropdown-item d-flex align-items-center" href="#!">Something else
                                                            here</a></li>
                                                </ul>
                                            </div>

                                    </td>
                                </tr>





                            </tbody>
                        </table>
                    </div>
                  </div>
                            <div class="card-footer d-md-flex justify-content-between align-items-center">
                                <span>Showing 1 to 8 of 12 entries</span>
                                <nav class="mt-2 mt-md-0">
                                    <ul class="pagination mb-0">
                                        <li class="page-item"><a class="page-link" href="#!">Previous</a></li>
                                        <li class="page-item"><a class="page-link active" href="#!">1</a></li>
                                        <li class="page-item"><a class="page-link" href="#!">2</a></li>
                                        <li class="page-item"><a class="page-link" href="#!">3</a></li>
                                        <li class="page-item"><a class="page-link" href="#!">Next</a></li>
                                    </ul>
                                </nav>
                            </div>

                        </div>
						    </div><!--//app-card-body-->		
						</div><!--//app-card-->
			        </div><!--//tab-pane-->
			        
			        <div class="tab-pane fade" id="orders-pending" role="tabpanel" aria-labelledby="orders-pending-tab">
					    <div class="app-card app-card-orders-table mb-5">
						    <div class="app-card-body">
							    <div class="table-responsive">
							  
						        </div><!--//table-responsive-->
						    </div><!--//app-card-body-->		
						</div><!--//app-card-->
			        </div><!--//tab-pane-->
			        <div class="tab-pane fade" id="orders-cancelled" role="tabpanel" aria-labelledby="orders-cancelled-tab">
					    <div class="app-card app-card-orders-table mb-5">
						    <div class="app-card-body">
							    <div class="table-responsive">
							        
						        </div><!--//table-responsive-->
						    </div><!--//app-card-body-->		
						</div><!--//app-card-->
			        </div><!--//tab-pane-->
				</div><!--//tab-content-->

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