<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<style>
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://images.unsplash.com/photo-1618221381711-42ca8ab6e908?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1332&q=80)
		no-repeat center;
	background-size: cover;
	margin: 0;
	border-bottom: none;
	padding-bottom: 0px;
}

.page-caption {
	padding: 90px 0px;
	position: relative;
	z-index: 1;
	color: #fff;
	text-align: center;
}

.page-title {
	color: #fff;
	font-size: 40px;
	font-weight: 400;
	letter-spacing: -1px;
}
/**헤더 이미지용 끝*/
.reviewList{
	margin: 60px 0 30px 0; 
}
.tab-content{
	margin-top: 30px; 
}

.card-body{
	cursor: pointer;
}
.card-body.img{
	position: relative;
	overflow: hidden;
	width: 100%;
	height:240px;
	padding:16px 0;
}
.card-body img{
	position: absolute;
  	width: 100%;
  	top: 50%; 
  	left: 50%;
  	transform: translate(-50%, -50%);
}
.card-body a{
	color: var(--p-color) !important;
}
.card-body a:hover{
    color:#FE8A7F !important;
}

.entry-meta ul{
	padding:0;
}

.review-star i {
    color:#FFD400;
}

.read-more a{
    color:#85745D !important;
}
.read-more a:hover{
    color:#FE8A7F !important;
}

.pagination{
	margin:40px 0 60px 0;
}
</style>
</head>
<body>
<%@include file="../header.jsp"%> 
<!-- 헤더 이미지 넣을때 css도 가져갈것...  -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">후기</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

<section class="reviewList">
<div class="container">
			<div class="row g-3 mb-4 align-items-center justify-content-center">
				    <div class="col-auto">
							    <form name="findContent" action="reviewList.do">
					     <div class="page-utilities">
						    <div class="row g-2 justify-content-end justify-content-md-end align-items-center">
							    <div class="col-auto">
								    <select class="form-select w-auto" name="category" >
											<option selected value="1" onclick="location.href = 'reviewList.do';">전체보기</option>
										  <option value="2" ${category == '2' ? 'selected' : ''}>정리일상</option>
										  <option value="3"${category == '3' ? 'selected' : ''}>구독일상</option>
									</select>
							    </div>
							    <div class="col-auto">
								    <div class="table-search-form row gx-1 align-items-center">
					                    <div class="col-auto">
					                        <input type="text" id="fvalue" name="fvalue" class="form-control search-orders" placeholder="검색어를 입력해주세요." size="30" value="${fvalue}">
					                    </div>
					                    <div class="col-auto">
					                        <button type="submit" class="btn app-btn-secondary btn-primary">검색</button>
					                    </div>
					                </div>
							    </div><!--//col-->
						    </div><!--//row-->
				</div><!--//table-utilities-->
					            </form>
			</div><!--//col-auto-->
		</div><!--//row-->
</div>		

			<div class="container">
				<div class="row row-cols-1 row-cols-md-3 g-4 mb-5">
				<c:if test="${empty lists}">
					<h5 class="text-center">등록된 후기가 없습니다.</h5>
				</c:if>
				
				<c:forEach var="dto" items="${lists}">
					
					<c:url var="contentUrl" value="reviewContent.do">
						<c:param name="review_idx">${dto.review_idx}</c:param>
					</c:url>
					
					<div class="col position-relative" >
					<!-- 배지 시작 -->
					        <c:choose>
					
					    <c:when test="${dto.category == '정리일상'}">
				                <span class="position-absolute top-0 start-50 translate-middle badge rounded-pill text-bg-warning" style="z-index: 999;">
				                   정리일상
				                </span>
				            </c:when>
				            <c:otherwise>
				                <span class="position-absolute top-0 start-50 translate-middle badge rounded-pill text-bg-primary " style="z-index: 999;">
				                    구독일상
				                </span>
				            </c:otherwise>
				        </c:choose>
					<!-- 배지끝 -->
						<div class="card h-100">
						<div class="card-body img">
							<c:if test="${not empty dto.thumb}">
								<a href="${contentUrl}">
									<img src="/meomum/images/reviewImg/${dto.thumb}" alt="Card image cap" />
								</a>
							</c:if>
							<c:if test="${empty dto.thumb}">
								<a href="${contentUrl}">
									<img class="card-img-top" src="/meomum/images/noimage.jpg" alt="Card image cap" />
								</a>
							</c:if>
						</div>
						<div class="card-body">
							<h5 class="card-title text-truncate"><a href="${contentUrl}">${dto.subject}</a></h5>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">
              					<div class="entry-meta">
									<ul class="d-flex justify-content-between">
										<li class="d-flex align-items-center"><i class="bi bi-person"></i>&nbsp;
											<c:set var="writerLength" value="${fn:length(dto.writer)}"/>
											<c:choose>
												<c:when test="${fn:length(dto.writer)>2}">
													<c:set var="startIndex" value="${(writerLength - 1) / 2}" />
													<c:set var="endIndex" value="${startIndex + 2 - writerLength % 2}" />
													<c:set var="maskedWriter" value="${fn:substring(dto.writer, 0, startIndex)}*${fn:substring(dto.writer, endIndex, writerLength)}" />
												</c:when>
												<c:otherwise>
													<c:set var="maskedWriter" value="${fn:substring(dto.writer, 0, 1)}*"/>
												</c:otherwise>
											</c:choose>
										 	${maskedWriter}
										</li>
					                  	<li class="d-flex align-items-center review-star">
					                  		<c:forEach var="i" begin="1" end="${dto.star}" step="1">
						                  		<i class="bi bi-star-fill"></i>&nbsp;
					                  		</c:forEach>
					                  	</li>
					                  	<li class="d-flex align-items-center"><i class="bi bi-clock"></i>&nbsp;${dto.writedate}</li>
					                </ul>
					            </div>
							</li>
							<li class="list-group-item">
								<div class="read-more text-center">
				                <a href="${contentUrl}">
									<i class="bi bi-plus-circle"></i>&nbsp;자세히 보기
								</a>
				                </div>
							</li>
						</ul>
              			</div>
              		</div>
				</c:forEach>
				</div>
			</div>
	
		

</section>

<div class="container-xl">
	<nav aria-label="Page navigation example">
		<ul class="pagination pagination-sm justify-content-center">
			<li>${pageStr}</li>
		</ul>
	</nav>

</div>


<%@include file="../footer.jsp"%>            
              
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
 
</body>
</html>