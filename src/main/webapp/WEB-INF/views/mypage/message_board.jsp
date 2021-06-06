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
						<img width="45" height="45" src="${pageContext.request.contextPath}/resources/image/mail_1.png">
						보낸 쪽지함
						</b>
					</div>
	
					<table class="table table-hover">
						<thead>
							<tr>
								<th class="text-center" width="100">번호</th>
								<th class="text-center" width="100">받는 사람</th>
								<th class="text-center" width="300">내용</th>
								<th class="text-center" width="200">작성일</th>
								<th class="text-center" width="50">더쓰기</th>
								<th class="text-center" width="50">삭제</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${resultList }" var="data">
								<tr>
									<td class="text-center">${data.messageVo.message_no }</td>
									<td class="text-center">${data.memberVo.user_nick }</td>
									<td class="text-center">${data.messageVo.message_content }</td>
									<td class="text-center"><fmt:formatDate value="${data.messageVo.senddate }" pattern="yyyy.MM.dd HH:mm:ss" /></td>
									<td class="text-center"><a href="${pageContext.request.contextPath}/mypage/write_message_page.do?friend_no=${data.memberVo.user_no }&friend_nick=${data.memberVo.user_nick }"><img src="${pageContext.request.contextPath }/resources/image/comment-discussion.svg" width="20" height="20" class="d-block w-100" alt="..."></a></td>
									
									<td class="text-center"><a href="${pageContext.request.contextPath}/mypage/delete_message_process.do?message_no=${data.messageVo.message_no }"><img src="${pageContext.request.contextPath }/resources/image/x.svg" width="20" height="20" class="d-block w-100" alt="..."></a></td>										
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
				</div>
				
				
				<div class="row mt-5">
					<div class="h4">
						<b>
						<img width="45" height="45" src="${pageContext.request.contextPath}/resources/image/mail_1.png">
						받은 쪽지함
						</b>
					</div>

						<table class="table table-hover">
							<thead>
								<tr>
									<th class="text-center" width="100">번호</th>
									<th class="text-center" width="100">작성자</th>
									<th class="text-center" width="300">내용</th>
									<th class="text-center" width="200">작성일</th>
									<th class="text-center" width="50">답장</th>
									<th class="text-center" width="50">삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${resultGetList }" var="data">
									<tr>
										<td class="text-center">${data.messageVo.message_no }</td>
										<td class="text-center">${data.memberVo.user_nick }</td>
										<td class="text-center">${data.messageVo.message_content }</td>
										<td class="text-center"><fmt:formatDate value="${data.messageVo.senddate }" pattern="yyyy.MM.dd HH:mm:ss" /></td>
										<td class="text-center"><a href="${pageContext.request.contextPath}/mypage/write_message_page.do?friend_no=${data.memberVo.user_no }&friend_nick=${data.memberVo.user_nick }"><img src="${pageContext.request.contextPath }/resources/image/comment-discussion.svg" width="20" height="20" class="d-block w-100" alt="..."></a></td>
										
										<td class="text-center"><a href="${pageContext.request.contextPath}/mypage/delete_message_process.do?message_no=${data.messageVo.message_no }"><img src="${pageContext.request.contextPath }/resources/image/x.svg" width="20" height="20" class="d-block w-100" alt="..."></a></td>										
									</tr>
								</c:forEach>
							</tbody>
						</table>
						
					</div>
					
				</div>
			<div class="col-1"></div>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>