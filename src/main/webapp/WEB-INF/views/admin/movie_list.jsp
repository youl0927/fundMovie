<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>BBQ 관리자 페이지</title>

    

    <!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/resources/bootstrap-5.0.0-beta2-examples/assets/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath}/resources/bootstrap-5.0.0-beta2-examples/dashboard/dashboard.css" rel="stylesheet">
<style>
 .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

.body {
  font-size: .875rem;
}

.feather {
  width: 16px;
  height: 16px;
  vertical-align: text-bottom;
}

/*
 * Sidebar
 */

.sidebar {
  position: fixed;
  top: 0;
  /* rtl:raw:
  right: 0;
  */
  bottom: 0;
  /* rtl:remove */
  left: 0;
  z-index: 100; /* Behind the navbar */
  padding: 48px 0 0; /* Height of navbar */
  box-shadow: inset -1px 0 0 rgba(0, 0, 0, .1);
}

@media (max-width: 767.98px) {
  .sidebar {
    top: 5rem;
  }
}

.sidebar-sticky {
  position: relative;
  top: 0;
  height: calc(100vh - 48px);
  padding-top: .5rem;
  overflow-x: hidden;
  overflow-y: auto; /* Scrollable contents if viewport is shorter than content. */
}

.sidebar .nav-link {
  font-weight: 500;
  color: #333;
}

.sidebar .nav-link .feather {
  margin-right: 4px;
  color: #727272;
}

.sidebar .nav-link.active {
  color: #007bff;
}

.sidebar .nav-link:hover .feather,
.sidebar .nav-link.active .feather {
  color: inherit;
}

.sidebar-heading {
  font-size: .75rem;
  text-transform: uppercase;
}

/*
 * Navbar
 */

.navbar-brand {
  padding-top: .75rem;
  padding-bottom: .75rem;
  font-size: 1rem;
  border:none;
  background-color: rgba(255, 255, 255, .1);
  box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
}

.navbar .navbar-toggler {
  top: .25rem;
  right: 1rem;
}

.navbar .form-control {
  padding: .75rem 1rem;
  border-width: 0;
  border-radius: 0;
}

.form-control-dark {
  color: #fff;
  background-color: rgba(255, 255, 255, .1);
  border-color: rgba(255, 255, 255, .1);
}

.form-control-dark:focus {
  border-color: transparent;
  box-shadow: 0 0 0 3px rgba(255, 255, 255, .25);
}

/* Chart.js */
@keyframes chartjs-render-animation{from{opacity:.99}to{opacity:1}}.chartjs-render-monitor{animation:chartjs-render-animation 1ms}.chartjs-size-monitor,.chartjs-size-monitor-expand,.chartjs-size-monitor-shrink{position:absolute;direction:ltr;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1}.chartjs-size-monitor-expand>div{position:absolute;width:1000000px;height:1000000px;left:0;top:0}.chartjs-size-monitor-shrink>div{position:absolute;width:200%;height:200%;left:0;top:0}	
</style>

</head>
<body>
	<jsp:include page="/WEB-INF/views/commons/admin_nav.jsp" />
<div class="container">    
<div class="container-fluid">
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse" style="padding-top: 25px">
    <div class="text-center" style="padding-bottom: 20px">
        <a class="navbar-brand" href="${pageContext.request.contextPath }/admin/setting_main.do"><img class="img-fluid" src="${pageContext.request.contextPath}/resources/image/bbq_logo.png" style="border: none;"></a>
      </div>
      <div class="position-sticky pt-2">
        
		<ul class="nav flex-column">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath }/admin/setting_main.do">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
              	관리자 홈
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/admin/fund_request_list.do">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>
              	펀딩 관리
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/admin/rank_request_list.do">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
              	펀딩 유저 관리	
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/admin/movie_list.do">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-cart"><circle cx="9" cy="21" r="1"></circle><circle cx="20" cy="21" r="1"></circle><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path></svg>
              	영화 등록
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/admin/qna_page.do">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-users"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
              	QnA관리	
            </a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="#">
              <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layers"><polygon points="12 2 2 7 12 12 22 7 12 2"></polygon><polyline points="2 17 12 22 22 17"></polyline><polyline points="2 12 12 17 22 12"></polyline></svg>
              Integrations
            </a>
          </li>
        </ul>
        
      </div>
    </nav>

    <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3">
        <div class="row">
			<div class="col"></div>
			<div class="col-10">
				<form action="${pageContext.request.contextPath }/admin/movie_list.do" method="get">
				<div class="row mt-3"><!-- 검색... -->
					<div class="col-2">
						<select name="search_type" class="form-control">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
						</select>
					</div>
					<div class="col-7">
						<input name="search_word" type="text" class="form-control">
					</div>
					<div class="col-1 d-grid gap-2">
						<input type="submit" value="검색" class="btn btn-dark">
					</div>
					<div class="col-2 d-grid gap-2">
						<a class="btn btn-dark" href="${pageContext.request.contextPath }/admin/add_movie_inform.do" role="button">영화 등록</a>
					</div>
				</div>
				</form>
				<div class="row mt-2"><!-- 테이블... -->
					<div class="col">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="text-center" width="100">글 번호</th>
									<th class="text-center" width="300">제목</th>
									<th class="text-center" width="100">작성자</th>
									<th class="text-center" width="150">개봉일</th>
									<th class="text-center" width="100">조회수</th>
									<th class="text-center" width="200">작성일</th>
									<th class="text-center" width="50"></th><th width="50"></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${resultList }" var="data">
									<tr>
										<td class="text-center">${data.contentVo.movie_no }</td>
										<td class="text-center"><a href="${pageContext.request.contextPath }/admin/test_movie_page.do?movie_no=${data.contentVo.movie_no }">${data.contentVo.movie_title }</a></td>
										<td class="text-center">${data.memberVo.user_nick }</td>
										<td class="text-center">${data.contentVo.movie_release_date }</td>
										<td class="text-center">${data.contentVo.movie_readcount }</td>
										<td class="text-center"><fmt:formatDate value="${data.contentVo.movie_writedate }" pattern="yyyy.MM.dd HH:mm:ss" /></td>
										<td class="text-center"><a href="${pageContext.request.contextPath}/admin/update_movie_page.do?movie_no=${data.contentVo.movie_no }"><img src="${pageContext.request.contextPath }/resources/image/pencil.svg" width="20" height="20" class="d-block w-100" alt="..."></a></td>
										<td class="text-center"><a href="${pageContext.request.contextPath}/admin/delete_movie_process.do?movie_no=${data.contentVo.movie_no }"><img src="${pageContext.request.contextPath }/resources/image/x.svg" width="20" height="20" class="d-block w-100" alt="..."></a></td>										
									</tr>
								</c:forEach>
							</tbody>
	
							
						</table>
						
					</div>
				</div>
				<div class="row mt-2"><!-- 페이징/글쓰기 버튼... -->
					<div class="col">
						<nav aria-label="Page navigation example">
								<ul class="pagination mb-0 pagination justify-content-center">
									<li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a href="${pageContext.request.contextPath}/admin/movie_list.do?page_num=1" class="page-link">&lt;&lt;</a></li>
									<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a href="${pageContext.request.contextPath}/admin/movie_list.do?page_num=${beginPage-1 }" class="page-link">&lt;</a></li>
									<c:forEach begin="${beginPage}" end="${endPage }" var="i">
										<li class="page-item<c:if test="${i == currentPage }"> active</c:if>"><a href="${pageContext.request.contextPath}/admin/movie_list.do?page_num=${i }" class="page-link">${i }</a></li>
									</c:forEach>
									<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a href="${pageContext.request.contextPath}/admin/movie_list.do?page_num=${endPage+1 }" class="page-link">&gt;</a></li>
									<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a href="${pageContext.request.contextPath}/admin/movie_list.do?page_num=${pageCount }" class="page-link">&gt;&gt;</a></li>
								</ul>
							</nav>						 
					</div>
					<div class="col-2 d-grid gap-2">
						<!-- <c:if test="${!empty sessionUser }">
						<a class="btn btn-primary" href="${pageContext.request.contextPath }/content/write_content_page.do">글쓰기</a>
						</c:if>-->
					</div>
				</div>			
			</div>
			<div class="col"></div>
		</div>
        
      </div>

    </main>
  </div>
</div>
</div>

    <script src="https://getbootstrap.com/docs/5.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

      <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
  </body>
</html>






