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

<!--주소 검색 api -->
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/meomum/js/request.js"></script>
<!--  -->
<style>
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://images.unsplash.com/photo-1519974719765-e6559eac2575?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80)
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
</style>

<script type="text/javascript">

let ask_idx;

function ask_click(clicked_idx, ask_userIdx) {

    ask_idx = clicked_idx; // ask_idx 변수를 전역 변수로 할당

    if (ask_userIdx == ${sessionScope.ssInfo.user_idx == null ? 0 : sessionScope.ssInfo.user_idx} && ask_userIdx != 0) {
        const form = document.createElement('form');
        form.method = 'POST';
        form.action = 'askContent.do';

        const askIdxInput = document.createElement('input');
        askIdxInput.type = 'hidden';
        askIdxInput.name = 'ask_idx';
        askIdxInput.value = ask_idx;
        form.appendChild(askIdxInput);

        const askOkInput = document.createElement('input');
        askOkInput.type = 'hidden';
        askOkInput.name = 'ask_ok';
        askOkInput.value = 'OK';
        form.appendChild(askOkInput);

        document.body.appendChild(form);
        form.submit();
    } else {
        $('#myModal').modal('show');
    }
}
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	<!-- 헤더 이미지 시작 -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">간단 견적 문의 내역</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 헤더 이미지 끝 -->
	<!-- 본문 시작 -->
		<section class="shop spad">
		<div class="container">
			<div class="row">
				<%@include file="../myMenu.jsp"%>
				<div class="col-xl-9 col-md-9">
					<div class="row justify-content-center">
					<p class="mb-0">
					작성 글 수: <span id="total-users">${totalCnt}</span>개
					</p>
				</div>
				<div class="table-responsive">
					<table class="table table-striped table-hover table-sm text-center">
						<thead>
							<tr>
								<th scope="col" style="width: 10%;">No.</th>
								<th scope="col" style="width: 45%;text-align:left;">제목</th>
								<th scope="col" style="width: 15%;">작성자</th>
								<th scope="col" style="width: 15%;">진행상태</th>
								<th scope="col" style="width: 15%;">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${empty lists}">
								<tr>
									<td colspan="5" class="text-center">등록된 글이 없습니다.</td>
								</tr>
							</c:if>
							<c:forEach var="ask" items="${lists}">
								<tr>
									<td>${ask.ask_idx}</td>
									<td align="left">

										<p onclick="ask_click(${ask.ask_idx}, ${ask.user_idx })">
											${ask.ask_title}
											<c:if test="${ask.newicon}">
												<img src="/meomum/images/icon/icon_new.png" alt="new"
													style="">
											</c:if>
										</p>
									</td>
									<td>${ask.ask_writer}</td>
									<td><c:if test="${ask.ask_ask>0}">
											<button type="button"
												class="btn btn-success btn-sm align-middle disabled">답변완료</button>
										</c:if> <c:if test="${ask.ask_ask==0}">
											<button type="button"
												class="btn btn-outline-danger btn-sm align-middle disabled">진행중</button>
										</c:if></td>

									<td>${ask.ask_date}</td>

								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<nav class="d-flex justify-content-between align-items-center">
					<div
						class="col-10 justify-content-center align-items-start text-center">
						<span class="pagination pagination-sm justify-content-center">
							${pageStr} </span>
					</div>
					<div class="col-auto">
						<a href="askWrite.do" class="btn btn-primary">글쓰기</a>
					</div>
				</nav>
			</div>
		</div>
	</div>
</section>

	<%@include file="/WEB-INF/views/footer.jsp"%>



</body>

</html>