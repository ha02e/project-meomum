<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
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

.reviewThumb{
	position: relative;
	overflow: hidden;
	width: 100%;
	height:240px;
	padding:16px 0;
}
.card-img-top{
	position: absolute;
  	width: 100%;
  	top: 50%; 
  	left: 50%;
  	transform: translate(-50%, -50%);
}
.review-star i {
    color:#FFD400;
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
			<div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
				<c:forEach var="dto" items="${lists}">
					<div class="col">
						<div class="card">
						<div class="reviewThumb">
							<c:if test="${not empty dto.thumb}">
								<img class="img-fluid card-img-top" src="/meomum/images/reviewImg/${dto.thumb}" alt="review thumb">
							</c:if>
							<c:if test="${empty dto.thumb}">
								<img class="img-fluid card-img-top" src="/meomum/images/noimage.jpg" alt="no thumb">
							</c:if>
							
						</div>
						<div class="card-body">
							<h4 class="card-title">${dto.subject}</h4>
							<div class="entry-meta">
								<ul class="d-flex justify-content-between">
									<li class="d-flex align-items-center"><i class="bi bi-person"></i>&nbsp;${dto.writer}</li>
									<li class="d-flex align-items-center review-star">
										<c:forEach var="i" begin="1" end="${dto.star}" step="1">
											<i class="bi bi-star-fill"></i>&nbsp;
										</c:forEach>
					                  	</li>
					                  	<li class="d-flex align-items-center"><i class="bi bi-clock"></i>&nbsp;${dto.writedate}</li>
					                </ul>
							</div>	
						</div>
						<div class="card-footer text-center">
							<input type="hidden" name="review_idx" value="${dto.review_idx}">
							<c:url var="contentUrl" value="reviewContent.do">
								<c:param name="review_idx">${dto.review_idx}</c:param>
							</c:url>
							<button class="btn btn-primary btn-sm" id="btn-view">자세히 보기</button>
							<div class="modal fade" id="reviewModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog" role="document">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">모달테스트</h5>
											<button class="close" type="button" data-dismiss="modal" aria-label="Close">
												<span aria-hidden="true">X</span>
											</button>
										</div>
										<div class="modal-body">내용 입력 !!</div>
										<div class="modal-footer">
											<a class="btn" id="modalY" href="#">예</a>
											<button class="btn" type="button" data-dismiss="modal">아니요</button>
										</div>
									</div>
								</div>
							</div>
							<script>
									$('#btn-view').click(function(e){
										e.preventDefault();
										$('#reviewModal').modal("show");
									});
							</script>
							<a href="reviewDel.do?review_idx=${dto.review_idx}">
								<button class="btn btn-danger btn-sm">삭제</button>
							</a>
						</div>
					</div>
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