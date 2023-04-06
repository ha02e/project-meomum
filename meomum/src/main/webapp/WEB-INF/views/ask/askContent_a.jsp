<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>간단견적 문의 내용</title>
<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- App CSS -->
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>
<body>


<%@include file="/WEB-INF/views/header_a.jsp"%>
<br><br><br><br>
<div class="container">
  <div class="row justify-content-center">
    <div class="col-md-9">
      <div class="row">
        <div class="text-center">
          <h4>간단견적 내용</h4>
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
			<td colspan="3" style="height: 300px;"><textarea
					class="form-control" rows="100" name="ask_content" id="ask_content"  readonly
					style="overflow-y: scroll; resize: none; height:300px">${ask.ask_content}</textarea>
			</td>
		</tr>
	    <tr>
	      <th class="bg-light text-center">첨부파일</th>
	      <td colspan="3">
	        <c:if test="${empty ask.ask_file}">
	        첨부파일 없음
	        </c:if>
			<c:if test="${not empty ask.ask_file}">
			    <c:url var="downUrl" value="filedown.do">
			        <c:param name="filename" value="${ask.ask_file}" />
			    </c:url>
			
			    <button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#attachmentModal">첨부파일보기</button>
			
		
				<!-- Attachment Modal -->
				<div class="modal fade" id="attachmentModal" tabindex="-1" aria-labelledby="attachmentModalLabel" aria-hidden="true">
				    <div class="modal-dialog modal-lg">
				        <div class="modal-content">
				            <div class="modal-header">
				                <h5 class="modal-title" id="attachmentModalLabel">첨부 파일</h5>
				                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				            </div>
				            <div class="modal-body">
				                <div class="d-flex flex-column align-items-center">
				                    <img src="/meomum/images/askFile/${ask.ask_file}" class="img-fluid mb-3" alt="첨부 이미지" />
				                    <a href="${downUrl}" class="btn btn-primary">파일 다운로드</a>
				                </div>
				            </div>
				        </div>
				    </div>
				</div>
			</c:if>
	         
	      </td>
	    </tr>
	  </tbody>
	</table>
	<div class="text-center">
	 <a href="askList_a.do" class="btn btn-primary text-center">수정</a>
	 <button type="button" class="btn btn-primary" onclick="deleteData()">삭제</button>
	 <a href="askList_a.do" class="btn btn-primary text-center">목록으로 돌아가기</a>
	 </div>
	 
	 <!-- 관리자 댓글용 -->
	 <c:if test="${empty comm }">
	      <div class="mt-5">
	        <h4>답글 작성</h4>
	        <form name="commentInsert" action="aksComm.do" method="post">
	        <input type="hidden" name="ask_idx" value="${ask.ask_idx}">
	        <input type="hidden" name="user_idx" value="${sessionScope.ssInfo.user_idx}">
	          <div class="form-group">
	            <label for="comm_content">내용</label>
	            <textarea name="comm_cont" id="comm_cont" class="form-control"></textarea>
	          </div>
	          <button type="submit" class="btn btn-primary">댓글 작성</button>
	        </form>
	      </div>
      </c:if>
<!-- 답글시작 -->
		<c:if test="${!empty comm }">
			<div class="card mb-3">
				<div class="card-header">
					관리자:${mInfo.user_name} (${comm.comm_date})  <button type="button" class="btn btn-primary" onclick="deleteComm()">삭제</button>
				</div>
				<div class="card-body">
					<p class="card-text">${comm.comm_cont}</p>
				</div>
			</div>
		</c:if>
		<!-- 답글 끝 -->
    </div>
  </div>
</div>

<%@include file="/WEB-INF/views/footer_a.jsp" %>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script type="text/javascript" src="/meomum/js/request.js"></script>

<!-- 게시글 삭제 -->
<script>
	var data = {
		ask_idx : "${ask.ask_idx}",
		ask_file : "${ask.ask_file}",
	};

	function deleteData() {
		if (confirm("정말로 삭제하시겠습니까?")) {
			$.ajax({
				url : "askDelete.do",
				type : "POST",
				contentType : "application/json",
				data : JSON.stringify(data),
				success : function(response) {
					alert("게시물이 삭제되었습니다.");
					$(this).closest('tr').remove();
					location.href = 'askList_a.do';
				},
				error : function() {
					alert("삭제 요청이 실패하였습니다.");
				}
			});
		}
	}
	
	function deleteComm() {
		if (confirm("정말로 삭제하시겠습니까?")){ 
			var ask_idx = '${ask.ask_idx}';

		  $.ajax({
		    url: 'askCommDel.do',
		    method: 'POST',
		    data: {
		      ask_idx: ask_idx
		    },
		    success: function(data) {
		      window.location.reload();
		      alert(data.msg);
		    },
		    error: function(jqXHR, textStatus) {
		      alert('전송 실패');
		    }
		  });
		}
	}
</script>

</body>
</html>