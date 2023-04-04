<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간단견적 문의 내용</title>

</head>
<body>


	<%@include file="/WEB-INF/views/header.jsp"%>
	<br>
	<br>
	<br>
	<br>
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
									class="form-control" rows="10" name="ask_content" id="ask_content"  readonly
									style="overflow-y: scroll; resize: none;">${ask.ask_content}</textarea>
							</td>
						</tr>
						<tr>
							<th class="bg-light text-center">첨부파일</th>
							<td colspan="3"><c:if test="${empty ask.ask_file}">
	        첨부파일 없음
	        </c:if> <c:if test="${not empty ask.ask_file}">
									<c:url var="downUrl" value="filedown.do">
										<c:param name="filename" value="${ask.ask_file}" />
									</c:url>

									<button type="button" class="btn btn-outline-success"
										data-bs-toggle="modal" data-bs-target="#attachmentModal">첨부파일보기</button>


									<!-- Attachment Modal -->
									<div class="modal fade" id="attachmentModal" tabindex="-1"
										aria-labelledby="attachmentModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="attachmentModalLabel">첨부
														파일</h5>
													<button type="button" class="btn-close"
														data-bs-dismiss="modal" aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<div class="d-flex flex-column align-items-center">
														<img src="/meomum/images/askFile/${ask.ask_file}"
															class="img-fluid mb-3" alt="첨부 이미지" /> <a
															href="${downUrl}" class="btn btn-primary">파일 다운로드</a>
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
					<button type="button" class="btn btn-primary text-center" onclick="editData()">수정</button>
					<button type="button" class="btn btn-primary"
						onclick="deleteData()">삭제</button>

					<a href="askList.do" class="btn btn-primary text-center">목록으로
						돌아가기</a>
				</div>
				<!-- 답글시작 -->
				<c:if test="${empty comm }">
					<div class="alert alert-primary mb-3" role="alert">담당자가 현재 확인
						중입니다. 빠른 시일 내에 답변드리겠습니다.</div>
				</c:if>
				<c:if test="${!empty comm }">
					<div class="card mb-3">
						<div class="card-header">관리자 (${comm.comm_date})</div>
						<div class="card-body">
							<p class="card-text">${comm.comm_cont}</p>
						</div>
					</div>
				</c:if>
				<!-- 답글 끝 -->

			</div>
		</div>
	</div>



	<%@include file="/WEB-INF/views/footer.jsp"%>


	<!-- 데이터 삭제 스크립트 -->

	<script>
		var data = {
			ask_idx : "${ask.ask_idx}",
			ask_file : "${ask.ask_file}"
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
						location.href = 'askList.do';
					},
					error : function() {
						alert("삭제 요청이 실패하였습니다.");
					}
				});
			}
		}
		
	</script>

</body>
</html>