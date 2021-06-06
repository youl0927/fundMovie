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
<body class="d-flex h-100 text-center text-white bg-dark">
	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
		<div class="row mt-5">
			<div class="col"></div>
			<div class="col-6 text-center">
			<div class="row">
				<div class="col"></div>
 				<div class="col" style="background-color: white; border-radius:20px 50px;"><input type="image" style="width:350px; height:125px;" src="${pageContext.request.contextPath}/resources/image/bbq_logo.png "></div>
 				<div class="col"></div>
 			</div>	
				<div class="row mt-5">
				<main class="px-3">
				    <h2>펀딩 신청이 완료되었습니다.</h2>
				<div class="row mt-3">    
				    <p class="lead mt-2"><strong style="font-size: 22px">${sessionUser.user_nick }님</strong> 펀딩에 신청해주셔서 감사합니다.</p>
				    <p class="lead">펀딩이 승인될 떄까지 <strong>2~3</strong>일 정도 소요됩니다.</p>
				    <div class="d-grid gap-2 col-4 mx-auto mt-4">
					<button class="btn btn-outline-light btn-lg" onclick="location.href='${pageContext.request.contextPath}/funding/funding_main_page.do'">
						펀딩 메인지로 가기
					</button>
					</div>
				</div> 
				 </main>	
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
</body>
</html>