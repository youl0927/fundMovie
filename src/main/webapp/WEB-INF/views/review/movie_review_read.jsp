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

<script type="text/javascript">

	function formSubmit(){
		var inputRepleContent = document.getElementById("input_reple_content");
		var inputReviewNo = document.getElementById("input_review_no");
		
		
		if (inputRepleContent.value != ""){			
			var frmReple = document.getElementById("frm_reple");
			frmReple.submit();
		}else{
			alert("내용을 입력해 주세요");
			inputRepleContent.focus();
			return;
		
		}		

	}

</script>


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
<div class="container mt-2">
	<div class="row">
		<div class="col-md-2">
			<img class="img-fluid" src="${readMap.contentVo.movie_main_img }" style="height:; width:200px; overflow:hidden; float:right;">			
		</div> 
		<div class="col" >
			<div class="row mt-3 ps-0"><b>${readMap.contentVo.movie_title }</b></div>
			<div class="row mt-3">${readMap.contentVo.movie_from } </div>
			<div class="row mt-3"> ${readMap.releaseYear}.${readMap.releaseMonth}.${readMap.releaseDate} 개봉 § ${readMap.contentVo.movie_runtime }분</div>
			<div class="row mt-3">감독 : ${readMap.contentVo.movie_director } § 주연 : ${readMap.contentVo.movie_actor }</div>
		</div>
		<div class="col"></div>
		<div class="col"></div>
	</div>
	<div class="row">
		<div class="col">
			<nav aria-label="breadcrumb">
				<ol class="breadcrumb" style="float:right;">
					<li class="breadcrumb-item"><a href="#">Home</a></li>
					<li class="breadcrumb-item active" aria-current="page">review Board</li>
					<li class="breadcrumb-item active" aria-current="page">review Read</li>
				</ol>
			</nav>
		</div>
	</div>
	<br>
	<hr>
	<div class="row">${readMap.contentVo.movie_synopsis }</div>
	<br>
	<br>
	<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
  		<div class="carousel-inner" style="width:1300px;">
    		<div class="carousel-item active" data-bs-interval="1000">
    			<img src="${pageContext.request.contextPath}/resources/image/stillCut.jpg" class="d-block w-100" style="height:500px; overflow:hidden;" alt="...">
    		</div>
    		<c:forEach items="${movieSteel}" var="data">
	   		 	<div class="carousel-item">
	     			<img src="${data.movieSteelcutVo.movie_steelcut_img }" class="d-block w-100" style="height:500px; overflow:hidden;" alt="...">
	   	 		</div>
   	 		</c:forEach>
 		</div>
  		<a class="carousel-control-prev" href="#carouselExampleFade" role="button" data-bs-slide="prev">
    		<span class="carousel-control-prev-icon" aria-hidden="true"></span>
    		<span class="visually-hidden">Previous</span>
  		</a>
  		<a class="carousel-control-next" href="#carouselExampleFade" role="button" data-bs-slide="next">
   			<span class="carousel-control-next-icon" aria-hidden="true"></span>
    		<span class="visually-hidden">Next</span>
  		</a>
	</div>
	<div class="row"><b>${readMap.reviewVo.movie_review_title }    [${readMap.reviewVo.movie_review_readcount}]</b></div>
	<br>
	<div class="row">${readMap.reviewVo.movie_review_content }</div>
	<div class="row">
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${readMap.reviewVo.movie_review_writedate}"/></div>
	</div>
	<div class="row">
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col">
		</div>
		<div class="col"> 
			<div class="dropdown">
 				 <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
   				 ${readMap.memberVo.user_nick }
  				</button>
  				<c:choose>
  					<c:when test="${!empty sessionUser && sessionUser.user_no == readMap.reviewVo.user_no }">
		 				 <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
		   					 <li><a class="dropdown-item" href="${pageContext.request.contextPath}/mypage/mypage_main.do">마이페이지</a></li>
					  	</ul>
					</c:when>
			  		<c:otherwise>
				  		<ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="dropdownMenuButton2">
				   			<li><a class="dropdown-item" href="#">친구추가</a></li>
							<li><a class="dropdown-item" href="#">쪽지보내기</a></li>
						</ul>
			  		</c:otherwise>
			  	</c:choose>			  	
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col"></div>
		<div class="col"></div>	
		<div class="col"></div>
		<div class="col">
			<c:choose>
			<c:when test="${MyCount==0 }">
				<form action="${pageContext.request.contextPath }/review/review_like_process.do" method="post">
					<input type="hidden" name= "movie_review_no" value="${readMap.reviewVo.movie_review_no }">
					<input type="hidden" name= "user_no" value="${sessionUser.user_no }">			
					<input type="image" style = "float:right; height:30px; width:30px;" src="${pageContext.request.contextPath}/resources/image/btn_icon_heart_blank.png" alt="제출버튼">	
				</form>	
			</c:when>
			<c:otherwise>
				<form action="${pageContext.request.contextPath }/review/review_like_update.do" method="post">
					<input type="hidden" name= "movie_review_no" value="${readMap.reviewVo.movie_review_no }">
					<input type="hidden" name= "user_no" value="${sessionUser.user_no }">			
					<input type="image" style = "float:right; height:30px; width:30px;"src="${pageContext.request.contextPath}/resources/image/btn_icon_heart_filled.png" alt="제출버튼">	
				</form>	
			</c:otherwise>
		</c:choose>
		</div>
		<div class="col">§  ${countLikeTotal}</div>
		<div class="col"></div>
		<div class="col"></div>	
		<div class="col"></div>
	</div>
	<div class="row">
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col"></div>
		<div class="col">
			<c:if test="${!empty sessionUser && sessionUser.user_no == readMap.reviewVo.user_no }">
				<a href = "${pageContext.request.contextPath}/review/update_review_page.do?movie_review_no=${readMap.reviewVo.movie_review_no }">수정</a>
			</c:if>
		</div>
		<div class="col">
			<c:if test="${!empty sessionUser && sessionUser.user_no == readMap.reviewVo.user_no }">
				<a href = "${pageContext.request.contextPath}/review/delete_review_process.do?movie_review_no=${readMap.reviewVo.movie_review_no }">삭제</a>
			</c:if>
		</div>	
	</div>
	<hr>
	<div class="row">
		<table class="table caption-top">
		  <caption><img alt="reple" style="width:20px; height:20px;" src="${pageContext.request.contextPath}/resources/image/btn_icon_comment.png">reple</caption>
		  <tbody>
			<c:forEach items="${reviewListResult }" var="data">
				<tr>
					<td class="col-md-7">${data.vo.review_reple_content}</td>
					<td class="col-md-2">${data.memberVo.user_nick }</td>
					<td class="col-md-2"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.vo.review_reple_date}"/></td>
					<td class="col-md-1">
						<c:if test="${sessionUser.user_no == data.memberVo.user_no}">
							<form action="${pageContext.request.contextPath }/review/delete_ReviewReple_process.do" method="post">					
								<input type="hidden" name= "review_reple_no" value="${data.vo.review_reple_no }">
								<input type="hidden" name= "movie_review_no" value="${readMap.reviewVo.movie_review_no }">
								<input type="submit" value="삭제">					
							</form>
						</c:if>
					</td>
				</tr>
			</c:forEach>
		  </tbody>
		</table>
	</div>
	<div class="row">
			<div class="mb-3">
				<form action="${pageContext.request.contextPath }/review/write_review_reple_process.do" method="post" id="frm_reple">
					<c:if test="${!empty sessionUser }">
		 				<label for="exampleFormControlTextarea1" class="form-label">댓글을 입력해주세요</label>
		  				<textarea class="form-control" id="input_reple_content" name="review_reple_content" rows="3"></textarea>
		  				<input type="hidden" id="input_review_no" name="movie_review_no" value="${readMap.reviewVo.movie_review_no }">
		  				<input onclick="formSubmit()" type="button" value="댓글 작성" style="float:right;">
	  				</c:if>
	  			</form>
			</div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>