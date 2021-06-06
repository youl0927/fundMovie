<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />

<form action="${pageContext.request.contextPath}/content/qna_update_process.do" method="post">

<div class="container mt-3">
	<div class="row">
		<div class="col"></div>
		<div class="col">
			<div class="row">
				<div class="col"></div>
					<div class="col text-center">Q & A</div>
				<div class="col"></div>
			</div>
			<div class="row mt-4">
				<div class="col">
					<table class="table text-center" border="1">
						<tr>
							<th>제목 :</th>
							<td><input class="form-control" type="text" name="qna_title" value="${result.qnaVo.qna_title }"></td>
						</tr>
						<tr>
							<th>글쓴이  :</th>
							<td>${qnaResult.memberVo.user_nick }</td>
						</tr>
						<tr>
							<td colspan="2"><input class="form-control" type="text" name="qna_content" value="${qnaResult.qnaVo.qna_content }"></td>
						</tr>
					</table>
				</div>
				
			<div class="row mt-2">
				<div class="col d-grid">
					<input type="hidden" name="qna_no" value="${qnaResult.qnaVo.qna_no }">
					<input class="btn btn-dark" type="submit" value="Update">
				</div>
			</div>
		</div>
		<div class="col"></div>
	</div>
</div>
</form>




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>