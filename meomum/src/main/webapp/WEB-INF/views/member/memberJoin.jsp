<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<!-- 작업자 : 이초은 
    	memberJoin.do
    	회원가입 입력 페이지 입니다.
    	
    -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	
	<div class="container">
	  <div class="row justify-content-center">
	    <div class="col-md-6">
	      <h4 class="mb-3 text-center">회원가입</h4>
	      <form name="memberJoin" action="memberJoin.do" method="post">
	        <div class="form-group">
	          <label for="user_id">이메일</label>
	         	 <input type="text" class="form-control" id="user_id" name="user_id" value="${param.user_id}" placeholder="이메일">
	         	 <input type="button" value="중복검사">
	        </div>
	        <div class="form-group">
	          <label for="user_pwd">비밀번호</label>
	          <input type="password" class="form-control" id="user_pwd" name="user_pwd" placeholder="비밀번호">
	        </div>
	        <div class="form-group">
	          <label for="user_name">이름</label>
	          <input type="text" class="form-control" id="user_name" name="user_name" value="${param.user_name}" placeholder="이름">
	        </div>
	        <div class="form-group">
	          <label for="user_pcode">우편번호</label>
	          <div class="input-group mb-3">
	            <input type="text" class="form-control" id="user_pcode" name="user_pcode" placeholder="우편번호" readonly="readonly">
	            <div class="input-group-append">
	              <button class="btn btn-outline-secondary" type="button" onclick="findaddr()">우편번호 검색</button>
	            </div>
	          </div>
	        </div>
	        <div class="form-group">
	          <label for="user_addr">기본주소</label>
	          <input type="text" class="form-control" id="user_addr" name="user_addr" placeholder="기본주소" readonly="readonly">
	        </div>
	        <div class="form-group">
	          <label for="user_detail">상세주소</label>
	          <input type="text" class="form-control" id="addr_detail" name="addr_detail" placeholder="상세주소">
	        </div>
	        <div class="form-group">
	          <label for="user_tel">연락처</label>
	          <input type="tel" class="form-control" id="user_tel" name="user_tel" placeholder="연락처 -제외 하고 입력">
	        </div>
	        <div class="text-center">
	          <button type="submit" class="btn btn-primary">회원가입</button>
	        </div>
	      </form>
	    </div>
	  </div>
	</div>





		<!-- 확인용 스크립트 -->
		<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
  

		<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
<!-- 우편번호 검색용 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>
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
</html>