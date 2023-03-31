<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[관리자] 상품 관리</title>
<script>
function confirmDel(pro_idx){
	if (confirm("정말 삭제하시겠습니까?")) {
	    window.location.href = "proDel.do?pro_idx=" + pro_idx;
	}
}
</script>
</head>
<body>
	<div>
	<form name="proFind" action="proFind.do">
	<input type="text" name="proF">
	<input type="submit" value="검색">
	</form>
	
	<a href="proForm.do">상품 등록</a>
	</div>

		<table style="text-align:center;">
		<tbody>
			<tr>
				<th></th>
				<th>No.</th>
				<th>카테고리</th>
				<th>상품명</th>
				<th>재고량</th>
				<th>재고 상태</th>
				<th>정가</th>
				<th>구독 월 수</th>
				<th>월 구독 가격</th>
				<th>등록일</th>
				<th></th>
			</tr>
			
			<c:if test="${empty lists }">
				<tr>
				<td colspan="11" align="center">
				등록된 게시글이 없습니다
				</td>
				</tr>
			</c:if>
			
			<c:forEach var="dto" items="${lists }">
			<tr>
				<td>
				<img alt="thumbnail" src="/meomum/items/${dto.pro_thumb}" style="width:40px; height:40px;">
				</td>
				
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
				<td><a href="proUpdateForm.do?pro_idx=${dto.pro_idx}">수정</a> | <a href="#" onclick="confirmDel(${dto.pro_idx})">삭제</a></td>
			</tr>
			</c:forEach>
			
			</tbody>
			
			<tfoot>
				<tr>
					<td>${pageStr }</td>
				</tr>
			</tfoot>
			
		</table>
</body>
</html>