<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <!-- CSS FILES -->
 
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <link href="css/bootstrap-icons.css" rel="stylesheet">

    <link href="css/templatemo-kind-heart-charity.css" rel="stylesheet">

	<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Dokdo&family=East+Sea+Dokdo&family=Hi+Melody&family=Nanum+Myeongjo:wght@400;800&family=Poor+Story&family=Single+Day&family=Song+Myung&family=Stylish&family=Sunflower:wght@300&display=swap" rel="stylesheet">



<!-- 고르기
font-family: 'Black Han Sans', sans-serif;
font-family: 'Dokdo', cursive;
font-family: 'East Sea Dokdo', cursive;
font-family: 'Hi Melody', cursive;
font-family: 'Nanum Myeongjo', serif;
font-family: 'Poor Story', cursive;
font-family: 'Single Day', cursive;
font-family: 'Song Myung', serif;
font-family: 'Stylish', sans-serif;
font-family: 'Sunflower', sans-serif;
 -->

<!-- 아이콘 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>
.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 700,
  'GRAD' -25,
  'opsz' 24
}

header nav {
font-family: 'Stylish', sans-serif;
}
</style>

</head>

<body>

    <header class="site-header" id="top">
        <div class="container">
            <div class="row">

                <div class="col-lg-8 col-12 d-flex flex-wrap">
                    <p class="d-flex me-4 mb-0">
                        <i class="bi-geo-alt me-2"></i>
                       소개 넣을까말까
                    </p>

                    <p class="d-flex mb-0">
                        <i class="bi-envelope me-2"></i>

                        <a href="mailto:info@company.com">
                            소개
                        </a>
                    </p>
                </div>

                <div class="col-lg-3 col-12 ms-auto d-lg-block d-none">
                    <ul class="social-icon">
                        <li class="social-icon-item">
                            <a href="#" class="social-icon-link bi-twitter"></a>
                        </li>

                        <li class="social-icon-item">
                            <a href="#" class="social-icon-link bi-facebook"></a>
                        </li>

                        <li class="social-icon-item">
                            <a href="#" class="social-icon-link bi-instagram"></a>
                        </li>

                        <li class="social-icon-item">
                            <a href="#" class="social-icon-link bi-youtube"></a>
                        </li>

                        <li class="social-icon-item">
                            <a href="#" class="social-icon-link bi-whatsapp"></a>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </header>

    <nav class="navbar navbar-expand-lg bg-light shadow-lg">
        <div class="container">
            <a class="navbar-brand" href="index.do">
                <img src="/meomum/images/meomum_logo(bold).png" class="logo img-fluid" alt="머뭄로고">
                <span>
                    머물고 싶은 공간을 만듭니다
                    <small>머뭄</small>
                </span>
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">머뭄</a>
                    </li>

                    <li class="nav-item">
                        <a class="nav-link" href="reviewList.do">후기</a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#"
                            id="navbarLightDropdownMenuLink" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">정리일상</a>

                        <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
                            <li><a class="dropdown-item" href="askList.do">간단 견적</a></li>

                            <li><a class="dropdown-item" href="svc.do">방문 견적</a></li>
                        </ul>
                    </li>
 					<li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#"
                            id="navbarLightDropdownMenuLink" role="button" data-bs-toggle="dropdown"
                            aria-expanded="false">구독일상</a>

                        <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
                            <li><a class="dropdown-item" href="proList.do">가구 구독</a></li>

                            <li><a class="dropdown-item" href="#">이용 방법</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="ntcList.do">공지</a>
                    </li>

                    <li class="nav-item ms-3">
		                  <li class="nav-item dropdown">
							<c:if test="${!empty sessionScope.ssInfo}">
		                      <a class="bi bi-person-circle display-6 bs-warning-bg-subtle" href="infoEdit.do"></a>
		                        <ul class="dropdown-menu dropdown-menu-light" aria-labelledby="navbarLightDropdownMenuLink">
		                            <li><a class="dropdown-item " href="logout.do">로그아웃 <span class="material-symbols-outlined">login</span></a>
                 				     <li><a class="dropdown-item" href="#">장바구니</a></li>
		                        </ul>
		                        </c:if>
		                        <c:if test="${empty sessionScope.ssInfo}">
		                        <a class="bi bi-person-circle display-6 bs-warning-bg-subtle" href="login.do"></a>
		                        </c:if>
		                    </li>
 
                </ul>
            </div>
        </div>
    </nav>
	


</body>
</html>