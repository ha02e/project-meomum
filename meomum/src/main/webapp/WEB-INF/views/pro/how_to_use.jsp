<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머뭄 이용방법</title>

<style type="text/css">
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://images.unsplash.com/photo-1507138451611-3001135909fa?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80)
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
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>


		<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">이용방법</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<div class="container" style=" margin-bottom: 20px; margin-top: 20px;">
		<div class="row justify-content-center">
			<div class="col-md-9">
				<div class="row">
				<img src="/meomum/images/meomum_how_to_use02.png">
				<img src="/meomum/images/meomum_how_to_use01.png">
				</div>
			</div>
		</div>
	</div>
			
	<%@include file="/WEB-INF/views/footer.jsp"%>
	
	
</body>
</html>