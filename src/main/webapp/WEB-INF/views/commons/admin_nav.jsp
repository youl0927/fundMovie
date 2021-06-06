<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/blog/">
    <!-- Bootstrap core CSS -->
<link href="/docs/5.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">

<style type="text/css">
	.navbar-brand > .img-fluid{width:100pt;height:40pt;}
	.ulist{list-style:none;}
</style>

<!-- Custom styles for this template -->
<link href="blog.css" rel="stylesheet">
<body>   
<div class="container">
  <header class="blog-header py-1">
    <div class="row flex-nowrap justify-content-between align-items-center">
      <div class="col-3 pt-1"></div>
      <div class="col-6 text-center">
      </div>
      <div class="col-3 d-flex justify-content-end align-items-center">
     	<c:choose>
			<c:when test="${!empty sessionUser }">
				<div class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" style="color:#6E6E6E" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">${sessionUser.user_nick }&nbsp;님</a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="${pageContext.request.contextPath }/member/logout_process.do">로그 아웃</a>
						<a class="dropdown-item" href="${pageContext.request.contextPath }/mypage/mypage_main.do">마이페이지</a>
					</div>														
				</div>				
			</c:when>
			<c:otherwise>
				<a class="nav-link" style="color:#6E6E6E" href="${pageContext.request.contextPath }/member/login_page.do">로그인</a>	
			</c:otherwise>
		</c:choose>
      </div>
    </div>
  </header>
</div> 

</body>  