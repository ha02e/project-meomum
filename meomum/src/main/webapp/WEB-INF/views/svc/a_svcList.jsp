<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="/docs/5.2/dist/css/bootstrap.min.css" rel="stylesheet" >
App CSS  
<link id="theme-style" rel="stylesheet" href="assets/css/portal_a.css">
<link rel="stylesheet" type="text/css" href="css/mainLayout_a.css"> -->

<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<!-- <script>
// 현재 일자를 구하는 함수
function getCurrentDate() {
  var now = new Date();
  var year = now.getFullYear();
  var month = now.getMonth() + 1; // getMonth()는 0부터 시작하므로 +1을 해줍니다.
  var day = now.getDate();

  // 월과 일이 한 자리 수일 경우 0을 붙여줍니다.
  month = month < 10 ? '0' + month : month;
  day = day < 10 ? '0' + day : day;

  return year + '-' + month + '-' + day;
  
}
// minDate와 maxDate의 초기값을 설정합니다.
document.getElementById('minDate').value = getCurrentDate();
document.getElementById('maxDate').value = getCurrentDate();

/* 		var now = new Date();
		var date = new Date(now.getTime()- now.getTimezoneOffset() * 60000).toISOString().split("T")[0];
		document.getElementById('minDate').value = date;
		document.getElementById('maxDate').value = date; */

</script> -->

<script>
//전체 체크박스 클릭시 전체 체크박스 선택

	$(function() {
		$('input[name="svc_state"]').click(
				function() {
					if ($(this).val() === "전체") {
						if ($(this).prop("checked")) {
							$('input[name="svc_state"]').not(this).prop(
									"checked", true);
						} else {
							$('input[name="svc_state"]').not(this).prop(
									"checked", false);
						}
					}
				});
	});

	//세부 검색 기능
	function selectDetail() {
		var minDate = $("#minDate").val();
		var maxDate = $("#maxDate").val();
		var category = $("select[name=category] > option:selected").val();
		var keyword = $("#keyword").val();

		var arr = [];
		$('input:checkbox[name=svc_state]:checked').each(function() {
			// 전체 체크박스를 제외한 나머지 체크박스만 배열에 추가
			if ($(this).val() !== '전체') {
				arr.push($(this).val());
			}
		});
		var allData = {
			"minDate" : minDate,
			"maxDate" : maxDate,
			"category" : category,
			"keyword" : keyword,
			"state" : arr
		};
		console.log(allData);
		
		$.ajax({
			url : "svcSearch.do",
			data :allData,
			dataType : 'json',
			method : "get"
		}).done(function(data) {
			console.log(data);
		}).fail(function() {
			alert('다시 시도해주세요');
		});
	}
	
</script>

</head>
<body>
<%-- 	<%@include file="/WEB-INF/views/header_a.jsp"%> --%>
	<!-- 세부 검색 -->
	<section>
		<article>
			<form>
				<div id="detaildiv">
					<fieldset>
						<ul>
							<li>예약일 
								<input type="date" name="minDate" id="minDate">&nbsp;~
								<input type="date" name="maxDate" id="maxDate">&nbsp;
							</li>
							
							<li>
								<select name="category" id="category">
									<option value="1">고객성함</option>
									<option value="2">전화번호</option>
								</select> 
								<input type="text" name="keyword" id="keyword" placeholder="검색어를 입력하세요" size="60">
							</li>
							
							<li>예약상태 
								<input type="checkbox" name="svc_state" value="전체">전체&nbsp;
								<input type="checkbox" name="svc_state" value="예약확정">예약확정&nbsp;
								<input type="checkbox" name="svc_state" value="예약취소">예약취소&nbsp;
								<input type="checkbox" name="svc_state" value="견적완료">견적완료&nbsp;
								<input type="checkbox" name="svc_state" value="결제대기">결제대기&nbsp;
								<input type="checkbox" name="svc_state" value="결제완료">결제완료&nbsp;
								<input type="checkbox" name="svc_state" value="결제취소">결제취소&nbsp;
								<input type="checkbox" name="svc_state" value="작업완료">작업완료&nbsp;
							</li>
							<div>
								<input type="button" value="검색" onclick="selectDetail()">
							</div>
						</ul>
					</fieldset>
				</div>
			</form>
		</article>
	</section>

	<!-- 리스트 출력 -->
	<section>
		<fieldset>
			<table>
				<tr>
					<th><input type="checkbox" name="check" value=""></th>
					<th>예약번호</th>
					<th>예약일</th>
					<th>고객성함</th>
					<th>전화번호</th>
					<th>상태</th>
				</tr>
				<c:if test="${empty svcDTO}">
					<tr>
						<td colspan="6">예약한 회원이 없습니다</td>
					</tr>
				</c:if>
				<c:forEach var="dto" items="${svcDTO}">
					<tr>
						<td><input type="checkbox" name="check" value=""></td>
						<td>${dto.svc_idx}</td>
						<td>${dto.svc_regdate}</td>
						<c:url var="contentUrl" value="asvcContent.do">
							<c:param name="svc_idx">${dto.svc_idx}</c:param>
						</c:url>
						<td><a href="${contentUrl}">${dto.user_name}</a></td>
						<td>${dto.user_tel}</td>
						<td>${dto.svc_state}</td>
					</tr>
				</c:forEach>
			</table>
			<input type="submit" value="선택 삭제">
		</fieldset>
	</section>

	<%@include file="/WEB-INF/views/footer_a.jsp"%>
	   <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
      crossorigin="anonymous">
   </script>
</body>
</html>