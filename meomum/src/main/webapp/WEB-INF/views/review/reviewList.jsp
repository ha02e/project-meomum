<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<style>
.reviewList{
	margin: 60px 0 30px 0; 
}
.tab-content{
	margin-top: 30px; 
}


.card-body.img{
	position: relative;
	overflow: hidden;
	width: 100%;
	height:240px;
	padding:16px 0;
}
.card-body img{
	position: absolute;
  	width: 100%;
  	top: 50%; 
  	left: 50%;
  	transform: translate(-50%, -50%);
}
.entry-meta ul{
	padding:0;
}

.review-star i {
    color:#FFD400;
}


.pagination{
	margin:40px 0 60px 0;
}
</style>
</head>
<body>
<%@include file="../header.jsp"%> 

<section class="reviewList">
<div class="container">

<!-- 탭메뉴  -->
	<ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
		<li class="nav-item flex-fill" role="presentation">
			<button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="false" tabindex="-1">전체보기</button>
		</li>
		<li class="nav-item flex-fill" role="presentation">
			<button class="nav-link w-100" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-profile" type="button" role="tab" aria-controls="profile" aria-selected="true">정리일상</button>
		</li>
		<li class="nav-item flex-fill" role="presentation">
			<button class="nav-link w-100" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-profile" type="button" role="tab" aria-controls="profile" aria-selected="true">구독일상</button>
		</li>
	</ul>
	
	<div class="tab-content pt-2" id="borderedTabJustifiedContent">
		<div class="tab-pane fade active show" id="bordered-justified-home" role="tabpanel" aria-labelledby="home-tab">
			<!-- 전체보기 -->
			
			<div class="container">
				<div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
				<c:if test="${empty lists}">
					<h5 class="text-center">등록된 후기가 없습니다.</h5>
				</c:if>
				<c:forEach var="dto" items="${lists}">
					<div class="col">
						<div class="card h-100">
						<div class="card-body img">
							<img class="card-img-top" src="images/reviewImg/review_thumb02.jpg" alt="Card image cap" />
						</div>
						<c:url var="contentUrl" value="reviewContent.do">
							<c:param name="review_idx">${dto.review_idx}</c:param>
						</c:url>
						<div class="card-body">
							<h5 class="card-title"><a href="${contentUrl}">${dto.subject}</a></h5>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
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
							</li>
							<li class="list-group-item">
								<div class="read-more text-center">
				                <a href="${contentUrl}">
									<i class="bi bi-plus-circle"></i>&nbsp;자세히 보기
								</a>
				                </div>
							</li>
						</ul>
              			</div>
              		</div>
				</c:forEach>

              		

				</div>
			</div>
		</div>
		<div class="tab-pane fade" id="bordered-justified-profile" role="tabpanel" aria-labelledby="profile-tab">
			<!-- 저장일상 후기 -->
			<div class="container">
			
			</div>		
		</div>
		<div class="tab-pane fade" id="bordered-justified-profile" role="tabpanel" aria-labelledby="profile-tab">
			<!-- 구독일상 후기 -->
			<div class="container">
			
			</div>		
		</div>
	</div>
</div>

</section>

<div class="container-xl">
	<nav aria-label="Page navigation example">
		<ul class="pagination pagination-sm justify-content-center">
			${pageStr}
		</ul>
	</nav>

</div>


<%@include file="../footer.jsp"%>            
              
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
 
</body>
</html>