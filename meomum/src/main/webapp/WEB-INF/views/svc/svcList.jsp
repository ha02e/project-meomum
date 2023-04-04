<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 사이드바용 css 시작-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 사이드바용 css 끝 -->
</head>

<body>
<%@include file="/WEB-INF/views/header.jsp"%>
<%@include file="/WEB-INF/views/myMenu.jsp"%>
<c:if test="${empty list}">
	<div class="card">
	 방문 견적 예약 내역이 없습니다
	</div>
</c:if>
<c:forEach var="list" items="${list}">
	<div class="card">
		<div class="card-header">
			<h5>${list.svc_state}</h5>
		</div>
		<div class="card-body">
			<p class="card-text">
				<c:url var="contentUrl" value="svcContent.do">
					<c:param name="user_idx">${sessionScope.ssInfo.user_idx}</c:param>
				</c:url>
			<a href="contentUrl">예약번호:${list.svc_idx}</a>
			</p>
			<p class="card-text">방문 예약 일시:${list.svc_days}</p>
			<div class="float-right">
				<a href="#" class="btn btn-primary">예약 수정</a> 
				<a href="#" class="btn btn-dark">예약 취소</a>
			</div>
		</div>
	</div>
</c:forEach>
<!-- 

<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  모달 열기
</button>


<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">모달 제목</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        모달 내용<br>
        모달 내용<br>
        모달 내용<br>
        모달 내용<br>
        모달 내용<br>
        모달 내용<br>
        모달 내용<br>
        모달 내용<br>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>
 -->

<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>