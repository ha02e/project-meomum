<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- 리뷰관련 css -->
<link id="theme-style" rel="stylesheet" href="assets/css/portal.css">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
.col-auto {
	margin:0 0 10px 0;
}
.app-content {
	margin: 0 20px;
	padding: 0 20px;
}
.app-card{
	border:1px solid #eeeeee;
}
.notification-title{
	font-weight: bold;
}
.app-card-notification .app-card-footer {
    background: #E3DBD6;
}
.action-link {
    color: #3d2217;
    text-decoration: none;
    background-color: transparent;
}
.action-link:hover{
    color: #000000;
}
.app-btn-secondary{

}

.nav-tabs{
    border-bottom: none;
    -webkit-box-pack: center;
    -ms-flex-pack: center;
    justify-content: center;
    position: relative;
    margin-bottom: 20px;
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
			<div class="row">
				<!-- 탭메뉴  -->
				<ul class="nav nav-tabs">
					<li class="nav-item">
						<a class="nav-link" data-toggle="tab" href="#reviewable-tab-pane">작성 가능한 후기</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" data-toggle="tab"  href="#myreview-tab-pane">내가 쓴 후기</a>
					</li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show" id="reviewable-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
						작성 가능한 후기내역~
					</div>
					<div class="tab-pane fade show active" id="myreview-tab-pane" role="tabpanel" aria-labelledby="home-tab" tabindex="0">
						<!-- 내가 작성한 후기  -->
						<%@include file="myReviewList.jsp"%> 
					</div>
				</div>
			
			
				

			
		</div>
		
		<!-- ---------- 마이페이지 각 페이지 여기에 넣어주세요!! 끝 지점 ---------- -->
		</div>
		
	</div>
	</div>
</section>

<%@include file="../footer.jsp"%> 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>