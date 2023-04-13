<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간단문의 글작성</title>
<style>

/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://images.unsplash.com/photo-1630904989936-da6328c2f92d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80)
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
<%@include file="/WEB-INF/views/header.jsp" %>


	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">간단 문의 글 작성</h2>
					</div>
				</div>
			</div>
		</div>
	</div>



	<!-- 본문 시작 -->
<div class="container"  style="margin-bottom: 30px;">
  <div class="row">
    <div class="col-8 mx-auto">
    <br><br>
    
      <form name="askWrite" action= "askWrite.do" method="post" enctype="multipart/form-data">
      <input type="hidden" name="user_idx" value="${empty sessionScope.ssInfo.user_idx ? 0 : sessionScope.ssInfo.user_idx}">
		 <div class="input-group mb-3">
		  <label class="input-group-text col-2 text-center" for="inputGroupSelect01">공간유형</label>
		  <select class="form-select" id="inputGroupSelect01" name="rsd_type" required="required" >
		    <option value="" selected disabled hidden>거주형태 선택</option>
		    <option value="아파트">아파트</option>
		    <option value="빌라">빌라</option>
		    <option value="주택">주택</option>
		    <option value="복층">복층</option>
		    <option value="오피스텔">오피스텔</option>
		    <option value="기타">기타</option>
		  </select>
		</div>
		 <div class="input-group mb-3">
          <label for="default" class="input-group-text col-2 text-center" >평수</label>
			<input type="text" class="form-control input-group-text-fixed" id="default" name="rsd_py" required="required" placeholder="숫자만 입력해주세요" pattern="[0-9]+" title="숫자만 입력하세요">
          <span class="input-group-text col-2 "> 평</span>
        </div>
        <div class="input-group mb-3">
          <label for="title" class="input-group-text col-2 text-center">제목</label>
          <input type="text" class="form-control input-group-text-fixed" id="title" name="ask_title"required="required" placeholder="제목을 입력해주세요"  maxlength="50">
        </div>
        <div class="input-group mb-3">
          <label for="author" class="input-group-text col-2 text-center">작성자</label>
          <input type="text" class="form-control input-group-text-fixed" id="author" name="ask_writer" value="${sessionScope.ssInfo.user_name}" required="required" placeholder="작성자를 입력해주세요"  minlength="2" maxlength="30">
        </div>
        <div class="input-group mb-3">
          <label for="contact" class="input-group-text col-2 text-center">연락처</label>
          <input type="text" class="form-control input-group-text-fixed" id="contact" name="ask_tel" value="${sessionScope.ssInfo.user_tel}"pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}"
							placeholder="휴대폰 번호 (ex. 010-1234-5678)" required="required">
        </div>

        <div class="input-group mb-3">
          <label class="input-group-text col-2 text-center" for="inputGroupFile01">첨부 파일</label>
          <input type="file" class="form-control" id="inputGroupFile01" name="file"  accept="image/*">
        </div>
		<div class="input-group mb-3" style="max-height: 600px; overflow-y: auto;">
		  <label for="question" class="input-group-text col-2 text-center">문의사항<br>(1000자이내)*</label>
 			 <textarea class="form-control input-group-text-fixed" id="question" aria-label="With textarea" style="height: 300px; resize: none;" name="ask_content" required="required" placeholder="내용을 입력해주세요" maxlength="1000"></textarea>
		</div>
		<c:if test="${empty sessionScope.ssInfo}">
        <div class="input-group mb-3">
          <label for="password" class="input-group-text col-2 text-center">비밀번호</label>
          <input type="password" class="form-control input-group-text-fixed" id="password" name="ask_pwd" required="required" placeholder="비밀번호로 게시글을 확인할 수 있습니다.">
        </div>
        </c:if>
        <c:if test="${!empty sessionScope.ssInfo}">
          <input type="hidden" class="form-control input-group-text-fixed" id="password" name="ask_pwd" required="required">
        </c:if>
		  <div class="input-group mb-3">
		<input class="form-check-input" type="checkbox" id="checkbox" value="Y" name="ask_tos" required="required"> 개인정보 이용동의합니다.
		  <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"> (내용보기)</a>
		</div>

        <div class="d-flex justify-content-center ">
          <span><input type="submit" value=" 글작성 " class="btn btn-primary "> </span>
           <span style="margin-left: 10px"> <a href="askList.do"><button type="button" class="btn btn-outline-secondary" >  목록으로</button></a></span>
        </div>
        
      </form>
    </div>
  </div>
</div>
<!-- 본문 작성 끝 -->
<%@include file="/WEB-INF/views/footer.jsp" %>

	<!-- 이용약관 Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">머뭄 개인정보 처리 방침</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					여러분을 환영합니다. <br>
					머뭄서비스 및 제품(이하 ‘서비스’)을
					이용해 주셔서 감사합니다. 본 약관은 다양한  머뭄 서비스의 이용과 관련하여  머뭄 서비스를 제공하는  머뭄
					주식회사(이하 ‘ 머뭄’)와 이를 이용하는  머뭄 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러
					여러분의  머뭄 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.  머뭄 서비스를 이용하시거나  머뭄
					서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어
					주의 깊게 살펴봐 주시기 바랍니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>