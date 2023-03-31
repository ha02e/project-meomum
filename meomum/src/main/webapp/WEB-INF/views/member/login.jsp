<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머뭄 로그인 페이지</title>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>

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
                                   class="form-check-input" ${empty cookie.saveid.value?'':'checked'}>
                            <label class="form-check-label">아이디 기억하기</label>
                        </div>

                        <button type="submit" class="btn btn-primary btn-block">로그인</button>

                    </form>
                </div>

                <div class="card-footer bg-white pt-4 pb-4 text-center">
                    <div class="mb-3">
                        <a href="memberJoin.do">회원가입</a>
                        <span class="mx-2">|</span>
                        <a href="#">아이디 찾기</a>
                        <span class="mx-2">|</span>
                        <a href="#">비밀번호 찾기</a>
                    </div>
                    
                    <div>
               	 	    <div>간편로그인</div>
               	 	    <div>
							<a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=f9f8f92fec61a14408e68cf856744293&redirect_uri=http://localhost:9090/meomum/kakao_login.do&response_type=code">
							<img src="/meomum/images/icon/kakao_login_small.png"></a>
						</div>        
                </div>

            </div>

        </div>
    </div>
	</div>
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>