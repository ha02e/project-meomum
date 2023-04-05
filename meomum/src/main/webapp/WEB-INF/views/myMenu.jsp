<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="assets/css/style_mymenu.css">
<style>
.sidebar__categories .section-title h4{
	font-weight: bold;
	font-size: 22px;
}
.section-title h4:after {
    position: absolute;
    left: 0;
    bottom: -8px;
    height: 4px;
    width: 110px;
    background: #c1564c;
    content: "";
}

.categories__accordion .card-heading.one a::after {
    content: "";
    font-size: 14px;
    font-family:"FontAwesome";
    color: rgb(102, 102, 102);
    position: absolute;
    right: 30px;
    top: -1px;
}
</style>
</head>
<body>
	<div class="col-xl-3 col-md-3">
		<div class="shop__sidebar">
			<div class="sidebar__categories">
			<div class="section-title">
				<h4>마이페이지</h4>
			</div>
			<div class="categories__accordion">
				<div class="accordion" id="accordionExample">
					<div class="card">
						<div class="card-heading active one">
							<a data-toggle="collapse" href="infoEdit.do">나의 정보 수정</a>
						</div>
					</div>
					
					<div class="card">
						<div class="card-heading">
							<a data-toggle="collapse" data-target="#collapseTwo">정리일상 목록</a>
						</div>
						<div id="collapseTwo" class="collapse" data-parent="#accordionExample">
							<div class="card-body">
								<ul>
									<li><a href="#">간단 견적 문의 내역</a></li>
									<li><a href="svcList.do">방문 견적 예약 내역</a></li>
									<li><a href="#">정리일상 진행 현황</a></li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="card">
						<div class="card-heading">
							<a data-toggle="collapse" data-target="#collapseThree">구독일상 목록</a>
						</div>
						<div id="collapseThree" class="collapse" data-parent="#accordionExample">
							<div class="card-body">
								<ul>
									<li><a href="#">구독상품</a></li>
									<li><a href="#">장바구니/찜 목록</a></li>
									<li><a href="#">주문/배송 내역</a></li>
									<li><a href="#">취소/환불 내역</a></li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="card">
						<div class="card-heading">
							<a data-toggle="collapse" data-target="#collapseFour">후기 내역</a>
						</div>
						<div id="collapseFour" class="collapse" data-parent="#accordionExample">
							<div class="card-body">
								<ul>
									<li><a href="myReviewList.do">내가 쓴 후기</a></li>
									<li><a href="reviewable.do">작성 가능한 후기</a></li>
								</ul>
							</div>
						</div>
					</div>
					
					<div class="card">
						<div class="card-heading one">
							<a data-toggle="collapse" href="#">나의 포인트 내역</a>
						</div>
					</div>
					
				</div>
			</div>
			</div>
                        
		</div>
	</div>




<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<script src="assets/js/main_mymenu.js"></script>
</body>
</html>