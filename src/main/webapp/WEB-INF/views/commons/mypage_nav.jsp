<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.navbar-brand > .img-fluid{width:100pt;height:40pt;}
	.ulist{list-style:none;}
</style>
</head>
<body>
	<!-- 네비바 -->
	
<header class="blog-header py-3" style="background-color: #FFFFFF;">
    <div class="row flex-nowrap justify-content-between align-items-center"  >
      <div class="col-3 pt-1"></div>
      <div class="col-6 text-center" >
        <a class="navbar-brand" href="${pageContext.request.contextPath }/content/main_page.do"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/bbq_logo.png"></a>
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
				<a class="nav-link" style="color:#6E6E6E" href="${pageContext.request.contextPath }/member/login_page.do"> 로그인 </a>
				<div style="border-left:solid 1px #D8D8D8; margin-left: 10px;">&nbsp;</div>
				<a class="nav-link" style="color:#6E6E6E; margin-right: 50px;" href="${pageContext.request.contextPath }/member/join_member_page.do">회원가입</a>	
			</c:otherwise>
		</c:choose>
      </div>
    </div>
 </header>
<!-- 네비바 -->
</body>
</html>