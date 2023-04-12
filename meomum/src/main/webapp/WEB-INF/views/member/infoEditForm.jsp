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
		url(https://images.unsplash.com/photo-1575805501150-e064fbd815dd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80)
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
						<h2 class="page-title">나의 정보 수정</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 헤더 이미지 끝 -->
		<div class="container "  style="overflow: auto; margin-bottom: 50px; margin-top: 30px;">
			<div class="row justify-content-center">
				<%@include file="../myMenu.jsp"%>
				
				<div class="col-xl-9 col-md-9">
				    <div class="row justify-content-center">
				        <div class="card text-center">
				            <div class="card-header ">
				                <label for="input_pwd" class="form-label">비밀번호 확인</label>
				            </div>
				            <div class="card-body">
				            비밀번호를 확인 후 정보 수정이 가능합니다.

				                <form class="form-inline justify-content-center" method="POST" action="infoEdit.do" id="myForm"
				                onkeypress="return event.keyCode != 13;">
				                    <div class="d-flex align-items-center my-3">
				                        <input type="password" class="form-control me-2" 
				                        id="input_pwd" name="input_pwd" placeholder="비밀번호를 입력하세요" required="required">
				                            <input type="hidden" id="user_ok" name="user_ok" value="OK" >
				                    </div>
				                </form>
				            </div>
				            <div class="card-footer">
				            <div class="d-grid gap-2">
				                <button type="button" class="btn btn-primary" onclick="pwdCheck()">확인</button>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
			</div>
		</div>
		<%@include file="/WEB-INF/views/footer.jsp"%>
	
<script type="text/javascript">
function pwdCheck(){
	var input_pwd = encodeURIComponent(document.getElementById('input_pwd').value);

	var user_pwd =  '${sessionScope.ssInfo.user_pwd}';

	
	if(input_pwd === user_pwd){   
		   document.getElementById('myForm').submit(); // 폼을 전송합니다.
		}else{
		   alert('비밀번호가 일치하지 않습니다.');
		}
	
}

</script>
</body>

</html>