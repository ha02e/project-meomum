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
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://images.unsplash.com/photo-1618221381711-42ca8ab6e908?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80)
		no-repeat center;
	background-size: cover;
	margin: 0;
	border-bottom: none;
	padding-bottom: 0px;
}

.page-caption {
	padding: 90px 0px;
	position: relative;
	z-index: 1;
	color: #fff;
	text-align: center;
}

.page-title {
	color: #fff;
	font-size: 40px;
	font-weight: 400;
	letter-spacing: -1px;
}
/**헤더 이미지용 끝*/
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
<!-- 헤더 이미지 넣을때 css도 가져갈것...  -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">후기</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

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
					<c:url var="contentUrl" value="reviewContent.do">
						<c:param name="review_idx">${dto.review_idx}</c:param>
					</c:url>
					<div class="col">
						<div class="card h-100">
						<div class="card-body img">
							<c:if test="${not empty dto.thumb}">
								<a href="${contentUrl}">
									<img src="/meomum/images/reviewImg/${dto.thumb}" alt="Card image cap" />
								</a>
							</c:if>
							<c:if test="${empty dto.thumb}">
								<a href="${contentUrl}">
									<img class="card-img-top" src="/meomum/images/noimage.jpg" alt="Card image cap" />
								</a>
							</c:if>
						</div>
						<div class="card-body">
							<h5 class="card-title text-truncate"><a href="${contentUrl}">${dto.subject}</a></h5>
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