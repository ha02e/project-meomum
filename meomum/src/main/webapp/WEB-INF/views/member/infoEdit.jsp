<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의정보수정</title>
<!-- 사이드바용 css 시작-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 사이드바용 css 끝 -->


<style>
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://cdn.aitimes.com/news/photo/202210/147215_155199_1614.jpg)
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

/**마이페이지 사이드바 css*/
.col-auto {
	margin: 0 0 10px 0;
}

.app-content {
	margin: 0 20px;
	padding: 0 20px;
}

.app-card {
	border: 1px solid #eeeeee;
}

.notification-title {
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

.action-link:hover {
	color: #000000;
}

.app-btn-secondary {
	
}

.nav-tabs {
	border-bottom: none;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	justify-content: center;
	position: relative;
	margin-bottom: 20px;
}
/**사이드바css 끝 */
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<!-- 헤더 이미지 시작 -->
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
	<!-- 헤더 이미지 끝 -->

	<section class="shop spad">
	<div class="container">
	<div class="row">
		<%@include file="../myMenu.jsp"%> 
		<div class="col-xl-9 col-md-9">
							<div class="row justify-content-center">
								<div class="card">
									<div class="card-body">
										<h4 class="card-title mb-4 text-center">나의 정보 수정</h4>
										<form>
											<div class="form-group">
												<label for="user_name">아이디</label> <input type="text"
													class="form-control" id="user_id"
													value="${sessionScope.userinfo.user_id}"
													readonly="readonly"> <label for="user_name">이름</label>
												<input type="text" class="form-control" id="user_name"
													value="${sessionScope.userinfo.user_name}"> <label
													for="user_name">우편번호</label> <input type="text"
													class="form-control" id="user_name"
													value="${sessionScope.userinfo.user_addr}"> <label
													for="user_name">기본주소</label> <input type="text"
													class="form-control" id="user_name"
													value="${sessionScope.userinfo.user_addr}"> <label
													for="user_name">상세주소</label> <input type="text"
													class="form-control" id="user_name"
													value="${sessionScope.userinfo.user_name}"> <label
													for="user_name">이름</label> <input type="text"
													class="form-control" id="user_name"
													value="${sessionScope.userinfo.user_name}"> <label
													for="user_name">이름</label> <input type="text"
													class="form-control" id="user_name"
													value="${sessionScope.userinfo.user_name}">

											</div>
											<button type="submit" class="btn btn-primary mt-4">수정하기</button>
										</form>
									</div>

								</div>



							</div>
						</div>
						<!-- 본문 작성 끝 -->

			</div>
		</div>
	</section>

	<%@include file="../footer.jsp"%>

</body>
</html>