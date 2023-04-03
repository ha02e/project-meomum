<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간단문의 내용보기</title>
</head>
<body>


<%@include file="/WEB-INF/views/header.jsp" %>
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-9">
      <div class="row">
        <div class="col-6">
          <h4>간단문의 게시판 내용보기</h4>
        </div>

      </div>

     <table class="table table-bordered">
	  <colgroup>
	    <col style="width: 20%;">
	    <col style="width: 30%;">
	    <col style="width: 20%;">
	    <col style="width: 30%;">
	  </colgroup>
	  <tbody>
	    <tr>
	      <th class="bg-light text-center">제목</th>
	      <td colspan="3">${ask.ask_title}</td>
	    </tr>
	    <tr>
	      <th class="bg-light text-center">작성자</th>
	      <td>${ask.ask_writer}</td>
	      <th class="bg-light text-center">작성일</th>
	      <td>${ask.ask_wdate}</td>
	    </tr>
		<tr>
		  <th class="bg-light text-center">내용</th>
		  <td colspan="3" style="height: 300px;">
		    <textarea class="form-control" rows="10" readonly style="overflow-y: scroll; resize: none;">${ask.ask_content}</textarea>
		  </td>
		</tr>
	    <tr>
	      <th class="bg-light text-center">첨부파일</th>
	      <td colspan="3">
	        <c:if test="${empty ask.ask_file}">
	        첨부파일 없음
	        </c:if>
	        <c:if test="${!empty ask.ask_file}">
	        
				<c:url var="downUrl" value="filedown.do">
					<c:param name="filename">${ask.ask_file}</c:param>
				</c:url>
	          <a href="${downUrl}">첨부파일 다운로드</a>
	         </c:if>
	      </td>
	    </tr>
	  </tbody>
	</table>
	<div class="text-center">
	 <a href="askList.do" class="btn btn-primary text-center">수정</a>
	 <a href="askList.do" class="btn btn-primary text-center">삭제</a>
	 <a href="askList.do" class="btn btn-primary text-center">목록으로 돌아가기</a>
	 </div>
      <div class="mt-5">
        <h4>댓글 작성하기</h4>
        <form action="#" method="post">
          <div class="form-group">
            <label for="comment_writer">작성자</label>
            <input type="text" name="comment_writer" id="comment_writer" class="form-control">
          </div>
          <div class="form-group">
            <label for="comment_content">내용</label>
            <textarea name="comment_content" id="comment_content" class="form-control"></textarea>
          </div>
          <button type="submit" class="btn btn-primary">댓글 작성</button>
        </form>
      </div>
    </div>
  </div>
</div>

<%@include file="/WEB-INF/views/footer.jsp" %>


</body>
</html>