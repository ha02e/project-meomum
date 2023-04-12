<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- CSS FILES -->

<link href="css/bootstrap.min.css" rel="stylesheet">

<link href="css/bootstrap-icons.css" rel="stylesheet">

<link href="css/templatemo-kind-heart-charity.css" rel="stylesheet">


<!-- 아이콘 -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
	
<link rel="stylesheet" href="assets/css/style_mymenu.css">

<style>

a {
	text-decoration: none;
}
ul {
  list-style-type: none;
}

.navbar-brand:focus, .navbar-brand:hover {
	color: #B8A890;
}

/*로고 부분*/
.navbar-brand {
    font-family: 'WandohopeR';
   	line-height: 1.2;
	color: #82745D;
	font-size: 18px;
	
}

.btn-outline-brown {
	color: #B8A890;
	border-color: #8B4513;
}

.btn-outline-brown:hover {
	color: #FFE4B5;
	background-color: #CD853F;
}

#navbarCollapse a {
	font-family: 'GmarketSansMedium';
	font-size: 20px;
	color: #422700;
}

#navbarCollapse :hover {
	color: #C1564C;
}
.navbar-nav .nav-item {
  margin: 0 10px;
}



body{
	font-family: 'GmarketSansMedium';
}
.btn-primary {
    --bs-btn-color: #fff;
    --bs-btn-bg: #85745D;
    --bs-btn-border-color: #85745D;
    --bs-btn-hover-color: #fff;
    --bs-btn-hover-bg: #4F4538;
    --bs-btn-hover-border-color: #4F4538;
    --bs-btn-focus-shadow-rgb: 49,132,253;
    --bs-btn-active-color: #fff;
    --bs-btn-active-bg: #FE8A7F;
    --bs-btn-active-border-color: #FFC1B4;
    --bs-btn-active-shadow: inset 0 3px 5px rgba(0, 0, 0, 0.125);
    --bs-btn-disabled-color: #fff;
    --bs-btn-disabled-bg: #85745D;
    --bs-btn-disabled-border-color: #85745D;
}

/**배너 용 폰트 여기서 바꾸기*/
.page-title {
	color: #fff;
	font-size: 40px;
	font-weight: 400;
	letter-spacing: -1px;
    font-family: 'GmarketSansMedium';
}

/**모달*/
.modal-title{
font-size: 25px;
font-weight: bold;
}

.modal-body p,label{
font-size :18px;
}
@font-face {
    font-family: 'TTTtangsbudaejjigaeB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2212@1.0/TTTtangsbudaejjigaeB.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}

h2{
    font-family: 'TTTtangsbudaejjigaeB';
    color :#524439;
}
</style>

</head>

<body id="#top">

	<header class="site-header" >
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-12 d-flex flex-wrap">
					<ul class="social-icon">
						<li class="social-icon-item"><a href="#"
							class="social-icon-link bi-twitter"></a></li>
						<li class="social-icon-item"><a href="#"
							class="social-icon-link bi-facebook"></a></li>
						<li class="social-icon-item"><a href="#"
							class="social-icon-link bi-instagram"></a></li>
						<li class="social-icon-item"><a href="#"
							class="social-icon-link bi-youtube"></a></li>
						<li class="social-icon-item"><a href="#"
							class="social-icon-link bi-whatsapp"></a></li>
					</ul>
				</div>

				<div class="col-lg-3 col-12 ms-auto d-lg-block d-none">
					<div class="text-end" >

						<c:if test="${!empty sessionScope.ssInfo}">
							
							<a class="ms-auto" href="logout.do" style="color: #FDF5E6;">로그아웃
							</a> |  
							<c:if test="${sessionScope.ssInfo.user_info=='관리자'}">
                          	 <a href="admin.do" style="color: #82745D; ">관리자</a>
                          	</c:if>
							${sessionScope.ssInfo.user_name}님
                		</c:if>

					</div>
				</div>

			</div>
		</div>
	</header>



	<nav
		class="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5 py-lg-0 shadow-lg">
		<div class="container">
			<a class="navbar-brand" href="index.do"> <img
				src="/meomum/images/meomum_logo(bold).png" class="logo img-fluid"
				alt="머뭄로고"> <span> 머물고 싶은<br> 공간을 만듭니다
			</span>
			</a>

			<button type="button" class="navbar-toggler"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarCollapse">
				<div class="navbar-nav mx-auto">
					<a href="index.do" class="nav-item nav-link"> 머뭄 </a> 
					<span style="margin-right: 30px;"></span>
					<a href="reviewList.do" class="nav-item nav-link"> 후기 </a>
					<span style="margin-right: 30px;"></span>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown">정리일상</a>
						<div
							class="dropdown-menu rounded-0 rounded-bottom border-0 shadow-sm m-0">
							<a href="askList.do" class="dropdown-item">간단 견적</a> <a
								href="svc.do" class="dropdown-item">방문 견적</a>
						</div>
					</div>
					<div class="nav-item dropdown">
						<a href="#" class="nav-link dropdown-toggle"
							data-bs-toggle="dropdown">구독 일상</a>
							
						<div
							class="dropdown-menu rounded-0 rounded-bottom border-0 shadow-sm m-0">
							<a href="proList.do" class="dropdown-item">가구 구독</a> <a
								href="svc.do" class="dropdown-item">이용 방법</a>
						</div>
					</div>
					<span style="margin-right: 30px;"></span>
					<a href="ntcList.do" class="nav-item nav-link">공지</a>
				</div>

				<c:if test="${!empty sessionScope.ssInfo}">
					<a href="infoEdit.do" class="position-relative"> <i
						class="bi bi-person-circle" style="font-size: 2em;"></i> <span
						style="margin-right: 15px;"></span>
					</a>

					<a href="proCart.do?user_idx=${sessionScope.ssInfo.user_idx}" class="position-relative"> <i class="bi bi-cart2"
						style="font-size: 2em;"></i> <span
						class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger"
						style="font-size: 0.5em;">${sessionScope.cart}</span>
					</a>

				</c:if>
				<c:if test="${empty sessionScope.ssInfo}">
					<a href="login.do"
						class="btn btn-outline-brown rounded-pill px-3 d-none d-lg-block">로그인<i
						class="bi bi-box-arrow-in-right"></i></a>
				</c:if>

			</div>
		</div>
	</nav>
	

</body>
</html>