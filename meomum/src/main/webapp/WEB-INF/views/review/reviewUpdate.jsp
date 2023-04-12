<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>리뷰작성 테스트</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- ckeditor -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>

<style>
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://plus.unsplash.com/premium_photo-1669686968099-f3a8f355a8cc?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80)
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

/* ck에디터 */
.ck-editor__editable[role="textbox"] {
	/* editing area */
	min-height: 500px;
}
.ck-content .image {
	/* block images */
	max-width: 80%;
	margin: 20px auto;
}

.nofile{
	margin-bottom:10px;
	color:blue;
	font-weight: bold;
}
.fileDel{
	margin-bottom:10px;
}
.fileDel span{
	color:blue;
	font-weight: bold;
}

/* 별점 */
#review-star fieldset{
    display: inline-block;
    direction: rtl;
}
#review-star input[type=radio]{
    display: none;
}
#review-star label{
    font-size: 1.4em;
    color: transparent;
    text-shadow: 0 0 0 #dddddd;
}
#review-star label:hover{
    text-shadow: 0 0 0 #FFD400;
}
#review-star label:hover ~ label{
    text-shadow: 0 0 0 #FFD400;
}
#review-star input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #FFD400;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp"%> 

<!-- 헤더 이미지 시작 -->
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">후기 수정하기</h2>
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- 헤더 이미지 끝 -->

<section class="shop spad">
	<div class="container">
	<div class="row">
		<%@include file="../myMenu.jsp"%> 
		<div class="col-xl-9 col-md-9">
		<!-- ---------- 마이페이지 작업한 파일 페이지 여기에 넣어주세요!!(include) ---------- -->
			<div class="row">
				<!-- 테스트 리뷰게시판 -->
				<form action="reviewUpdate.do" name="reviewUpdate" method="post" enctype="multipart/form-data">
				
				<div class="container-xl">
					<div class="position-relative mb-3">
					<div class="row g-3 justify-content">
						<div class="col">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">작성자</span>
								<input type="text" name="writer" class="form-control" 
										value="${review.writer}">
							</div>
						</div>
						<div class="col">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">카테고리</span>
								<input type="text" name="category" class="form-control" value="${review.category}">
							</div>
						</div>
					</div>
					<div class="mb-3 title">
						<input type="text" name="subject" class="form-control form-control-lg" value="${review.subject}">
					</div>
					
					<!-- ckeditor -->
					<div class="mb-3" id="editor">
						<textarea name="content" id="content">${review.content}</textarea>
						<script>
							var ckeditor_config={
								resize_enaleb : false,
								enterMode : CKEDITOR.ENTER_BR,
								shiftEnterMode : CKEDITOR.ENTER_P,
								filebrowserUploadUrl : '${pageContext.request.contextPath}/review/ckUpload.do'
							};
							CKEDITOR.replace("content",ckeditor_config);
							var reviewContent=CKEDITOR.instances.content.getData();
						</script>
					</div>
					
					<div class="mb-3">
						<label>대표이미지</label> 
						<c:if test="${empty review.thumb}">
							<div class="nofile">
							<span>등록된 썸네일이 없습니다.</span>
							</div>
						</c:if>
						<c:if test="${!empty review.thumb}">
							<div class="fileDel">
								<span>${review.thumb}</span>
							</div>
						</c:if>
						<div>
						<input class="form-control" type="file" name="thumb">
						</div>
					</div>
					
					<div class="mb-3" id="review-star">
						<fieldset>
							<span class="text-bold">별점을 선택해주세요</span>
								<c:forEach var="i" begin="1" end="5" step="1">
									<c:set var="reviewStar" value="${review.star}"/>
								    <c:set var="starValue" value="${6 - i}"/>
								    <c:set var="isChecked" value="${starValue == reviewStar ? 'checked' : ''}"/>
								    <input type="radio" name="star" value="<c:out value='${starValue}'/>" id="rate<c:out value='${i}'/>" <c:out value='${isChecked}'/>>
								    <label for="rate<c:out value='${i}'/>"><i class="bi bi-star-fill"></i></label>
								</c:forEach>
						</fieldset>
					</div>		
				</div>
				
				<div class="mb-3 text-center">
				
				<input type="hidden" name="review_idx" value="${review.review_idx}">
					<input type="submit" class="btn btn-primary mb-2" value="수정하기">
				</div>
				
				</div>
				</form>
			</div>
		<!-- ---------- 마이페이지 각 페이지 여기에 넣어주세요!! 끝 지점 ---------- -->
		</div>
	</div>
	</div>
</section>

<!-- ckeditor -->
<script>
    ClassicEditor
        .create( document.querySelector( '#editor' ) )
        .catch( error => {
            console.error( error );
        } );
</script>


<%@include file="../footer.jsp"%> 


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>