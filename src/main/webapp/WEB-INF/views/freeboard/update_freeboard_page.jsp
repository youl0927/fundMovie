<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
</head>
<body>
<!-- 
	<h1>게시글 수정</h1>
	<form action="${pageContext.request.contextPath}/freeboard/update_freeboard_process.do" method="post">
		작성자 : ${result.memberVo.user_nick }<br>
		제목 : <input type = "text" name= "freeboard_title" value="${result.freeboardVo.freeboard_title} "><br>
		내용 : <br>
		<textarea name = "freeboard_content" rows="10" cols="60">${result.freeboardVo.freeboard_content } </textarea>
		<input type="hidden" name= "freeboard_no" value="${result.freeboardVo.freeboard_no }">
		<br>
		<input type="submit" value="수정">
	</form>
 -->
  <jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />
 <img class="img-fluid" src="${pageContext.request.contextPath }/resources/image/freeboardMain.jpg" style="display: block; margin: 0 auto; height:300px; width:1950px; overflow:hidden;">
 <form action="${pageContext.request.contextPath }/freeboard/update_freeboard_process.do" method="post" enctype="multipart/form-data">
	<div class="container mt-1">
		<div class="row mt-5">
			<div class="col-1">작성자 : </div>
			<div class="col">${sessionUser.user_nick }</div>
		</div>
		<div class="row">
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">제목</label>
	  			<input type="text" name="freeboard_title" class="form-control" id="exampleFormControlInput1" value="${result.freeboardVo.freeboard_title}" placeholder="제목을 입력하세요">
			</div>
		</div>	
		<div class="row">
			<div class="mb-3">
	  			<label for="exampleFormControlTextarea1" class="form-label">내용</label>
	  			<textarea name="freeboard_content" class="form-control" id="exampleFormControlTextarea1" rows="10">${result.freeboardVo.freeboard_content }</textarea>
			</div>
		</div>
		<div class="row">
			이미지 : <input name="files" type="file" accept="image/*"  multiple><br>
		</div>
		<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  			<button type="submit" class="btn btn-primary" type="button">등록</button>
  			<a class="btn btn-secondary" href="${pageContext.request.contextPath }/freeboard/freeboard_page.do">취소</a>
	</div>
	</div>
</form>	
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>