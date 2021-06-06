<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<style>
	.navbar-brand > .img-fluid{width:100pt;height:40pt;}
	.ulist{list-style:none;}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/commons/mypage_nav.jsp" />
	<div class="container-fluid">
		<div class="row mt-5">
			<jsp:include page="/WEB-INF/views/commons/mypage_sidebar.jsp" />

			<div class="col-1"></div>
			
			<div class="col-8 bg-light">
				<div class="row mt-5">
					<div class="h2 text-center">
						<b>
						<img width="50" height="50" src="${pageContext.request.contextPath}/resources/image/move.png">
							펀드관리
						</b>
					</div>
					
					<c:forEach items="${resultList }" var="data">
					<table class="table table-hover">
						
						<thead>			
						<tr>
							<th>펀딩 제목</th>
							<th>펀딩 시작 날짜</th>
							<th>펀딩 마감 날짜</th>
							<th>현재 펀딩 상태</th>
							<th></th>
							<th></th>
							<th></th>
						</tr>
						</thead>
						
						<tbody>
						<tr>
							<td>${data.funding_title }</td>
							<td><fmt:formatDate value="${data.funding_start }" pattern="yyyy.MM.dd" /></td>
							<td><fmt:formatDate value="${data.funding_end }" pattern="yyyy.MM.dd" /></td>
	 	  					<td>${data.funding_status }</td>
	 	  					<td class="text-center"><a class="btn btn-secondary" role="button" href="${pageContext.request.contextPath}/mypage/manage_funding_detail.do?funding_open_no=${data.funding_open_no}">상세보기</a></td>
	 	  					<td class="text-center"><a class="btn btn-secondary" role="button" href="${pageContext.request.contextPath}/funding/update_funding_page.do?funding_open_no=${data.funding_open_no}">수정</a></td>
	 	  					<td class="text-center"><a class="btn btn-secondary" role="button" href="${pageContext.request.contextPath}/funding/delete_fuding_process.do">취소</a></td>
	 	  					<c:choose>
		 	  					<c:when test="${data.funding_status eq 'Complete'}">
								<td class="text-center"><a class="btn btn-secondary" role="button" href="${pageContext.request.contextPath}/funding/upload_funding_movie_page.do?funding_open_no=${data.funding_open_no}">영화 업로드</a></td>
								</c:when>
	 	  					</c:choose>
						</tr>
						</tbody>
						
					</table>			
					</c:forEach>
					
				</div>
			
			</div>
			
			<div class="col-1"></div>
		</div>
	</div>

			
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
</body>
</html>