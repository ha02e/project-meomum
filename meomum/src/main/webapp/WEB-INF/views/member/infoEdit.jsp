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
		url(https://cdn.aitimes.com/news/photo/202210/147215_155199_1614.jpg)
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
						<h2 class="page-title">마이페이지</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 헤더 이미지 끝 -->


		<div class="container">
			<div class="row">
				<%@include file="../myMenu.jsp"%>
				<div class="col-xl-9 col-md-9">
					<div class="row justify-content-center">
						<div class="card">
							<div class="card-body">

								<h4 class="card-title mb-4 text-center">나의 정보 수정</h4>

								<form name="userInfo_Update" action="infoEditOK.do" method="post">
									<input type="hidden" name="user_idx"
										value="${sessionScope.ssInfo.user_idx}" required="required">
									<div class="form-group">
										<label for="user_id">이메일</label> <input type="text"
											class="form-control" id="user_id" name="user_id"
											value="${info.user_id}" readonly="readonly" required="required">
									</div>
									<div class="form-group">
										<label for="user_name">이름</label> <input type="text"
											class="form-control" id="user_name" name="user_name"
											value="${info.user_name}" placeholder="이름" required="required">
									</div>
									<div class="form-group">
										<label for="user_pcode">우편번호</label>
										<div class="input-group mb-3">
											<input type="text" class="form-control" id="user_pcode"
												name="user_pcode" value="${info.user_pcode}"
												readonly="readonly" onclick="findaddr()" required="required">
											<div class="input-group-append">
												<button class="btn btn-outline-secondary" type="button"
													onclick="findaddr()">우편번호 검색</button>
											</div>
										</div>
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="user_addr"
											name="user_addr" value="${info.user_addr}"
											readonly="readonly" required="required">
									</div>
									<div class="form-group">
										<input type="text" class="form-control" id="addr_detail"
											name="addr_detail" value="${info.addr_detail}"
											placeholder="상세주소">
									</div>
									<div class="form-group">
										<label for="user_tel">연락처</label>
										<div class="input-group">
										</div>
										<input type="tel" class="form-control" name="user_tel"
											placeholder="-제외하고 입력" value="${info.user_tel}" required="required">
									</div>

									<div class="text-center">
										<button type="submit" class="btn btn-primary">나의 정보
											수정</button>
										<button type="button" class="btn btn-primary"
											data-bs-toggle="modal" data-bs-target="#pwdChange">비밀번호
											변경</button>

									</div>
								</form>
							</div>
							<!-- 본문 작성 끝 -->
							
							
						</div>
					</div>
				</div>
			</div>
		</div>

	<%@include file="/WEB-INF/views/footer.jsp"%>







<!-- ----------------------------------------------------------------------------------------- -->

	<!-- 비밀번호 변경 모달 -->
	<div class="modal fade" id="pwdChange" tabindex="-1"
		aria-labelledby="pwdChangeLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="pwdChangeLabel">비밀번호 변경</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form id="pwdChangeForm">
						<input type="hidden" name="user_idx"
							value="${sessionScope.ssInfo.user_idx}">
						<div class="mb-3">
							<label for="newPassword" class="form-label">새로운 비밀번호</label> <input
								type="password" class="form-control" id="newPassword"
								name="newPassword"  pattern="(?=.*\d)(?=.*[~`!@#$%\^&*()-+=])(?=.*[a-zA-Z]).{8,}" title="8자 이상, 숫자와 특수문자를 모두 포함해주세요." required="required">
						</div>
						<div class="mb-3">
							<label for="confirmPassword" class="form-label">비밀번호 확인</label> <input
								type="password" class="form-control" id="confirmPassword"
								name="confirmPassword"  pattern="(?=.*\d)(?=.*[~`!@#$%\^&*()-+=])(?=.*[a-zA-Z]).{8,}" title="8자 이상, 숫자와 특수문자를 모두 포함해주세요." required="required">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="submitPwdChange">변경</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 비밀번호 변경 모달끝  -->

	
	
	<script>
		/**주소검색*/
		function findaddr() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							document.getElementById("user_pcode").value = data.zonecode;
							document.getElementById("user_addr").value = data.address;
							document.getElementById("addr_detail").focus();
						},
						autoClose : true
					// 팝업 자동 닫힘
					}).open();
		}

		/*비밀번호 변경*/
		$(document).ready(function() {
			$("#submitPwdChange").click(function() {
				var newPassword = $("#newPassword").val();
				var confirmPassword = $("#confirmPassword").val();
				
			      // 비밀번호가 8자 이상이며, 특수문자가 하나 이상 포함되어 있는지 확인합니다.
		        var passwordRegex = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,}$/;
		        if (!passwordRegex.test(newPassword)) {
		            alert("비밀번호는 8자 이상이며, 영문자, 숫자, 특수문자를 모두 포함해야 합니다.");
		            return;
		        }
				
				
				
				if (newPassword != confirmPassword) {
					alert("입력한 비밀번호가 일치하지 않습니다.");
					return;
				}
				var formData = $("#pwdChangeForm").serialize();
				$.ajax({
					type : "POST",
					url : "pwdChange.do",
					data : formData,
					success : function(result) {
						// 변경 성공 시 처리할 코드 작성
						if(result.result>0){
							alert('비밀번호가 변경되었습니다. 다시 로그인 바랍니다.');
							location.href='logout.do';

						}else{
							alert('비밀번호 변경에 실패하였습니다. 고객센터로 문의 바랍니다.');
						}
					},
					error : function(xhr, status, error) {
						alert('비밀번호 변경요청에 실패하였습니다.');
					}
				});
			});
		});
	</script>
</body>

</html>