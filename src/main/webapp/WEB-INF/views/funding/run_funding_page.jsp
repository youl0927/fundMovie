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

<style type="text/css">

.funding-grid .funding-thumb p{display:block}
.funding-grid .funding-thumb img{width:100%;height:auto;}
.funding-grid .funding-image p{display:block}
.funding-grid .funding-image img{width:100%;height:auto;}


</style>

<script type="text/javascript">
		
</script>


</head>
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp"/>
<jsp:include page="/WEB-INF/views/commons/funding_nav.jsp"/>
<body class="bg-white">	
	<div class="container mt-3">
		<div class="row">
			<div class="col">
				<main>
					<div class="py-5 textcenter">
					<img class="d-block mx-auto mb-4" src="" width="" height="">
					</div>
				    <div class="row g-3">
				    	<div class="col-md-5 col-lg-4 order-md-last">
					        <h4 class="d-flex justify-content-between align-items-center mb-3">
					        	<span class="text-muted">몇일 남음</span>
					        </h4>
					        <hr class="mt-2" style=" border-width:20px; color:rgb(0, 187, 161) ">
					        <div style="padding:20px; background:rgb(255, 255, 255, 0.4)">
						        <div class="mt-3"><p><strong></strong>% 달성</p></div>
						        <div class="mt-3"><p><strong></strong>원 달성</p></div>
						        <div class="mt-3"><p><strong></strong>명 펀딩 중</p></div>
					        </div>
					        <div class="btn-funding mt-3">
					        <form action="${pageContext.request.contextPath}/funding/run_funding_process.do">
					        <input name="funding_user_point" type="number" value="금액">
					        <input name="funding_open_no" type="hidden" value="${result.fundingVo.funding_open_no }">
					        <button class="w-100 btn btn-outline-light" type="submit" style="padding:10px; background:rgb(0, 187, 161, 0.4)"><strong>펀딩하기</strong></button>
					        </form>
					        </div>
					        <div class="btn-wrap share mt-3">
					        	<button id="btn-like" class="campaign-like btn-like">
					        	<i class="icon-like"></i>
					        	<em id="cnLike" class="cnt-like">좋아요 인원수</em>
					        	</button>
					        	<button class="campaign-message btn-message">
					        	<i class="chat-o-like" aria-hidden="true"></i>
					        	문의
					        	</button>
					        </div>
				      </div>
				      <div class="col-md-7 clo-lg-8">
				      	<div class="funding-grid">
					    	<h4 class="mb-3"></h4>
					      		<div class="funding-thumb"><p><img class="funding-thumb" src="${result.fundingVo.funding_thumb }"></p></div>
					      		<div style="padding:20px; background:rgb(55, 160, 130, 0.2)" >
					      			<p style="color:#00b2b2;font-size:13px;line-height:20px;margin-bottom:8ptx; ">
					      				 <strong><fmt:formatDate pattern="yyyy.MM.dd" value="${result.fundingVo.funding_start }"/> ~ <fmt:formatDate pattern="yyyy.MM.dd" value="${result.fundingVo.funding_end }"/></strong>
					      			</p>
					      			<p style="color:#60656a;font-size:12px;line-height:19px;">
	            						<strong>100% 이상 모이면 펀딩이 성공되며, 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 결제가 진행되지 않습니다.</strong>
	          						</p>
					      		</div>
					      		<hr class="my-4" style=" border-width:20px; color:rgb(0, 187, 161) ">
					      		<div class="row gy-3">
						      		<strong class="title">프로젝트 상세정보</strong>
						      		<div class="col">
						      			<hr class="my-2" style=" border-width:20px; color:rgb(0, 187, 161) ">
						      			<div class="funding-image"><p>
						      				<c:forEach items="${result.fundingImageVoList }" var="imageVo">
												<div class="mt-3">
												<img src="${imageVo.funding_image_link }">
												</div>
											</c:forEach>
						      			</p></div>
						      			<hr class="my-4" style=" border-width:20px; color:rgb(0, 187, 161) ">
						      			<div class="funding-content"><p>${result.fundingVo.funding_detail }</p></div>
						      		</div>
					      		</div>
					      		<hr class="my-4" style=" border-width:20px; color:rgb(0, 187, 161) ">
					      </div>
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