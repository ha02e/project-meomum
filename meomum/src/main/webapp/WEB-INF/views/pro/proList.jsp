<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[관리자] 상품 관리</title>
</head>
<body>
	<form action="">
		<table>
			<tr>
				<th>No.</th>
				<th>카테고리</th>
				<th>상품명</th>
				<th>재고량</th>
				<th>재고 상태</th>
				<th>정가</th>
				<th>구독 월 수</th>
				<th>월 구독 가격</th>
				<th>등록일</th>
				<th>사진 테스트</th>
			</tr>
			
			<c:forEach var="dto" items="${lists }">
			<tr>
			<td>${dto.pro_idx }</td>
			
			<td>
			<c:choose> 
			<c:when test="${dto.pro_cate == 1}">
			침대
			</c:when>
			<c:when test="${dto.pro_cate == 2}">
			테이블
			</c:when>
			<c:when test="${dto.pro_cate == 3}">
			의자
			</c:when>
			<c:when test="${dto.pro_cate == 4}">
			소파
			</c:when>
			<c:when test="${dto.pro_cate == 5}">
			조명
			</c:when>
			</c:choose>
			</td>
			
			<td>${dto.pro_name }</td>	
			<td>${dto.pro_amount }</td>
			
			<td>
			<c:choose> 
				<c:when test="${dto.pro_state == 0}">
				판매 중
				</c:when>
			 	<c:otherwise>
			    품절
			  	</c:otherwise>
			</c:choose>
			</td>
			
			<td>${dto.pro_price }</td>
			<td>${dto.pro_month }</td>
			<td>${dto.pro_subprice }</td>
			<td>${dto.pro_date }</td>	
			<td>
			<img alt="thumbnail" src="../items/${dto.pro_thumb}" />
			</td>
			</tr>
			</c:forEach>
			
			<tr>
			<td>${pageStr }</td>
			</tr>
			
		</table>
	</form>
</body>
</html>