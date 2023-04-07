<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머뭄 로그인 페이지</title>
<script type="text/javascript" src="/meomum/js/request.js"></script>
<script type="text/javascript">
function findID(){
	var input_name = document.getElementById("input_name").value;
	var input_tel = document.getElementById("input_tel").value;

	var param = 'input_name='+input_name+'&input_tel='+input_tel;
	sendRequest('findId.do',param,'POST',findIDResult);
	
}
function findIDResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			var user_id = JSON.parse(data).user_id;
			if(user_id){ // user_id 값이 있을 경우
			    $('#idFindModal').modal('toggle');
			    $('#showID').modal('toggle');
			    $('#userIdSpan').text(user_id);
				
		      }else{ // user_id 값이 없을 경우
		        alert("입력하신 정보와 일치하는 회원 아이디가 없습니다.");
		      }
		}else{
		alert('전송에 실패하였습니다.');
		}
	}
}



function findpwd(){
	var name = document.fm.name.value;
	var param = 'name='+name;
	sendRequest('test.jsp',param,'GET',showResult);
}
function showResult(){
	if(XHR.readyState==4){
		if(XHR.status==200){
			var data = XHR.responseText;
			alert(data);
		}
	}
}
</script>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-lg-6">

				<div class="card border-0">

					<div class="card-header bg-white pt-4 pb-4 text-center">
						<h4>로그인</h4>
					</div>

					<div class="card-body">
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

							<div class="form-check mb-3">
								<input type="checkbox" name="saveid" value="ok"
									class="form-check-input"
									${empty cookie.saveid.value?'':'checked'}> <label
									class="form-check-label">아이디 기억하기</label>
							</div>

							<button type="submit" class="btn btn-primary btn-block">로그인</button>

						</form>
					</div>

					<div class="card-footer bg-white pt-4 pb-4 text-center">
						<div class="mb-3">
							<a href="memberJoin.do">회원가입</a> 
							<span class="mx-2">|</span> 
							<a href="#" data-bs-toggle="modal" data-bs-target="#idFindModal">아이디찾기</a>
							<span class="mx-2">|</span> 
							<a href="#" data-bs-toggle="modal" data-bs-target="#passwordFindModal">비밀번호 찾기</a>

						</div>

						<div>
							<div>간편로그인</div>
							<div>
								<a class="p-2"
									href="https://kauth.kakao.com/oauth/authorize?client_id=f9f8f92fec61a14408e68cf856744293&redirect_uri=http://localhost:9090/meomum/kakao_login.do&response_type=code">
									<img src="/meomum/images/icon/kakao_login_small.png">
								</a>
							</div>
						</div>

					</div>

				</div>
			</div>
		</div>
	</div>

	<%@include file="/WEB-INF/views/footer.jsp"%>


	<!-- 회원 아이디찾기시작 -->
	<div class="modal fade" id="idFindModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog ">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5 ">회원 아이디 찾기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="name">이름</label> 
							<input type="text"
								class="form-control" id="input_name" name="input_name" placeholder="이름을 입력해주세요." required="required">
						</div>
						<div class="form-group">
							<label for="user_tel">휴대폰 번호</label> 
							<input type="tel" class="form-control" id="input_tel" name="input_tel" pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" placeholder="휴대폰 번호 (ex. 010-1234-5678)" required="required">
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="findID()" >확인</button>
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
					<h1 class="modal-title fs-5 ">회원 아이디 정보</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
       			 <p>회원 아이디는 <span id="userIdSpan"></span> 입니다.</p>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="findID()" >비밀번호 찾기</button>
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
					<h1 class="modal-title fs-5 ">회원 비밀번호 찾기</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form>
						<div class="form-group">
							<label for="email">아이디</label> 
							<input type="email" class="form-control" id="user_id" name="user_id" value="${param.user_id}" placeholder="이메일(ex. abc@a.a)" required="required">
						</div>
						<div class="form-group">
							<label for="input_name">이름</label> <input type="text"
								class="form-control" id="input_name" name="input_name" placeholder="이름을 입력해주세요."required="required">
						</div>
						<div class="form-group">
							<label for="user_tel">휴대폰 번호</label> 
							<input type="tel" class="form-control" id="intput_tel" name="intput_tel" pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}" placeholder="휴대폰 번호 (ex. 010-1234-5678)" required="required">
						</div>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary"
						onclick="findpwd()" >확인</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 회원 비밀번호 찾기 끝 -->
	
	
	<!-- 새 비밀번호 입력 모달창 -->
<div class="modal fade" id="resetPasswordModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" >
    <div class="modal-dialog ">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5">새 비밀번호 입력</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="form-group">
                        <label for="password">새 비밀번호</label>
                        <input type="password" class="form-control" id="password" name="password" placeholder="새 비밀번호를 입력해주세요." required="required">
                    </div>
                    <div class="form-group">
                        <label for="confirm_password">새 비밀번호 확인</label>
                        <input type="password" class="form-control" id="confirm_password" name="confirm_password" placeholder="새 비밀번호를 한번 더 입력해주세요." required="required">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" id="submitNewPasswordBtn" data-bs-dismiss="modal">확인</button>
            </div>
        </div>
    </div>
</div>
	
</body>
</html>