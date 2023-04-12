<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">


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

.fc .fc-time-grid-event .fc-content {
	border: 1px solid black;
	border-radius: 3px;
	padding: 2px;
}

.serviceTitle {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	cursor: pointer;
	position: relative;
	display: inline-block;
	width: 150px;
	padding: 2px;
	background-color: #F9E000;
	border-radius: 3px;
	color: black;
}

.time1 {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	cursor: pointer;
	position: relative;
	display: inline-block;
	width: 150px;
	padding: 2px;
	background-color: #00ECF4;
	border-radius: 3px;
	color: black;
}

.time2 {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	cursor: pointer;
	position: relative;
	display: inline-block;
	width: 150px;
	padding: 2px;
	background-color: #7DDB83;
	border-radius: 3px;
	color: black;
}

.time3 {
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	cursor: pointer;
	position: relative;
	display: inline-block;
	width: 150px;
	padding: 2px;
	background-color: #B674BC;
	border-radius: 3px;
	color: black;
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
				<div class="row g-4 mb-4 d-flex justify-content-center">
					<div class="col-6 col-lg-3">
						<div class="app-card app-card-stat shadow-sm h-100">
							<div class="app-card-body p-3 p-lg-4">
								<h4 class="stats-type mb-1">${month } 방문 예약</h4>
								<div class="stats-figure">${svc_count }</div>
								<div class="stats-meta text-success">
									건
								</div>
							</div>
						</div>
					</div>
					<div class="col-6 col-lg-3">
						<div class="app-card app-card-stat shadow-sm h-100">
							<div class="app-card-body p-3 p-lg-4">
								<h4 class="stats-type mb-1">${month } 서비스 진행</h4>
								<div class="stats-figure">${svcing_count }</div>
								<div class="stats-meta text-success">
									건
								</div>
							</div>
						</div>
					</div>
					<div class="col-6 col-lg-3">
						<div class="app-card app-card-stat shadow-sm h-100">
							<div class="app-card-body p-3 p-lg-4">
								<h4 class="stats-type mb-1">${month } 예약 취소</h4>
								<div class="stats-figure">${svc_cancel }</div>
								<div class="stats-meta text-success">
									건
								</div>
							</div>
						</div>
					</div>
				
				</div>


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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>


	<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
            googleCalendarApiKey : "AIzaSyD3SeaUMvA1AdhujE_RLpRCFrRO4_oKzpw",
            eventSources : [
                {
                    googleCalendarId : 'ko.south_korea#holiday@group.v.calendar.google.com',
                    backgroundColor : '#FF6D6D',
                    textColor : '#FFFFFF'
                },
                {
                    events: ${svcJson},
    
                }

            ],
            initialView : 'dayGridMonth',
            headerToolbar : {
                start : 'prev next today',
                center : 'title',
                end : 'dayGridMonth,dayGridWeek,dayGridDay'
            },
            titleFormat : function(date) {
                return date.date.year + '년 ' + (parseInt(date.date.month) + 1) + '월';
            },
            selectable : true,
            droppable : true,
            editable : true,
            nowIndicator : true,
            locale : 'ko'
            	
        });

        calendar.render();
    });
</script>
</body>
</html>