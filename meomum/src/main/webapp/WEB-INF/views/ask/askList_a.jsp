<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>간단문의 관리하기</title>

<script type="text/javascript">
	function checklist(checklist, type, fvalue) {
		
			if (type == 'yes') {
				window.location.href = 'askList_a.do?checklist=' + checklist +'&type=yes&fvalue=' + fvalue;
			} else {
				window.location.href = 'askList_a.do?checklist=' + checklist;
			}
		
	}
</script>
</head>
<body class="app">

				<%@include file="/WEB-INF/views/header_a.jsp"%>
				
				<div class="app-wrapper">
				  <div class="app-content pt-3 p-md-3 p-lg-4">
				    <div class="container pt-5 ">
				      <h1 class="text-center mb-4 ">간단문의 게시글 관리</h1>
				      <div class="d-flex justify-content-between align-items-center mb-3">
				        <p class="mb-0">
				          전체 글 수: <span id="total-users">${totalCnt}</span>개 
				          <c:if test="${!empty fvalue}"> | 검색 내용 : ${fvalue } 
				         <a href="askList_a.do" style="color:#FF6A89;border: 1px solid #FF6A89;">검색 취소</a> 
				          </c:if>
				        </p>
				        <form name="searchask" action="askList_a.do" class="ms-auto me-auto">
				          <div class="input-group">
				            <input type="hidden" name="type" value="yes">
				           <input type="hidden" name="checklist" value="${checklist}">
				            <input type="text" class="form-control" placeholder="검색 내용" name="fvalue">
				            <button class="btn btn-primary" type="submit">검색</button>
				          </div>
				        </form>
				        <div class="col-md-2">
				          <div class="d-flex justify-content-end align-items-center">
							<select class="form-select w-auto"
								name="checklist"
								onchange="checklist(this.value, '${type}', '${fvalue}')">
								<option value="1" ${checklist == '1' ? 'selected' : ''}>전체보기</option>
								<option value="2" ${checklist == '2' ? 'selected' : ''}>답변미완료글</option>
								<option value="3" ${checklist == '3' ? 'selected' : ''}>당일 작성글</option>
							</select>
						</div>
					</div>
				</div>
				<table
					class="table table-striped table-hover table-sm text-center table-responsive">
					<thead>
						<tr>
							<th scope="col" style="width: 10%;">No.</th>
							<th align="left" scope="col" style="width: 40%;">제목</th>
							<th scope="col" style="width: 15%;">작성자</th>
							<th scope="col" style="width: 20%;">진행상태</th>
							<th scope="col" style="width: 15%;">작성일</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:if test="${empty lists}">
							<tr>
								<td colspan="5" class="text-center">등록된 글이 없습니다.</td>
							</tr>
						</c:if>
						<c:forEach var="ask" items="${lists}">
							<tr>
								<td>${ask.ask_idx}</td>
								<c:url var="askContentUrl" value="askContent_a.do">
									<c:param name="ask_idx">${ask.ask_idx }</c:param>
								</c:url>
								<td align="left"><a href="${askContentUrl}">
										${ask.ask_title} <c:if test="${ask.newicon}">
											<img src="/meomum/images/icon/icon_new.png" alt="new"
												style="">
										</c:if>
								</a></td>
								<td>${ask.ask_writer}</td>
								<td><c:if test="${ask.ask_ask>0}">
										<button type="button"
											class="btn btn-success align-middle disabled" style="width:90px;">답변완료</button>
									</c:if> <c:if test="${ask.ask_ask==0}">
										<button type="button"
											class="btn btn-danger align-middle disabled" style="width:90px;">진행중</button>
									</c:if></td>

								<td>${ask.ask_date}</td>

							</tr>
						</c:forEach>
					</tbody>
				</table>

			
					<div
						class="col-12 justify-content-center align-items-start text-center">
						<span class="pagination pagination-sm justify-content-center">
							${pageStr} </span>
					</div>
			
			</div>
		</div>
</div>
	<%@include file="/WEB-INF/views/footer_a.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>

</body>
</html>