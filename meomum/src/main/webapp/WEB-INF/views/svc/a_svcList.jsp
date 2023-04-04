<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
/* 검색창
.search-bar{
	vertical-align: middle;
	margin: 30px 0;
	text-align: right;
}
.search-bar input[type="text"]{
	border: 2px solid #00cdac; 
	border-radius: 0px; 
}
.search-bar input[type="submit"]{
	border:0; 
	background-color:transparent;
	background-position:center;
	background-repeat:no-repeat;
	width:30px;
	height:40px;
	cursor: pointer;
	margin:-10px 20px -14px 2px;
}*/
</style>
<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
<!-- App CSS -->  
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">
</head>
<body>
	<%@include file="/WEB-INF/views/header_a.jsp"%>
	<!-- 세부 검색 -->
	<section>
		<article>
			<form>
				<div id="detaildiv">
					<fieldset>
						<ul>
							<li>예약일 
								<input type="date" name="period">&nbsp;~
								<input type="date" name="period">&nbsp;
							</li>
							
							<li>
								<select name="category">
									<option value="고객성함">고객성함</option>
									<option value="전화번호">전화번호</option>
								</select> 
								<input type="text" name="keyword" placeholder="검색어를 입력하세요" size="60">
							</li>
							
							<li>예약상태 
								<input type="checkbox" name="svc_state" value="전체">전체&nbsp;
								<input type="checkbox" name="svc_state" value="예약확정">예약확정&nbsp;
								<input type="checkbox" name="svc_state" value="예약취소">예약취소&nbsp;
								<input type="checkbox" name="svc_state" value="견적완료">견적완료&nbsp;
								<input type="checkbox" name="svc_state" value="결제대기">결제대기&nbsp;
								<input type="checkbox" name="svc_state" value="결제완료">결제완료&nbsp;
								<input type="checkbox" name="svc_state" value="결제취소">결제취소&nbsp;
								<input type="checkbox" name="svc_state" value="작업완료">작업완료&nbsp;
							</li>
							<div>
								<input type="submit" value="검색">
							</div>
						</ul>
					</fieldset>
				</div>
			</form>
		</article>
	</section>

	<!-- 리스트 출력 -->
	<section>
		<fieldset>
			<table>
				<tr>
					<th><input type="checkbox" name="check" value=""></th>
					<th>예약번호</th>
					<th>예약일</th>
					<th>고객성함</th>
					<th>전화번호</th>
					<th>상태</th>
				</tr>
				<c:if test="${empty svcDTO}">
					<tr>
						<td colspan="6">예약한 회원이 없습니다</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${svcDTO}">
					<tr>
						<td><input type="checkbox" name="check" value=""></td>
						<td>${dto.svc_idx}</td>
						<td>${dto.svc_regdate}</td>
						<c:url var="contentUrl" value="asvcContent.do">
							<c:param name="svc_idx">${dto.svc_idx}</c:param>
						</c:url>
						<td><a href="${contentUrl}">${dto.user_name}</a></td>
						<td>${dto.user_tel}</td>
						<td>${dto.svc_state}</td>
					</tr>
				</c:forEach>
			</table>
			<input type="submit" value="선택 삭제">
		</fieldset>
	</section>
	<%@include file="/WEB-INF/views/footer_a.jsp"%>
	   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous">
   </script>
</body>
</html>