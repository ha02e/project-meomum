<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
	
<head>
<style>
@font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
}
*{

    font-family: 'Pretendard-Regular';
}

@font-face {
    font-family: 'TheJamsil5Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302_01@1.0/TheJamsil5Bold.woff2') format('woff2');
    font-weight: 700;
    font-style: normal;
}
h1, h2, h3{
 font-family: 'TheJamsil5Bold';
}


</style>
<!-- App CSS -->
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">


<!-- 구글 아이콘 -->

</head>
<body>
<header class="app-header fixed-top">	            
	<div class="app-header-inner">  
	<div class="container-fluid py-2">
	
		<div class="app-header-content"> 
			<div class="row justify-content-between align-items-center">
				<div class="col-auto">
					<a id="sidepanel-toggler" class="sidepanel-toggler d-inline-block d-xl-none" href="#">
						<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 30 30" role="img"><title>Menu</title><path stroke="currentColor" stroke-linecap="round" stroke-miterlimit="10" stroke-width="2" d="M4 7h22M4 15h22M4 23h22"></path></svg>
					</a>
			
				</div><!--//col-->
				
				<div class="app-utilities col-auto">
					
				
					<!-- 계정 --> 
					<div class="app-utility-item app-user-dropdown dropdown">
						<a class="dropdown-toggle" id="user-dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">
							<span class="admin-name">${sessionScope.ssInfo.user_name} 님</span>
						</a>
				            <ul class="dropdown-menu" aria-labelledby="user-dropdown-toggle">
								<li><a class="dropdown-item" href="index.do">머뭄 홈페이지

								</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="logout.do">로그아웃</a></li>
							</ul>
			            </div><!--//app-user-dropdown--> 
		            </div><!--//app-utilities-->
		        </div><!--//row-->
		</div><!--//app-header-content-->
	</div><!--//container-fluid-->
	</div><!--//app-header-inner-->
        
        
	<div id="app-sidepanel" class="app-sidepanel"> 
		<div id="sidepanel-drop" class="sidepanel-drop"></div>
		<div class="sidepanel-inner d-flex flex-column">
		
			<a href="#" id="sidepanel-close" class="sidepanel-close d-xl-none">&times;</a>
			<div class="app-branding">
				<a class="app-logo" href="admin.do">
					<img class="logo-icon me-2" src="images/meomum_logo(bold).png" alt="logo">
				</a>
			</div><!--//app-branding-->  
		        
			<nav id="app-nav-main" class="app-nav app-nav-main flex-grow-1">
				<ul class="app-menu list-unstyled accordion" id="menu-accordion">
					<li class="nav-item">
					<!--//Bootstrap Icons: https://icons.getbootstrap.com/ -->
						<a class="nav-link" href="admin.do">
							<span class="nav-icon">
						        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-bar-chart-line" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
								  <path fill-rule="evenodd" d="M11 2a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v12h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1v-3a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3h1V7a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v7h1V2zm1 12h2V2h-2v12zm-3 0V7H7v7h2zm-5 0v-3H2v3h2z"/>
								</svg>
							</span>
							<span class="nav-link-text">대시보드</span>
						</a><!--//nav-link-->
					</li><!--//nav-item-->
				
					<li class="nav-item has-submenu">
					<!--//Bootstrap Icons: https://icons.getbootstrap.com/ -->
						<a class="nav-link" href="#"data-bs-toggle="collapse" data-bs-target="#submenu-0" aria-expanded="false" aria-controls="submenu-0">
							<span class="nav-icon">
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-gear" viewBox="0 0 16 16">
								  <path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0ZM8 7a2 2 0 1 0 0-4 2 2 0 0 0 0 4Zm.256 7a4.474 4.474 0 0 1-.229-1.004H3c.001-.246.154-.986.832-1.664C4.484 10.68 5.711 10 8 10c.26 0 .507.009.74.025.226-.341.496-.65.804-.918C9.077 9.038 8.564 9 8 9c-5 0-6 3-6 4s1 1 1 1h5.256Zm3.63-4.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382l.045-.148ZM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0Z"/>
								</svg>
							</span>
							<span class="nav-link-text">회원 관리</span>
							<span class="submenu-arrow">
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-down" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
								</svg>
							</span><!--//submenu-arrow-->
							
						</a><!--//nav-link-->
						<div id="submenu-0" class="collapse submenu submenu-0" data-bs-parent="#menu-accordion">
							<ul class="submenu-list list-unstyled">
								<li class="submenu-item"><a class="submenu-link" href="menMan.do">회원 관리</a></li>
								<li class="submenu-item"><a class="submenu-link" href="managerList.do">관리자 관리</a></li>
							</ul>
						</div>
					</li><!--//nav-item-->
					
					<li class="nav-item has-submenu">
					<!--//Bootstrap Icons: https://icons.getbootstrap.com/ -->
						<a class="nav-link submenu-toggle" href="#" data-bs-toggle="collapse" data-bs-target="#submenu-1" aria-expanded="false" aria-controls="submenu-1">
							<span class="nav-icon">
							<!--//Bootstrap Icons: https://icons.getbootstrap.com/ -->
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box2-heart" viewBox="0 0 16 16">
								  <path d="M8 7.982C9.664 6.309 13.825 9.236 8 13 2.175 9.236 6.336 6.31 8 7.982Z"/>
								  <path d="M3.75 0a1 1 0 0 0-.8.4L.1 4.2a.5.5 0 0 0-.1.3V15a1 1 0 0 0 1 1h14a1 1 0 0 0 1-1V4.5a.5.5 0 0 0-.1-.3L13.05.4a1 1 0 0 0-.8-.4h-8.5Zm0 1H7.5v3h-6l2.25-3ZM8.5 4V1h3.75l2.25 3h-6ZM15 5v10H1V5h14Z"/>
								</svg>
							</span>
							<span class="nav-link-text">정리일상 관리</span>
							<span class="submenu-arrow">
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-down" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
								</svg>
							</span><!--//submenu-arrow-->
						</a><!--//nav-link-->
						<div id="submenu-1" class="collapse submenu submenu-1" data-bs-parent="#menu-accordion">
							<ul class="submenu-list list-unstyled">
								<li class="submenu-item"><a class="submenu-link" href="svcCalendar.do">전체 스케줄</a></li>
								<li class="submenu-item"><a class="submenu-link" href="asvcList.do">방문 견적 예약</a></li>
								<li class="submenu-item"><a class="submenu-link" href="askList_a.do">간단 견적 문의</a></li>
							</ul>
						</div>
					</li><!--//nav-item-->
					
					<li class="nav-item has-submenu">
						<!--//Bootstrap Icons: https://icons.getbootstrap.com/ -->
						<a class="nav-link submenu-toggle" href="#" data-bs-toggle="collapse" data-bs-target="#submenu-2" aria-expanded="false" aria-controls="submenu-2">
							<span class="nav-icon">
							<!--//Bootstrap Icons: https://icons.getbootstrap.com/ -->
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-basket3" viewBox="0 0 16 16">
									<path d="M5.757 1.071a.5.5 0 0 1 .172.686L3.383 6h9.234L10.07 1.757a.5.5 0 1 1 .858-.514L13.783 6H15.5a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5H.5a.5.5 0 0 1-.5-.5v-1A.5.5 0 0 1 .5 6h1.717L5.07 1.243a.5.5 0 0 1 .686-.172zM3.394 15l-1.48-6h-.97l1.525 6.426a.75.75 0 0 0 .729.574h9.606a.75.75 0 0 0 .73-.574L15.056 9h-.972l-1.479 6h-9.21z"/>
								</svg>
							</span>
							<span class="nav-link-text">구독일상 관리</span>
							<span class="submenu-arrow">
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-down" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
								</svg>
							</span><!--//submenu-arrow-->
						</a><!--//nav-link-->
					        <div id="submenu-2" class="collapse submenu submenu-2" data-bs-parent="#menu-accordion">
						        <ul class="submenu-list list-unstyled">
							        <li class="submenu-item"><a class="submenu-link" href="proAdmin.do">상품 관리</a></li>
							        <li class="submenu-item"><a class="submenu-link" href="proAmount_a.do">상품 재고 관리</a></li>
							        <li class="submenu-item"><a class="submenu-link" href="orderReport_a.do">주문/배송 내역</a></li>
							        <li class="submenu-item"><a class="submenu-link" href="returnProList_a.do">구독 반납 내역</a></li>
						        </ul>
					        </div>
					    </li><!--//nav-item-->

					<li class="nav-item has-submenu">
					<!--//Bootstrap Icons: https://icons.getbootstrap.com/ -->
						<a class="nav-link submenu-toggle" href="#" data-bs-toggle="collapse" data-bs-target="#submenu-3" aria-expanded="false" aria-controls="submenu-3">
							<span class="nav-icon">
							<!--//Bootstrap Icons: https://icons.getbootstrap.com/ -->
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
									<path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
									<path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
								</svg>
							</span>
							<span class="nav-link-text">콘텐츠 관리</span>
							<span class="submenu-arrow">
								<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-chevron-down" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
									<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z"/>
								</svg>
							</span><!--//submenu-arrow-->
						</a><!--//nav-link-->
						<div id="submenu-3" class="collapse submenu submenu-3" data-bs-parent="#menu-accordion">
							<ul class="submenu-list list-unstyled">
								<li class="submenu-item"><a class="submenu-link" href="ntcList_a.do">공지사항/FAQ 관리</a></li>
								<li class="submenu-item"><a class="submenu-link" href="reviewList_a.do">후기 관리</a></li>
							</ul>
						</div>
					</li><!--//nav-item-->
					    				    
				</ul><!--//app-menu-->
			</nav><!--//app-nav-->
			
		</div><!--//sidepanel-inner-->
	    </div><!--//app-sidepanel-->
</header><!--//app-header-->
</body>
