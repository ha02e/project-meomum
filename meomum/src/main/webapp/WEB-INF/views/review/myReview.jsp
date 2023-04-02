<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

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


<!-- 작성 가능한 후기 -->
.reviewable-img img{
	width:60%;
	border:1px solid red;
}
.thumb{
	width:10%;
}
.num{
	width:25%;
}
.service{
	width:32%;
}
.category{
	width:13%;
}
.button{
	width:20%;
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
				<ul class="nav nav-tabs nav-tabs-bordered d-flex" id="borderedTabJustified" role="tablist">
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100" id="home-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-home" type="button" role="tab" aria-controls="home" aria-selected="false" tabindex="-1">Home</button>
                </li>
                <li class="nav-item flex-fill" role="presentation">
                  <button class="nav-link w-100 active" id="profile-tab" data-bs-toggle="tab" data-bs-target="#bordered-justified-profile" type="button" role="tab" aria-controls="profile" aria-selected="true">Profile</button>
                </li>

              </ul>
              <div class="tab-content pt-2" id="borderedTabJustifiedContent">
                <div class="tab-pane fade" id="bordered-justified-home" role="tabpanel" aria-labelledby="home-tab">
					<%@include file="reviewable.jsp"%> 
                </div>
                <div class="tab-pane fade active show" id="bordered-justified-profile" role="tabpanel" aria-labelledby="profile-tab">
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