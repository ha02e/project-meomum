<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
<%@include file="../header.jsp"%> 

<section class="reviewList">
<div class="container">

<!-- 탭메뉴  -->
	<ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
		<li class="nav-item flex-fill" role="presentation">
			<button class="nav-link w-100 active" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="false" tabindex="-1">정리일상</button>
		</li>
		<li class="nav-item flex-fill" role="presentation">
			<button class="nav-link w-100" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-profile" type="button" role="tab" aria-controls="profile" aria-selected="true">구독일상</button>
		</li>
	</ul>
	
	<div class="tab-content pt-2" id="borderedTabJustifiedContent">
		<div class="tab-pane fade active show" id="bordered-justified-home" role="tabpanel" aria-labelledby="home-tab">
			<!-- 정리일상 후기 -->
			
			<div class="container">
				<div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
					<div class="col">
						<div class="card h-100">
						<div class="card-body img">
							<img class="card-img-top" src="images/reviewImg/product-1.jpg" alt="Card image cap" />
						</div>
						<div class="card-body">
							<h5 class="card-title">후기 제목</h5>
							<p class="card-text">이렇게 넓은 거실이라면 좀 더 색다르게 거실을 꾸며보아도 좋습니다.
								소파를 재배치하니 가족과 방문하는 모두를 품을 것만 같은 따뜻하고 훤한 거실이 됐습니다.
							</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
              					<div class="entry-meta">
									<ul class="d-flex justify-content-between">
										<li class="d-flex align-items-center"><i class="bi bi-person"></i>&nbsp;홍길동</li>
					                  	<li class="d-flex align-items-center">
						                  	<i class="bi bi-star-fill"></i>
						                  	<i class="bi bi-star-fill"></i>
						                  	<i class="bi bi-star-fill"></i>
						                  	<i class="bi bi-star-fill"></i>
						                  	<i class="bi bi-star-fill"></i>
					                  	</li>
					                  	<li class="d-flex align-items-center"><i class="bi bi-clock"></i>&nbsp;2023-04-03</li>
					                </ul>
					            </div>
							</li>
							<li class="list-group-item">
								<div class="read-more text-center">
				                  <a href="#">
									<i class="bi bi-plus-circle"></i>&nbsp;자세히 보기</a>
				                </div>
							</li>
						</ul>
              			</div>
              		</div>
              			
              		<div class="col">
              			<div class="card h-100">
						<div class="card-body img">
							<img class="card-img-top" src="images/reviewImg/product-1.jpg" alt="Card image cap" />
						</div>
						<div class="card-body">
							<h5 class="card-title">후기 제목</h5>
							<p class="card-text">이렇게 넓은 거실이라면 좀 더 색다르게 거실을 꾸며보아도 좋습니다.
								소파를 재배치하니 가족과 방문하는 모두를 품을 것만 같은 따뜻하고 훤한 거실이 됐습니다.
							</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
              					<div class="entry-meta">
									<ul class="d-flex justify-content-between">
										<li class="d-flex align-items-center"><i class="bi bi-person"></i>&nbsp;홍길동</li>
					                  	<li class="d-flex align-items-center">
						                  	<i class="bi bi-star-fill"></i>
						                  	<i class="bi bi-star-fill"></i>
						                  	<i class="bi bi-star-fill"></i>
						                  	<i class="bi bi-star-fill"></i>
						                  	<i class="bi bi-star-fill"></i>
					                  	</li>
					                  	<li class="d-flex align-items-center"><i class="bi bi-clock"></i>&nbsp;2023-04-03</li>
					                </ul>
					            </div>
							</li>
							<li class="list-group-item">
								<div class="read-more text-center">
				                  <a href="#">
									<i class="bi bi-plus-circle"></i>&nbsp;자세히 보기</a>
				                </div>
							</li>
						</ul>
              			</div>
              		</div>
              		
              		<div class="col">	
              			<div class="card h-100">
						<div class="card-body img">
							<img class="card-img-top" src="images/reviewImg/product-1.jpg" alt="Card image cap" />
						</div>
						<div class="card-body">
							<h5 class="card-title">후기 제목</h5>
							<p class="card-text">이렇게 넓은 거실이라면 좀 더 색다르게 거실을 꾸며보아도 좋습니다.
								소파를 재배치하니 가족과 방문하는 모두를 품을 것만 같은 따뜻하고 훤한 거실이 됐습니다.
							</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
              					<div class="entry-meta">
									<ul class="d-flex justify-content-between">
										<li class="d-flex align-items-center"><i class="bi bi-person"></i>&nbsp;홍길동</li>
					                  	<li class="d-flex align-items-center">
						                  	<i class="bi bi-star-fill"></i>
						                  	<i class="bi bi-star-fill"></i>
						                  	<i class="bi bi-star-fill"></i>
						                  	<i class="bi bi-star-fill"></i>
						                  	<i class="bi bi-star-fill"></i>
					                  	</li>
					                  	<li class="d-flex align-items-center"><i class="bi bi-clock"></i>&nbsp;2023-04-03</li>
					                </ul>
					            </div>
							</li>
							<li class="list-group-item">
								<div class="read-more text-center">
				                  <a href="#">
									<i class="bi bi-plus-circle"></i>&nbsp;자세히 보기</a>
				                </div>
							</li>
						</ul>
              			</div>
              		</div>
              		
				</div>
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
			<li class="page-item"><a class="page-link" href="#">Previous</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">Next</a></li>
		</ul>
	</nav>
	
</div>
<%@include file="../footer.jsp"%>            
              
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
 
</body>
</html>