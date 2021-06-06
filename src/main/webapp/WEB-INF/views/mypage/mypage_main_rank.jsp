<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

</head>
<body>
	<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />


	<div class="container mt-10">
	<div class="row mt-5">
				<div class="col"></div>
				<div class="col-6 text-center"><h3>마이 페이지</h3>
				</div>
				<div class="col"></div>
	
	</div>
	<div class="row mt-5">
		<div class="col"></div>
		<div class="col-8  text-center">
		<div class="row">
			
			<div class="col">
			<a href="${pageContext.request.contextPath }/friend/friend_main.do" class="btn btn-dark" role="button">친구 목록</a>
			<a href="${pageContext.request.contextPath }/friend/friend_search.do" class="btn btn-dark" role="button">친구 찾기</a>
			</div>
		</div>
		<div class="row mt-5">
			
			<div class="col">
			
			<a href="${pageContext.request.contextPath }/mypage/message_board.do" class="btn btn-dark" role="button">쪽지함</a>
			<a href="#" class="btn btn-dark" role="button">My Q&A</a>
			</div>
		</div>
		<div class="row mt-5">
			
			<div class="col">
			
			<a href="${pageContext.request.contextPath }/mypage/my_point.do" class="btn btn-dark" role="button">포인트 관리</a>
			</div>
		</div>
		
		
		<div class="row mt-5">
			<div class="col">

			<c:choose>
				<c:when test="${sessionUser.user_author eq '펀드유저'}">
					<a class="btn btn-dark" role="button" href="${pageContext.request.contextPath }/funding/funding_main_page.do">펀드 유저입니다. 당신의 여정을 시작하세요.</a>
					
				</c:when>
				<c:when test="${rankUpStatus != 0}">
					<a  class="btn btn-dark" role="button">펀드 유저 심사중</a>
				</c:when>
				
				<c:otherwise>	
				<form action="${pageContext.request.contextPath }/mypage/rank_up_request_process.do"  method="post">
				<input type="text" class="form-control" name="user_account" placeholder="계좌번호를 입력하세요">
				<button type="submit" class="btn btn-dark">펀드 유저 신청</button>
				</form>
				</c:otherwise>
			</c:choose>
		
			</div>
		
		</div>
		
		</div>
		<div class="col"></div>
		
	</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>