<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--

				<fmt:formatDate pattern="yyyy-MM-dd" value="${sessionUser.accesstime }"/>
				일 째 접속 중
 --%>
<div class="col-2 shadow-lg p-3 mb-5 bg-body rounded">
	<div class="row mt-2">
		<div class="col text-center"></div>
	</div>
	<div class="row mt-2">
		<div class="col text-center"></div>
	</div>
	<div class="row mt-2">
		<div class="col text-center"></div>
	</div>
	<div class="row mt-2">
		<div class="col text-center"></div>
	</div>
	<hr>
	<div class="row mt-5 mb-5">
		<div class="col text-center">
			<span style="color:#424242; font-size:28px"><b>${sessionUser.user_nick }&nbsp;님</b></span>
			<br>
			<br>
			<span style="color:#424242; font-size:20px">
				환영합니다.
			</span>
		</div>
	</div>
	<hr>
	<div class="row mt-2">
		<div class="col text-center">
			<img width="38" height="38" src="${pageContext.request.contextPath}/resources/image/friends_1.png">
			<a href="${pageContext.request.contextPath }/friend/friend_main.do" style="text-decoration:none; color:#424242; font-size:17px">친구목록</a>
		</div>
	</div>
	<hr>
	<div class="row mt-2">
		<div class="col text-center">
			<img width="35" height="35" src="${pageContext.request.contextPath}/resources/image/friends_2.png">
			<a href="${pageContext.request.contextPath }/friend/friend_search.do" style="text-decoration:none; color:#424242; font-size:17px">친구찾기</a>
		</div>
	</div>
	<hr>
	<div class="row mt-2">
		<div class="col text-center">
			<img width="35" height="35" src="${pageContext.request.contextPath}/resources/image/mail_1.png">
			<a href="${pageContext.request.contextPath }/mypage/message_board.do" style="text-decoration:none; color:#424242; font-size:17px">쪽지함</a>
		</div>
	</div>
	<hr>
	<div class="row mt-2">
		<div class="col text-center">
			<img width="35" height="35" src="${pageContext.request.contextPath}/resources/image/money_1.png">
			<a href="${pageContext.request.contextPath }/mypage/my_point.do" style="text-decoration:none; color:#424242; font-size:17px">포인트 관리</a>
		</div>
	</div>
	<hr>
	<div class="row mt-2">
		<div class="col text-center">
			<img width="38" height="38" src="${pageContext.request.contextPath}/resources/image/move.png">
			<a href="${pageContext.request.contextPath }/mypage/manage_my_funding.do" style="text-decoration:none; color:#424242; font-size:17px">펀딩관리</a>
		</div>
	</div>
	<hr>

	<div class="row mt-2 mb-2">
		<div class="col text-center"></div>
	</div>
		<div class="row mt-2">
		<div class="col text-center"></div>
	</div>
		<div class="row mt-2">
		<div class="col text-center"></div>
	</div>
		<div class="row mt-2">
		<div class="col text-center"></div>
	</div>
		<div class="row mt-2">
		<div class="col text-center"></div>
	</div>
</div>



</body>
</html>