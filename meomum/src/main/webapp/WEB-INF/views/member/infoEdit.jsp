<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의정보수정</title>
<style>
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
    background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)), rgba(36, 39, 38, 0.5) url(https://cdn.aitimes.com/news/photo/202210/147215_155199_1614.jpg) no-repeat center;
    background-size: cover;
    margin: 0;
    border-bottom: none;
    padding-bottom: 0px;
	}
	.page-caption { padding: 90px 0px; position: relative; z-index: 1; color: #fff; text-align: center; }
	.page-title { color: #fff;  font-size: 40px; font-weight: 400; letter-spacing: -1px; }
	
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
                        <h2 class="page-title">마이페이지</h2>
                        
                         <c:if test="${!empty sessionScope.userinfo}">
							회원 번호: ${sessionScope.userinfo.user_idx}
							회원 이름: ${sessionScope.userinfo.user_name}
							회원 주소: ${sessionScope.userinfo.user_addr}
						</c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@include file="/WEB-INF/views/myMenu.jsp" %>
<%@include file="/WEB-INF/views/footer.jsp" %>

</body>
</html>