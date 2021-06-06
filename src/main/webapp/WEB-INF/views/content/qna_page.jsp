<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<style>
	span{
		margin : 0 0 0 15px;
	}
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />
<div class="album py-5 bg-light">
	<div class="container mt-2">
		<div class="row">
			<div class="col-1"></div>
			<div class="col">
				<div class="row">
					<div class="col-12">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>No</th>
									<th>말머리</th>
									<th>글쓴이</th>
									<th>제목</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${qnaResultList }" var="data">
									<tr>
										<td>${data.qnaVo.qna_no }</td>
										<td>${data.qnaHeadlineVo.qna_headline }</td>
										<td>${data.memberVo.user_nick }</td>
										<c:choose>
											<c:when test="${!empty data.qnaVo.qna_reply}">
												<td><a class="link-dark mr-2" href="${pageContext.request.contextPath }/content/qna_read_page.do?qna_no=${data.qnaVo.qna_no}">${data.qnaVo.qna_title }<span id="span" class="badge rounded-pill bg-secondary">답변완료</span></a></td>	
											</c:when>
											<c:otherwise>
												<td><a class="link-dark" href="${pageContext.request.contextPath }/content/qna_read_page.do?qna_no=${data.qnaVo.qna_no}">${data.qnaVo.qna_title }</a></td>
											</c:otherwise>
										</c:choose>
										
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.qnaVo.qna_writedate }"/></td>
						
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

				<div class="row mt-2">
					<div class="col d-grid">
						<c:if test="${!empty sessionUser }">
							<a class="btn btn-secondary" href="${pageContext.request.contextPath}/content/qna_write_page.do">Write</a>
						</c:if>					
					</div>
				</div>
			<div class="row mt-4">
				<div class="col">
					<nav aria-label="Page navigation example">
						<ul class="pagination mb-0 justify-content-center">
						 	<li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a href="${pageContext.request.contextPath }/content/qna_page.do?page_num=1" class="page-link">&lt;&lt;</a></li>
							<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a href="${pageContext.request.contextPath }/content/qna_page.do?page_num=${beginPage-1 }" class="page-link">&lt;</a></li>
							<c:forEach begin="${beginPage }" end="${endPage }" var="i">
								<li class="page-item<c:if test="${i == currentPage }"> active</c:if>"><a href="${pageContext.request.contextPath }/content/qna_page.do?page_num=${i }" class="page-link">${i }</a></li>
							</c:forEach>
							<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a href="${pageContext.request.contextPath }/content/qna_page.do?page_num=${endPage+1 }" class="page-link">&gt;</a></li>
							<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a href="${pageContext.request.contextPath }/content/qna_page.do?page_num=${pageCount}" class="page-link">&gt;&gt;</a></li>	
						</ul>
					</nav>
				</div>
			</div>
			</div>
			<div class="col-1"></div>
		</div>
	</div>
	
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>