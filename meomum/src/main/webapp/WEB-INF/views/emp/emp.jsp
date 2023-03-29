<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file = "/WEB-INF/views/header.jsp" %>

	<h1>사원 관리 프로그램</h1>
	<form name="empAdd" action="empAdd.do">
		<fieldset>
			<legend>사원 등록</legend>
			<table>
				<tr>
					<th>사원 이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<th>E-mail</th>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<th>부서명</th>
					<td><input type="text" name="dept"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="submit" value="사원 등록"> 
					<input type="reset" value="다시 작성">
				</tr>
			</table>
		</fieldset>
	</form>
	
	<hr>
	<form name="empDel" action="empDel.do">
		<fieldset>
			<legend> 사원 삭제</legend>
			사원번호:<input type="text" name="idx" size= "40" placeholder="삭제할 사원의 번호를 입력해주세요"><br>
			<input type="submit" value="사원 삭제">
		</fieldset>
	</form>
	
	<hr>
	<fieldset>
		<legend>모든 사원 내역</legend>
		<h3><a href="empList.do">모든 사원 내역 보기</a></h3>
	</fieldset>
	
	<hr>
	<form name="empSearch" action="empSearch.do">
	<fieldset>
		<legend>사원 검색</legend>
		사원번호:<input type="text" name="idx" size= "40" placeholder="검색 사원의 번호를 입력해주세요"><br>
			<input type="submit" value="사원 검색">
	</fieldset>
	</form>
		
	
	<hr>
	<form name="empUpdate" action="empUpdateForm.do">
	<fieldset>
		<legend>사원 정보 수정</legend>
		사원번호:<input type="text" name="idx" size= "40" placeholder="정보를 수정할 사원의 번호를 입력해주세요"><br>
			<input type="submit" value="사원 정보 수정">
	</fieldset>
	</form>
</body>
</html>