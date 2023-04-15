<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- 관리자 헤더 CSS -->  
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">

<!-- 데이터테이블 css&js -->
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" type="text/css">
<script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
	  var table = document.getElementById("svc_table");
	  
	  if (table) {
	    $(table).DataTable({
	    	lengthChange: false,
	    	info: false,
	    	paging: false,
	    	order: [ [ 0, "desc" ] ],
	    	responsive: true,
	    	searching: false
	    });
	  }
});
</script>

<style>
.title {
	text-align: center;
	font-weight: bold;
	margin: 30px 0;
}

#searchCard{
	margin-bottom:10px;
}

#searchCard select#category {
  font-size: 20px; 
}

#searchCard select#category + .datatable-search {
  margin-left: 20px; 
}

@media only screen and (min-width: 768px) {
  #searchCard .card-body > div {
    font-size: 18px; 
  }
}

.datatable-input {
	margin: 0 4px 0 10px;
	width: 250px;
	height: 40px;
}

.datatable-selector {
	height: 40px;
}

.button {
	border-radius: 2px;
	height: 40px;
}

.datatable-table {
	margin: 20px 0 10px 0;
}

.datatable-table tbody tr:hover {
	background-color: #f5f5f5;
}

.datatable-table>tbody>tr>th {
	padding: 1rem 0;
}

.datatable-table>tbody>tr>td {
	font-size: .875rem;
	padding: 1rem 0;
}

thead th a {
	text-align: center;
	cursor: pointer;
}

.svc_idx {
	color: #0055FF;
}

.del {
  color: black;
}

.del:hover {
  color: red;
  font-size: 1em; 
}

/* .state div {
	padding: 0.2rem 0;
	width: 40%;
	text-align: center;
} */

.btn-sm {
	padding: 0.2rem 0.8rem;
}

.paging {
	margin: 20px;
}
</style>


<script src="js/svc/a_svcList.js"></script>

</head>
<body class="app">
	<%@include file="../header_a.jsp"%>
	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container pt-5">
				<h1 class="text-center mb-4">방문 견적 예약</h1>
				
				 <div class="card" id="searchCard">
				 
				    <div class="card-body">
				      <div class="datatable-top d-flex justify-content-right align-items-center">
				        <div class="datatable-search">
				          예약일 <input type="date" name="minDate" id="minDate">&nbsp;~
				          <input type="date" name="maxDate" id="maxDate">&nbsp;
				        </div>
				      </div>
				      <div class="datatable-top d-flex justify-content-right align-items-center">
				        <div class="datatable-search">
				          <select class="datatable-selector" name="category" id="category">
				            <option value="1" selected>고객성함</option>
				            <option value="2">전화번호</option>
				          </select>
				          <input class="datatable-input" placeholder="검색어를 입력해주세요" type="text" name="keyword" id="keyword">
				        </div>
				      </div>
				      <div class="datatable-top d-flex justify-content-right align-items-center">
				        <div class="datatable-search">
				          예약상태 
				          <input type="checkbox" name="svc_state" value="전체">전체&nbsp;
				          <input type="checkbox" name="svc_state" value="예약확정">예약확정&nbsp;
				          <input type="checkbox" name="svc_state" value="예약취소">예약취소&nbsp;
				          <input type="checkbox" name="svc_state" value="견적완료">견적완료&nbsp;
				          <input type="checkbox" name="svc_state" value="결제완료">결제완료&nbsp;
				          <input type="checkbox" name="svc_state" value="결제취소">결제취소&nbsp;
				          <input type="checkbox" name="svc_state" value="작업완료">작업완료&nbsp;
				        </div>
				      </div>
				      <div class="datatable-top ">
						    <div class="datatable-search text-center">
						        <button class="btn app-btn-primary button text-center" onclick="selectDetail()">검색
						    </div>
						    <div class="datatable-search text-end ">
						        <button class="btn app-btn-secondary button " onclick="location.reload()">초기화
						    </div>
					</div>
				    </div>
				  
				</div>
				<!-- 세부 검색 div end -->
				<div class="card">
					<div class="card-body">
						<div class="datatable-container">
							<table class="datatable-table" id="svc_table">
								<thead>
									<tr>
										<th data-sortable="true" style="width: 18%;"
											aria-sort="descending" class="datatable-descending"><a
											href="#" class="datatable-sorter">예약번호</a></th>
										<th data-sortable="true" style="width: 18%;"
											aria-sort="descending" class="datatable-descending"><a
											href="#" class="datatable-sorter">고객성함</a></th>
										<th data-sortable="true" style="width: 10%;"
											aria-sort="descending" class="datatable-descending"><a
											href="#" class="datatable-sorter">전화번호</a></th>
										<th data-sortable="true" style="width: 18%;"
											aria-sort="descending" class="datatable-descending"><a
											href="#" class="datatable-sorter">예약일</a></th>
										<th data-sortable="true" style="width: 10%;"
											aria-sort="descending" class="datatable-descending"><a
											href="#" class="datatable-sorter">상태</a></th>
										<th class="text-center" style="width: 10%;">삭제</th>
									</tr>
								</thead>

								<tbody id="tableBody">
									<c:if test="${empty svcDTO}">
										<tr>
											<td class="text-center" colspan="6">예약한 회원이 없습니다</td>
										</tr>
									</c:if>
									<c:forEach var="dto" items="${svcDTO}">
										<c:url var="contentUrl" value="asvcContent.do">
												<c:param name="svc_idx">${dto.svc_idx}</c:param>
										</c:url>
										<tr>
											<td class="svc_idx text-center "><a href="${contentUrl}">${dto.svc_idx}</a></td>
											<td class="text-center"><a href="${contentUrl}">${dto.user_name}</a></td>
											<td class="text-center">${dto.user_tel}</td>
											<td class="text-center">${dto.svc_regdate}</td>
											<td class="text-center"><c:choose>
													<c:when test="${dto.svc_state eq '예약확정'}">
														<span
															class="text-warning d-flex justify-content-center align-items-center">${dto.svc_state}</span>
													</c:when>
													<c:when test="${dto.svc_state eq '결제완료'}">
														<span
															class="text-info d-flex justify-content-center align-items-center">${dto.svc_state}</span>
													</c:when>
													<c:when
														test="${dto.svc_state eq '예약취소' || dto.svc_state eq '결제취소'}">
														<span
															class="text-danger d-flex justify-content-center align-items-center">${dto.svc_state}</span>
													</c:when>
													<c:when
														test="${dto.svc_state eq '견적완료' || dto.svc_state eq '작업완료'}">
														<span
															class="text-success d-flex justify-content-center align-items-center">${dto.svc_state}</span>
													</c:when>
												</c:choose></td>

											<td class="text-center">
											<div>
											<a href="#" onclick="svcDelete('${dto.svc_idx}','${dto.svc_state}')">X</a>
											</div>
											</td>
										</tr>
										
									</c:forEach>
							</table>
						</div>
					</div>
					<!--card-body end-->
			</div>
			<!--container end-->
			<div class="container-xl paging">
				<nav aria-label="Page navigation example">
					<ul class="pagination pagination-sm justify-content-center">
						${pageStr}
					</ul>
				</nav>
			</div>
		</div>
		<!--app-content~end-->



		<%@include file="/WEB-INF/views/footer_a.jsp"%>
	</div>
	<!-- End:app-wrapper -->
	<!-- Javascript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- 데이터 삭제 -->
	<script>
	function svcDelete(svc_idx,svc_state) {
		var data = {
				svc_idx : svc_idx
			}; 
		
		var ingData = {
				svc_state:svc_state,
				svc_idx : svc_idx
			};
		
		if (confirm("정말로 삭제하시겠습니까?")) {
			if(ingData.svc_state == '예약확정'||ingData.svc_state=='예약취소'){
			$.ajax({
				url : "asvcDelete.do",
				type : "Get",
				contentType : "application/json",
				dataType: 'json',
				data : data,
			}).done(function(data) {
						alert("예약 삭제가 완료되었습니다");
						$(this).closest('tr').remove();
						location.href = 'asvcList.do';
					
				}).fail(function(){
			        	alert('다시 시도해주세요');
			      
			});
			}else{
				$.ajax({
					url : "asvcIngDelete.do",
					type : "Get",
					contentType : "application/json",
					dataType: 'json',
					data : ingData,
				}).done(function(data) {
							alert("예약 삭제가 완료되었습니다");
							$(this).closest('tr').remove();
							location.href = 'asvcList.do';
						
					}).fail(function(){
						alert('다시 시도해주세요');
				});
			}
		}
	}
	</script>
</body>
</html>