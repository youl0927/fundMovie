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
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp"/>
<jsp:include page="/WEB-INF/views/commons/funding_nav.jsp"/>
<form action="${pageContext.request.contextPath }/funding/update_funding_qna_process.do" method="get">
<div class="container mt-3">
	<div class="row">
		<div class="col"></div>
		<div class="col-8">
			<div class="row mt-3">
				<div class="col"></div>
				<div class="col-5"><h1>문의 하기</h1></div>
				<div class="col"></div>
			</div>
			<div class="row mt-3">
				<div class="col"></div>
				<div class="col">
					<input name="funding_qna_title" class="form-control" type="text" placeholder="제목">
				</div>
				<div class="col"></div>
			</div>
			<div class="row mt-3">
				<div class="col"></div>
				<div class="col">작성자  ${sessionUser.user_nick }</div>
				<div class="col"></div>
			</div>
			<div class="row mt-3">
				<div class="col"></div>
				<div class="col">
					<select name="funding_qna_category_no" class="form_select">
						<option value="">문의 분류 선택</option>
						<option value="1">펀딩 관련 문의</option>
						<option value="2">펀딩 금액 관련 문의</option>
						<option value="3">영화 제작 관련 문의</option>
						<option value="4">기타 문의</option>
					</select>
				</div>
				<div class="col"></div>
			</div>
			<div class="row mt-3">
				<div class="col">
 					<textarea name="funding_qna_content" class="form-control" placeholder="문의 내용" style="height: 400px"></textarea>
				</div>
			</div>
			<div class="row mt-3">
				<div class="col d-grid justify-content-md-end">
					<input name="funding_open_no" type="hidden" value="${funding_open_no }">
				    <button type="submit" class="btn btn-dark">수정완료</button>
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