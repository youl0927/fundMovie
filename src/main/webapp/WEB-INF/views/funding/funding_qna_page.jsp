<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	span{
		margin : 0 0 0 15px;
	}
</style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp"/>
<jsp:include page="/WEB-INF/views/commons/funding_nav.jsp"/>
	<div class="container mt-3">
		<div class="row mt-5">
			<div class="col-2"></div>
			<div class="col">
				<div class="row mt-5">
					<div class="col-12">
						<table class="table table-striped table-hover">
							<thead>
								<tr>
									<th>펀딩이름</th>
									<th>카테고리</th>
									<th>제목</th>
									<th>작성일</th>
									<th>조회수</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${resultList }" var="data">
									<tr>
										<td>${data.fundingOpenVo.funding_title }</td>
										<td>${data.fundingQnACategoryVo.funding_qna_category }</td>
										
										<c:choose>
											<c:when test="${!empty data.fundingQnAVo.funding_qna_status eq 'Yes'}">
												<td><a class="link-dark mr-2" href="${pageContext.request.contextPath }/funding/read_funding_qna_page.do?funding_qna_no=${data.fundingQnAVo.funding_qna_no}">${data.fundingQnAVo.funding_qna_title }<span id="span" class="badge rounded-pill bg-secondary">답변완료</span></a></td>	
											</c:when>
											<c:otherwise>
												<td><a class="link-dark" href="${pageContext.request.contextPath }/funding/read_funding_qna_page.do?funding_qna_no=${data.fundingQnAVo.funding_qna_no}">${data.fundingQnAVo.funding_qna_title }</a></td>
											</c:otherwise>
										</c:choose>
										
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.fundingQnAVo.funding_qna_writedate }"/></td>
										
										
										<td>${data.fundingQnAVo.funding_qna_readcount }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col d-grid">
						<c:if test="${!empty sessionUser }">
							<a class="btn btn-light" href="${pageContext.request.contextPath}/funding/write_funding_qna_page.do?funding_open_no=${funding_open_no}">문의하기</a>
						</c:if>					
					</div>
				</div>
			</div>
			<div class="col-2"></div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>