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
		<div class="input-form-backgroud row">
			<div class="input-form col-md-6 mx-auto">
				<br><br><br><br>
				<h4 class="mb-3 text-center">회원가입</h4>
				<form name="memberJoin" action="memberJoin.do" method="post">
					<ul>
						<li><input type="text" name="user_id" id="user_id" placeholder="이메일"></li>
						<li><input type="password" name="user_pwd" id="user_pwd" placeholder="비밀번호"></li>
						<li><input type="text" name="user_name" id="user_name" placeholder="이름"></li>
						<li><input type="text" name="user_pcode" id="user_pcode"placeholder="우편번호" onclick="findaddr()">
							<input type="button" value="우편번호 검색" onclick="findaddr()"></li>
						<li><input type="text" name="user_addr" id="user_addr" placeholder="기본주소" readonly="readonly"></li>
						<li><input type="text" name="user_detail" id="user_detail" placeholder="상세주소"></li>
						<li><input type="text" name="user_tel" id="user_tel" placeholder="연락처 -제외 하고 입력"></li>
						
					</ul>
						<div><input type="submit" value="회원가입"></div>
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
	        }
	    }).open({

	    });
    }
</script>
</html>