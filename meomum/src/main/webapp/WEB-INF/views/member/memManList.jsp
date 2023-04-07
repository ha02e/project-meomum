<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>머뭄 회원 관리 페이지</title>
	<script type="text/javascript" src="/meomum/js/request.js"></script>

<script type="text/javascript">
	function sortUsers(orderby, type, fvalue) {

		if (type == 'yes') {
			window.location.href = 'menMan.do?orderby=' + orderby
					+ '&type=yes&fvalue=' + fvalue;
		} else {
			window.location.href = 'menMan.do?orderby=' + orderby;
		}
	}
	
	function manage() {
		  if (confirm("관리자로 변경하시겠습니까?")) {
		    var user_idx = document.getElementById('user_idx').value;
		    var param = "user_idx="+user_idx;
			sendRequest('managerUpdate.do',param,'POST',managerResult);

		  }
		}
	function managerResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				 var data = XHR.responseText;
		            data = JSON.parse(data);
		            alert(data.msg);
		            location.reload();
					
			}else{
				alert('전송에 실패하였습니다.');
			}
		}
	}

	function updateUserMemo() {
		 if (confirm("사용자 정보를 변경하시겠습니까?")) {
			  var memoInput = document.getElementById('user_memo').value;
			  var user_idx = document.getElementById('user_idx').value;
			  var param = "user_memo="+memoInput+"&user_idx="+user_idx;
	
			  sendRequest('userMemoUpdate.do',param,'POST',updateUserMemoResult);
			}
	}
	function updateUserMemoResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				 var data = XHR.responseText;
		            data = JSON.parse(data);
		            alert(data.msg);
		            location.reload();
					
			}else{
				alert('전송에 실패하였습니다.');
			}
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

						<div class="tab-pane active row justify-content-center">
							<div class="col-md-6">

								<form name="searchuser" action="menMan.do" class="input-group">
									<input type="hidden" name="type" value="yes"> <input
										type="hidden" name="orderby" value="${orderby}"> <input
										type="text" class="form-control" placeholder="회원 검색"
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


						<div class="container pt-5 overflow-x-auto">
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
														<button type="button" class="btn btn-outline-secondary"
															data-bs-toggle="modal" data-bs-target="#exampleModal"
															onclick="document.getElementById('user_idx').value='${ul.user_idx}';
															document.getElementById('user_memo').value='${ul.user_memo}';
															">
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
                    회원 정보 수정 
                    <input type="hidden" name="user_idx" id="user_idx"
                        value="${user_idx}">
                </h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                    aria-label="Close"></button>
            </div>
            <div class="modal-body">
               
                <form id="memoForm">
                    <div class="mb-3">
                        <label for="user_memo" class="form-label">사용자 메모</label>
                        <input type="text" class="form-control" id="user_memo"
                            placeholder="사용자 메모를 입력하세요.">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
             <button type="button" class="btn btn-outline-info" id="manageBtn"
                    onclick="manage()">관리자로 변경</button>
                <button type="button" class="btn btn-secondary"
                    data-bs-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-info" id="modifyBtn" onclick="updateUserMemo()">수정</button>
            </div>
        </div>
    </div>
</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
		
	</script>




</body>

</html>