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
				<div class="row mt-3">
					<div class="h4">
						<b>
						<img width="45" height="45" src="${pageContext.request.contextPath}/resources/image/friends_1.png">
						내가 추가한 친구
						</b>
					</div>

					<table class="table table-hover">
							<thead>
								<tr>
									<th class="text-center" width="100">닉네임</th>
									<th class="text-center" width="100">Lv.</th>
									<th class="text-center" width="100">ID.</th>
									<th class="text-center" width="100">E-mail.</th>
									<th class="text-center" width="150">친구 시작일</th>
									<th class="text-center" width="150">최근 접속시간</th>
									<th class="text-center" width="50">쪽지</th>
								</tr>
							</thead>
							<tbody>
							
								<c:forEach items="${addFriendList}" var="data" >
									<tr>
										<td class="text-center">${data.memberVo.user_nick }</td>
										<td class="text-center">${data.memberVo.user_level }</td>
										<td class="text-center">${data.memberVo.user_id }</td>
										<td class="text-center">${data.memberVo.user_email }</td>
										<td class="text-center">${data.addFriendVo.friend_regdate }</td>
										<td class="text-center">1</td>
										<td class="text-center"><a href="${pageContext.request.contextPath}/mypage/write_message_page.do?friend_no=${data.memberVo.user_no }&friend_nick=${data.memberVo.user_nick }"><img src="${pageContext.request.contextPath }/resources/image/comment-discussion.svg" width="20" height="20" class="d-block w-100" alt="..."></a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
						<div class="row mt-5"></div>
						
						
					<div class="h4">
						<b>
						<img width="45" height="45" src="${pageContext.request.contextPath}/resources/image/friends_1.png">
						나를 추가한 친구
						</b>
					</div>

				
					<table class="table table-hover">
							<thead>
								<tr>
									<th class="text-center" width="100">닉네임</th>
									<th class="text-center" width="100">Lv.</th>
									<th class="text-center" width="100">ID.</th>
									<th class="text-center" width="100">E-mail.</th>
									<th class="text-center" width="150">친구 시작일</th>
									<th class="text-center" width="150">최근 접속시간</th>
									<th class="text-center" width="50">쪽지</th>
								</tr>
							</thead>
							<tbody>
							
								<c:forEach items="${myFriendList}" var="data" >
									<tr>
										<td class="text-center">${data.memberMyVo.user_nick }</td>
										<td class="text-center">${data.memberMyVo.user_level }</td>
										<td class="text-center">${data.memberMyVo.user_id }</td>
										<td class="text-center">${data.memberMyVo.user_email }</td>
										<td class="text-center">${data.addMyFriendVo.friend_regdate }</td>
										<td class="text-center">1</td>
										<td class="text-center"><a href="${pageContext.request.contextPath}/mypage/write_message_page.do?friend_no=${data.memberMyVo.user_no }&friend_nick=${data.memberMyVo.user_nick }"><img src="${pageContext.request.contextPath }/resources/image/comment-discussion.svg" width="20" height="20" class="d-block w-100" alt="..."></a></td>
										
										
									</tr>
								</c:forEach>
							</tbody>
	
							
						</table>
			
			
				</div>
			</div>
			<div class="col-1"></div>
		</div>
		<div class="row mt-3">


		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>