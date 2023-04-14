<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>


<head>
<meta charset="UTF-8">
<title>방문견적신청</title>
<!-- 부트스트랩 CSS 파일 추가 -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9gVRbX+6ePRepvpODvJy27JQ+wh2StsQJz9TYs2X0Pm6Rc8IljaUksdQRVvoxv3"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<style>
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
	background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)),
		rgba(36, 39, 38, 0.5)
		url(https://images.unsplash.com/photo-1615876234886-fd9a39fda97f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1932&q=80)
	
		
		 no-repeat center;
	background-size: cover;
	margin: 0;
	border-bottom: none;
	padding-bottom: 0px;
	margin-bottom: 40px;
}

.page-caption {
	padding: 90px 0px;
	position: relative;
	z-index: 1;
	color: #fff;
	text-align: center;
}

.page-title {
	color: #fff;
	font-size: 40px;
	font-weight: 400;
	letter-spacing: -1px;
}

textarea {
	width: 50%;
	height: 6.25em;
	border: 1px solid black;
	resize: none;
}



#detaildiv {
  display: none;
  margin-top: 5px;
}

#timeDetail:checked ~ #detaildiv {
  display: block;
}

#timeSpan:hover,{
  background: #85745D;
  transition: 0.3s;
}

/* 희망일자 토글관련
label.timeDetail {
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

label.timeDetail:hover,
label.timeDetail:active,
input:hover + label.timeDetail,
input:active + label.timeDetail {
  background: #85745D;
  transition: 0.3s;
}

.timeDetail input#detail {
	display: none;
}

div#detaildiv {
	display: none;
}

#detaildiv {
  height: 150px;
  margin-top: 10px;
  border-radius: 12px;
  border: 2px solid #ddd;
  background: white;
  display: none;
}

#detaildiv input[type="date"] {
  display: block;
  margin: 10px auto;
}

#detaildiv span {
  margin-left: 10px;
  margin-right: 20px;
}

input#timeDetail:checked + #detaildiv {
  display: block;
}*/

footer {
	margin-top: 20px;
}

 </style>


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
	<%@include file="../header.jsp"%>
	<div class="page-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="page-caption">
						<h2 class="page-title">방문 견적 예약 수정</h2>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-10 mx-auto">
				<form name="svcUpdate" action="svcUpdate.do" method="post">
						<input type="hidden" name="svc_state" value="${dto.svc_state}">
						<input type="hidden" name="svc_know" value="${dto.svc_know}">
						<input type="hidden" name="svc_memo" value="${dto.svc_memo}">
				<!-- -------------------------------------예약번호------------------------------- -->	
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_svc_idx" style="font-weight:bold;">예약번호</label> 
								<input type="text" class="form-control input-group-text-fixed" name="svc_idx" id="svc_idx" value="${dto.svc_idx}" required="required" readonly>
						</div>
				<!-- -------------------------------------거주형태------------------------------- -->	
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_svc_type" style="font-weight:bold;">거주형태</label> 
								<select class="form-select" id="svc_type" name="svc_type" required="required">
									<option value="아파트" ${dto.svc_type =="아파트"?"selected":""}>아파트</option>
									<option value="빌라" ${dto.svc_type =="빌라"?"selected":""}>빌라</option>
									<option value="주택" ${dto.svc_type =="주택"?"selected":""}>주택</option>
									<option value="복층" ${dto.svc_type =="복층"?"selected":""}>복층</option>
									<option value="오피스텔" ${dto.svc_type =="오피스텔"?"selected":""}>오피스텔</option>
									<option value="기타" ${dto.svc_type =="기타"?"selected":""}>기타</option>
								</select>
						</div>
	
				<!-- ----------------------------------서비스영역---------------------------------- -->
						<div class="input-group mb-3">
						
							<label class="input-group-text col-3 text-center" for="input_svc_area" style="font-weight:bold;">서비스 영역</label>&nbsp;&nbsp;
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="svc_area" id="svc_area"  value="전체" ${dto.svc_area.contains("전체")?"checked":""}> 
								<label class="form-check-label" for="전체">전체</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="svc_area" id="svc_area" value="주방" ${dto.svc_area.contains("주방")?"checked":""}> 
								<label class="form-check-label" for="주방">주방</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="svc_area" id="svc_area" value="침실" ${dto.svc_area.contains("침실")?"checked":""}> 
								<label
									class="form-check-label" for="침실">침실</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="svc_area" id="svc_area" value="화장실" ${dto.svc_area.contains("화장실")?"checked":""}> 
								<label class="form-check-label" for="화장실">화장실</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="svc_area" id="svc_area" value="자녀방" ${dto.svc_area.contains("자녀방")?"checked":""}> 
								<label class="form-check-label" for="자녀방">자녀방</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="svc_area" id="svc_area" value="옷장" ${dto.svc_area.contains("옷장")?"checked":""}> 
								<label class="form-check-label" for="옷장">옷장</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="checkbox" name="svc_area" id="svc_area" value="기타" ${dto.svc_area.contains("기타")?"checked":""}> 
								<label class="form-check-label" for="기타">기타</label>
							</div>
						</div>


						<!-- ----------------------------------거주 평수--------------------------------- -->
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_svc_py" style="font-weight:bold;">거주 평수(공급면적)</label> 
								<input type="text" class="form-control input-group-text-fixed" name="svc_py" id="svc_py" value="${dto.svc_py}" required="required" placeholder="평수를 입력해주세요">
								<span class="input-group-text">평</span>
						</div>
						
						<!-- ----------------------------------성함--------------------------------- -->
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_user_name" style="font-weight:bold;">성함</label> 
							<input type="text" class="form-control input-group-text-fixed" name="user_name" value="${dto.user_name}" required="required" placeholder="성함을 입력해주세요">
						</div>
						
						<!-- ----------------------------------휴대전화--------------------------------- -->
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_user_tel" style="font-weight:bold;">휴대전화</label>
							<input type="text" class="form-control input-group-text-fixed" name="user_tel" required="required" value="${dto.user_tel}" placeholder="010-1234-5678 형태로 기재해주세요">
						</div>
						
						<!-- ----------------------------------주소--------------------------------- -->
						<div class="input-group mb-3">
					    <label class="input-group-text col-3 text-center" for="input_user_addr" style="font-weight:bold;">주소</label> 
					    <div class="col-sm-9">
					        <div class="input-group">
					            <input id="user_pcode" type="text" class="form-control" name="user_pcode" placeholder="우편번호" value="${dto.user_pcode}" required="required" onclick="findAddr()" readonly>
					            <div class="input-group-append">
					                <button class="btn btn-outline-secondary" type="button" onclick="findAddr()"  style="font-weight:bold;">우편번호 검색</button>
					            </div>
					        </div>
					        <div>
					            <input id="user_addr" type="text" class="form-control" name="user_addr" value="${dto.user_addr}" required="required" readonly placeholder="기본주소"> 
					        </div>
					        <div>
					            <input type="text" class="form-control" name="user_detail" value="${dto.user_detail}" placeholder="상세주소를 입력해주세요">
					        </div>
					    </div>
					</div>
						<!-- ----------------------------------방문 희망일--------------------------------- -->
					<div class="input-group mb-3" >
					<label class="input-group-text col-3 text-center" for="input_svc_date" style="font-weight:bold;">방문 희망일</label> 
					<div class="col-sm-9">
					<input type="text" class="form-control input-group-text-fixed" name="svc_date" value="${dto.svc_days} &nbsp;&nbsp; ${dto.svc_time}">
					 
					 
					
						<span id="timeSpan">방문 희망일 수정</span><input type="checkbox" id="timeDetail">
						<div id="detaildiv">
							<input id="svc_days" type="date" name="svc_days" value="${dto.svc_days}" onclick="setMinDate()"> 
							<input id="timeA" type="radio" name="svc_time" value="10:00" ${dto.svc_time =="10:00"?"checked":""}>10:00<span></span> &nbsp;&nbsp;
							<input id="timeB" type="radio" name="svc_time" value="13:00" ${dto.svc_time =="13:00"?"checked":""}>13:00<span></span> &nbsp;&nbsp;
							<input id="timeC" type="radio" name="svc_time" value="16:00" ${dto.svc_time =="16:00"?"checked":""}>16:00<span></span>&nbsp;&nbsp;
						</div>
					</div>
					</div>
					<!--  -->
				<%-- <div class="input-group mb-3">
				<label class="input-group-text col-3 text-center" for="input_user_addr" style="font-weight:bold;">방문 희망일</label> 
					    <div class="col-sm-9">
					        <div class="input-group">
					            <input type="text" class="form-control"  value="${dto.svc_days} &nbsp;&nbsp; ${dto.svc_time}" readonly>
					            <div class="input-group-append" id="timeCb">
					            	<span>방문 희망일 수정</span><input type="checkbox" >
					                <!-- <button class="btn btn-outline-secondary" type="button" onclick="findAddr()"  style="font-weight:bold;">우편번호 검색</button> -->
					            </div>
					        </div>
					    </div>
				</div> --%>
			
 
						<!-- ----------------------------------요청사항--------------------------------- -->
						<div class="input-group mb-3" style="max-height: 600px; overflow-y: auto;">
							<label for="input_svc_req"
								class="input-group-text col-3 text-center" style="font-weight:bold;">요청사항<br>(2000자이내)</label>
							<textarea class="form-control input-group-text-fixed"
								id="svc_req" aria-label="With textarea"
								style="height: 300px; resize: none;" name="svc_req"
								placeholder="내용을 입력해주세요">${dto.svc_req}</textarea>
						</div>
						
						<!-- ----------------------------------개인정보 수집 이용 동의--------------------------------- -->
						<div class="input-group mb-3" >
							<div class="card w-100">
  								<div class="card-header" style="font-weight:bold;"> 개인정보 수집 및 이용에 대한 안내</div>
 								 <div class="card-body">
    									<p class="card-text">
    									주식회사 머뭄은 기업/단체 및 개인의 정보 수집 및 이용 등 처리에 있어
										아래의 사항을 관계법령에 따라 고지하고 안내해 드립니다.<br>

										1. 정보수집의 이용 목적 : 상담 및 진행<br>
										2. 수집/이용 항목 : 이름, 연락처, 내용 등<br>
										3. 보유 및 이용기간 : 상담 종료후 6개월, 정보제공자의 삭제 요청시 즉시<br>
										4. 개인정보처리담당 : 전화 1234-1004 / 이메일 meomum@meomum.com</p>
  								</div>
							</div>
						</div>

						<!-- ----------------------------------동의 여부--------------------------------- -->
						<div class="input-group mb-3">
						  <div class="form-check">
						    <input class="form-check-input" type="checkbox" id="svc_pia" value="Y" name="svc_pia" required="required">
						    <label class="form-check-label" for="svc_pia" style="font-weight: bold;">(필수)개인정보 수집 및 이용에 동의합니다</label>
						  </div>
						</div>

						<!-- ----------------------------------유의사항--------------------------------- -->
						<div class="input-group mb-3">
						  <div class="card w-100">
						    <div class="card-header" style="font-weight:bold;"> 유의사항</div>
						    <div class="card-body">
						      <p class="card-text">
						        방문 견적 신청 2일 전에는 수정 불가한 점 참고 부탁드립니다.<br>
						        피치 못할 사정으로 취소 시, 1234-1004로 전화부탁드립니다. </p>
						    </div>
						  </div>
						</div>
						<!-- ----------------------------------예약버튼--------------------------------- -->
						<div class="d-flex justify-content-between align-items-center">
							<div>
						        <input type="reset" value="초기화" class="btn btn-secondary btn-block" style="font-weight:bold;">
						    </div>
						    <div>
						        <input type="submit" value="수정" class="btn btn-primary btn-block" style="font-weight:bold;">
						    </div>

						</div>

				</form>
			</div>
		</div>
	</div>

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
	<script src="js/svc/findAddr.js">
		
	</script>


	<%@include file="/WEB-INF/views/footer.jsp"%>
</body>

</html>