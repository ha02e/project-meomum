<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 포인트 내역</title>
<!-- 사이드바용 css 시작-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 사이드바용 css 끝 -->
<style>
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://images.unsplash.com/photo-1516053256215-94022213b13c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80)
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

/**헤더 이미지용 끝*/
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
						<h2 class="page-title">나의 포인트 내역</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 헤더 이미지 끝 -->
	<div class="container" style="overflow: auto; margin-bottom: 20px; margin-top: 20px;">
			<div class="row" style="overflow: auto; margin-bottom: 20px; margin-top: 20px;">
				<%@include file="../myMenu.jsp"%>
				<div class="col-xl-9 col-md-9">
					<div class="row justify-content-center  my-3">
						<div class="text-center">
						현재 고객님의 총 포인트는 
						<span style="color:red; font-size :18px;"><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${totalPoint}" /></span>점 입니다.
												</div>
						<div class="table-responsive my-3 ">
					<table class="table table-striped table-hover table-sm text-center">
						<thead>
							<tr>
								<th scope="col" style="width: 15%;">No.</th>
								<th scope="col" style="width: 15%;">날짜</th>
								<th scope="col" style="width: 25%;">내용</th>
								<th scope="col" style="width: 15%;">금액</th>
								<th scope="col" style="width: 15%;">사용/적립</th>
								<th scope="col" style="width: 15%;">합계</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty lists}">
								<tr>
									<td colspan="6">
									포인트 내역이 없습니다. 
									</td>
								</tr>
							</c:if>
							<c:forEach var="point" items="${lists}">
							<tr>
							<td>${point.rnum }</td>
							<td>${point.point_usedate}</td>
							<td>${point.point_info}</td>
							<td>${point.point_changed} 점</td>
							<td>${point.point_type}</td>
							<td >
							<span style="color:red;"><fmt:formatNumber type="number" maxFractionDigits="3"
												value="${point.point_sum}" /></span> 점</td>
							
						
							
						</c:forEach>
						</tbody>
					</table>
				</div>
				<div>

					<div>
						<span class="pagination pagination-sm justify-content-center">
							${pageStr} </span>
					</div>
	




						
					</div>
				</div>
			</div>
		</div>
</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>