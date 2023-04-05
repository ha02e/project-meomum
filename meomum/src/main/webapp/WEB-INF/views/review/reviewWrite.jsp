<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
.title{
	font-weight: bold;
	margin-bottom: 40px; 
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

/* 별점 */
#review-star fieldset{
    display: inline-block;
    direction: rtl;
}
#review-star fieldset legend{
    text-align: right;
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
<%@include file="../header.jsp"%> 

<section class="shop spad">
	<div class="container">
	<div class="row">
		<%@include file="../myMenu.jsp"%> 
		<div class="col-xl-9 col-md-9">
		<!-- ---------- 마이페이지 작업한 파일 페이지 여기에 넣어주세요!!(include) ---------- -->
			<div class="row">
				<h3 class="title text-center">후기 작성하기</h3>
				<!-- 테스트 리뷰게시판 -->
				<form action="reviewWrite.do" name="reviewWrite" method="post" enctype="multipart/form-data">
				<div class="container-xl">
					<div class="position-relative mb-3">
					<div class="row g-3 justify-content">
						<div class="col">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">작성자</span>
								<input type="text" name="writer" class="form-control" 
										value="${param.writer}" readonly>
							</div>
						</div>
						<div class="col">
							<div class="input-group mb-3">
								<span class="input-group-text" id="inputGroup-sizing-default">카테고리</span>
								<input type="text" name="category" class="form-control" value="${param.category}" readonly>
							</div>
						</div>
					</div>
					<div class="mb-3 title">
						<input type="text" name="subject" class="form-control form-control-lg" placeholder="제목">
					</div>
					
					<!-- ckeditor -->
					<div class="mb-3" id="editor">
						<textarea name="content" id="content"></textarea>
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
						<input class="form-control" type="file" name="thumb">
					</div>
					
					<div class="mb-3" id="review-star">
						<fieldset>
							<span class="text-bold">별점을 선택해주세요</span>
							<c:forEach var="i" begin="1" end="5">
							    <input type="radio" name="star" value="<c:out value='${6 - i}'/>" id="rate<c:out value='${i}'/>">
							    	<label for="rate<c:out value='${i}'/>"><i class="bi bi-star-fill"></i></label>
							</c:forEach>
						</fieldset>
					</div>		
				</div>
				
				<div class="mb-3 text-center">
					<input type="submit" class="btn btn-outline-primary mb-2" value="작성하기">	
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