<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../header.jsp"%>
	<h1>방문 견적 예약</h1>
	<form>
		<h3>예약 정보</h3>
		<ul>
			<li>예약번호: ${dto.svc_idx}</li>

			<c:if test="${dto.svc_state ne '예약취소'}">
			방문 예약 일시:${dto.svc_days}&nbsp;|&nbsp;${dto.svc_time}
			</c:if>
			<c:if test="${dto.svc_state eq '예약취소'}">
			방문 예약 일시:${dto.svc_days.substring(1)} | ${dto.svc_time.substring(1)}
			</c:if>

			<li>지역: ${dto.user_addr} ${dto.user_detail}</li>

			<li>거주형태: ${dto.svc_type}</li>

			<li>서비스 영역: ${dto.svc_area}</li>

			<li>거주 평수(공급면적): ${dto.svc_py}</li>

			<li>요청사항<br> ${dto.svc_req}
			</li>
			<hr>
			<h3>예약자 정보</h3>

			<li>성함: ${dto.user_name}</li>

			<li>휴대전화: ${dto.user_tel}</li>

		</ul>

		<div class="float-right">
			<c:if test="${dto.svc_state eq '예약취소'}">
				<a href="svc.do" class="btn btn-primary">재예약</a>
			</c:if>
			<c:if test="${dto.svc_state eq '예약확정'}">
				<c:url var="updateUrl" value="svcUpdateForm.do">
					<c:param name="svc_idx">${dto.svc_idx}</c:param>
				</c:url>
				<a href="${updateUrl}" class="btn btn-primary">예약 수정</a>
				<c:url var="deleteUrl" value="svcDelete.do">
					<c:param name="svc_idx">${dto.svc_idx}</c:param>
				</c:url>
				<a href="${deleteUrl}" class="btn btn-dark">예약 취소</a>
			</c:if>

		</div>
	</form>
	<%@include file="../footer.jsp"%>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
</body>
</html>