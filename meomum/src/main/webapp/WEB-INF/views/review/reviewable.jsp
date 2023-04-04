<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<!-- 아이콘 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
.title{
	text-align: center;
	font-weight: bold;
	margin-bottom: 30px;
}
.noreview h5{
	line-height:180px;
}

.col-auto {
	margin:0 0 10px 0;
}
.app-content {
	margin: 0 20px;
	padding: 0 20px;
}

.reviewable-img img{
	width:60%;
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
.review-star i {
    color:#FFD400;
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
		
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container-xl text-center">
				<h2 class="title">작성 가능한 후기</h2>
				<table class="table reviewable-table">
					<thead class="table-light">
						<tr class="table-borderless">
							<th scope="col" class="thumb">Preview</th>
							<th scope="col" class="num">서비스/주문번호</th>
							<th scope="col" class="service">이용서비스</th>
							<th scope="col" class="category">카테고리</th>
							<th scope="col" class="button">버튼</th>
						</tr>
					</thead>
					
					<tbody class="table-group-divider">
						<tr>
							<th scope="row" class="align-middle">
								<a href="#" class="reviewable-img">
									<img src="images/reviewImg/product-1.jpg" alt="">
								</a>
							</th>
							<td class="align-middle">O20230330-1001</td>
							<td class="align-middle"><a href="#" class="text-success fw-bold">모찌 소파 Mozzi｜B type</a></td>
							<td class="align-middle"><span class="badge bg-primary">구독일상</span></td>
							<td class="align-middle">
								<a href="#" class="btn btn-sm btn-outline-success">후기 작성하기</a>
							</td>
						</tr>
						<tr>
							<th scope="row" class="align-middle"><a href="#"><img src="images/reviewImg/product-1.jpg" alt=""></a></a></th>
							<td class="align-middle">S20230330-1001</td>
							<td class="align-middle"><a href="#" class="text-success fw-bold">모찌 소파 Mozzi｜B type</a></td>
							<td class="align-middle"><span class="badge bg-warning">정리일상</span></td>
							<td class="align-middle">
								<a href="#" class="btn btn-sm btn-outline-success">후기 작성하기</a>
							</td>
						</tr>
						<tr>
							<th scope="row" class="align-middle"><a href="#"><img src="images/reviewImg/product-1.jpg" alt=""></a></a></th>
							<td class="align-middle">S20230330-1002</td>
							<td class="align-middle"><a href="#" class="text-success fw-bold">모찌 소파 Mozzi｜B type</a></td>
							<td class="align-middle"><span class="badge bg-warning">정리일상</span></td>
							<td class="align-middle">
								<a href="#" class="btn btn-sm btn-outline-success">후기 작성하기</a>
							</td>
						</tr>
						<tr>
							<th scope="row" class="align-middle"><a href="#"><img src="images/reviewImg/product-1.jpg" alt=""></a></a></th>
							<td class="align-middle">O20230330-1002</td>
							<td class="align-middle"><a href="#" class="text-success fw-bold">모찌 소파 Mozzi｜B type</a></td>
							<td class="align-middle"><span class="badge bg-primary">구독일상</span></td>
							<td class="align-middle">
								<a href="#" class="btn btn-sm btn-outline-success">후기 작성하기</a>
							</td>
						</tr>
						<tr>
							<th scope="row" class="align-middle"><a href="#"><img src="images/reviewImg/product-1.jpg" alt=""></a></a></th>
							<td class="align-middle">S20230330-1003</td>
							<td class="align-middle"><a href="#" class="text-success fw-bold">모찌 소파 Mozzi｜B type</a></td>
							<td class="align-middle"><span class="badge bg-warning">정리일상</span></td>
							<td class="align-middle">
								<a href="#" class="btn btn-sm btn-outline-success">후기 작성하기</a>
							</td>
						</tr>
					</tbody>
				</table>

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