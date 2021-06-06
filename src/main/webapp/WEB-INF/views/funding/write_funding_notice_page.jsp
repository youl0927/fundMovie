<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <!-- Bootstrap core CSS -->
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/">
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

</head>

<jsp:include page="/WEB-INF/views/commons/global_nav.jsp"/>
<jsp:include page="/WEB-INF/views/commons/funding_nav.jsp"/>
<body class="bg-light">	
	<div class="container mt-3">
		<div class="row">
			<div class="project_info">
				<main>				
				    <div class="row g-3 mt-3">
				      <div class="col-md">
				        <h4 class="mb-3" style="text-align: center;">공지사항 작성하기</h4>
				        <hr class="my-4">
				        <form class="needs-validation" action="${pageContext.request.contextPath}/funding/write_funding_notice_process.do">
				          <div class="row g-3">
				            <div class="col-md-5">
				              <label for="title" class="form-label">공지사항 제목</label>
				              <input name="funding_notice_title" type="text" class="form-control" id="title" placeholder="제목을 입력해주세요">
				              <div class="invalid-feedback">
				               	공지사항 제목을 입력하지 않았습니다. 제목을 입력해주세요.
				              </div>
				            </div>
				          </div>
				          <hr class="my-4">
				          <div class="row gy-3">
				          	<div class="col-12-mb-4">
				              <label for="datail" class="form-label">공지사항 내용</label>
				              <textarea name="funding_notice_content" class="form-control" id="datail" placeholder="상세내용을 입력해주세요" rows="7"></textarea>
				              <div class="invalid-feedback">
				               	 공지사항 내용을 입력하지 않았습니다. 상세내용을 입력해주세요.
				              </div>
				            </div>
				          </div>  
				          <hr class="my-4">
				          <div class="row gy-3">
				          	  <div></div>
					          <div class="d-grid gap-2 col-4 mx-auto">
					     		  <input name="funding_open_no" type="hidden" value="${funding_open_no }">
						          <button class="btn btn-outline-secondary" type="submit" style="align-content: space-between;">작성완료</button>
					          </div>
					          <div></div>
				          </div>
				        </form>
				      </div>
				    </div>
		  		</main>
			</div>
		</div>
	</div>
	<div class="container">
  	<footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">© BBQ</p>
  	</footer>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>	
</body>
</html>