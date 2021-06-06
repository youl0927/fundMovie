<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<style>
	h5 { text-align: left; }
	
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
						펀딩관리
						</b>
					</div>
					
	
					
					<div class="row mt-5 mb-2 text-center">
						<div class="col">
						<c:choose>
							<c:when test="${sessionUser.user_author eq '펀드유저'}">
								<a class="btn btn-dark btn-lg" role="button" href="${pageContext.request.contextPath }/funding/funding_main_page.do">펀드 유저로 접속중</a>
								<a class="btn btn-dark btn-lg" role="button" href="${pageContext.request.contextPath }/mypage/manage_my_funding.do">펀드 관리</a>
							</c:when>
							<c:when test="${rankUpStatus != 0}">
								<a  class="btn btn-dark" role="button">펀드 유저 심사중</a>
							</c:when>
							
							<c:otherwise>	
								<a href="${pageContext.request.contextPath }/mypage/mypage_main_rank.do" class="btn btn-dark" role="button">펀드 유저 신청</a>
							</c:otherwise>
						</c:choose>
						</div>	
					</div>
				 	
				</div>
			</div>
			
			<div class="col-1"></div>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>