<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
</head>
<body>
	<h1>공지사항 수정</h1>
	<form name="ntcUpdate" action="ntcUpdate.do" method="post" enctype="multipart/form-data">
		<ul>
			<c:if test="${empty dto}">
				<li>존재하지 않거나 삭제된 게시글입니다.</li>
			</c:if>
				<li>제목:<input type="text" name="ntc_title" value="${dto.ntc_title}"></li>
				<li>카테고리: <select name="ntc_ctg">
						<option value="공지사항" ${dto.ntc_ctg == '공지사항' ? 'selected' : ''}>공지사항</option>
						<option value="FAQ" ${dto.ntc_ctg == 'FAQ' ? 'selected' : ''}>FAQ</option>
						<option value="이벤트" ${dto.ntc_ctg == '이벤트' ? 'selected' : ''}>이벤트</option>
				</select></li>
				<li><label>이미지 파일 첨부</label> <input type="file" name="ntc_img"></li>
				<li>본문:<textarea name="ntc_content" rows="50" cols="50"
						placeholder="내용을 입력해주세요.">${dto.ntc_content}</textarea></li>
				<input type="hidden" name="ntc_idx" value="${dto.ntc_idx}">
		</ul>
		<div>
			<input type="submit" value="수정하기"> <input type="reset" value="초기화">
		</div>
	</form>
</body>
</html>
