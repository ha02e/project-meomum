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

<!-- summernote  -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> 
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script src=" https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/lang/summernote-ko-KR.min.js"></script>
<style>
.review-form{
	width:860px;
	margin:0 auto;
}
.review-form h1{
	text-align: center;
	font-size: 30px;
	font-weight: bold;
	margin-bottom:30px;
}
.review-form .title{
	margin-bottom:10px;
}
.form-control-lg{
	border-radius: 0px;
}
#editor{
	margin: 0 auto;
	border:1px solid blue;
}
button#submit{
	margin:30px auto;
	display:block;
}

/* ck에디터 */
.ck-content {
    height: 500px;
}


/* 별점 */
#review-star fieldset{
    display: inline-block;
    direction: rtl;
    /*border:0;*/
}
#review-star fieldset legend{
    /*text-align: right;*/
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
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#review-star label:hover ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}
#review-star input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
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
			
				<!-- 테스트 리뷰게시판 -->
					<div class="review-form">
						<h1>후기 작성하기</h1>
						<form action="reviewWrite.do" name="myform" id="myform" method="post">
							<div class="container-xl">
								<div class="position-relative mb-3">
								<div class="row g-3 justify-content">
									<div class="col-auto">
										<div class="input-group mb-3">
										  <span class="input-group-text" id="inputGroup-sizing-default">작성자</span>
										  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
										</div>
									</div>
									<div class="col-auto">
										<div class="input-group mb-3">
										  <span class="input-group-text" id="inputGroup-sizing-default">카테고리</span>
										  <input type="text" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default">
										</div>
									</div>
					   			</div>
				    			</div>
							<div class="row g-3 justify-content-between">
								
								
							</div>
							
							<div class="title">
								<input type="text" class="form-control form-control-lg" placeholder="제목">
							</div>
							
							<div id="container">
							  <textarea class="summernote" name="editordata"></textarea>    
							</div>
	
							<br>
							<div class="mb-3">
								<label for="formFileMultiple" class="form-label">대표이미지</label>
								<input class="form-control" type="file" id="formFileMultiple" multiple>
							</div>
							
							<div class="mb-3" id="review-star">
								<fieldset>
									<span class="text-bold">별점을 선택해주세요</span>
									<input type="radio" name="reviewStar" value="5" id="rate1"><label
										for="rate1">★</label>
									<input type="radio" name="reviewStar" value="4" id="rate2"><label
										for="rate2">★</label>
									<input type="radio" name="reviewStar" value="3" id="rate3"><label
										for="rate3">★</label>
									<input type="radio" name="reviewStar" value="2" id="rate4"><label
										for="rate4">★</label>
									<input type="radio" name="reviewStar" value="1" id="rate5"><label
										for="rate5">★</label>
								</fieldset>
							</div>		
							
							<button type="button" class="btn btn-outline-primary mb-2" id="submit">작성하기</button>	
						</div>
					</form>

			</div>
		
		<!-- ---------- 마이페이지 각 페이지 여기에 넣어주세요!! 끝 지점 ---------- -->
		</div>
		
	</div>
	</div>
</section>

<!-- summernote js  -->
<script>
$('.summernote').summernote({
	placeholder: '후기 내용을 작성해주세요.',
	height: 300,
	lang: "ko-KR"
});
</script>

<%@include file="../footer.jsp"%> 





<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>