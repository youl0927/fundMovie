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
<jsp:include page="/WEB-INF/views/commons/mypage_nav.jsp" />

<div class="container-fluid">
	<div class="row mt-5">
		<jsp:include page="/WEB-INF/views/commons/mypage_sidebar.jsp" />
		<div class="col-1"></div>
		<div class="col-8 bg-light">
			<div class="row mt-5">
				<div class="h3 text-center">
					<img width="50" height="50" src="${pageContext.request.contextPath}/resources/image/money_1.png">
					<b>포인트 관리</b>
				</div>
			</div>
			<div class="row mt-4">	
				<table class="table table-hover  text-center">	
					<thead>			
						<tr>
							<th>닉네임</th>
							<th>Lv.</th>
							<th>보유 포인트</th>
							<th>포인트 충전</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${sessionUser.user_nick}</td>
							<td>${sessionUser.user_level}</td>
							<td>${sessionUser.user_point}, 포인트 = ${result.memberVo.user_point }</td>
							<td><a href="${pageContext.request.contextPath }/mypage/point_purchase.do"><img src="${pageContext.request.contextPath }/resources/image/credit-card.svg" width="20" height="20" class="d-block w-100" alt="..."></a></td>
						</tr>
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