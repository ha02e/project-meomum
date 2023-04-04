<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
<!-- App CSS -->  
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">

<style>
.title{
	text-align: center;
	font-weight: bold;
	margin: 30px 0;
}
.noreview h5{
	line-height:180px;
}

.app-card-notification .notification-title {
    font-size: 1.5rem;
}
.app-card-notification .notification-meta {
    font-size: .85rem;
}
.reviewThumb{
	position: relative;
	overflow: hidden;
	width: 200px;
	height: 120px;
	margin:auto;
}
.profile-image{
	position: absolute;
  	width: 100%;
  	top: 50%; 
  	left: 50%;
  	transform: translate(-50%, -50%);
}

.review-star {
    color:#FFD400;
}

.btn-detail a, .btn-del a{
	padding:5px 40px;
}
.btn-detail a:hover, .btn-del a:hover{
	padding:5px 40px;
	background-color: #15a362;
	color:#ffffff;
	transition:all 0.5s;
}


</style>
</head>

<body class="app"> 

<%@include file="../header_a.jsp"%>  

<div class="app-wrapper">
	    
	    <div class="app-content pt-3 p-md-3 p-lg-4">
		    <div class="container-xl">
			   <h2 class="title">후기 관리</h2>
			<c:if test="${empty lists}">
				<div class="row noreview">
					<div class="card">
					<h5 class="text-center">등록된 후기가 없습니다.</h5>
					</div>
				</div>
			</c:if>
				<div class="row row-cols-1 row-cols-md-2 g-4 mb-2">
				<c:forEach var="dto" items="${lists}">
				<div class="col app-card app-card-notification shadow-sm mb-4">
				    <div class="app-card-headerpx-4 py-3">
				        <div class="row g-3 d-flex justify-content-around align-items-center">
					        <div class="col-12 col-lg-4 text-center text-lg-start">	
					        	<div class="reviewThumb">					        
				                	<c:if test="${not empty dto.thumb}">
										<img src="/meomum/images/reviewImg/${dto.thumb}" alt="tumb" />
									</c:if>
									<c:if test="${empty dto.thumb}">
										<img class="card-img-top" src="/meomum/images/noimage.jpg" alt="no thumb" />
									</c:if>
					        	</div>
					        </div><!--//col-->
					        <div class="col-12 col-lg-8 text-center text-lg-start">
						        <div class="notification-type mb-2">
						        	<span class="badge bg-info">Project</span>
						        </div>
						        <h4 class="notification-title mb-1">${dto.subject}</h4>
						        
						        <ul class="notification-meta list-inline mb-0">
							        <li class="list-inline-item">주문/서비스번호</li>
							        <li class="list-inline-item">|</li>
							        <li class="list-inline-item">${dto.writer}</li>
							        <li class="list-inline-item">|</li>
							        <li class="list-inline-item review-star">
							        	<c:forEach var="i" begin="1" end="${dto.star}" step="1">
						                  	<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
											  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
					                  	</c:forEach>
							        </li>
							        <li class="list-inline-item">|</li>
							        <li class="list-inline-item">${dto.writedate}</li>
						        </ul>
						   
					        </div><!--//col-->
				        </div><!--//row-->
				    </div><!--//app-card-header-->
				    <div class="d-flex text-center app-card-footer px-4 py-3">
				    <div class="col btn-detail">
				    	<c:url var="contentUrl" value="reviewContent.do">
							<c:param name="review_idx">${dto.review_idx}</c:param>
						</c:url>
					    <a class="action-link" href="${contentUrl}" target="blank">
						    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
							  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
							</svg>
					    보기
						</a>
				    </div>
				    <div class="col btn-del">
					    <a class="action-link" href="reviewDel.do?review_idx=${dto.review_idx}">
					    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
						  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
						  <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
						</svg>
					    삭제
						</a>
				    </div>
				    </div><!--//app-card-footer-->
				</div>
				
				</c:forEach>
				</div>
					


				
				<div class="container-xl">
					<nav aria-label="Page navigation example">
						<ul class="pagination pagination-sm justify-content-center">
							${pageStr}
						</ul>
					</nav>
				</div>	    
		    </div><!--//container-fluid-->
	    </div><!--//app-content-->


<%@include file="../footer_a.jsp"%>    
</div><!--//app-wrapper-->    					


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>

</html>
</body>
</html>