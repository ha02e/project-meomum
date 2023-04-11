<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>머뭄</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/typed.js/2.0.11/typed.min.js"></script>

<script>
document.addEventListener('DOMContentLoaded', function() {
	  var typedTextElements = document.querySelectorAll('.typed-text');
	  typedTextElements.forEach(function(typedTextElement) {
	    var typed = new Typed(typedTextElement, {
	      strings: typedTextElement.getAttribute('data-typed-text').split(','),
	      typeSpeed: 100,
	      loop: true,
	      backDelay: 1500
	    });
	  });
	});

</script>
<style>
.carousel-item img {
  width: 100%;
  height: 700px;
object-fit: cover; 
}
.main-process {
    padding: 100px 0 110px 0;
    background: #f2f2f2;
    text-align: center;
}
.main-process .tit {
    font-size: 22px;
    font-weight: 700;
    line-height: 1.4em;
    letter-spacing: -0.04em;
    color: #2c2c2c;
    padding-bottom: 32px;
    margin-bottom: 40px;
    border-bottom: 1px dashed #d7d7d7;
}
.main-process .num {
    display: inline-block;
    font-size: 17px;
    font-weight: 700;
    line-height: 1em;
    letter-spacing: -0.04em;
    color: #426b4c;
    padding: 12px 22px;
    border-radius: 60px;
    background: #F5E1DA;
    margin-bottom: 30px;
}
.contain {
    position: relative;
    width: 100%;
    max-width: 1260px;
    padding-left: 30px;
    padding-right: 30px;
    margin: 0 auto;
}
.main-process .main-tit {
    margin-bottom: 65px;
}

    ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}
.main-process ul li {
    position: relative;
    width: calc(25% - 94px);
    margin-left: 94px;
    background: #fff;
    border-radius: 16px;
    padding: 40px 44px;
}
.main-process ul {
    display: flex;
    margin-left: -94px;
}
.main-tit {
    font-size: 38px;
    font-weight: 700;
    line-height: 1.2em;
    letter-spacing: -0.04em;
    color: #82745D;
}
.main-process .tit span {
    display: block;
    font-size: 17px;
    letter-spacing: 0.2em;
    color: #B9916E;
    line-height: 1em;
    margin-bottom: 18px;
}
.main-about {
    padding: 140px 0 140px 0;
}
.main-about .img {
    padding-left: 50px;
}
.main-about .cnt {
    padding-left: 20px;
    flex: 1 1 auto;
    min-width: 0;
    width: 1%;
}

.main-visual {
    position: relative;
    padding: 40px 30px 0 30px;
}
.main-about .contain {
    display: flex;
    position: relative;
    align-items: center;
}
.main-about .main-tit {
    margin-bottom: 25px;
}


div{
 display: block;
}
img {
    border: 0;
    max-width: 100%;
    vertical-align: top;
    overflow-clip-margin: content-box;
    overflow: clip;

}
#mainintro{
font-family: 'GmarketSansMedium';
}
.img {
  width: 600px;
  height: 410px;
object-fit: cover; 
}
@media (min-width: 576px)
.hidden-sm-up {
    display: none!important;
}
</style>
</head>
<body id="mainintro">
	<%@include file="/WEB-INF/views/header.jsp"%>
	<div class="row">
		<div id="carouselExampleRide" class="carousel slide"
			data-bs-ride="true">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleIndicators"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img
						src="https://cdn.pixabay.com/photo/2016/08/26/15/06/home-1622401_960_720.jpg"
						class="d-block  " alt="인테리어 이미지 " data-bs-interval="10000">
				</div>
				<div class="carousel-item">
					<img
						src="https://cdn.pixabay.com/photo/2014/08/11/21/40/bedroom-416062_960_720.jpg"
						class="d-block  " alt="인테리어 이미지" data-bs-interval="10000">
				</div>
				<div class="carousel-item">
					<img
						src="https://cdn.pixabay.com/photo/2020/12/16/00/10/home-5835289_960_720.jpg"
						class="d-block " alt="인테리어 이미지" data-bs-interval="10000">
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleRide" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleRide" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>



	<div class="contain text-center">
		<h2 >머뭄은 <span class="color-primary">
		<br class="hidden-sm-up">
		<span class="typed-text" data-typed-text="['beautiful','gorgeous','outstanding','remarkable','stunning'">gorgeous</span>
		<span class="typed-cursor"></span>
		</span><br class="hidden-sm-up"> 합니다.</h2>
	</div>


<div class="main-about wow" >
		<div class="contain">
			<div class="img"><img src="https://cdn.pixabay.com/photo/2020/05/11/06/45/cutlery-5156696_960_720.jpg" alt="정리된 서랍장"></div>
			<div class="cnt">
				<h2 class="main-tit">머물고 싶은 공간을 만드는 '머뭄'</h2>
				<p>머물고 싶은 공간을 만들어드립니다.<br>당신의 상쾌한 일상에 함께합니다.<br> 간단한 상담이 필요하다면 간단한 문의 먼저 해보세요!</p>

				
				<div class="main-more">정리일상 <a href="svc.do"><button type="button" class="btn btn-outline-info"> 간단문의</button></a></div>
			</div>
		</div>
	</div>


<div class="main-process">
		<div class="contain" style="display: block;">
			<h2 class="main-tit">서비스 프로세스</h2>
			<ul>
				<li class="wow fadeInLeft" data-wow-delay="0.3s" data-wow-duration="0.6s" style="visibility: visible; animation-duration: 0.6s; animation-delay: 0.3s; animation-name: fadeInLeft;">
					<div class="num">01</div>
					<div class="tit"><span>간단문의 견적</span> 어떤 점이 <br>불편하실까요?</div>
					<div class="icon"><img src="https://jnewlife.com/images/main/process_icon1.png" alt="도움아이콘"></div>
				</li>
				<li class="wow fadeInLeft" data-wow-delay="0.4s" data-wow-duration="0.6s" style="visibility: visible; animation-duration: 0.6s; animation-delay: 0.4s; animation-name: fadeInLeft;">
					<div class="num">02</div>
					<div class="tit"><span>해피콜</span> 고객의<br>삶을 공감합니다.</div>
					<div class="icon"><img src="https://jnewlife.com/images/main/process_icon2.png" alt="공감아이콘"></div>
				</li>
				<li class="wow fadeInLeft" data-wow-delay="0.5s" data-wow-duration="0.6s" style="visibility: visible; animation-duration: 0.6s; animation-delay: 0.5s; animation-name: fadeInLeft;">
					<div class="num">03</div>
					<div class="tit"><span>방문미팅</span> 고객의<br>요구사항을 파악합니다.</div>
					<div class="icon"><img src="https://jnewlife.com/images/main/process_icon3.png" alt="호응아이콘"></div>
				</li>
				<li class="wow fadeInLeft" data-wow-delay="0.6s" data-wow-duration="0.6s" style="visibility: visible; animation-duration: 0.6s; animation-delay: 0.6s; animation-name: fadeInLeft;">
					<div class="num">04</div>
					<div class="tit"><span>공간크리에이팅</span>가치있는 공간을<br>만듭니다. </div>
					<div class="icon"><img src="https://jnewlife.com/images/main/process_icon4.png" alt="손아이콘"></div>
				</li>
			</ul>
		</div>
	</div>

<div class="main-about wow fadeInUp" data-wow-delay="0.3s" data-wow-duration="0.6s" style="visibility: visible; animation-duration: 0.6s; animation-delay: 0.3s; animation-name: fadeInUp;">
		<div class="contain">
			<div class="img"><img src="https://cdn.pixabay.com/photo/2020/05/11/06/45/cutlery-5156696_960_720.jpg" alt="정리된 서랍장"></div>
			<div class="cnt">
				<h2 class="main-tit">새로운 삶의 문을 열어주는 '새삶'</h2>
				<p>공간이 바뀌면 인생이 달라집니다. <br>비움과 활용으로 공간을 가치있게 디자인하고 새로운 삶을 살아갈 <br>당신을 응원합니다.</p>
				<div class="main-more"><a href="service.php">바로가기</a></div>
			</div>
		</div>
	</div>


	<%@include file="/WEB-INF/views/footer.jsp"%>

</body>
</html>