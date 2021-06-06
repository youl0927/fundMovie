<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
				
				<div class="col text-center">
					
						<img width="250" height="250" src="${pageContext.request.contextPath}/resources/image/my.png">
						<br><br><br>
						<span><h1><b>${sessionUser.user_nick }&nbsp;님의 마이페이지</b></h1></span>
					
				</div>
				
				
				</div>
			</div>
			
			<div class="col-1"></div>	
			
	</div>
</div>
				










<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>