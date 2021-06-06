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
<body>
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />
<form action="${pageContext.request.contextPath }/trade/trade_update_process.do" method="post" enctype="multipart/form-data">
<div class="container mt-3">
	<div class="row">
		<div class="col-2"></div>
		<div class="col">
			<div class="row">
				<div class="text-center"><img class="img-fluid" width="300" height="300" src="${pageContext.request.contextPath }/resources/image/trade1.png"></div>
			</div>
			<div class="row mt-2">
				<div class="col-6">
					<input name="trade_title" class="form-control" type="text" placeholder="제목" value="${tradeResult.tradeVo.trade_title }">
				</div>
				<div class="col-3">
					  <input name="trade_money" type="text" class="form-control" placeholder="판매액" value="${tradeResult.tradeVo.trade_money }">
				</div>
				<div class="col-3">
					<select name="trade_headline_no" class="form-select">
						<option selected>말머리</option>
						<option value="1">포스터</option>
						<option value="2">굿즈</option>
						<option value="3">기타</option>
					</select>
				</div>
			</div>
			<div class="row mt-2">
				<div class="col">
					<textarea name="trade_content" type="text" placeholder="내용을 입력해주세요." class="form-control" id="exampleFormControlTextarea1" style="height: 400px" value="${tradeResult.tradeVo.trade_content }"></textarea>
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
						<button type="submit" class="btn btn-light">수정완료</button>
						<input class="btn btn-dark" type="hidden" name="trade_no" value="${tradeResult.tradeVo.trade_no }">
					</div>
				</div>
			</div>
		</div>
		<div class="col-2"></div>
	</div>
</div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>