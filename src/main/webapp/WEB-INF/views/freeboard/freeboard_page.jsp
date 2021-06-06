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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Brush+Script&display=swap" rel="stylesheet">
<style>
p{
	font-family:'Nanum Brush Script', sans-serif;
}
</style>
</head>
<body>
<c:if test="${sessionUser.user_no == null}">
		<script type="text/javascript">
			alert("로그인을 해야 이용이 가능합니다.");
			document.location.href="${pageContext.request.contextPath }/member/login_page.do";
		</script>
</c:if>
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />
<img class="img-fluid" src="${pageContext.request.contextPath }/resources/image/freeboardMain.png" style="display: block; margin: 0 auto; height:300px; width:1950px; overflow:hidden;">
<div class="container mt-1">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<div class="row">
				<div class="col-4 ps-1">
					<div class="ps-1" role="alert">
  						<p style="font-size:30px">Freeboard(자유 게시판)</p>
					</div>
				</div>
				<div class="col-4"></div>
				<div class="col-4">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb" style="float:center;">
							<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/content/main_page.do">Home</a></li>
							<li class="breadcrumb-item active" aria-current="page">Freeboard</li>
						</ol>
					</nav>
				</div>
			</div>
			<div class="row">
				<table class="table">
  					<thead>
    					<tr>
      						<th class="col-1">No</th>
							<th class="col-4 text-center">제목</th>
							<th class="col-1 text-center">조횟수</th>							
							<th class="col-2 text-center">글쓴이</th>
							<th class="col-4 text-center">날짜</th>
   						 </tr>
					</thead>
					<tbody>
						<c:forEach items="${resultList }" var="data">
							<tr>
								<td>${data.freeboardVo.freeboard_no }</td>
								<td><a href="${pageContext.request.contextPath }/freeboard/read_freeboard_page.do?freeboard_no=${data.freeboardVo.freeboard_no }">${data.freeboardVo.freeboard_title }</a> [${data.countReple}]</td>
								<td class="text-center">${data.freeboardVo.freeboard_readcount }</td>
								<td class="text-center">${data.memberVo.user_nick }</td>
								<td class="text-center"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${data.freeboardVo.freeboard_writedate }"/></td>
							</tr>
					</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="row">
				<div class="col-10"></div>
				<div class="col-2">
					<c:if test="${!empty sessionUser }">
						<a href="/fundmovie/freeboard/write_freeboard_page.do"><img src="/fundmovie/resources/image/freeboard_write.PNG"></a>
					</c:if>	
				</div>
			</div>
			<div class="row">
				<div class="col">
					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center mb-0">
							<li class="page-item<c:if test= "${currentPage == 1 }"> disabled</c:if>"><a href="${pageContext.request.contextPath}/freeboard/freeboard_page.do?page_num=1" class="page-link">&lt;&lt;</a></li>
							<li class="page-item<c:if test= "${beginPage <= 1 }"> disabled</c:if>"><a href="${pageContext.request.contextPath}/freeboard/freeboard_page.do?page_num=${beginPage-1 }" class="page-link">&lt;</a></li>
							
							<c:forEach begin="${beginPage}" end="${endPage }" var="i">
								<li class="page-item<c:if test="${i == currentPage }"> active</c:if>"><a href="${pageContext.request.contextPath}/freeboard/freeboard_page.do?page_num=${i }" class="page-link">${i }</a></li>							
							</c:forEach>
							<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a href = "${pageContext.request.contextPath}/freeboard/freeboard_page.do?page_num=${endPage+1 }" class="page-link">&gt;</a></li>
							<li class="page-item<c:if test="${currentPage == pageCount  }"> disabled</c:if>"><a href = "${pageContext.request.contextPath}/freeboard/freeboard_page.do?page_num=${pageCount }"class="page-link">&gt;&gt;</a></li>		
						</ul>
					</nav>
				</div>			
			</div>
			<form action="${pageContext.request.contextPath}/freeboard/freeboard_page.do" method="get">
				<div class="row mt-3">
					<div class="col-1"></div>
					<div class="col-2">
						<select name = "search_type" class="form-control">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>
						</select>
					</div>
					<div class="col-7">
						<input name="search_word" type="text" class="form-control">
					</div>
					<div class="col-1 d-grid gap-2">
						<input type="image" style="width:30px; height:30px;" src="${pageContext.request.contextPath}/resources/image/iconmonstr-search-thin-48.png ">
					</div>
					<div class="col-1"></div>					
				</div>
			</form>
		</div>
		<div class="col-2"></div>
	</div>
</div>
<br>
<br>
<br>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>