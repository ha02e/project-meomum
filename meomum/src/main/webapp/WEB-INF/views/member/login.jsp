<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>


		<div class="container">
			<div class="input-form-backgroud row">
				<div class="input-form col-md-6 mx-auto">
					<br><br><br><br>
					<h4 class="mb-3 text-center">로그인</h4>
					<form name="login" action="login.do" method="post">
						<ul>
							<li><input type="text" name="user_id" id="user_id" placeholder="이메일"></li>
							<li><input type="text" name="user_pwd" id="user_pwd" placeholder="비밀번호"></li>

						</ul>
							<div><input type="submit" value="로그인"></div>
					</form>	
					
				</div>
			</div>
		</div>






<%@include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>