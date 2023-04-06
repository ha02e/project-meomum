<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>[관리자] 상품 관리</title>
<link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
<!-- App CSS -->  
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css">
<script>
function confirmDel(pro_idx){
	if (confirm("정말 삭제하시겠습니까?")) {
	    window.location.href = "proDel.do?pro_idx=" + pro_idx;
	}
}

function sortUsers(orderby, type, fvalue) {

	  if(type=='yes') {
	    window.location.href = 'proFind.do?proF='+orderby+'&type=yes&fvalue='+fvalue;
	  } else {
	    window.location.href = 'proFind.do?proF='+orderby;
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
				<h2 class="text-center mb-4">상품 관리</h2>
				
	<div class="row justify-content-between mb-3">
    <div class="col-md-6">
        <form name="proFind" action="proFind.do">
            <div class="input-group">
                <input type="text" class="form-control" name="proF" placeholder="상품명 검색" style="max-width: 250px;">
                <button class="btn btn-primary" type="submit">검색</button>
            </div>
        </form>
    </div>
    <div class="col-md-6">
    <div class="d-flex justify-content-end align-items-center">
        <span class="me-2">카테고리:</span> 
        <select class="form-select w-auto" name="orderby" onchange="sortUsers(this.value, '${type}', '${fvalue}')">
            <option value="침대" ${order == '1' ? 'selected' : ''}>침대</option>
            <option value="테이블" ${order == '2' ? 'selected' : ''}>테이블</option>
            <option value="의자" ${order == '3' ? 'selected' : ''}>의자</option>
            <option value="소파" ${order == '4' ? 'selected' : ''}>소파</option>
            <option value="조명" ${order == '5' ? 'selected' : ''}>조명</option>
        </select>
    </div>
</div>
</div>
				
				
	<a href="proForm.do">상품 등록</a>
		
				<div class="table-responsive">
				<table class="table table-hover" style="text-align:center;">
					<thead>
						<tr>
							<th></th>
							<th>No.</th>
							<th>카테고리</th>
							<th>상품명</th>
							<th>재고량</th>
							<th>재고 상태</th>
							<th>정가</th>
							<th>구독 월 수</th>
							<th>월 구독 가격</th>
							<th>등록일자</th>
						</tr>
					</thead>
					<tbody>
						<c:if test="${empty lists }">
							<tr>
								<td colspan="11" align="center">
								등록된 게시글이 없습니다
								</td>
							</tr>
						</c:if>
						<c:forEach var="list" items="${lists}">
							<tr>
								<td><img alt="thumbnail" src="/meomum/items/${list.pro_thumb}" style="width:40px; height:40px;"></td>
								<td>${list.pro_idx}</td>
								<td>
									<c:choose> 
										<c:when test="${list.pro_cate == 1}">
											침대
										</c:when>
										<c:when test="${list.pro_cate == 2}">
											테이블
										</c:when>
										<c:when test="${list.pro_cate == 3}">
											의자
										</c:when>
										<c:when test="${list.pro_cate == 4}">
											소파
										</c:when>
										<c:when test="${list.pro_cate == 5}">
											조명
										</c:when>
									</c:choose>
								</td>
								<td><a href="proContent.do?pro_idx=${list.pro_idx}">${list.pro_name }</a></td>	
								<td>${list.pro_amount}</td>
								<td>
									<c:choose> 
										<c:when test="${list.pro_state == 0}">
										 판매 중
										</c:when>
									 	<c:otherwise>
									   	 품절
									  	</c:otherwise>
									</c:choose>
								</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pro_price }" />원</td>
								<td>${list.pro_month }</td>
								<td><fmt:formatNumber type="number" maxFractionDigits="3" value="${list.pro_subprice }" />원</td>
								<td>${list.pro_date }</td>	
								<td><a href="proUpdateForm.do?pro_idx=${list.pro_idx}">수정</a> | <a href="#" onclick="confirmDel(${list.pro_idx})">삭제</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>

<div class="container-xl">
	<nav aria-label="Page navigation example">
		<span class="pagination pagination-sm justify-content-center">
			${pageStr}
		</span>
	</nav>

</div>
			</div>
			<!--//container-fluid-->
		</div>
		<!--//app-content-->
		<!-- 본문 끝 -->
		<%@include file="/WEB-INF/views/footer_a.jsp"%>
	</div>
	<!-- app-wrapper 끝-->

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
	</script>
</body>
</html>