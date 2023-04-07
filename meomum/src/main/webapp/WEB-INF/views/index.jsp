<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머뭄</title>
<style>
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
    background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)), rgba(36, 39, 38, 0.5) url(https://cdn.aitimes.com/news/photo/202210/147215_155199_1614.jpg) no-repeat center;
    background-size: cover;
    margin: 0;
    border-bottom: none;
    padding-bottom: 0px;
	}
	.page-caption { padding: 90px 0px; position: relative; z-index: 1; color: #fff; text-align: center; }
	.page-title { color: #fff;  font-size: 40px; font-weight: 400; letter-spacing: -1px; }
	
	/**헤더 이미지용 끝*/
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>


<!-- 헤더 이미지 넣을때 css도 가져갈것...  -->
 <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="page-caption">
                        <h2 class="page-title">마이페이지</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- test 슬라이드 -->

<div class="container">
<div class="row">
<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="https://img.freepik.com/premium-photo/white-wall-living-room-have-sofa-and-decoration-3d-rendering_41470-3282.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://img.freepik.com/free-photo/mock-up-poster-frame-in-modern-interior-background-living-room-scandinavian-style-generative-ai-illustration_1258-151594.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYb9PF2AwJWBya67Kr9KMf7MvRrmm12gzSeHvMkiAVDFDmZG4KfN75p5Ee7uonSOBrTNw&usqp=CAU" class="d-block w-100" alt="...">
    </div>
  </div>
</div>
<div id="carouselExampleInterval" class="carousel slide" data-bs-ride="carousel">
  <div class="carousel-inner">
    <div class="carousel-item active" data-bs-interval="10000">
      <img src="https://img.freepik.com/premium-photo/white-wall-living-room-have-sofa-and-decoration-3d-rendering_41470-3282.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item" data-bs-interval="2000">
      <img src="https://img.freepik.com/free-photo/mock-up-poster-frame-in-modern-interior-background-living-room-scandinavian-style-generative-ai-illustration_1258-151594.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYb9PF2AwJWBya67Kr9KMf7MvRrmm12gzSeHvMkiAVDFDmZG4KfN75p5Ee7uonSOBrTNw&usqp=CAU" class="d-block w-100" alt="...">
    </div>
  </div>
  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Previous</span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleInterval" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="visually-hidden">Next</span>
  </button>
</div>
<!-- test 끝 슬라이드 -->


<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</div>
</div>



<%@include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>