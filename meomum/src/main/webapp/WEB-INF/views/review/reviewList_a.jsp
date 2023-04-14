<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
<!-- App CSS -->  
<link rel="stylesheet" href="assets/css/style.min_review_a.css"> <!-- 관리자후기관리 css -->

<style>

.badge-pending, .badge-active{
	display: inline-block;
}
.activity_idx{
    font-size: 13px;
    line-height: 1.8;
    margin-top:0.2rem;
}
.review-star {
    color:#FFD400;
}

.buttons{
	margin:0.2rem 0;
}


</style>

<script>
function deleteReview(reviewIdx) {
  if (confirm("정말로 삭제하시겠습니까?")) {
	location.href = "reviewDel.do?review_idx=" + reviewIdx;
  } else {
	window.close();
  }
}
</script>

</head>

<body class="app"> 

<%@include file="../header_a.jsp"%>  

<div class="app-wrapper">
	    
	<div class="app-content pt-3 p-md-3 p-lg-4">
		<div class="container pt-5">
			<h1 class="text-center mb-4">후기 관리</h1>
 
				<div class="users-table table-wrapper">
					<table class="posts-table">
						<thead>
							<tr class="users-table-info text-center">
								<th>대표이미지</th>
								<th>제목</th>
								<th>작성자</th>
								<th>이용서비스</th>
								<th>별점</th>
								<th>작성날짜</th>
								<th>관리</th>
							</tr>
						</thead>
                
						<tbody>
							<c:if test="${empty lists}">
								<tr class="text-center">
									<td colspan="7">등록된 후기가 없습니다.</td>
								</tr>
                			</c:if>
							<c:forEach var="dto" items="${lists}">
								<tr class="text-center">
									<td>
										<div class="categories-table-img">
											<c:if test="${not empty dto.thumb}">
												<img src="/meomum/images/reviewImg/${dto.thumb}" alt="tumb" />
											</c:if>
											<c:if test="${empty dto.thumb}">
												<img class="card-img-top" src="/meomum/images/noimage.jpg" alt="no thumb" />
											</c:if>
                        				</div>
                    				</td>
									<td>${dto.subject}</td>
									<td>${dto.writer}</td>
									<td>
										<c:choose>
											<c:when test="${dto.category=='정리일상'}">
												<span class="badge-pending">${dto.category}</span>
												<div class="activity_idx">${dto.activity_idx}</div>
											</c:when>
											<c:when test="${dto.category=='구독일상'}">
												<span class="badge-active">${dto.category}</span>
												<div class="activity_idx">${dto.activity_idx}</div>
											</c:when>
										</c:choose>
									</td>
									<td class="review-star">
										<c:forEach var="i" begin="1" end="${dto.star}" step="1">
						                  	<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-star-fill" viewBox="0 0 16 16">
											  <path d="M3.612 15.443c-.386.198-.824-.149-.746-.592l.83-4.73L.173 6.765c-.329-.314-.158-.888.283-.95l4.898-.696L7.538.792c.197-.39.73-.39.927 0l2.184 4.327 4.898.696c.441.062.612.636.282.95l-3.522 3.356.83 4.73c.078.443-.36.79-.746.592L8 13.187l-4.389 2.256z"/>
											</svg>
					                  	</c:forEach>
									</td>
									<td>${dto.writedate}</td>
									<td>
										<c:url var="contentUrl" value="reviewContent.do">
											<c:param name="review_idx">${dto.review_idx}</c:param>
										</c:url>
										<div class="buttons">
											<a class="action-link" href="${contentUrl}" target="blank">
												<svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
												  <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z"/>
												</svg>
												보기
											</a>
										</div>
										<div class="buttons">
											<a class="action-link" href="#" id="deleteButton" onclick="deleteReview(${dto.review_idx})">
											    <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" fill="currentColor" class="bi bi-dash-circle" viewBox="0 0 16 16">
												  <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z"/>
												  <path d="M4 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 4 8z"/>
												</svg>
											    삭제
											</a>
										</div>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			   
				<div class="container-xl">
					<nav aria-label="Page navigation example">
						<ul class="pagination pagination-sm justify-content-center">
							${pageStr}
						</ul>
					</nav>
				</div>	    
		    </div><!--//container-fluid-->
	    </div><!--//app-content-->


<%@include file="../footer_a.jsp"%>    
</div><!--//app-wrapper-->    					

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>

</html>