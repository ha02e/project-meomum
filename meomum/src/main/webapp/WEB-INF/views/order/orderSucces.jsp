<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>머뭄 주문/결제 확인</title>
<meta charset="UTF-8">

<style>

.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://images.unsplash.com/photo-1513694203232-719a280e022f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80)
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
@font-face {
    font-family: 'GongGothicMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.orderCheck p{

    font-family: 'GongGothicMedium';
	font-size: 20px;
	color : black;
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
						<h1 class="page-title">주문/결제</h1>
					</div>
				</div>
			</div>
		</div>
	</div>

<div class="container py-5"style="overflow: auto; margin-bottom: 50px; margin-top: 30px;">
  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card p-4 text-center orderCheck">
        <h2 class="mb-4 text-center"><i class="bi bi-check2-circle" style="font-size:100px;"></i>
        주문이 완료 되었습니다!</h2>
        <p class="text-center mb-0" style="color:#C45630;">주문번호 : <c:if test="${!empty order_idx }">${order_idx }</c:if></p>

        <br>
        <p class="text-center">머뭄을 이용해주셔서 감사합니다. 
   
        <p class="text-center">고객님의 소중한 상품을 안전하고 <br>신속하게 배송해드리겠습니다 <i class="bi bi-emoji-smile"></i></p>
       <p class="text-center"> 주문내역 및 배송 확인은<br> 마이페이지 > <a href="orderReport.do">주문/배송조회</a>에서 가능합니다.</p>
         <a href="orderReport.do" class="btn btn-success btn-lg my-3">주문/배송 확인</a>
      </div>
    </div>
  </div>
</div>



	<%@include file="../footer.jsp"%>



</body>
</html>