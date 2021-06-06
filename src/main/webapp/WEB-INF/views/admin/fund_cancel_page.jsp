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

</head>
<body>
	<jsp:include page="/WEB-INF/views/commons/admin_nav.jsp" />
	<div class="container mt-10">
	<div class="row mt-5">
		<div class="col"></div>
		<div class="col-6 text-center"><h3>펀딩 관리</h3>
			<div class="row mt-5">
			<h5>취소 요청된 펀드 정보</h5>
				<table class="table table-hover">	
					<thead>			
					<tr>
						<th>펀드 제작자</th>
						<th>Lv.</th>
						<th>보유 포인트</th>
						<th>계좌 정보</th>
					</tr>
					</thead>
					<tbody>
					<tr>
						<td>${result.memberVo.user_nick}</td>
						<td>${result.memberVo.user_level}</td>
						<td>${result.memberVo.user_point}</td>
						<td>${result.memberVo.user_account}</td>
					</tr>
					</tbody>
				</table>
				
			<h5>펀딩에 참여한 유저 정보</h5><br>
			<h6>펀딩 총액: ${totalFundMoney}포인트</h6>
				
				<table class="table table-hover">
							<thead>
								<tr>
									<th class="text-center" width="100">유저번호</th>
									<th class="text-center" width="100">펀딩한 포인트</th>
									<th class="text-center" width="300">펀딩 날짜</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${fundMemberList }" var="data">
									<tr>
										<td class="text-center">${data.fmemberVo.user_nick }</td>
										<td class="text-center">${data.fundingUserListVo.funding_user_point }</td>
										<td class="text-center"><fmt:formatDate value="${data.fundingUserListVo.funding_date}" pattern="yyyy.MM.dd HH:mm:ss" /></td>
									</tr>
								</c:forEach>
							</tbody>
	
							
						</table>
				
			</div>
			<div class="row mt-5">
			
			
			</div>	
		</div>
	<div class="col"></div>
	
	</div>
	
	</div>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
</body>
</html>