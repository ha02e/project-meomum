<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간단문의</title>

<style>

/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://img.kr.news.samsung.com/kr/wp-content/uploads/2018/05/0510-white-1.jpg)
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

function ask_ok() {
    const enteredPassword = document.getElementById('password-input').value;
    $.ajax({
        url: 'getPassword.do',
        data: {
            ask_idx: ask_idx // ask_no로 수정
        },
        type: 'POST',
        success: function (result) {
            if (enteredPassword == result.pwd) {
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
                alert('비밀번호가 일치하지 않습니다.');
                $('#myModal').modal('hide');
            }
        },
        error: function () {
            alert('오류가 발생했습니다.');
            $('#myModal').modal('hide');
        }
    });
}

function close_modal(){
    $('#myModal').modal('hide');

}
</script>



</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>

	<!-- 헤더 이미지 넣을때 css도 가져갈것...  -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">간단 견적 문의</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 본문 시작 -->
	<div class="container " style="overflow: auto;">
		<div class="row justify-content-center">
			<div class="col-10">
				<div class="d-flex justify-content-between align-items-center mb-3">
					<p class="mb-0">
						전체 글 수: <span id="total-users">${totalCnt}</span>개
					</p>
					<form name="searchask" action="askList.do">
						<div class="input-group">
							<input type="hidden" name="type" value="yes"> <input
								type="text" class="form-control" placeholder="검색 내용"
								name="fvalue">
							<button class="btn btn-primary" type="submit">검색</button>
						</div>
					</form>
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
			<!-- 본문끝 -->
		</div>
	</div>

	<!-- 모달창시작 -->
	<div class="modal fade" id="myModal" tabindex="-1"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content text-center">
				<div class="modal-header">
					<h5 class="modal-title text-center" id="myModalLabel"
						style="color: black;">간단견적문의</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="mb-3">
							<p class="text-center">
								작성자 본인만 글을 확인할 수 있습니다. <br>게시글 작성시 입력한 비밀번호를 입력해주세요.
							</p>
							<label for="password-input" class="form-label">비밀번호</label> <input
								type="password" class="form-control" id="password-input">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="password-submit"
						onclick="ask_ok()">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 모달창 끝 -->



	<%@include file="/WEB-INF/views/footer.jsp"%>



</body>

</html>