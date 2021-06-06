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
<body class="text-center">
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />
<form action="${pageContext.request.contextPath }/content/qna_write_process.do" method="post">
<div class="container mt-5">
	<div class="row mt-5">	
		<div class="col">
			<div class="text-center"><h1><b>〓Q&A〓</b></h1></div>
			<div class="row mt-5">
				
				<div class="col-6">
					<input name="qna_title" class="form-control" type="text" placeholder="제목을 입력해주세요.">
				</div>
				<div class="col-6">
					<select name="qna_headline_no" class="form-select">
						<option selected>말머리를 선택해주세요.</option>
						<option value="1">펀딩</option>
						<option value="2">경매장</option>
						<option value="3">중고거래</option>
						<option value="4">자유게시판</option>
						<option value="5">같이놀자</option>
						<option value="6">플레이리스트</option>
						<option value="7">기타</option>
					</select>
				</div>
			</div>
			<div class="row mt-2">
				<div class="col">
					<textarea name="qna_content" type="text" placeholder="내용을 입력해주세요." class="form-control" id="exampleFormControlTextarea1" style="height: 400px"></textarea>
				</div>
			</div>
			<div class="row mt-2">
				<div class="col">
				  <input name="files" class="form-control" type="file" accept="image/*" multiple>
				</div>
			</div>
			<div class="row mt-4">
				<div class="col">
					<div class="col d-grid">
						<button type="submit" class="btn btn-secondary btn-lg">글올리기</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>
</form>
<footer class="text-muted py-5">
  <div class="container">
    <p class="float-end mb-1">
      <a href="#">위로가기</a>
    </p>		  	
	<p class="fs-6">Copyright &copy; 2021 BBQ Project</p>
  </div>
</footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>