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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<!-- 사이드바용 css 끝 -->

<!--주소 검색 api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="/meomum/js/request.js"></script>

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

.page-title {
	color: #fff;
	font-size: 40px;
	font-weight: 400;
	letter-spacing: -1px;
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

<section class="shop spad">
  <div class="container">
    <div class="row">
      <%@include file="../myMenu.jsp"%>
      <div class="col-xl-9 col-md-9">
        <div class="row justify-content-center">
          <div class="card">
            <div class="card-body">
              <h4 class="card-title mb-4 text-center">나의 정보 수정</h4>
              
              
              <form name="userInfo_Update" action="infoEdit.do" method="post">
           		<input type="hidden" name="user_idx" value="${sessionScope.ssInfo.user_idx}">
		        <div class="form-group">
		          <label for="user_id">이메일</label>
		         	<input type="text" class="form-control" id="user_id" name="user_id" value="${info.user_id}" readonly="readonly">
		        </div>
		        <div class="form-group">
		          <label for="user_name">이름</label>
		          <input type="text" class="form-control" id="user_name" name="user_name" value="${info.user_name}" placeholder="이름">
		        </div>
		       <div class="form-group">
				<label for="user_pcode">우편번호</label>
				<div class="input-group mb-3">
					<input type="text" class="form-control" id="user_pcode" name="user_pcode" value="${info.user_pcode}" readonly="readonly" onclick="findaddr()">
					<div class="input-group-append">
						<button class="btn btn-outline-secondary" type="button" onclick="findaddr()">우편번호 검색</button>
					</div>
					</div>
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="user_addr" name="user_addr" value="${info.user_addr}" readonly="readonly">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" id="addr_detail" name="addr_detail" value="${info.addr_detail}" placeholder="상세주소">
				</div>
				<div class="form-group">
				    <label for="user_tel">연락처</label>
				    <div class="input-group">
				    <!--  
				        <select class="form-control" id="tel_first" name="tel_first">
				            <option value="010">010</option>
				            <option value="011">011</option>
				            <option value="016">016</option>
				            <option value="017">017</option>
				            <option value="018">018</option>
				            <option value="019">019</option>
				        </select>
				        <div class="input-group-prepend">
				            <span class="input-group-text"><i class="fas fa-minus"></i></span>
				        </div>
				        <input type="tel" class="form-control" id="user_tel2" name="user_tel2" placeholder="중간 번호">
				        <div class="input-group-prepend">
				            <span class="input-group-text"><i class="fas fa-minus"></i></span>
				        </div>
				        <input type="tel" class="form-control" id="user_tel3" name="user_tel3" placeholder="끝 번호">
				    </div>
				</div>-->
				</div>
				<input type="tel" class="form-control"  name="user_tel" placeholder="-제외하고 입력" value="${info.user_tel}"></div>
				
		        <div class="text-center">
		          <button type="submit" class="btn btn-primary">나의 정보 수정</button>
					<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#pwdChange" data-whatever="${sessionScope.ssInfo.user_idx}">비밀번호 변경</button>
		           
		        </div>
		      </form>
            </div>
            <!-- 본문 작성 끝 -->
          </div>
        </div>
      </div>
    </div>
  </div>
</section>
<!-- 모달 변경 -->
<div class="modal fade" id="pwdChange" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">비밀번호 변경</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <form id="passwordForm">
      <input type="hidden" name="user_idx" id="user_idx">;
         <div class="modal-body">
          <div class="mb-3">
            <label for="newPwd" class="col-form-label">새 비밀번호:</label>
            <input type="password" class="form-control" id="newPwd" name="newPwd" required>
          </div>
          <div class="mb-3">
            <label for="confirmPassword" class="col-form-label">새 비밀번호 확인:</label>
            <input type="password" class="form-control" id="newPwdCheck" name="newPwdCheck" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
          <button type="submit" class="btn btn-primary">저장</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- 모달 끝 -->
	<%@include file="../footer.jsp"%>
<script>
const passwordForm = document.getElementById('passwordForm');
const user_idx_input = document.getElementById('user_idx');


function changePassword(newPwd, user_idx) {
  const url = 'pwdChange.do';
  const param = `newPwd=${newPwd}&user_idx=${user_idx}`;
  sendRequest(url, param, 'POST', function() {
    if (XHR.readyState === XMLHttpRequest.DONE) {
      if (XHR.status === 200) {
        const response = JSON.parse(XHR.responseText);
        if (response.success) {
          alert('비밀번호가 성공적으로 변경되었습니다.');
          const pwdChangeModal = document.getElementById('pwdChange');
          const modal = bootstrap.Modal.getInstance(pwdChangeModal);
          modal.hide();
        } else {
          alert(response.message);
        }
      } else {
        alert('비밀번호 변경 중 오류가 발생했습니다.');
      }
    }
  });
}


passwordForm.addEventListener('submit', function(event) {
  event.preventDefault();
  const newPwd = document.getElementById('newPwd').value;
  const newPwdCheck = document.getElementById('newPwdCheck').value;
  
  if (newPwd !== newPwdCheck) {
    alert('새 비밀번호와 비밀번호 확인이 일치하지 않습니다.');
    return;
  }
  
  const user_idx = user_idx_input.value;
  changePassword(newPwd, user_idx);
});
/**주소검색*/
function findaddr(){
	new daum.Postcode({
	    oncomplete: function(data) {
	        document.getElementById("user_pcode").value = data.zonecode;
	        document.getElementById("user_addr").value =  data.address;
	        document.getElementById("addr_detail").focus();
	    },
	    autoClose: true // 팝업 자동 닫힘
	}).open();
}


</script>
</body>

</html>