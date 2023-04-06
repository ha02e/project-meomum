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
		var minDate = $("#minDate").val();{}
		var maxDate = $("#maxDate").val();
		var category = $("select[name=category] > option:selected").val();
		var keyword = $("#keyword").val();

		var arr = new Array();
		$('input:checkbox[name=svc_state]:checked').each(function() {
			// 전체 체크박스를 제외한 나머지 체크박스만 배열에 추가
			if ($(this).val() !== '전체') {
				arr.push($(this).val());
			}
		});
		
		//검색 값들이 없을 경우
		if(!minDate){
			minDate ="";
		}
		
		if(!maxDate){
			maxDate = "";
		}
		
		if(!keyword){
			keyword = "";
		}
		
		if(arr.length==0){
			arr.push("");
		}
		
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
			$('#tableBody').empty();
			
			if(data.list.length==0){
				var tableTd = '<tr><td colspan="6" style="text-align:center;">회원 정보가 없습니다.</td></tr>';
				$('#tableBody').append(tableTd);
			}else{
				for (var i = 0; i < data.list.length; i++) {
			
		        var rowData = data.list[i];
		        
		        //일자가 timestamp로 반환되어 yyyy-mm-dd로 출력되게 변환
		        var date = new Date(rowData.svc_regdate);
		        var date = new Date(rowData.svc_regdate);
		        var formatDate = date.getFullYear() + '-' + ('0' + (date.getMonth() + 1)).slice(-2) + '-' + ('0' + date.getDate()).slice(-2);
	
		        var tableTd = '<tr>';
		        tableTd += '<td><input type="checkbox" name="check" value=""></td>';
		        tableTd += '<td>' + rowData.svc_idx + '</td>';
		        tableTd += '<td>' + formatDate + '</td>';
		        tableTd += '<td><a href="asvcContent.do?svc_idx=' + rowData.svc_idx + '">' + rowData.user_name + '</a></td>';
		        tableTd += '<td>' + rowData.user_tel + '</td>';
		        tableTd += '<td>' + rowData.svc_state + '</td>';
		        tableTd += '</tr>';
		        $('#tableBody').append(tableTd);
				}
			}
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
			<form name="searchDetail">
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
				<thead>
				<tr>
					<th><input type="checkbox" name="check" value=""></th>
					<th>예약번호</th>
					<th>예약일</th>
					<th>고객성함</th>
					<th>전화번호</th>
					<th>상태</th>
				</tr>
				<thead>
				<tbody id="tableBody">
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
				</tbody>
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