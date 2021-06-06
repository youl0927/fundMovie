<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<style>
c{
	font-family:'Nanum Brush Script', sans-serif;
}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />
 <c:if test="${sessionUser.user_no == null}">
		<script type="text/javascript">
			alert("로그인을 해야 이용이 가능합니다.");
			document.location.href="${pageContext.request.contextPath }/member/login_page.do";
		</script>
</c:if>
<img class="img-fluid" src="${pageContext.request.contextPath }/resources/image/review_main.png" style="height:300px; width:1950px; overflow:hidden;">
 <div class="container">
 	<div class="row">
		<div class="col-8">
			<c style="font-size:30px">review board(리뷰 게시판)<p>
		</div>
		<div class="col-4">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb" style="float:center;">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">review board</li>
				</ol>
			</nav>
		</div>
		<div class="row">
			<div class="col-4 ps-2"><h3><span class="badge bg-secondary">Top1</span></h3></div>
			<div class="col-4 ps-3"><h3><span class="badge bg-secondary">Top2</span></h3></div>
			<div class="col-4 ps-4"><h3><span class="badge bg-secondary">Top3</span></h3></div>
		</div>
	</div>
		<div class="row row-cols-1 row-cols-md-3 g-4" >
			<div class="col">
				<div class="card" style="width:350px;">
					<c:choose>
						<c:when test="${!empty firstMap.contentVo.movie_main_img }">
							<img src="${firstMap.contentVo.movie_main_img }" class="card-img-top" style="height:300px; overflow:hidden;" alt="...">
							<div class="card-body">
							<h5 class="card-title">${firstMap.contentVo.movie_title }</h5>
							<p class="card-text"><a href="${pageContext.request.contextPath }/review/reivew_read_page.do?movie_review_no=${firstMap.reviewVo.movie_review_no }">${firstMap.reviewVo.movie_review_title }</a></p>					
							</div>
						</c:when>
						<c:otherwise>
							<img src="${pageContext.request.contextPath}/resources/image/no.png " class="card-img-top" style="height:300px; overflow:hidden;" alt="...">
							<div class="card-body">
							<h5 class="card-title">리뷰를 작성해주세요</h5>
							</div>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width:350px;">
					<c:choose>
					<c:when test="${!empty secondMap.contentVo.movie_main_img }">
						<img src="${secondMap.contentVo.movie_main_img }" class="card-img-top" style="height:300px; overflow:hidden;" alt="...">
						<div class="card-body">
						<h5 class="card-title">${secondMap.contentVo.movie_title }</h5>
						<p class="card-text"><a href="${pageContext.request.contextPath }/review/reivew_read_page.do?movie_review_no=${secondMap.reviewVo.movie_review_no }">${secondMap.reviewVo.movie_review_title }</a></p>
						</div>
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}/resources/image/no.png" class="card-img-top" style="height:300px; overflow:hidden;" alt="...">
						<div class="card-body">
						<h5 class="card-title">리뷰를 작성해주세요</h5>
						</div>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
			<div class="col">
				<div class="card" style="width:350px;">
					<c:choose>
					<c:when test="${!empty ThirdMap.contentVo.movie_main_img}">
						<img src="${ThirdMap.contentVo.movie_main_img }" class="card-img-top" style="height:300px; overflow:hidden;" alt="...">
						<div class="card-body">
						<h5 class="card-title">${ThirdMap.contentVo.movie_title }</h5>
						<p class="card-text"><a href="${pageContext.request.contextPath }/review/reivew_read_page.do?movie_review_no=${ThirdMap.reviewVo.movie_review_no }">${ThirdMap.reviewVo.movie_review_title }</a></p>
					</div>
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}/resources/image/no.png" class="card-img-top" style="height:300px; overflow:hidden;" alt="...">
						<div class="card-body">
						<h5 class="card-title">리뷰를 작성해주세요</h5>
						</div>
					</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	<div class="row"><br></div>
</div>
 <div class="container">
 	<div class="row">
 		<div class="col-1"></div>
 		<div class="col-10">
 			<div class="row">
 			<table class="table">
				<thead>
					<tr>
						<th class="col-1">No</th>
						<th class="col-2">영화 제목</th>
						<th class="col-3">리뷰 제목</th>
						<th class="col-1">평점</th>
						<th class="col-1">조회수</th>
						<th class="col-1">작성자</th>
						<th class="col-3">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reviewListResult}" var="data">
						<tr>
							<td>${data.reviewVo.movie_review_no }</td>
							<td>${data.contentVo.movie_title }</td>
							<td><a href="${pageContext.request.contextPath }/review/reivew_read_page.do?movie_review_no=${data.reviewVo.movie_review_no }">${data.reviewVo.movie_review_title }
							</a></td>
							<td>${data.reviewVo.movie_review_rating }</td>
							<td>${data.reviewVo.movie_review_readcount }</td>
							<td>${data.memberVo.user_nick }</td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.reviewVo.movie_review_writedate }"/></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			</div>
			<div class="row">
				<div class="col"></div>
					<div class="col">
						<nav aria-label="Page navigation example">
							<ul class="pagination mb-0">
								<li class="page-item<c:if test="${currentPage == 1}"> disabled</c:if>"><a href="${pageContext.request.contextPath }/review/movie_review.do?page_num=1" class="page-link">&lt;&lt;</a></li>
								<li class="page-item<c:if test="${beginPage <= 1}"> disabled</c:if>"><a href="${pageContext.request.contextPath }/review/movie_review.do?page_num=${beginPage-1 }" class="page-link">&lt;</a></li>
								<c:forEach begin="${beginPage }" end="${endPage }" var="i">
									<li class="page-item<c:if test="${i == currentPage }"> active</c:if>"><a href="${pageContext.request.contextPath }/review/movie_review.do?page_num=${i }" class="page-link">${i }</a></li>
								</c:forEach>
								<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a href="${pageContext.request.contextPath }/review/movie_review.do?page_num=${endPage+1 }" class="page-link">&gt;</a></li>
								<li class="page-item<c:if test="${currentPage == pageCount}"> disabled</c:if>"><a href="${pageContext.request.contextPath }/review/movie_review.do?page_num=${pageCount }" class="page-link">&gt;&gt;</a></li>								
							</ul>
						</nav>						 
					</div>		
				<div class="col"></div>
			</div>
			<div class="row">
				<div class="col">
					<form action="${pageContext.request.contextPath }/review/movie_review.do" method="get">
						<div class="row mt-2">
							<div class="col-2"></div>	
							<div class="col-2">
								<select name="search_type" class="form-control">
									<option value="title">제목</option>
									<option value="content">내용</option>
									<option value="writer">작성자</option>
								</select>
							</div>
							<div class="col">
								<input name="search_word" type="text" class="form-control">
							</div>
							<div class="col-1">
								<input type="image" style="width:30px; height:30px;" src="${pageContext.request.contextPath}/resources/image/iconmonstr-search-thin-48.png ">
							</div>	
							<div class="col-2"></div>		
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-10"></div>
				<div class="col">
					<c:if test="${!empty sessionUser }">
						<a href="${pageContext.request.contextPath }/review/movie_review_write.do">리뷰 쓰기 </a>
					</c:if>
				</div>
			</div>
 		</div>
 		<div class="col-1"></div>
 	</div>
 </div>
<br>
<br>
<br>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>