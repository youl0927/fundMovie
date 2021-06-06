<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/carousel/">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<%--
<style>
	.carousel-inner-main{
		width:auto;
		height:350px;
		overflow:hidden;
	}
	.carousel-inner-main > .carousel-top{
		display: flex;
	}
	.carousel-inner-main > .carousel-top > img { width: 500px; height: 300px; 
	}
</style>
 --%>
    <!-- Favicons -->
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="/docs/5.0/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

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
</style>
<link href="carousel.css" rel="stylesheet">
</head>
<body>
	<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />

<main>
  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <ol class="carousel-indicators">
      <li data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></li>
      <li data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></li>
      <li data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="bd-placeholder-img" width="100%" height="500px" src="${pageContext.request.contextPath }/resources/image/main1.png" aria-hidden="true" focusable="false">
			<div class="carousel-caption d-none d-md-block" style="color: #FFFFFF;">
		        <h5>BBQ사이트에 오신 걸 환영합니다.</h5>
		        <p>저희 사이트는 영화를 사랑하시는 분들이 자유롭게 활동하길 바라며 만든 사이트입니다.</p>
		    </div>
      </div>
      <div class="carousel-item">
        <img class="bd-placeholder-img" width="100%" height="500px" src="${pageContext.request.contextPath }/resources/image/main1.png" aria-hidden="true" focusable="false">
			<div class="carousel-caption d-none d-md-block">
		        <h5>독립영화 제작에 참여하세요.</h5>
		        <p>상업영화에 비해 많은 주목을 받지 못하는 독립영화를 위한 펀딩을 직접 설계하고 참여할 수 있는 공간이 마련되어 있습니다.</p>
		    </div>
      </div>
      <div class="carousel-item">
        <img class="bd-placeholder-img" width="100%" height="500px" src="${pageContext.request.contextPath }/resources/image/main1.png" aria-hidden="true" focusable="false">
			<div class="carousel-caption d-none d-md-block">
		        <h5>영화의 여운을 오프라인에서 이어가세요.</h5>
		        <p>포스터와 티켓등 영화 관련 물건들에 대한 가격을 제시해주세요. 중고장터와 경매장이 마련되어 있습니다.</p>
		    </div>
      </div>
    </div>
    <ol class="carousel-control-prev" data-bs-target="#myCarousel" data-bs-slide="prev">
      <li class="carousel-control-prev-icon" aria-hidden="true"></li>
      <li class="visually-hidden">Previous</li>
    </ol>
    <ol class="carousel-control-next" data-bs-target="#myCarousel" data-bs-slide="next">
      <li class="carousel-control-next-icon" aria-hidden="true"></li>
      <li class="visually-hidden">Next</li>
    </ol>
  </div>
   <!-- Three columns of text below the carousel -->
<div class="container mt-5">
 <div class="row mb-5">
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">중고</strong>
          <h3 class="mb-0"><b>토이스토리  피규어</b></h3>
          <div class="mb-1 text-muted">Fev 24</div>
          <p class="card-text mb-auto">작년에 구매한 버즈와 우디 피규어입니다.<br>연락주세요~</p>
          <a href="${pageContext.request.contextPath }/trade/trade_read_page.do?trade_no=14" class="btn btn-outline-primary">구매하기</a>
        </div>
        <div class="col-auto d-none d-lg-block">
		  <img width="250" height="250" src="${pageContext.request.contextPath }/resources/image/toystory1.png">
        </div>
      </div>
    </div>
    
    
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-primary">중고</strong>
          <h3 class="mb-0"><b>라라랜드 한정판 티켓</b></h3>
          <div class="mb-1 text-muted">Fev 24</div>
          <p class="card-text mb-auto">라라랜드 한정판 티켓입니다.<br>편하게 연락주세요^^</p>
          <a href="${pageContext.request.contextPath }/trade/trade_read_page.do?trade_no=15" class="btn btn-outline-primary">구매하기</a>
        </div>
        <div class="col-auto d-none d-lg-block">
		  <img width="250" height="250" src="${pageContext.request.contextPath }/resources/image/lalaland1.png">
        </div>
      </div>
    </div>   
  </div> 
  
  
   <div class="row mb-5">
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-success">경매</strong>
          <h3 class="mb-0"><b>인셉션 굿즈</b></h3>
          <div class="mb-1 text-muted">Fev 24</div>
          <p class="card-text mb-auto">현재 구하기 어려운 제품입니다.<br>경매에 참여해보세요.</p>
          <a href="${pageContext.request.contextPath }/auction/auction_main_cover.do" class="btn btn-outline-success">중고참여</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <img width="250" height="250" src="${pageContext.request.contextPath }/resources/image/auction_1.png">
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-success">경매</strong>
          <h3 class="mb-0"><b>해리포터 목걸이</b></h3>
          <div class="mb-1 text-muted">Fev 24</div>
          <p class="card-text mb-auto">외국에서 직접 구매했습니다!<br>경매에 참여해보세요.^^</p>
          <a href="${pageContext.request.contextPath }/auction/auction_main_cover.do" class="btn btn-outline-success">경매참여</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <img width="250" height="250" src="${pageContext.request.contextPath }/resources/image/auction_2.png">
        </div>
      </div>
    </div>
  </div> 
  
  
   <div class="row mb-5">
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-warning">펀딩</strong>
          <h3 class="mb-0"><b>크루아상</b></h3>
          <div class="mb-1 text-muted">Fev 20</div>
          <p class="card-text mb-auto">독립영화 크루아상입니다.<br>펀딩에 참여해보세요.</p>
          <a href="${pageContext.request.contextPath }/funding/funding_main_page.do" class="btn btn-outline-warning">펀딩참여</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <img width="250" height="250" src="${pageContext.request.contextPath }/resources/image/funding_1.jpg">
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
        <div class="col p-4 d-flex flex-column position-static">
          <strong class="d-inline-block mb-2 text-warning">펀딩</strong>
          <h3 class="mb-0"><b>69세</b></h3>
          <div class="mb-1 text-muted">Fev 20</div>
          <p class="card-text mb-auto">독립영화 69세 입니다.<br>펀딩에 참여해보세요!</p>
          <a href="${pageContext.request.contextPath }/funding/funding_main_page.do" class="btn btn-outline-warning">펀딩참여</a>
        </div>
        <div class="col-auto d-none d-lg-block">
          <img width="250" height="250" src="${pageContext.request.contextPath }/resources/image/funding_2.jpg">
        </div>
      </div>
    </div>
  </div> 
  
  
  
</div>   




</main>

<footer class="text-muted py-5">
 	<jsp:include page="/WEB-INF/views/commons/footer_nav.jsp" />

</footer>
<%--
	<div class="container mt-1">
		<div class="row">
			<div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner-main">
					<div class="carousel-top">
						<div class="carousel-item active" >
							<img src="https://mdbootstrap.com/img/Photos/Horizontal/Food/4-col/img%20(10).jpg"" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="https://mdbootstrap.com/img/Photos/Horizontal/Food/4-col/img%20(11).jpg"" class="d-block w-100" alt="...">
						</div>
						<div class="carousel-item">
							<img src="https://mdbootstrap.com/img/Photos/Horizontal/Food/4-col/img%20(13).jpg" class="d-block w-100" alt="...">
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row mt-3">
			<div id="multi-item-example" class="carousel slide carousel-multi-item" data-ride="carousel">
				<div class="controls-top">
					<a class="btn-floating" href="#multi-item-example" data-slide="prev"><i class="fa fa-chevron-left"></i></a>
					<a class="btn-floating" href="#multi-item-example" data-slide="next"><i class="fa fa-chevron-right"></i></a>
				</div>
				<ol class="carousel-indicators">
					<li data-target="#multi-item-example" data-slide-to="0" class="active"></li>
					<li data-target="#multi-item-example" data-slide-to="1"></li>
					<li data-target="#multi-item-example" data-slide-to="2"></li>
				</ol>
				<div class="carousel-inner" role="listbox">
					 <!--First slide-->
			        <div class="carousel-item active">
			          <div class="row">
			            <div class="col-md-4">
			              <div class="card mb-2">
			                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(34).jpg"
			                  alt="Card image cap">
			              </div>
			            </div>
			
			            <div class="col-md-4 clearfix d-none d-md-block">
			              <div class="card mb-2">
			                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(18).jpg"
			                  alt="Card image cap">
			              </div>
			            </div>
			
			            <div class="col-md-4 clearfix d-none d-md-block">
			              <div class="card mb-2">
			                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20(35).jpg"
			                  alt="Card image cap">
			              </div>
			            </div>
			          </div>
			
			        </div>
			        <!--/.First slide-->
			
			        <!--Second slide-->
			        <div class="carousel-item">
			
			          <div class="row">
			            <div class="col-md-4">
			              <div class="card mb-2">
			                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(60).jpg"
			                  alt="Card image cap">
			              </div>
			            </div>
			
			            <div class="col-md-4 clearfix d-none d-md-block">
			              <div class="card mb-2">
			                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(47).jpg"
			                  alt="Card image cap">
			              </div>
			            </div>
			
			            <div class="col-md-4 clearfix d-none d-md-block">
			              <div class="card mb-2">
			                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Horizontal/City/4-col/img%20(48).jpg"
			                  alt="Card image cap">
			              </div>
			            </div>
			          </div>
			
			        </div>
			        <!--/.Second slide-->
			
			        <!--Third slide-->
			        <div class="carousel-item">
			
			          <div class="row">
			            <div class="col-md-4">
			              <div class="card mb-2">
			                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Horizontal/Food/4-col/img%20(53).jpg"
			                  alt="Card image cap">
			              </div>
			            </div>
			
			            <div class="col-md-4 clearfix d-none d-md-block">
			              <div class="card mb-2">
			                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Horizontal/Food/4-col/img%20(45).jpg"
			                  alt="Card image cap">
			              </div>
			            </div>
			
			            <div class="col-md-4 clearfix d-none d-md-block">
			              <div class="card mb-2">
			                <img class="card-img-top" src="https://mdbootstrap.com/img/Photos/Horizontal/Food/4-col/img%20(51).jpg"
			                  alt="Card image cap">
			              </div>
			            </div>
			          </div>
			
			        </div>
			        <!--/.Third slide-->
				</div>					
			</div>
		</div>
	</div>
	 --%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>