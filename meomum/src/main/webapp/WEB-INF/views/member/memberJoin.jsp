<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

</script>
</head>
<body>
	<%@include file="/WEB-INF/views/header.jsp"%>
	
	<div class="container">
	  <div class="row justify-content-center">
	    <div class="col-md-6">
	      <h4 class="mb-3 text-center">회원가입</h4>
	      <form name="memberJoin" action="memberJoin.do" method="post">
	      <input type="hidden" name="user_jointype" value="머뭄">
	       <input type="hidden" name="user_info" value="회원">
	      
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
	            <input type="text" class="form-control" id="user_pcode" name="user_pcode" placeholder="우편번호" readonly="readonly" onclick="findaddr()">
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
	       	 <div class="form-group">
	          <label for="user_tel">필수약관동의</label>
	          <input type="checkbox" name="allcheck">전체 동의
	          <input type="checkbox" name="tos" value="Y">(필수)이용약관 <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
  내용보기
</button>
	      		<input type="checkbox" name="user_pia" value="Y">(필수)개인정보처리방침
	        </div> 
	        <div class="text-center">
	          <button type="submit" class="btn btn-primary">회원가입</button>
	        </div>
	      </form>
	    </div>
	  </div>
	</div>


<!-- 이용약관 Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">머뭄 이용약관 동의</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        여러분을 환영합니다. JUN 서비스 및 제품(이하 ‘서비스’)을 이용해
                주셔서 감사합니다. 본 약관은 다양한 JUN 서비스의 이용과 관련하여
                JUN 서비스를 제공하는 JUN 주식회사(이하 ‘JUN’)와 이를 이용하는
                JUN 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며,
                아울러 여러분의 JUN 서비스 이용에 도움이 될 수 있는 유익한
                정보를 포함하고 있습니다. JUN 서비스를 이용하시거나 JUN 서비스
                회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을
                확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐
                주시기 바랍니다.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick="check_tos">확인</button>
      </div>
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