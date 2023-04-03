<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>간단문의</title>
<style>
/*헤더 이미지용 url에 이미지 추가하면 됩니다.*/
.page-header {
    background: linear-gradient(rgba(36, 39, 38, 0.5), rgba(36, 39, 38, 0.5)), rgba(36, 39, 38, 0.5) url(https://img.kr.news.samsung.com/kr/wp-content/uploads/2018/05/0510-white-1.jpg) no-repeat center;
    background-size: cover;
    margin: 0;
    border-bottom: none;
    padding-bottom: 0px;
	}
	.page-caption { padding: 90px 0px; position: relative; z-index: 1; color: #fff; text-align: center; }
	.page-title { color: #fff;  font-size: 40px; font-weight: 400; letter-spacing: -1px; }
	
	/**헤더 이미지용 끝*/
</style>
</head>
<body>
<%@include file="/WEB-INF/views/header.jsp" %>

<!-- 헤더 이미지 넣을때 css도 가져갈것...  -->
 <div class="page-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="page-caption">
                        <h2 class="page-title">간단 견적 문의</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- 본문 시작 -->
<div class="container">
  <div class="row">
    <div class="col-9 mx-auto">
   		 <p>
			전체 글 수 :<span id="total-users">${totalCnt}</span>개
		</p>
		<div class="table-responsive">
		
      <table class="table table-striped table-hover table-sm text-center">
        <thead>
          <tr>
            <th scope="col" style="width: 10%;">No.</th>
            <th scope="col" style="width: 45%;">제목</th>
            <th scope="col" style="width: 15%;">작성자</th>
            <th scope="col" style="width: 15%;">진행상태</th>
            <th scope="col" style="width: 15%;">작성일</th>
          </tr>
        </thead>
        <tbody>
          <c:if test="${empty lists}">
            <tr>
              <td colspan="5" class="text-center">등록된 글이 없습니다.</td>
            </tr>
          </c:if>
          <c:forEach var="ask" items="${lists}">
            <tr>
              <td>${ask.ask_idx}</td>
              <c:url var = "askContentUrl" value="askContent.do">
                <c:param name="ask_idx">${ask.ask_idx }</c:param>
              </c:url>
              <td><a href="${askContentUrl}">${ask.ask_title}</a></td>
              <td>${ask.ask_writer}</td>
              <td>
                <c:if test="${ask.ask_ask==1}">
                  <button type="button" class="btn btn-success btn-sm align-middle">답변완료</button>
                </c:if>
                <c:if test="${ask.ask_ask==0}">
                  <button type="button" class="btn btn-outline-danger btn-sm align-middle">진행중</button>
                </c:if>
              </td>

              <td>${ask.ask_date}</td>

            </tr>
          </c:forEach>
        </tbody>
      </table>
      </div>
			<nav class="d-flex justify-content-between align-items-center">
			  <div class="col-12 justify-content-center align-items-start text-center">
			    ${pageStr}
			  </div>
			  <div class="col-auto">
			    <a href="askWrite.do" class="btn btn-primary">글쓰기</a>
			  </div>
			</nav>
    </div>
  </div>
</div>
<%@include file="/WEB-INF/views/footer.jsp" %>
</body>
</html>