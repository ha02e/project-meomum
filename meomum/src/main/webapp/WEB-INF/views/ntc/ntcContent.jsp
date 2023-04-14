<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머뭄 공지사항</title>
<style>
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
	        url(https://images.unsplash.com/photo-1635321350281-e2a91ecffd00?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2623&q=80)
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
@font-face {
    font-family: 'OAGothic-ExtraBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2302@1.0/OAGothic-ExtraBold.woff2') format('woff2');
    font-weight: 800;
    font-style: normal;
}
.page-title {
	color: #fff;
	font-size: 40px;
	font-weight: 400;
	letter-spacing: -1px;
	
}

@font-face {
    font-family: 'SBAggroB';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.card-title{
    font-family: 'SBAggroB';
}
.card-text{
	font-size : 15px;
    font-family: 'SBAggroB';
    color :#677381;



}
/**헤더 이미지용 끝*/
</style>
</head>
<body class="app">
	<%@include file="/WEB-INF/views/header.jsp"%>
	
	<div class="page-header" style="margin-bottom: 70px;">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h4 class="page-title">공지사항</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	
	<div class="container mt-4 text-center" style="margin-bottom: 100px;">
		

		<c:choose>
			<c:when test="${empty list}">
				<div class="alert alert-danger">삭제되었거나 존재하지 않는 게시글입니다.</div>
			</c:when>
			<c:otherwise>
				<div class="card mb-4">
					<div class="card-header">
						<span class="card-text text-end">${list.ntc_date}  <i class="bi bi-eye-fill"></i> ${list.ntc_viewCnt}</span>
						<h3 class="card-title">${list.ntc_title}</h3>
					</div>
					
					<div class="card-body">
						
								<c:if test="${not empty list.ntc_img}">
									<tr>
										<td colspan="4"><img
											src="/meomum/ntcImages/${list.ntc_img}" class="img-fluid"></td>
									</tr>
								</c:if>
								
									${list.ntc_content}
					</div>
				</div>
			</c:otherwise>
		</c:choose>
		<div class="text-end">
				<a href="ntcList.do" class="btn btn-primary btn-lg" style="width : 150px;">목록</a>
		</div>
	</div>

	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>
</html>