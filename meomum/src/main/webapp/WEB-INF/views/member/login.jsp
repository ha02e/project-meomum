<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머뭄 로그인 페이지</title>
<script type="text/javascript" src="/meomum/js/request.js"></script>

<script type="text/javascript">

	function findID() {
		var input_name = document.getElementById("input_name").value;
		var input_tel = document.getElementById("input_tel").value;

		if (!input_name || input_name.length < 2) {
			alert('이름을 입력해주세요.');
			return;
		}
		if (!input_tel || !/^01([0|1|6|7|8|9]?)-\d{3,4}-\d{4}$/.test(input_tel)) {
			alert(' - 를 포함한 올바른 휴대폰 번호를 입력해주세요.\n (ex.010-1234-5678)');
			return;
		}

		var param = 'input_name=' + input_name + '&input_tel=' + input_tel;
		sendRequest('findId.do', param, 'POST', findIDResult);

	}

	function findIDResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var user_id = JSON.parse(data).user_id;
				if (user_id) { // user_id 값이 있을 경우
					$('#idFindModal').modal('toggle');
					$('.modal-backdrop').remove();

					$('#showID').modal('toggle');
					$('#userIdSpan').text(user_id);

				} else { // user_id 값이 없을 경우

					alert("입력하신 정보와 일치하는 회원 아이디가 없습니다.");

				}
			} else {
				alert('아이디를 찾을 수 없습니다. \n고객센터로 연락바랍니다.');
			}
		}
	}

	function closeModal(id) {
		$(id).modal('hide');
	}

	function findpwd() {
		var inputp_name = document.getElementById("inputp_name").value;
		var inputp_tel = document.getElementById("inputp_tel").value;
		var inputp_id = document.getElementById("inputp_id").value;

		if (!inputp_name || inputp_name.length < 2) {
			alert('올바른 이름을 입력해주세요.');
			return;
		}
		if (!inputp_tel
				|| !/^01([0|1|6|7|8|9]?)-\d{3,4}-\d{4}$/.test(inputp_tel)) {
			alert(' - 를 포함한 올바른 휴대폰 번호를 입력해주세요.\n (ex.010-1234-5678)');
			return;
		}
		if (!inputp_id
				|| !/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
						.test(inputp_id)) {
			alert('올바른 이메일 주소를 입력해주세요.');
			return;
		}

		var param = 'input_name=' + inputp_name + '&input_tel=' + inputp_tel
				+ '&input_id=' + inputp_id;
		
		
		sendRequest('findPWD.do', param, 'POST', findPWDResult);
		
		  document.getElementById("mail-Check-Btn").innerHTML = "전송중...";
          document.getElementById("mail-Check-Btn").disabled = true;
	}
	
	var user_idx;
	function findPWDResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var user_idx = JSON.parse(data).user_idx;
				var user_id = JSON.parse(data).user_id;
				if (user_idx) { // user_idx 값이 있을 경우
					if (user_idx) {
					    if (confirm(
					    	'기존의 비밀번호는 초기화 되며 임시비밀번호가 메일로 전송됩니다.\n임시 비밀번호로 로그인 후 비밀번호 변경을 해주시기 바랍니다. \n\n임시 비밀번호를 발급하시겠습니까?')) {
					       
					    	changePWD(user_id, user_idx);
				
					    }else{
					    	location.reload();
					    }
					}
				} else { // user_idx 값이 없을 경우
					alert("입력하신 정보와 일치하는 회원이 없습니다.");

				}
			} else {
				alert('전송에 실패하였습니다.');
			}
		}
	}

	function changePWD(user_id, user_idx) {

		var param = 'user_idx=' + user_idx + '&user_id=' + user_id;
		sendRequest('pwdChangeEmail.do', param, 'POST', pwdChange);

	}

	function pwdChange() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var msg = JSON.parse(data).msg;
				alert(msg);
				location.reload();
			} else {
				alert('임시비밀번호 발급 전송에 실패하였습니다.');
	            document.getElementById("mail-Check-Btn").innerHTML = "확인";
	            document.getElementById("mail-Check-Btn").disabled = false;
			}
		}
	}
</script>
<style type="text/css">
.section a{
font-size : 18px;
color : black;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>

	<div class="section">
	<div class="container" style="margin-bottom: 50px; margin-top: 50px;">
		<div class="row justify-content-center">
			<div class="col-lg-6">

				<div class="card border-0">

					<div class="card-header bg-white pt-4 pb-4 text-center">
						<h2 class="mb-3 text-center">로그인</h2>

					</div>

					<div class="card-body my-3">
						<form name="login" action="login.do" method="post">

							<div class="form-group">
								<input type="text" name="input_id" id="user_id"
									value="${cookie.saveid.value}" class="form-control"
									placeholder="이메일">
							</div>

							<div class="form-group">
								<input type="password" name="input_pwd" id="user_pwd"
									class="form-control" placeholder="비밀번호">
							</div>

							<div class="form-check mb-3 my-3">
								<input type="checkbox" name="saveid" value="ok"
									class="form-check-input"
									${empty cookie.saveid.value?'':'checked'}> <label
									class="form-check-label">아이디 기억하기</label>
							</div>
							<div class="d-grid gap-2">
								<button type="submit" class="btn btn-primary btn-block btn-lg">로그인</button>
							</div>

						</form>
					</div>

					<div class="card-footer bg-white pt-4 pb-4 text-center">
						<div class="mb-3">
							<a href="memberJoin.do">회원가입</a> <span class="mx-2">|</span> <a
								href="#" data-bs-toggle="modal" data-bs-target="#idFindModal">아이디 찾기</a>
							<span class="mx-2">|</span> <a href="#" data-bs-toggle="modal"
								data-bs-target="#passwordFindModal">비밀번호 찾기</a>
						</div>
						<div >
							<div>
								<label >- 간편 로그인 -</label>
							</div>
							<div>
								<a class="p-2" title="카카오에 등록된 이메일로 로그인 할 수 있습니다."
									href="https://kauth.kakao.com/oauth/authorize?client_id=f9f8f92fec61a14408e68cf856744293&redirect_uri=http://localhost:9090/meomum/kakao_login.do&response_type=code">
									<img src="/meomum/images/icon/kakao_login_medium_narrow.png">
								</a>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>

<!-- --------------------모달창----------------------------------- -->
	<!-- 회원 아이디찾기시작 -->
	<div class="modal fade" id="idFindModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5 ">아이디 찾기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<form>
						<div class="form-group my-3">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="input_name" name="input_name"
								placeholder="이름을 입력해주세요." required="required">
						</div>
						<div class="form-group my-3">
							<label for="user_tel">휴대폰 번호</label> <input type="tel"
								class="form-control" id="input_tel" name="input_tel"
								pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}"
								placeholder="휴대폰 번호 (ex. 010-1234-5678)" required="required">
						</div>

					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" onclick="location.reload();">닫기</button>
					<button type="button" class="btn btn-primary" onclick="findID()">확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원 아이디찾기 끝 -->
	<!-- 회원 아이디 안내 -->
	<div class="modal fade" id="showID" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5 ">아이디 찾기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<p>
						회원님의 아이디는 <span id="userIdSpan"
							style="font-weight: bold; font-size: 1.2rem;"></span> 입니다.
					</p>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" onclick="location.reload();">닫기</button>

					<button type="button" class="btn btn-primary"
						data-bs-toggle="modal" data-bs-target="#passwordFindModal"
						onclick="$('#passwordFindModal').find('#inputp_id').val($('#userIdSpan').text())">비밀번호
						찾기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원 아이디찾기 끝 -->
	<!-- 회원 비밀번호 찾기 시작 -->
	<div class="modal fade" id="passwordFindModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5 ">비밀번호 찾기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group my-3">
							<label for="email">아이디</label> <input type="email"
								class="form-control" id="inputp_id" name="inputp_id"
								placeholder="이메일(ex. abc@a.a)" required="required">
						</div>
						<div class="form-group my-3">
							<label for="input_name">이름</label> <input type="text"
								class="form-control" id="inputp_name" name="inputp_name"
								placeholder="이름을 입력해주세요." required="required">
						</div>
						<div class="form-group my-3">
							<label for="input_tel">휴대폰 번호</label> <input type="tel"
								class="form-control" id="inputp_tel" name="inputp_tel"
								pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}"
								placeholder="휴대폰 번호 (ex. 010-1234-5678)" required="required">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal" onclick="location.reload();">닫기</button>
					<button type="button" class="btn btn-primary" onclick="findpwd()" id="mail-Check-Btn">비밀번호 초기화</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원 비밀번호 찾기 끝 -->
	
	</div>
	<%@include file="/WEB-INF/views/footer.jsp"%>

</body>

</html>