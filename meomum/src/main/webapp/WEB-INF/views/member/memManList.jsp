<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>머뭄 회원 관리 페이지</title>
<script type="text/javascript">
	function sortUsers(orderby, type, fvalue) {

		if (type == 'yes') {
			window.location.href = 'menMan.do?orderby=' + orderby
					+ '&type=yes&fvalue=' + fvalue;
		} else {
			window.location.href = 'menMan.do?orderby=' + orderby;
		}
	}
</script>

</head>

<body class="app">
	<%@include file="/WEB-INF/views/header_a.jsp"%>


	<!-- 본문 시작 -->
	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container pt-5">
				<h1 class="text-center mb-4">회원관리</h1>

				<!-- 탭 메뉴  -->
				<ul class="nav nav-tabs nav-tabs-sm" id="borderedTabJustified"
					role="tablist">
					<li class="nav-item" role="presentation">
						<button class="nav-link active" id="home-tab" data-bs-toggle="tab"
							data-bs-target="#bordered-justified-home" type="button"
							role="tab" aria-controls="home" aria-selected="false"
							tabindex="-1">전체보기</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="profile-tab" data-bs-toggle="tab"
							data-bs-target="#bordered-justified-profile" type="button"
							role="tab" aria-controls="profile" aria-selected="true">회원</button>
					</li>
					<li class="nav-item" role="presentation">
						<button class="nav-link" id="admin-tab" data-bs-toggle="tab"
							data-bs-target="#bordered-justified-admin" type="button"
							role="tab" aria-controls="admin" aria-selected="false">관리자</button>
					</li>
				</ul>
				<!-- 탭 메뉴끝  -->


				<!-- 전체 회원 보기 tab  -->
				<div class="tab-content pt-2" id="borderedTabJustifiedContent">
					<div class="tab-pane fade active show" id="bordered-justified-home"
						role="tabpanel" aria-labelledby="home-tab">

						<div class="tab-pane active row justify-content-center">
							<div class="col-md-6">

								<form name="searchuser" action="menMan.do" class="input-group">
									<input type="hidden" name="type" value="yes"> <input
										type="hidden" name="orderby" value="${orderby}"> <input
										type="text" class="form-control" placeholder="전체 관리자+회원 검색"
										name="fvalue">
									<button class="btn btn-primary" type="submit">검색</button>
								</form>

							</div>
							<div class="col-md-6">
								<div class="d-flex justify-content-end align-items-center">
									<span class="me-2 ">정렬:</span> <select
										class="form-select w-auto" name="orderby"
										onchange="sortUsers(this.value, '${type}', '${fvalue}')">
										<option value="1" ${order == '1' ? 'selected' : ''}>신규
											회원순</option>
										<option value="2" ${order == '2' ? 'selected' : ''}>이름순</option>
										<option value="3" ${order == '3' ? 'selected' : ''}>예약횟수순</option>
										<option value="4" ${order == '4' ? 'selected' : ''}>구독순</option>
										<option value="5" ${order == '5' ? 'selected' : ''}>후기작성순</option>
									</select>
								</div>
							</div>
						</div>


						<div class="container pt-5">
							<div class="row justify-content-center">
								<div class="col-md-12">
									<div class="text-center mb-4">
										<p class="text-start">
											전체 사용자 <span id="total-users">${totalCnt}</span>명
										</p>
									</div>
									<table class="table table-hover">
										<thead>
											<tr>
												<th>회원 번호</th>
												<th>회원/관리자</th>
												<th>아이디</th>
												<th>이름</th>
												<th>휴대폰</th>
												<th>가입일자</th>
												<th>예약횟수</th>
												<th>구독수</th>
												<th>후기작성</th>
												<th>비고</th>
											</tr>
										</thead>
										<tbody id="user-list">
											<c:if test="${empty lists }">
												<tr>
													<td colspan="9" align="center">회원이 없습니다.</td>
												</tr>
											</c:if>
											<c:forEach var="ul" items="${lists}">
												<tr>
													<td>${ul.user_idx }</td>
													<td>${ul.user_info }</td>
													<td>${ul.user_id }</td>
													<td>${ul.user_name}</td>
													<td>${ul.user_tel}</td>
													<td>${ul.joindate}</td>
													<td>${ul.svcCount}</td>
													<td>${ul.orderCount}</td>
													<td>${ul.reviewCount}</td>
													<td>
														<!-- Button trigger modal -->
														<button type="button" class="btn btn-primary"
															data-bs-toggle="modal" data-bs-target="#exampleModal"
															onclick="document.getElementById('user_Idx').value='${ul.user_idx}';">
															수정</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

								<div class="container-xl">
									<nav aria-label="Page navigation example">
										<span class="pagination pagination-sm justify-content-center">
											${pageStr} </span>
									</nav>

								</div>
							</div>
							<!--//container-fluid-->
						</div>
					</div>

					<!--  전체 회원 탭 끝 -->


				</div>
			</div>
		</div>
		<!--//app-content-->
		<!-- 본문 끝 -->
		<%@include file="/WEB-INF/views/footer_a.jsp"%>
	</div>
	<!-- app-wrapper 끝-->



	<!-- 회원 정보수정 모달 -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">
						회원 정보 수정 <input type="text" name="user_Idx" id="user_Idx"
							value="${user_idx}">
					</h1>

					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<button type="button" class="btn btn-danger" id="manageBtn"
						data-user-idx="">관리자로 변경</button>
					<form>
						<div class="mb-3">
							<label for="user-memo" class="form-label">사용자 메모</label> <input
								type="text" class="form-control" id="user-memo"
								placeholder="사용자 메모를 입력하세요.">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">닫기</button>
					<button type="submit" class="btn btn-primary">수정</button>
				</div>
			</div>
		</div>
	</div>






	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
		
	</script>
	<script type="text/javascript" src="/meomum/js/request.js"></script>
	<script>
		function manage() {
			if (confirm("관리자로 변경하시겠습니까?")) {
				var user_idx = document.getElementById('manageBtn')
						.getAttribute('data-user-idx');
				alert(user_idx);
				$.ajax({
					url : 'askCommDel.do',
					method : 'POST',
					data : {
						ask_idx : ask_idx
					},
					success : function(data) {
						window.location.reload();
						alert(data.msg);
					},
					error : function(jqXHR, textStatus) {
						alert('전송 실패');
					}
				});
			}
		}
	</script>




</body>

</html>