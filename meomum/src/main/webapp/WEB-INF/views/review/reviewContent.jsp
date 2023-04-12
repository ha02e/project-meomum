<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="assets/css/style_reviewCon.css">

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

section {
    padding: 0;
    overflow: hidden;
}

.blog .entry .entry-title {
    font-size: 34px;
    font-weight: bold;
    padding: 0;
    margin: 20px 0 20px 0;
}
.entry-content{
	margin:20px 0 40px 0;
	max-width:100%;
	height:auto !important;
}
element.style {
    height: auto;
    width: 100%;
}
.blog .entry .entry-meta .review-star i {
    margin-right: 0;
    color:#FFD400;
}
.blog .entry .entry-footer {
    padding: 30px;
    font-size: 20px;
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

<section class="reviewCon">
	    <!-- ======= Blog Single Section ======= -->
    <section id="blog" class="blog">
      <div class="container-lg text-center" data-aos="fade-up">

        <div class="row justify-content-md-center">

          <div class="col">

            <article class="entry entry-single">

              <h1 class="entry-title text-truncate">${dto.subject}</h1>

              <div class="entry-meta">
                <ul class="d-flex justify-content-center">
					<li><i class="bi bi-person"></i>${dto.writer}</li>
					<li class="review-star">
						<c:forEach var="i" begin="1" end="${dto.star}" step="1">
							<i class="bi bi-star-fill"></i>
						</c:forEach>
					</li>
					<li><i class="bi bi-clock"></i>${dto.writedate}</li>
                  	<li><i class="bi bi-eye-fill"></i>${dto.readnum}</li>
                </ul>
              </div>

              <div class="entry-content">
	          	${dto.content}
              </div>

              <div class="entry-footer">
				<a href="reviewList.do">
					<i class="bi bi-arrow-left-circle"></i>&nbsp;목록으로
				</a>
              </div>

            </article>

           
          </div>

        </div>

      </div>
    </section><!-- End Blog Single Section -->


   </div>
</section>



<%@include file="../footer.jsp"%> 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>