<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
textarea {
	width: 50%;
	height: 6.25em;
	border: 1px solid black;
	resize: none;
}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- 예약 완료된 시간 비활성화 -->
<script>
$(function() {
	function timeSelect(){
	    
		//시간 선택 버튼 모두 활성화
	    $('#timeA, #timeB, #timeC').prop('disabled', false);
		
	  //컨트롤러로 사용자가 선택한 날짜 전송
	    $.ajax({
	      url: "svcTimeSelect.do",
	      data: {
	        svc_days: $("#svc_days").val()
	      },
	      dataType: 'json',
	      method: "get"
	    }).done(function(data) {
	      console.log(data);
			
	    //컨트롤러에서 전달받은 값이 timeA,B,C와 같으면 버튼 비활성화
	      if (data != null) {
	        for (let i = 0; i < data.times.length; i++) {
	          if (data.times[i] == $("#timeA").val()) {
	            $('#timeA').prop('disabled', true);
	          } else if (data.times[i] == $("#timeB").val()) {
	            $('#timeB').prop('disabled', true);
	          } else {
	            $('#timeC').prop('disabled', true);
	          }
	        }
	      }
	    }).fail(function() {
	      alert('다시 시도해주세요');
	    });
	};

	timeSelect();

	$("#svc_days").change(function(){
		timeSelect();
	});
});
</script>
</head>
<body>
<h1>방문 견적 예약</h1>
	<form name="svcUpdate" action="svcUpdate.do" method="post">
		<ul>
			<li>예약번호
				<input type="text" value="${dto.svc_idx}" readonly>
			</li>
			
			<li>거주형태 <select name="svc_type">
					<option value="아파트" ${dto.svc_type}="아파트"?"selected":"">아파트</option>
					<option value="빌라" ${dto.svc_type}="빌라"?"selected":"">빌라</option>
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
				<input type="text" name="svc_py" value="">
			</li>
			
			<li>성함 
				<input type="text" name="user_name" value="">
			</li>
			<li>휴대전화 
				<input type="text" name="user_tel" value="">
			</li>

			<li>지역 
				<input id="user_pcode"  type="text" name="user_pcode" placeholder="우편번호" readonly><br>
				<div onclick="findAddr()">우편번호찾기 </div>
				<input id="user_addr" type="text" name="user_addr" readonly value=""> <br>
  				<input type="text" name="user_detail" placeholder="상세 주소" value="">
			</li>
			
			<li>방문 희망 일자 
				<input id="svc_days" type="date" name="svc_days" onclick="setMinDate()" value="">
			</li>
			
			
			<li>시간 
				<input id="timeA" type="radio" name="svc_time" value="10:00">10:00
				<input id="timeB" type="radio" name="svc_time" value="13:00">13:00
				<input id="timeC" type="radio" name="svc_time" value="16:00">16:00
			</li>
			
			<li>요청사항<br> 
				<textarea name="svc_req" rows="5" cols="35" placeholder="요청사항을 입력해주세요" value=""></textarea>
			</li>
			
			<li>서비스 인지 경로 
				<input type="radio" name="svc_know" value="블로그" >블로그
				<input type="radio" name="svc_know" value="인터넷 카페" >인터넷 카페 
				<input type="radio" name="svc_know" value="지인추천" >지인소개
				<input type="radio" name="svc_know" value="검색" >인터넷 검색
				<input type="radio" name="svc_know" value="검색" >재이용고객
			</li>
			<li>관리자 메모<br> 
				<textarea name="svc_memo" rows="5" cols="35" value=""></textarea>
			</li>
			

		</ul>
		
		<div>
			<input type="submit" value="수정">
			<input type="reset" value="초기화">
		</div>
	</form>
	
	<!-- 현재 시간보다 이전 시간 선택 불가 제약 -->
	<script>
		var dateElement = document.getElementById('svc_days');
		var now = new Date();
		var date = new Date(now.getTime()+24*60*60*1000 - now.getTimezoneOffset() * 60000).toISOString().split("T")[0];
		dateElement.value = date;
		dateElement.setAttribute("min", date);

		function setMinDate() {
			if (dateElement.value < date) {
				dateElement.value = date;
			}
		}
	</script>
	
	<!-- 카카오 주소 API -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function findAddr(){
			var width = 500; //팝업의 너비
			var height = 600; //팝업의 높이
	
			new daum.Postcode({
		 		width: width,
		 		height: height,
        		oncomplete: function(data) {
            		var zonecode = data.zonecode;
            		var roadAddr = data.roadAddress; // 도로명 주소 변수
            		var jibunAddr = data.jibunAddress; // 지번 주소 변수

            		document.getElementById('user_pcode').value = zonecode;
            		
            		if(roadAddr !== ''){
                		document.getElementById('user_addr').value = roadAddr;
            		} 
            		else if(jibunAddr !== ''){
                		document.getElementById('user_addr').value = jibunAddr;
            		}
        		}
    		}).open({
        		left: (window.screen.width / 2) - (width / 2),
        		top: (window.screen.height / 2) - (height / 2)
    	});
	}
</body>
</html>