<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--fullcalendar css  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.css">

<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/main.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<!-- fullcalendar 언어 설정관련 script -->
<script
	src="https://cdn.jsdelivr.net/npm/fullcalendar@5.10.1/locales-all.js"></script>
<style>

/* 일요일 날짜 빨간색 */
.fc-day-sun a {
	color: red;
	text-decoration: none;
}

.fc-day-sun {
	background-color: #EFEFEF;
}

/* 토요일 날짜 파란색 */
.fc-day-sat a {
	color: blue;
	text-decoration: none;
}

.fc-day-sat {
	background-color: #EFEFEF;
}
</style>
</head>
<body class="app">
	<%@include file="../header_a.jsp"%>


	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container pt-5">
				<h3 class="text-center mb-4">전체 스케줄 보기</h3>




				<!--카드 -->
				 <div class="row g-4 mb-4">
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Total Sales</h4>
							    <div class="stats-figure">$12,628</div>
							    <div class="stats-meta text-success">
								    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-up" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8 15a.5.5 0 0 0 .5-.5V2.707l3.146 3.147a.5.5 0 0 0 .708-.708l-4-4a.5.5 0 0 0-.708 0l-4 4a.5.5 0 1 0 .708.708L7.5 2.707V14.5a.5.5 0 0 0 .5.5z"/>
</svg> 20%</div>
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="#"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
				    
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Expenses</h4>
							    <div class="stats-figure">$2,250</div>
							    <div class="stats-meta text-success">
								    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-down" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M8 1a.5.5 0 0 1 .5.5v11.793l3.146-3.147a.5.5 0 0 1 .708.708l-4 4a.5.5 0 0 1-.708 0l-4-4a.5.5 0 0 1 .708-.708L7.5 13.293V1.5A.5.5 0 0 1 8 1z"/>
</svg> 5% </div>
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="#"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Projects</h4>
							    <div class="stats-figure">23</div>
							    <div class="stats-meta">
								    Open</div>
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="#"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
				    <div class="col-6 col-lg-3">
					    <div class="app-card app-card-stat shadow-sm h-100">
						    <div class="app-card-body p-3 p-lg-4">
							    <h4 class="stats-type mb-1">Invoices</h4>
							    <div class="stats-figure">6</div>
							    <div class="stats-meta">New</div>
						    </div><!--//app-card-body-->
						    <a class="app-card-link-mask" href="#"></a>
					    </div><!--//app-card-->
				    </div><!--//col-->
			    </div><!--//row-->
			 
	
<!-- 카드끝 -->







				<br> <br>
				<!-- 캘린더 시작  -->
				<div class="row">
					<div class="tab-pane active row justify-content-center">
						<div id='calendar'></div>
					</div>
				</div>
			</div>




		</div>
		<%@include file="../footer_a.jsp"%>
	</div>

</div>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
		
	<script type="text/javascript">
		document.addEventListener('DOMContentLoaded',
						function() {
							var calendarEl = document
									.getElementById('calendar');
							var calendar = new FullCalendar.Calendar(
									calendarEl,
									{

										googleCalendarApiKey : "AIzaSyD3SeaUMvA1AdhujE_RLpRCFrRO4_oKzpw",
										eventSources : [ {
											googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com',
											backgroundColor : 'red',
											textColor : 'black'

										} ],

										initialView : 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
										headerToolbar : { // 헤더에 표시할 툴 바
											start : 'prev next today',
											center : 'title',
											end : 'dayGridMonth,dayGridWeek,dayGridDay'
										},
										titleFormat : function(date) {
											return date.date.year
													+ '년 '
													+ (parseInt(date.date.month) + 1)
													+ '월';
										},
										//initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
										selectable : true, // 달력 일자 드래그 설정가능
										droppable : true,
										editable : true,
										nowIndicator : true, // 현재 시간 마크
										locale : 'ko' // 한국어 설정
									});
							calendar.render();
						});
	</script>
</body>
</html>