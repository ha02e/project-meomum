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

/* 세부사항 토글관련 */
label.detail {
	background: #00cdac;
	color: white;
	display: inline-block;
	width: 100px;
	line-height: 32px;
	padding: 2px 0;
	cursor: pointer;
	text-align: center;
	font-size: 14px;
}

/**/
label:hover, label:active, input:hover+label, input:active+label {
	background: #00cdac;
	transition: 0.3s;
}

#detaildiv {
	height: 150px;
	margin-top: 10px;
	border-radius: 12px;
	border: 2px solid #DDDDDF;
	background: white;
}

input#detail {
	display: none;
}

div#detaildiv {
	display: none;
}

input#detail:checked+div#detaildiv {
	display: block;
}
</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>


<script>
$(function() {
	function timeSelect(){		
		//span 태그 내 텍스트 빈 문자열
		$('#timeA+span, #timeB+span, #timeC+span').text("");
		
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
			
	    //컨트롤러에서 전달받은 값이 timeA,B,C와 같으면 버튼 빨강색으로 변화
	    if (data != null) {
  			for (let i = 0; i < data.times.length; i++) {
    			if (data.times[i] == $("#timeA").val()) {
     				$('#timeA+span').text('예약불가');
      				$('#timeA+span').css('color','red');
    			} else if (data.times[i] == $("#timeB").val()) {
     				$('#timeB+span').text('예약불가');
      				$('#timeB+span').css('color','red');
    			} else {
      				$('#timeC+span').text('예약불가');
      				$('#timeC+span').css('color','red');
    			}
  			}
		}
	   }).fail(function() {
	      alert('다시 시도해주세요');
	   });
	}
	timeSelect();

	$("#svc_days").change(function(){
		timeSelect();
	});
});
</script>

</head>
<body>
	<h1>방문 견적 예약</h1>
	<form name="asvcUpdate" action="asvcUpdate.do" method="post">
		<ul>
			<li>예약번호 <input type="text" name="svc_idx"
				value="${dto.svc_idx}" readonly>
			</li>

			<li>거주형태 <select name="svc_type">
					<option value="아파트" ${dto.svc_type =="아파트"?"selected":""}>아파트</option>
					<option value="빌라" ${dto.svc_type =="빌라"?"selected":""}>빌라</option>
					<option value="주택" ${dto.svc_type =="주택"?"selected":""}>주택</option>
					<option value="복층" ${dto.svc_type =="복층"?"selected":""}>복층</option>
					<option value="오피스텔" ${dto.svc_type =="오피스텔"?"selected":""}>오피스텔</option>
					<option value="기타" ${dto.svc_type =="기타"?"selected":""}>기타</option>
			</select>
			</li>

			<li>서비스 영역 <input type="checkbox" name="svc_area" value="전체"
				${dto.svc_area.contains("전체")?"checked":""}>전체 <input
				type="checkbox" name="svc_area" value="주방"
				${dto.svc_area.contains("주방")?"checked":""}>주방 <input
				type="checkbox" name="svc_area" value="침실"
				${dto.svc_area.contains("침실")?"checked":""}>침실 <input
				type="checkbox" name="svc_area" value="화장실"
				${dto.svc_area.contains("화장실")?"checked":""}>화장실 <input
				type="checkbox" name="svc_area" value="자녀방"
				${dto.svc_area.contains("자녀방")?"checked":""}>자녀방 <input
				type="checkbox" name="svc_area" value="옷장"
				${dto.svc_area.contains("옷장")?"checked":""}>옷장 <input
				type="checkbox" name="svc_area" value="기타"
				${dto.svc_area.contains("기타")?"checked":""}>기타
			</li>


			<li>거주 평수(공급면적) <input type="text" name="svc_py"
				value="${dto.svc_py}">
			</li>

			<li>성함 <input type="text" name="user_name"
				value="${dto.user_name}">
			</li>
			<li>휴대전화 <input type="text" name="user_tel"
				value="${dto.user_tel}">
			</li>

			<li>지역 <input id="user_pcode" type="text" name="user_pcode"
				readonly value="${dto.user_pcode}"><br>
				<div onclick="findAddr()">우편번호찾기</div> <input id="user_addr"
				type="text" name="user_addr" readonly value="${dto.user_addr}"><br>
				<input type="text" name="user_detail" placeholder="상세 주소"
				value="${dto.user_detail}">
			</li>

			<li>방문 희망일자 ${dto.svc_days} &nbsp;&nbsp; ${dto.svc_time}</li>

			<label class="detail" for="detail">수정</label>
			<input type="checkbox" id="detail">
			<div id="detaildiv">
				<input id="svc_days" type="date" name="svc_days"
					value="${dto.svc_days}" onclick="setMinDate()"> <input
					id="timeA" type="radio" name="svc_time" value="10:00"
					${dto.svc_time =="10:00"?"checked":""}>10:00<span></span> <input
					id="timeB" type="radio" name="svc_time" value="13:00"
					${dto.svc_time =="13:00"?"checked":""}>13:00<span></span> <input
					id="timeC" type="radio" name="svc_time" value="16:00"
					${dto.svc_time =="16:00"?"checked":""}>16:00<span></span>
			</div>
			<li>예약상태 <select name="svc_state">
					<option value="예약확정" ${dto.svc_state =="예약확정"?"selected":""}>예약확정</option>
					<option value="예약취소" ${dto.svc_state =="예약취소"?"selected":""}>예약취소</option>
					<option value="견적완료" ${dto.svc_state =="견적완료"?"selected":""}>견적완료</option>
					<option value="결제대기" ${dto.svc_state =="결제대기"?"selected":""}>결제대기</option>
					<option value="결제완료" ${dto.svc_state =="결제완료"?"selected":""}>결제완료</option>
					<option value="결제취소" ${dto.svc_state =="결제취소"?"selected":""}>결제취소</option>
					<option value="작업완료" ${dto.svc_state =="작업완료"?"selected":""}>작업완료</option>
			</select>
			</li>


			<li>요청사항<br> <textarea name="svc_req" rows="5" cols="35">${dto.svc_req}</textarea>
			</li>

			<li>서비스 인지 경로 <input type="text" value="${dto.svc_know}"
				readonly>
			</li>
			<li>관리자 메모<br> <textarea name="svc_memo" rows="5" cols="35">${dto.svc_memo}</textarea>
			</li>
		</ul>

		<hr>
		서비스 희망일: 데이터데이터

		결제내역
		<table border="1 solid black" cellspacing="0">
			<thead>
				<th>결제방식</th>
				<th>견적금액</th>
				<th>할인금액</th>
				<th>결제금액</th>
				<th>확인/취소</th>
			</thead>
			<tbody>
				<tr>
					<td>데이터</td>
					<td>데이터</td>
					<td>데이터</td>
					<td>데이터</td>
					<td>데이터</td>
				</tr>
			</tbody>
		</table>
		<div>
			<script src="js/svcIngPopup.js"></script>
			<input type="button" value="정보 추가" onclick="svcIng()">
			<!-- onclick시 서비스 진행 idx,예약번호idx 넘기기-->
			<!-- 서비스 진행일자, 견적금액, 할인금액, 결제 금액, 결제 상태 넘기기-->
		</div>
		<hr>

		<div>
			<input type="submit" value="저장하기"> 
			<input type="reset" value="초기화">
		</div>
	</form>

	<!-- 현재 시간보다 이전 시간 선택 불가 제약 -->
	<script>
		var dateElement = document.getElementById('svc_days');
		var now = new Date();
		var date = new Date(now.getTime()+24*60*60*1000 - now.getTimezoneOffset() * 60000).toISOString().split("T")[0];
		dateElement.setAttribute("min", date);

		function setMinDate() {
			if (dateElement.value < date) {
				dateElement.value = date;
			}
		}
	</script>

	<!-- 카카오 주소 API -->
	<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
	</script>

	<script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous">
	</script>
</body>


</html>