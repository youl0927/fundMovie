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

<jsp:include page="/WEB-INF/views/commons/admin_nav.jsp" />
<div class="container mt-3">
	<div class="row" >
		<div class="col"></div>
		<div class="col-8">	
		<div class="row">
		<div class="col">
		<span style="font-size: 30px;">${result.contentVo.movie_title }</span><br>
		<span id="span" class="badge rounded-pill bg-danger">${result.contentVo.movie_from }</span> 
		<c:forEach items="${result.movieGenreList }" var="movieGenre">
			<a>${movieGenre }</a>
		</c:forEach>
		
		 / ${result.contentVo.movie_rating} / ${result.releaseYear} / 작성자 : ${result.memberVo.user_nick }<br>
		조회수  : ${result.contentVo.movie_readcount}<br>
		작성일 : 
		<fmt:formatDate value="${result.contentVo.movie_writedate}" pattern="yyyy.MM.dd HH:mm:ss" />
		<br>
		<div class="row mt-3" style="border-bottom: 1px dashed gray;"></div>
		<br>
		${result.contentVo.movie_synopsis }
		<br>
		
		
	
		<div class="row mt-3" style="border-bottom: 1px dashed gray;"></div><br>
		</div>	
		</div>
		<div class="row">
		<div class="col-3">
		<img src="${result.contentVo.movie_main_img }" style="height: ; width:200px;" class="img-thumbnail"><br>
		</div>
		<div class="col">
			<div class="row">
			개봉일: ${result.releaseYear}.${result.releaseMonth}.${result.releaseDate}
			</div>	<div class="row">감독: ${result.contentVo.movie_director }
			</div>	<div class="row">출연진: ${result.contentVo.movie_actor }
		</div>	
		
		</div>	
		</div>
		<div class="row mt-2">
		
		
	
		
		<c:forEach items="${result.steelcutVoList }" var="steelcutVo" varStatus="status">
		<div class="col-md-4">
	      <div class="img-thumbnail">
	        <img src="${steelcutVo.movie_steelcut_img }" alt="Lights" style="width:100%; height:180px;">
		    <div class="caption">
	        <p>Scene #. ${status.index+1}</p>
	       	</div>
	      </div>
	   	</div>		
   		</c:forEach>
   		</div>
		<div class="row mt-2 mb-2">
			<div class="col">
			<a href="${pageContext.request.contextPath}/admin/movie_list.do">목록으로</a>
			</div>
			<div class="col" style="text-align: right;">
				<c:if test="${!empty sessionUser && sessionUser.user_no == result.contentVo.user_no}">
					<div style=" float:right;"><a href="${pageContext.request.contextPath}/admin/delete_movie_process.do?movie_no=${data.contentVo.movie_no }"><img src="${pageContext.request.contextPath }/resources/image/x.svg" width="30 px" height="30 px" class="d-block w-100" alt="..."></a></div>
					<div style=" float:right;"><a href="${pageContext.request.contextPath}/admin/update_movie_page.do?movie_no=${data.contentVo.movie_no }"><img src="${pageContext.request.contextPath }/resources/image/pencil.svg" width="30 px" height="30 px" class="d-block w-100" alt="..."></a></div>
				</c:if>
			</div>	
		</div>	
		
		</div>
		
		<div class="col"></div>
		
	</div>
</div>
	
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
	
</body>
</html>









