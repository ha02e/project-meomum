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
	<!-- 본문 시작 -->
<div class="container">
  <div class="row">
    <div class="col-6 mx-auto">
    <br><br>
    
    <h4 class="text-center">간단문의글 작성</h4>
      <form name="askWrite" action= "askWrite.do" method="post">
      <input type="hidden" name="user_idx" value="${sessionScope.ssInfo.user_idx}">
		 <div class="input-group mb-3">
		  <label class="input-group-text col-3 text-center" for="inputGroupSelect01">공간유형</label>
		  <select class="form-select" id="inputGroupSelect01" name="rsd_type">
		    <option selected>공간유형 선택</option>
		    <option value="아파트">아파트</option>
		    <option value="빌라">빌라</option>
		    <option value="주상복합">주상복합</option>
		    <option value="주택">주상복합</option>
		    <option value="기타">기타</option>
		  </select>
		</div>
		 <div class="input-group mb-3">
          <label for="default" class="input-group-text col-3 text-center">평수</label>
          <input type="text" class="form-control input-group-text-fixed" id="default" name="rsd_py">
          <span class="input-group-text">평</span>
        </div>
        <div class="input-group mb-3">
          <label for="title" class="input-group-text col-3 text-center">제목</label>
          <input type="text" class="form-control input-group-text-fixed" id="title" name="ask_title">
        </div>
        <div class="input-group mb-3">
          <label for="author" class="input-group-text col-3 text-center">작성자</label>
          <input type="text" class="form-control input-group-text-fixed" id="author" name="ask_writer" value="${sessionScope.ssInfo.user_name}">
        </div>
        <div class="input-group mb-3">
          <label for="contact" class="input-group-text col-3 text-center">연락처</label>
          <input type="text" class="form-control input-group-text-fixed" id="contact" name="ask_tel" value="${sessionScope.ssInfo.user_tel}">
        </div>

        <div class="input-group mb-3">
          <label class="input-group-text col-3 text-center" for="inputGroupFile01">첨부 파일</label>
          <input type="file" class="form-control" id="inputGroupFile01" name="ask_file">
        </div>
		<div class="input-group mb-3" style="max-height: 600px; overflow-y: auto;">
		  <label for="question" class="input-group-text col-3 text-center">문의사항<br>(2000자이내)*</label>
		  <textarea class="form-control input-group-text-fixed" id="question" aria-label="With textarea" style="height: 300px; resize: none;" name="ask_content"></textarea>
		</div>
		<c:if test="${empty sessionScope.ssInfo}">
        <div class="input-group mb-3">
          <label for="password" class="input-group-text col-3 text-center">비밀번호</label>
          <input type="password" class="form-control input-group-text-fixed" id="password" name="ask_pwd">
        </div>
        </c:if>
         <div class="input-group mb-3">
          <label for="password" class="input-group-text col-3 text-center">보안방지</label>
          <input type="text" class="form-control input-group-text-fixed" id="password">
        </div>
		  <div class="input-group mb-3">
		  <label class="input-group-text col-3 text-center" for="checkbox">
		    개인정보이용동의
		  </label>
		  <input class="form-check-input" type="checkbox" id="checkbox" value="Y" name="ask_tos">개인정보 이용동의합니다.
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
</body>
</html>