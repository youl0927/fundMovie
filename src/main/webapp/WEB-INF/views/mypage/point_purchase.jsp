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
		<div class="col-6 text-center bg-light"><h3>포인트 관리</h3>
			<div class="row mt-5">
				<table border="1">	
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
 	  
						<td><a href="#"><img src="${pageContext.request.contextPath }/resources/image/credit-card.svg" width="20" height="20" class="d-block w-100" alt="..."></a></td>
					</tr>
					
					</tbody>
					
				</table>
				<div class="row mt-5">
				
					<div class="col">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="text-center" width="200">구매 금액</th>
									<th class="text-center" width="200">충전 포인트</th>
									<th class="text-center" width="200">승인</th>
									
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="text-center"><img src="${pageContext.request.contextPath }/resources/image/krw.svg" width="15" height="15"> 9,900</td>
									<td class="text-center">10,000 pt</td>
									<td class="text-center">
										<form action="${pageContext.request.contextPath}/mypage/point_process.do" method="post">
											<input type="hidden"  style="text-align:center; width:90px;" name="user_point" value="10000">
											<input type="image" src="${pageContext.request.contextPath }/resources/image/credit-card.svg" alt="Submit" width="25" height="25">
										</form>
									</td>
								</tr>
								<tr>
									<td class="text-center"><img src="${pageContext.request.contextPath }/resources/image/krw.svg" width="15" height="15"> 49,000</td>
									<td class="text-center">50,000 pt</td>
									<td class="text-center">
										<form action="${pageContext.request.contextPath}/mypage/point_process.do" method="post">
											<input type="hidden"  style="text-align:center; width:90px;" name="user_point" value="50000">
											<input type="image" src="${pageContext.request.contextPath }/resources/image/credit-card.svg" alt="Submit" width="25" height="25">
										</form>
									</td>
								</tr>
								<tr>
									<td class="text-center"><img src="${pageContext.request.contextPath }/resources/image/krw.svg" width="15" height="15"> 95,000</td>
									<td class="text-center">100,000 pt</td>
									<td class="text-center">
										<form action="${pageContext.request.contextPath}/mypage/point_process.do" method="post">
											<input type="hidden"  style="text-align:center; width:90px;" name="user_point" value="100000">
											<input type="image" src="${pageContext.request.contextPath }/resources/image/credit-card.svg" alt="Submit" width="25" height="25">
										</form>
									</td>
								</tr>
										</tbody>
					</table>
									<div class="row text-center no-gutters">
									<div class="col">
									<form action="${pageContext.request.contextPath}/mypage/point_process.do" method="post">
									<img src="${pageContext.request.contextPath }/resources/image/krw.svg" width="15" height="15"> 직접입력: <input type="number"  style="text-align:center; width:90px;" name="user_point" >
									&nbsp;&nbsp;&nbsp; 충전포인트: <input type="text" style="text-align:center; width:90px;" value="얼마얼마" disabled >pt
									&nbsp;&nbsp;&nbsp;<input type="image" src="${pageContext.request.contextPath }/resources/image/credit-card.svg" alt="Submit" width="25" height="25">
									&nbsp;&nbsp;&nbsp;</form>
									
									</div>
									
								
									</div>	
			</div>
			
			</div>			
			<div class="col"></div>	
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