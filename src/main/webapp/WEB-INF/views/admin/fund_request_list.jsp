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
        <table class="table table-hover">
							<thead>
								<tr>
									<th class="text-center" width="100">닉네임</th>
									<th class="text-center" width="100">ID.</th>
									<th class="text-center" width="300">펀딩 제목</th>
									<th class="text-center" width="150">펀딩 기간</th>
									<th class="text-center" width="150">제작예정일</th>	
									<th class="text-center" width="250">펀딩 신청일</th>
									<th class="text-center" width="150">진행상태</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${fundList}" var="data" >
							
									<tr>
										<td class="text-center">${data.memberVo.user_nick }</td>
										<td class="text-center">${data.memberVo.user_id }</td>
										<td class="text-center">${data.fundingRequestVo.funding_title }</td>
										<td class="text-center"><fmt:formatDate value="${data.fundingRequestVo.funding_start }" pattern="yyyy.MM.dd" />~<fmt:formatDate value="${data.fundingRequestVo.funding_end }" pattern="yyyy.MM.dd" /></td>
										<td class="text-center"><fmt:formatDate value="${data.fundingRequestVo.release_date }" pattern="yyyy.MM.dd" /></td>
										<td class="text-center"><fmt:formatDate value="${data.fundingRequestVo.funding_open_date }" pattern="yyyy.MM.dd" /></td>
										
										
										<c:choose>
										<c:when test="${data.fundingRequestVo.funding_status eq 'N' }">
											<td class="text-center"><a class="btn btn-secondary" role="button" href="${pageContext.request.contextPath}/admin/approve_funding_process.do?funding_open_no=${data.fundingRequestVo.funding_open_no }">대기중</a></td>
										</c:when>
										
										<c:when test="${data.fundingRequestVo.funding_status eq 'Approved' }">
											<td class="text-center"><a class="btn btn-primary" role="button" href="${pageContext.request.contextPath}/admin/complete_funding_process.do?funding_open_no=${data.fundingRequestVo.funding_open_no }">펀딩 승인</a></td>
										</c:when>
										
										<c:when test="${data.fundingRequestVo.funding_status eq 'Complete' }">
											<td class="text-center"><a class="btn btn-success" role="button" href="${pageContext.request.contextPath}/admin/uploaded_funding_process.do?funding_open_no=${data.fundingRequestVo.funding_open_no }">영화 제작중</a></td>
										</c:when>
										
										<c:when test="${data.fundingRequestVo.funding_status eq 'Uploaded' }">
											<td class="text-center"><a class="btn btn-dark" role="button" href="">업로드 완료</a></td>
										</c:when>
										
										<c:when test="${data.fundingRequestVo.funding_status eq 'Canceled' }">
											<td class="text-center"><a class="btn btn-danger" role="button" href="${pageContext.request.contextPath}/admin/fund_cancel_page.do?funding_open_no=${data.fundingRequestVo.funding_open_no }">취소</a></td>
										</c:when>
										
										<c:otherwise>
											<td class="text-center"><a class="btn btn-dark" role="button" href="#">미정</a></td>
										</c:otherwise>
										</c:choose>	
									
									
										
										
									</tr>
									
								</c:forEach>
							</tbody>
	
							
						</table>
        
      </div>

    </main>
  </div>
</div>
</div>

    <script src="https://getbootstrap.com/docs/5.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>

      <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
  </body>
</html>
