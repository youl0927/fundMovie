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
		<div class="col-6 text-center"><h3>현재 내 펀딩 상황</h3>
			<div class="row mt-5">
				<table class="table table-hover">	
					<thead>			
					<tr>
						<th class="text-center" width="100">펀딩 이름</th>
						<th class="text-center" width="100">Lv.</th>
						<th class="text-center" width="100">보유 포인트</th>
						<th class="text-center" width="100">포인트 충전</th>
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
			<div class="row mt-5">
			<h4>포인트 벌러가기</h4>
			<div> 현재 진행중인 이벤트
			</div><br>
			<div> 진행 예정중인 이벤트
			</div><br>
			<div> 도전과제
			</div><br>
			
			
			
			</div>	
		</div>
	<div class="col"></div>
	
	</div>
	
	</div>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
</body>
</html>