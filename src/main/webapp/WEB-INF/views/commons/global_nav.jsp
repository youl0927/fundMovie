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
<body >  
 
<div class="row">
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

  <div class="nav-scroller mt-2 py-1 mb-2" style="background-color: #FFFFFF;">
    <nav class="nav d-flex justify-content-center" style="text-align:center;">
    
      <a class=" link-secondary" style="text-decoration:none; margin:0px; padding-left:70px;padding-right:70px;display:block; text-align:center; border-left:solid 1px #D8D8D8;" href="${pageContext.request.contextPath }/funding/funding_main_page.do">펀딩</a>
      <a class=" link-secondary" style="text-decoration:none; margin:0px; padding-left:70px;padding-right:70px;display:block; text-align:center; border-left:solid 1px #D8D8D8;" href="${pageContext.request.contextPath }/auction/auction_main_cover.do">경매</a>
      <a class=" link-secondary" style="text-decoration:none; margin:0px; padding-left:70px;padding-right:70px;display:block; text-align:center; border-left:solid 1px #D8D8D8;" href="${pageContext.request.contextPath }/trade/trade_page.do">중고</a>
      <a class=" link-secondary" style="text-decoration:none; margin:0px; padding-left:70px;padding-right:70px;display:block; text-align:center; border-left:solid 1px #D8D8D8;" href="${pageContext.request.contextPath }/hangout/hangOut_list.do">놀자</a>
      <a class=" link-secondary" style="text-decoration:none; margin:0px; padding-left:70px;padding-right:70px;display:block; text-align:center; border-left:solid 1px #D8D8D8;" href="${pageContext.request.contextPath }/review/movie_review.do">리뷰</a>
      <a class=" link-secondary" style="text-decoration:none; margin:0px; padding-left:70px;padding-right:70px;display:block; text-align:center; border-left:solid 1px #D8D8D8;" href="${pageContext.request.contextPath }/freeboard/freeboard_page.do">자유</a>
      <a class=" link-secondary" style="text-decoration:none; margin:0px; padding-left:70px;padding-right:70px;display:block; text-align:center; border-left:solid 1px #D8D8D8; border-right:solid 1px #D8D8D8;" href="${pageContext.request.contextPath }/content/qna_page.do">질문</a>
      <a class=" link-secondary"></a>
    </nav>
  </div>
</div> 

</body>  