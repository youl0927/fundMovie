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

			<div class="col-2"></div>
			
			<div class="col-6 bg-light">
				<div class="row mt-5">
					<div class="h2 text-center">
						<b>
						<img width="50" height="50" src="${pageContext.request.contextPath}/resources/image/mail_1.png">
						쪽지 보내기
						</b>
					</div>
			
			
					<form action="${pageContext.request.contextPath}/mypage/write_message_process.do" method="post" >
						<div class="row mt-4">
							<div class="col">
								<label for="exampleInputEmail1" class="form-label">보내는 사람 : ${sessionUser.user_nick }</label>
								<br>
								<label for="exampleInputEmail1" class="form-label">받는 사람 : ${friend_user_nick }</label>
								<input type="text" class="form-control" name="message_content" placeholder="쪽지 내용을 입력해주세요">
								<input type="hidden" name="receiver_no" value="${friend_user_no }">
							</div>
						</div>
						<div class="row mt-4">
							<div class="col d-grid ">
								<button type="submit" class="btn btn-primary btn-lg">전송</button>
							</div>
							<div class="col d-grid">
								<a class="btn btn-danger btn-lg" role="button" href="${pageContext.request.contextPath }/friend/friend_main.do">취소</a>
							</div>
						</div>
						
						
					</form>
			
				
				</div>
			</div>
			
			<div class="col-2"></div>
		</div>
	</div>


		
		
<%-- 		
		<div class="row mt-5">
			<div class="col-4">
			<h5>쪽지 쓰기</h5>
				보내는 사람: ${sessionUser.user_nick }<br>
				받는 사람: ${friend_user_nick }
				<form action="${pageContext.request.contextPath}/mypage/write_message_process.do" method="post" >
					<div class="col">
						<input type="text" class="form-control" name="message_content" placeholder="보내고 싶은 내용을 입력하세요~">
						<input type="hidden" name="receiver_no" value="${friend_user_no }">					
						<div class="row mt-5">
							<div class="col d-grid gap-2 d-md-block">
								<button type="submit" class="btn btn-primary">보내기 !</button>
							</div>
							<div class="col d-grid d-md-block">
								<a class="btn btn-danger" href="${pageContext.request.contextPath }/friend/friend_main.do" role="button">취소!</a>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
--%>	
		
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
		
</body>
</html>