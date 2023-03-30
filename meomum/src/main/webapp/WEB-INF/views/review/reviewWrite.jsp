<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>리뷰작성 테스트</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

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
	margin-bottom:18px;
}
.form-control{
	border-radius: 2px;
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
</style>
<script src="https://cdn.ckeditor.com/ckeditor5/36.0.1/classic/ckeditor.js"></script>
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
						<textarea name="review_form" id="editor"></textarea>
						<br>
						<div class="mb-3">
							<label for="formFileMultiple" class="form-label">대표이미지</label>
							<input class="form-control" type="file" id="formFileMultiple" multiple>
						</div>
						
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
						
						<button type="button" class="btn btn-outline-primary mb-2" id="submit">작성하기</button>	
					</div>
			

			</div>
		
		<!-- ---------- 마이페이지 각 페이지 여기에 넣어주세요!! 끝 지점 ---------- -->
		</div>
		
	</div>
	</div>
</section>

<%@include file="../footer.jsp"%> 




<script>
ClassicEditor.create(document.querySelector('#editor'))
.then( editor => { 
	console.log( editor ); 
} ) 
.catch( error => { 
    console.error( error ); 
} );
//Assuming there is a <button id="submit">Submit</button> in your application.
document.querySelector( '#submit' ).addEventListener( 'click', () => {
    const editorData = editor.getData();
} );
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>