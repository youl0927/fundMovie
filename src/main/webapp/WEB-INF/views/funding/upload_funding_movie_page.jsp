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
			<div class="col-8 text-center">
				<div class="row mt-5">
				<main class="px-3">
				<form action="${pageContext.request.contextPath}/funding/upload_funding_movie_process.do" method="post" enctype="multipart/form-data">
				    <h1>영화 업로드</h1>
				    <p class="lead">회원들과 함께 만든 소중한 당신의 영화를 공유해주세요</p>
				    <p class="lead">
				    	<input name="upload_funding_movie" type="file" id="funing_movie" accept="image/*" multiple="multiple">
				    	
				    </p>
				    <input name="funding_open_no" type="hidden" value="${funding_open_no }">
				    <input type="submit" value="작성완료">	
				 </form>   
				 </main>	
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
</body>
</html>