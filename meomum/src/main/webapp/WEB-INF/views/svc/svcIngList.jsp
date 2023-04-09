<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
.card{
 	margin: 0 0 20px 0;
}
</style>

</head>

<body>
	<%@include file="../header.jsp"%>
	<section>
		<div class="container">
			<div class="row">
				<%@include file="../myMenu.jsp"%>
				<div class="col-xl-9 col-md-9">
					<c:if test="${empty list}">
						<div class="card">
							<div class="card-body">정리일상 이용 내역이 없습니다</div>
						</div>	
					</c:if>
					<c:forEach var="list" items="${list}">
						<div class="card">
							<div class="card-header">
								<h5>${list.pay_state}</h5>
							</div>
							<div class="card-body">
								<p class="card-text">
									<c:url var="contentUrl" value="svcIngContent.do">
										<c:param name="svc_idx">${list.svc_idx}</c:param>
									</c:url>
									<a href="${contentUrl}">예약번호:${list.svc_idx}</a>
								</p>
								<p class="card-text">
									서비스일: ${list.svc_datetime}
								</p>
								<p class="card-text">
									결제금액: ${list.total}원
								</p>
<%-- 								<c:if test="${list.svc_state ne '예약취소'}">
								방문 예약 일시:${list.svc_days}&nbsp;|&nbsp;${list.svc_time}
								</c:if>
								<c:if test="${list.svc_state eq '예약취소'}">
								방문 예약 일시:${list.svc_days.substring(1)} | ${list.svc_time.substring(1)}
								</c:if>
								</p> --%>
							</div>
						</div>
					</c:forEach>
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