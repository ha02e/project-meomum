<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공지사항 작성</h1>
	<form name="ntcWrite" action="ntcWrite.do" method="post"
		enctype="multipart/form-data">
		<ul>
			<li>제목:<input type="text" name="ntc_title"></li>
			<li>카테고리:<select name="ntc_ctg"> 
				<option value="공지사항">공지사항</option>
				<option value="FAQ">FAQ</option>
				<option value="이벤트">이벤트</option>
			</select>
			<li><label>이미지 파일 첨부</label> 
            <input type="file" name="ntc_img"></li>
			
			<li>본문:<textarea name="ntc_content" rows="50" cols="50">내용을 입력해주세요.</textarea></li>
		</ul>
		<div>
			<input type="submit" value="등록하기"> <input type="reset"
				value="초기화">
		</div>
	</form>
</body>
</html>