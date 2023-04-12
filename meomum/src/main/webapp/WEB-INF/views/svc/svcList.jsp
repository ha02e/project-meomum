<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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


<style>
.title {
	text-align: center;
	font-weight: bold;
	margin-bottom: 30px;
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

.card {
	margin: 0 0 20px 0;
}

footer {
	margin-top: 20px;
}
</style>

</head>

<body>
	<%@include file="../header.jsp"%>
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
	<section>
		<div class="container">
			<div class="row">
				<%@include file="../myMenu.jsp"%>
				<div class="col-xl-9 col-md-9">
					<c:if test="${empty list}">
						<div class="card">
							<div class="card-body">방문 견적 예약 내역이 없습니다</div>
						</div>
					</c:if>
					<c:forEach var="list" items="${list}">
						<div class="card mb-3">
							<div class="card-header bg-secondary text-white">
								<h5>${list.svc_state}</h5>
							</div>
							<div class="card-body">
								<p class="card-text">
									<c:url var="contentUrl" value="svcContent.do">
										<c:param name="svc_idx">${list.svc_idx}</c:param>
									</c:url>
									<a href="${contentUrl}"
										class="text-decoration-none text-primary">예약번호:
										${list.svc_idx}</a>
								</p>
								<p class="card-text">
									<c:if test="${list.svc_state ne '예약취소'}">
                                방문 예약 일시: ${list.svc_days}&nbsp;|&nbsp;${list.svc_time}
                            </c:if>
									<c:if test="${list.svc_state eq '예약취소'}">
                                방문 예약 일시: ${list.svc_days.substring(1)} | ${list.svc_time.substring(1)}
                            </c:if>
								</p>
							</div>
						</div>
					</c:forEach>
				   <div class="container-xl paging">
             		<nav aria-label="Page navigation example">
                  		<ul class="pagination pagination-sm justify-content-center"> ${pageStr}</ul>
               		</nav>
            		</div>			
				</div>
			</div>
		</div>


	</section>
	<%@include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>