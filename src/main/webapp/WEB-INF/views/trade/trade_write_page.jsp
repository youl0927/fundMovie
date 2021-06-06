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
<form action="${pageContext.request.contextPath }/trade/trade_write_process.do" method="post" enctype="multipart/form-data">

<%--
<main>
  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
	<ol class="carousel-indicators">
	    <li data-bs-target="carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></li>
	    <li data-bs-target="carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></li>
	    <li data-bs-target="carouselExampleCaptions" data-bs-slide-to="2" aria-label="Slide 3"></li>
	</ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="bd-placeholder-img" width="100%" height="300px" src="${pageContext.request.contextPath }/resources/image/main_1.jpg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false">

      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>

      </div>
      <div class="carousel-item">
        <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>

      </div>
    </div>
    <a class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </a>
    <a class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </a>
  </div>
</main>
 --%>




<div class="album py-5 bg-light">
<div class="container">
	<div class="row">
		<div class="col">
			<div class="row mt-2">
				<div class="col-6">
					<input name="trade_title" class="form-control" type="text" placeholder="제목을 입력해주세요   ex)  ㅇㅇ 판매합니다">
				</div>
				<div class="col-3">
					  <input name="trade_money" type="text" class="form-control" placeholder="판매액을 입력해주세요   ex)  3000">
				</div>
				<div class="col-3">
					<select name="trade_headline_no" class="form-select">
						<option selected>말머리를 선택해주세요</option>
						<option value="1">포스터</option>
						<option value="2">굿즈</option>
						<option value="3">기타</option>
					</select>
				</div>
			</div>
			<div class="row mt-2">
				<div class="col">
					<textarea name="trade_content" type="text" placeholder="내용을 입력해주세요 &#13;&#10; &#13;&#10; ex) 구매한 날짜 :&#13;&#10;&#13;&#10;     구매처 : &#13;&#10;&#13;&#10;     구매 당시 가격 : &#13;&#10;&#13;&#10;     제품 현재 상태 : " class="form-control" id="exampleFormControlTextarea1" style="height: 400px"></textarea>
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
						<button type="submit" class="btn btn-primary btn-lg">등록하기</button>
					</div>
				</div>
			</div>
		</div>
		
	</div>
</div>
</div>
</form>

<jsp:include page="/WEB-INF/views/commons/footer_nav.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>