<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/request.js"></script>
<script>
	function showSvcPia(){
		sendRequest('getSvcPia.jsp',null,'GET',showResult);
	}
	
	function showResult(){
		if(XHR.readyState==4){
			if(XHR.status==200){
				var data = XHR.responseText;
				
				var divNode = document.all.pia;
				divNode.innerHTML = data;
			}	
		}
	}
</script>
</head>
<body onload="showSvcPia()">
<h1>방문 견적 예약</h1>
<form>
<ul>
	<li>거주형태
		<select name="svc_type">
			<option value="아파트">아파트</option>
			<option value="빌라">빌라</option>
			<option value="주택">주택</option>
			<option value="복층">복층</option>
			<option value="오피스텔">오피스텔</option>
			<option value="기타">기타</option>
		</select>
	</li>
	
<%-- 	<li>가구수
		<select name="svc_people">
			<c:forEach var="i" begin="1" end="10">
			<option value="${i}">${i}</option>
			</c:forEach>
		</select>
	</li> --%>
	
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
		<input type="date" name="svc_date">
	</li>
	
	<li>시간
		<input type="button" value="10:00">
		<input type="button" value="13:00">
		<input type="button" value="16:00">
	</li>
	
	<li>요청사항<br>
		<textarea name="svc_req" rows="5" cols="35" placeholder="요청사항을 입력해주세요"></textarea>
	</li>
	
	<li>서비스 인지 경로
		<input type="radio" name="svc_know" value="블로그">블로그
		<input type="radio" name="svc_know" value="인터넷 카페">인터넷 카페
		<input type="radio" name="svc_know" value="지인추천">지인추천
		<input type="radio" name="svc_know" value="검색">검색
	</li>
	
	<li>개인정보 수집 및 이용에 대한 안내
		<div id="pia"></div>
		<input type="checkbox" name="svc_pia" value="checked">
		개인정보 수집 및 이용에 동의합니다
	</li>
	
</ul>
	<div><input type="submit" value="예약"></div>

</form>
</body>
</html>