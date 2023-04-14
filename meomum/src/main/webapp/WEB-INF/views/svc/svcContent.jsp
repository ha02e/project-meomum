<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
    

<!doctype html>
<html>
<head>
<script src="/docs/5.3/assets/js/color-modes.js"></script>

<meta charset="UTF-8">

<title>정리일상 진행 현황</title>
<!-- jQuery -->
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<link rel="canonical"
	href="https://getbootstrap.com/docs/5.3/examples/checkout/">

<link href="/docs/5.3/dist/css/bootstrap.min.css" rel="stylesheet">

<style>

#buy{
	justify-content: space-between;
}
ul.list-group-item{
	margin-left: 20px;
}

  li.list-group-item > div {
    text-align: left;
    margin-right: 40px;
  }
  
    li.list-group-item input[type="text"] {
    text-align: left;
    margin-right: 20px;
  }
  
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://images.unsplash.com/photo-1606327054629-64c8b0fd6e4f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1740&q=80)
		no-repeat center;
	background-size: cover;
	margin: 0;
	border-bottom: none;
	padding-bottom: 0px;
	margin-bottom: 40px;
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

.btn-group .btn {
	margin-right: 10px;
}

footer {
	margin-top: 20px;
}

.b-example-divider {
	width: 100%;
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.bd-mode-toggle {
	z-index: 1500;
}

.list-group-item input[type="text"], .list-group-item input[type="text"]:focus
	{
	border: none;
	box-shadow: none;
}

.form-control {
	border: none;
}
.my-4 {
    margin-top: 1rem;
    margin-bottom: 1rem;
}
.button-container {
     display: flex;
     justify-content: center;
}
.button-container a {
     margin: 0 10px;
}
</style>


<!-- Custom styles for this template -->
<link href="checkout.css" rel="stylesheet">
</head>
<body class="bg-body-tertiary">
	<%@include file="../header.jsp"%>
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">방문 견적 예약 내역</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<main>
		<div class="col-md-10 col-lg-8 order-md-first mx-auto">
			<h2 class="d-flex justify-content-between align-items-center mb-3" >
				<span>${dto.svc_state}</span>
			</h2>
			</div>

			<div class="row g-5">
				
				<!-- 예약 상세 내용 -->
				<div class="col-md-10 col-lg-8 order-md-first mx-auto">
					<!-- <h5 class="d-flex justify-content-between align-items-center mb-3">
						<span class="text-primary" style="font-family: 'GmarketSansMedium';">예약 상세 내용</span>
					</h5> -->
					
					<ul class="list-group mb-3">
						<input type="hidden" id="user_id" value="${sessionScope.ssInfo.user_id}">
						<input type="hidden" id="user_idx"
							value="${sessionScope.ssInfo.user_idx}">
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>예약번호</span>
							</div>
							<div class="col">${dto.svc_idx}</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>서비스 일시</span>
							</div>
							<div class="col">
								<c:if test="${dto.svc_state ne '예약취소'}">
	      						${dto.svc_days}&nbsp; &nbsp;${dto.svc_time}
	      						</c:if>
								<c:if test="${dto.svc_state eq '예약취소'}">
	      						${dto.svc_days.substring(1)} &nbsp; &nbsp; ${dto.svc_time.substring(1)}
	      						</c:if>
							</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between bg-body-tertiary row">
							<div class="col">
								<strong><span>예약 상세 내용</span></strong>
							</div>

						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>지역</span>
							</div>
							<div class="col">${dto.user_addr},${dto.user_detail}</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>거주형태</span>
							</div>
							<div class="col">${dto.svc_type}</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>서비스 영역</span>
							</div>
							<div class="col">${dto.svc_area}</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>거주 평수(공급면적)</span>
							</div>
							<div class="col">${dto.svc_py}평</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>요청사항</span>
							</div>
							<div class="col">${dto.svc_req}</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li
							class="list-group-item d-flex justify-content-between bg-body-tertiary row">
							<div class="col">
								<strong><span>예약자 정보</span></strong>
							</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>성함</span>
							</div>
							<div class="col">${dto.user_name}</div>
						</li>
						<!-- ---------------------------------------------------------- -->
						<li class="list-group-item d-flex justify-content-between lh-sm row">
							<div class="col">
								<span>휴대전화</span>
							</div>
							<div class="col">${dto.user_tel}</div>
						</li>
					</ul>
					<c:if test="${dto.svc_state eq '예약취소'}">
						<hr class="my-4">
						<a href="svc.do" class="w-100 btn btn-primary">재예약</a>
					</c:if>
					<c:if test="${dto.svc_state eq '예약확정'}">
						<hr class="my-4">
						<div class="button-container">
						<c:url var="updateUrl" value="svcUpdateForm.do">
							<c:param name="svc_idx">${dto.svc_idx}</c:param>
						</c:url>
						<a href="${updateUrl}" class="w-40 btn btn-primary">예약수정</a>
					
						<c:url var="cancleUrl" value="svcCancle.do">
						<c:param name="svc_idx">${dto.svc_idx}</c:param>
						<c:param name="svc_days" value="${dto.svc_days}"/>
						<c:param name="svc_time" value="${dto.svc_time}"/>
					</c:url>
					<a href="${cancleUrl}" class="w-40 btn btn-secondary">예약취소</a>
					</div>
				</c:if>
				</div>
			</div>

		</main>
		</div>
		

</body>
</html>

<%@include file="../footer.jsp"%>

<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
</body>
</html>