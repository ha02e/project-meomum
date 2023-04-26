<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function validate() {
		
	  var areaLabel = $('#areaLabel');
	  var areaLabelTop = areaLabel.offset().top;
	  var areaLabelHeight = areaLabel.height();
	  
	  var windowHeight = $(window).height();

	  if ($("input[name='svc_area']:checked").length === 0) {
	    $('html, body').animate({//해당 부분으로 스크롤 이동
	      scrollTop: areaLabelTop - windowHeight / 2 + areaLabelHeight / 2
	    }, 100, function() {
	      $('#areaLabel')[0].focus();
	      $('#areaError').text('서비스 영역을 선택해주세요').show();
	    });
	    return false;
	  }
	 
	  
	  // 유효성 검사가 모두 통과한 경우 true 반환
	  return true;
	}
	$(document).ready(function() {
		  $('#asvcUpdate').on('submit', function(event) {
		    event.preventDefault(); // 폼의 자동 전송 막기
		    if (validate()) {
		      this.submit(); // 폼 제출
		    }
		  });
		});

</script>
<style>
.form-control:disabled, .form-control[readonly] {
    background-color: #ffff!important;
    opacity: 1;
}

.title {
	text-align: center;
	font-weight: bold;
	margin: 30px 0;
}
.app-content {
  max-width: 1200px; 
  margin: 0 auto;
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
textarea {
	width: 50%;
	height: 6.25em;
	border: 1px solid black;
	resize: none;
}

 .table {
    border: 1px solid black;
    border-collapse: collapse;
  }

 
  .table td, .table th {
    border: 1px solid black;
    padding: 5px;
  }
  
 .table input[type="text"] {
  background-color: #f8f9fa; 
  border: none;
  }

.table td {
  background-color: #f8f9fa !important;
  }
  
label[for="input_svc"]::before{
  content: "*";
  color: #ff6666;
  margin-right: 5px;
}

label[for="areaLabel"]::before{
  content: "*";
  color: #ff6666;
  margin-right: 5px;
}

</style>

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- 예약 완료된 시간 표시 -->
<script src="js/svc/a_timeSelect.js"></script>

</head>
<body class="app">
	<%@include file="/WEB-INF/views/header_a.jsp"%>

	<div class="app-wrapper">
		<div class="app-content pt-3 p-md-3 p-lg-4">
			<div class="container-xl">
				<h2 class="title">방문 견적 예약 : ${dto.svc_idx}</h2>
				<form name="asvcUpdate" id="asvcUpdate" action="asvcUpdate.do" method="post" onsubmit="return validate()">
					<input type="hidden" name="user_idx" value="${dto.user_idx}" id="user_idx" style="background-color: #fff; border: 1px solid #ced4da;">
					<!-- -------------------------------------예약번호------------------------------- -->	
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_svc_idx" style="font-weight:bold;">예약번호</label> 
								<input type="text" class="form-control input-group-text-fixed" name="svc_idx" id="svc_idx" value="${dto.svc_idx}" required="required" readonly>
						</div>
					<!-- ----------------------------------서비스 상태--------------------------------- -->
					
					<div class="input-group mb-3">
					<label class="input-group-text col-3 text-center" for="input_svc" style="font-weight:bold;">예약상태</label> 
								<select class="form-select" name="svc_state" id="svc_state" required="required">
								<option value="예약확정" ${dto.svc_state =="예약확정"?"selected":""}>예약확정</option>
								<option value="예약취소" ${dto.svc_state =="예약취소"?"selected":""}>예약취소</option>
								<option value="견적완료" ${dto.svc_state =="견적완료"?"selected":""}>견적완료</option>
								<option value="결제완료" ${dto.svc_state =="결제완료"?"selected":""}>결제완료</option>
								<option value="결제취소" ${dto.svc_state =="결제취소"?"selected":""}>결제취소</option>
								<option value="작업완료" ${dto.svc_state =="작업완료"?"selected":""}>작업완료</option>
						</select>
						</div>
				<!-- -------------------------------------거주형태------------------------------- -->	
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_svc" style="font-weight:bold;">거주형태</label> 
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
						
							<label class="input-group-text col-3 text-center" for="areaLabel" id="areaLabel" style="font-weight:bold;">서비스 영역</label>&nbsp;&nbsp;
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
							<span id="areaError" style="color: red;"></span>
						</div>


						<!-- ----------------------------------거주 평수--------------------------------- -->
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_svc" style="font-weight:bold;">거주 평수(공급면적)</label> 
								<input type="text" class="form-control input-group-text-fixed" name="svc_py" id="svc_py" value="${dto.svc_py}" required="required" placeholder="평수를 입력해주세요">
								<span class="input-group-text">평</span>
						</div>
						
						<!-- ----------------------------------성함--------------------------------- -->
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_svc" style="font-weight:bold;">성함</label> 
							<input type="text" class="form-control input-group-text-fixed" name="user_name" value="${dto.user_name}" required="required" placeholder="성함을 입력해주세요">
						</div>
						
						<!-- ----------------------------------휴대전화--------------------------------- -->
						<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_svc" style="font-weight:bold;">휴대전화</label>
							<input type="text" class="form-control input-group-text-fixed" name="user_tel" required="required" value="${dto.user_tel}" placeholder="010-1234-5678 형태로 기재해주세요">
						</div>
						
						<!-- ----------------------------------주소--------------------------------- -->
						<div class="input-group mb-3">
					    <label class="input-group-text col-3 text-center" for="input_svc" style="font-weight:bold;">주소</label> 
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
					<label class="input-group-text col-3 text-center" for="input_svc" style="font-weight:bold;">방문 희망일</label> 
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
					
					<!-- ----------------------------------요청사항--------------------------------- -->
						<div class="input-group mb-3" style="max-height: 600px; overflow-y: auto;">
							<label for="input_svc_req"
								class="input-group-text col-3 text-center" style="font-weight:bold;">요청사항<br>(2000자이내)</label>
							<textarea class="form-control input-group-text-fixed"
								id="svc_req" aria-label="With textarea"
								style="height: 300px; resize: none;" name="svc_req"
								placeholder="내용을 입력해주세요">${dto.svc_req}</textarea>
						</div>		
					
					<!-- ---------------------------------서비스 인지 경로--------------------------------- -->
					<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="svc_know" style="font-weight:bold;">서비스 인지경로</label> 
							<input type="text" class="form-control input-group-text-fixed" name="svc_know" value="${dto.svc_know}" readonly>
						</div>
						
					<!-- ---------------------------------관리자 메모--------------------------------- -->
						<div class="input-group mb-3" style="max-height: 600px; overflow-y: auto;">
							<label for="input_svc_memo"
								class="input-group-text col-3 text-center" style="font-weight:bold;">관리자 메모<br>(2000자이내)</label>
							<textarea class="form-control input-group-text-fixed"
								id="svc_memo" aria-label="With textarea"
								style="height: 300px; resize: none;" name="svc_memo"
								placeholder="내용을 입력해주세요">${dto.svc_memo}</textarea>
						</div>		
					
					
					<hr>
					<!-- ---------------------------------서비스 희망일--------------------------------- -->
					<div class="input-group mb-3">
					<c:if test="${empty ingdto}">
								<div class="col  text-end">
								<script src="js/svc/IngPopup.js"></script>
								<input type="button" class="btn app-btn-primary button" value="서비스 희망일 및 견적 추가" onclick="svcIng()"></td>
								</div>
					</c:if>
					<c:if test="${not empty ingdto}">
								<div class="col text-end">
								<script src="js/svc/IngContent.js"></script>
								<input type="button" class="btn app-btn-primary button" value="서비스 희망일 및 견적 수정" onclick="openSvcIngContent()"></td>
								</div>
					</c:if>
					</div>
					<div class="input-group mb-3">
							<label class="input-group-text col-3 text-center" for="input_svc_datetime" style="font-weight:bold;">서비스 희망일</label> 
							<c:if test="${empty ingdto}">
							<input type="text" class="form-control input-group-text-fixed" name="svc_datetime" id="svc_datetime" readonly>
							</c:if>
							<c:if test="${not empty ingdto}">
							<input type="text" class="form-control input-group-text-fixed" name="svc_datetime" id="svc_datetime" value="${ingdto.svc_datetime}"  readonly>
							</c:if>
					</div>
					
					<!-- 테이블 -->
					<div class="input-group mb-3">
					<table class="table" cellspacing="0">
					  <thead class="table-dark text-center">
							<th scope="col" style="width:18%">결제방식</th>
							<th scope="col" style="width:18%">견적금액</th>
							<th scope="col" style="width:18%">할인금액</th>
							<th scope="col" style="width:18%">결제금액</th>
							<th scope="col" style="width:18%">확인/취소</th>
						</thead>
						<tbody>
						<c:if test="${empty ingdto}">
							<tr>
								<td><input type="text" name="type" id="type" readonly></td>
								<td><input type="text" name="estimated" id="estimated" readonly></td>
								<td><input type="text" name="discount" id="discount" readonly></td>
								<td><input type="text" name="total" id="total" readonly></td>
								<td><input type="text" name="pay_state" id="pay_state" readonly></td>
							</tr>
							</tbody>
							</table>
								
						</c:if>
						<c:if test="${not empty ingdto}">
						<tr>
								<td class="text-center">${ingdto.type}</td>
								<td class="text-center">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${ingdto.estimated}"/>원
								</td>
								<td class="text-center">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${ingdto.discount}"/>
								</td>
								<td class="text-center">
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${ingdto.total}"/>원
								</td>
								<td class="text-center">${ingdto.pay_state}</td>
						</tr>
						</tbody>
						</table>
					</c:if>
					</div>
					<hr>
					
					<div class="row mt-3">
						<div class="col text-first">
						       <input type="reset" value="초기화" class="btn app-btn-secondary button" style="font-weight:bold;">
						</div>
						<div class="col text-center">
						      <a href="asvcList.do"><input type="button" value="목록" class="btn app-btn-primary button" style="font-weight:bold;"></a>
						 </div>
						<div class="col text-end">
						       <input type="submit" value="저장" class="btn app-btn-primary button" style="font-weight:bold;">
						 </div>
					</div>
				</form>
			</div>
		</div>
		<%@include file="/WEB-INF/views/footer_a.jsp"%>
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
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="js/svc/findAddr.js"> </script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous">
	</script>
</body>


</html>