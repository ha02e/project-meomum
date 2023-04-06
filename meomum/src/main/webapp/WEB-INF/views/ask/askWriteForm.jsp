<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간단문의 글작성</title>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>



	<!-- 본문 시작 -->
<div class="container">
  <div class="row">
    <div class="col-6 mx-auto">
    <br><br>
    
    <h4 class="text-center">간단문의글 작성</h4>
      <form name="askWrite" action= "askWrite.do" method="post" enctype="multipart/form-data">
      <input type="hidden" name="user_idx" value="${empty sessionScope.ssInfo.user_idx ? 0 : sessionScope.ssInfo.user_idx}">
		 <div class="input-group mb-3">
		  <label class="input-group-text col-3 text-center" for="inputGroupSelect01">공간유형</label>
		  <select class="form-select" id="inputGroupSelect01" name="rsd_type" required="required" >
		    <option value="" selected disabled hidden>공간유형 선택</option>
		    <option value="아파트">아파트</option>
		    <option value="빌라">빌라</option>
		    <option value="주상복합">주상복합</option>
		    <option value="주택">주상복합</option>
		    <option value="기타">기타</option>
		  </select>
		</div>
		 <div class="input-group mb-3">
          <label for="default" class="input-group-text col-3 text-center" >평수</label>
          <input type="text" class="form-control input-group-text-fixed" id="default" name="rsd_py" required="required" placeholder="평수를 입력해주세요">
          <span class="input-group-text">평</span>
        </div>
        <div class="input-group mb-3">
          <label for="title" class="input-group-text col-3 text-center">제목</label>
          <input type="text" class="form-control input-group-text-fixed" id="title" name="ask_title"required="required" placeholder="제목을 입력해주세요"  maxlength="50">
        </div>
        <div class="input-group mb-3">
          <label for="author" class="input-group-text col-3 text-center">작성자</label>
          <input type="text" class="form-control input-group-text-fixed" id="author" name="ask_writer" value="${sessionScope.ssInfo.user_name}" required="required" placeholder="작성자를 입력해주세요"  minlength="2" maxlength="30">
        </div>
        <div class="input-group mb-3">
          <label for="contact" class="input-group-text col-3 text-center">연락처</label>
          <input type="text" class="form-control input-group-text-fixed" id="contact" name="ask_tel" value="${sessionScope.ssInfo.user_tel}"pattern="[0-9]{3}-[0-9]{3,4}-[0-9]{4}"
							placeholder="휴대폰 번호 (ex. 010-1234-5678)" required="required">
        </div>

        <div class="input-group mb-3">
          <label class="input-group-text col-3 text-center" for="inputGroupFile01">첨부 파일</label>
          <input type="file" class="form-control" id="inputGroupFile01" name="file"  accept="image/*">
        </div>
		<div class="input-group mb-3" style="max-height: 600px; overflow-y: auto;">
		  <label for="question" class="input-group-text col-3 text-center">문의사항<br>(2000자이내)*</label>
		  <textarea class="form-control input-group-text-fixed" id="question" aria-label="With textarea" style="height: 300px; resize: none;" name="ask_content" required="required" placeholder="내용을 입력해주세요"></textarea>
		</div>
		<c:if test="${empty sessionScope.ssInfo}">
        <div class="input-group mb-3">
          <label for="password" class="input-group-text col-3 text-center">비밀번호</label>
          <input type="password" class="form-control input-group-text-fixed" id="password" name="ask_pwd" required="required" placeholder="비밀번호로 게시글을 확인할 수 있습니다.">
        </div>
        </c:if>
        <c:if test="${!empty sessionScope.ssInfo}">
          <input type="hidden" class="form-control input-group-text-fixed" id="password" name="ask_pwd" required="required">
        </c:if>
         <div class="input-group mb-3">
          <label for="password" class="input-group-text col-3 text-center">보안방지</label>
          <input type="text" class="form-control input-group-text-fixed" id="password">
        </div>
		  <div class="input-group mb-3">
		  <label class="input-group-text col-3 text-center" for="checkbox">
		    개인정보이용동의
		  </label>
		  <input class="form-check-input" type="checkbox" id="checkbox" value="Y" name="ask_tos" required="required">개인정보 이용동의합니다.
		  <a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal">내용보기</a>
		</div>

        <div class="d-flex justify-content-center">
          <span><input type="submit" value="글작성" class="btn btn-primary"> </span>
           <span><a href="askList.do"><button type="button" class="btn btn-outline-info" >목록으로</button></a></span>
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
					<h1 class="modal-title fs-5" id="exampleModalLabel">머뭄 이용약관 동의</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">여러분을 환영합니다. JUN 서비스 및 제품(이하 ‘서비스’)을
					이용해 주셔서 감사합니다. 본 약관은 다양한 JUN 서비스의 이용과 관련하여 JUN 서비스를 제공하는 JUN
					주식회사(이하 ‘JUN’)와 이를 이용하는 JUN 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러
					여러분의 JUN 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다. JUN 서비스를 이용하시거나 JUN
					서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어
					주의 깊게 살펴봐 주시기 바랍니다.</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary" data-bs-dismiss="modal">확인</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>