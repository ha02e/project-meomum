<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>


<head>
<meta charset="UTF-8">
<title></title>
<style>
textarea {
	width: 50%;
	height: 6.25em;
	border: 1px solid black;
	resize: none;
}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- <script>
	$(function() {
		$("#userdate").change(function() {
			$.ajax({
				url : "svcTimeSelect.do",
				data : {
					svc_date : $("#userdate").val()
				},
				method : "get"
			}).done(function(result) {

				}

			})
		})
	});
</script> -->

<script>
$(function() {
	  $("#userdate").change(function() {
	    $.ajax({
	      url : "svcTimeSelect.do",
	      data : {
	        svc_date : $("#userdate").val()
	      },
	      dataType:'json',
	      method : "get"
	    }).done(function(result) {
	      console.log(result);
	    });
	  });
	});

</script>
</head>

<body>
	<h1>방문 견적 예약</h1>
	<form name="svcForm" action="svcFormSubmit.do" method="post">
		<ul>
			<li>거주형태 <select name="svc_type">
					<option value="아파트">아파트</option>
					<option value="빌라">빌라</option>
					<option value="주택">주택</option>
					<option value="복층">복층</option>
					<option value="오피스텔">오피스텔</option>
					<option value="기타">기타</option>
			</select>
			</li>
			
			<li>서비스 영역 
				<input type="checkbox" name="svc_area" value="전체">전체
				<input type="checkbox" name="svc_area" value="주방">주방 
				<input type="checkbox" name="svc_area" value="침실">침실 
				<input type="checkbox" name="svc_area" value="화장실">화장실 
				<input type="checkbox" name="svc_area" value="자녀방">자녀방 
				<input type="checkbox" name="svc_area" value="옷장">옷장 
				<input type="checkbox" name="svc_area" value="기타">기타
			</li>
			
			<li>거주 평수(공급면적) 
				<input type="text" name="svc_py">
			</li>
			
			<li>성함 
				<input type="text" name="user_name">
			</li>
			<li>휴대전화 
				<input type="text" name="user_tel">
			</li>

			<li>지역 
				<input type="text" name="svc_local">
			</li>
			
			<li>방문 희망 일자 
				<input id="userdate" type="date" name="svc_date" onclick="setMinDate()">
			</li>
			
			<li>시간 
				<input type="radio" name="svc_time" value="10:00">10:00
				<input type="radio" name="svc_time" value="13:00">13:00 
				<input type="radio" name="svc_time" value="16:00">16:00
			</li>
			
			<li>요청사항<br> 
				<textarea name="svc_req" rows="5" cols="35" placeholder="요청사항을 입력해주세요"></textarea>
			</li>
			
			<li>서비스 인지 경로 
				<input type="radio" name="svc_know" value="블로그">블로그
				<input type="radio" name="svc_know" value="인터넷 카페">인터넷 카페 
				<input type="radio" name="svc_know" value="지인추천">지인소개
				<input type="radio" name="svc_know" value="검색">인터넷 검색
				<input type="radio" name="svc_know" value="검색">재이용고객
			</li>
			
			<li>개인정보 수집 및 이용에 대한 안내<br> 
			<textarea row="50" cols="120">
				주식회사 머뭄은 기업/단체 및 개인의 정보 수집 및 이용 등 처리에 있어
				아래의 사항을 관계법령에 따라 고지하고 안내해 드립니다.

				1. 정보수집의 이용 목적 : 상담 및 진행
				2. 수집/이용 항목 : 이름, 연락처, 내용 등
				3. 보유 및 이용기간 : 상담 종료후 6개월, 정보제공자의 삭제 요청시 즉시
				4. 개인정보처리담당 : 전화 1234-5678 / 이메일 ask@meomum.com
			</textarea> <br> 
			<input type="checkbox" name="svc_pia" value="Y">개인정보 수집 및 이용에 동의합니다
			</li>
		</ul>
		
		<div>
			<input type="submit" value="예약">
		</div>
		<div id="a"></div>
	</form>
	
	<script>
		/* 	현재 시간보다 이전 시간 선택 불가 제약 */
		var dateElement = document.getElementById('userdate');
		var now = new Date();
		var date = new Date(now.getTime() - now.getTimezoneOffset() * 60000)
				.toISOString().split("T")[0];
		dateElement.value = date;
		dateElement.setAttribute("min", date);

		function setMinDate() {
			if (dateElement.value < date) {
				dateElement.value = date;
			}
		}
	</script>
</body>

</html>