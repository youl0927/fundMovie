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

<style type="text/css">
h3.h3{text-align:center;margin:1em;text-transform:capitalize;font-size:1.7em;}
.carousel-inner{width:100%; height:350px;}

.funding-grid,.funding-grid .funding-image{overflow:hidden}
.funding-grid{font-family:'Open Sans',sans-serif;text-align:center;position:relative;transition:all .5s ease 0s}
.funding-grid:hover{box-shadow:0 0 10px rgba(0,0,0,.3)}
.funding-grid .funding-image a{display:block}
.funding-grid .funding-image img{width:100%;height:auto;transition:all .5s ease 0s}
.funding-grid:hover .funding-image img{transform:scale(1.1)}
.funding-grid .funding-content{padding:12px 12px 15px;transition:all .5s ease 0s}
.funding-grid:hover .funding-content{opacity:0}
.funding-grid .title{font-size:20px;font-weight:600;text-transform:capitalize;margin:0 0 10px;transition:all .3s ease 0s}
.funding-grid .title a{color:#000}
.funding-grid .title a:hover{color:#2e86de}
.funding-grid .price{font-size:18px;font-weight:600;color:#2e86de}
.funding-grid .add{background-color:#fff;width:100%;padding:0;margin:0;list-style:none;opacity:0;transform:translateX(-50%);position:absolute;bottom:-50%;left:50%;z-index:1;transition:all .5s ease 0s}
.funding-grid:hover .add{opacity:1;bottom:20px}
.funding-grid .add li{display:inline-block}
.funding-grid .add li a{color:#909090;font-size:16px;line-height:45px;text-align:center;height:45px;width:45px;margin:0 7px;border:1px solid #909090;border-radius:50px;display:block;position:relative;transition:all .3s ease-in-out}
.funding-grid .add li a:hover{color:#fff;background-color:#2e86de;width:80px}
.funding-grid .add li a:after,.funding-grid .add li a:before{content:attr(data-tip);color:#fff;background-color:#2e86de;font-size:12px;letter-spacing:1px;line-height:20px;padding:1px 5px;border-radius:5px;white-space:nowrap;opacity:0;transform:translateX(-50%);position:absolute;left:50%;top:-30px}
.funding-grid .add li a:after{content:'';height:15px;width:15px;border-radius:0;transform:translateX(-50%) rotate(45deg);top:-20px;z-index:-1}
.funding-grid .add li a:hover:after,.funding-grid .add li a:hover:before{opacity:1}
@media only screen and (max-width:990px){.funding-grid{margin-bottom:30px}
}

@font-face {
    font-family: 'SDSamliphopangche_Outline';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Outline.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'CookieRunOTF-Bold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/CookieRunOTF-Bold00.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
.slo { 
	 font-family: 'SDSamliphopangche_Outline', serif;
	}
	
.crb { 
	 font-family: 'CookieRunOTF-Bold', serif;
	}

</style>
 

<script type="text/javascript">
function freshList(){
	
	var xmlhttp = new XMLHttpRequest();
	
	xmlhttp.onreadystatechange = function (){
		
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
			var resultList = JSON.parse(xmlhttp.responseText);
			
			var containerBox = document.getElementById("container_box");
			
			containerBox.innerHTML = "";
			
			
				for(data of resultList){
				
				var fundingListBox = document.getElementById("funding_grid_box");
				var newFundingListBox = fundingListBox.cloneNode(true);
				newFundingListBox.setAttribute("class","col-md-3 col-sm-6");
								
				var fundingImgA = newFundingListBox.getElementsByClassName("funding_img_url");
				var funding_a = new String(data.fundingVo.funding_open_no);
					fundingImgA[0].setAttribute("href", "${pageContext.request.contextPath}/funding/read_funding_page.do?funding_open_no="+funding_a);
				
				var fundingImgUrl = newFundingListBox.getElementsByClassName("pic");
				var ImgUrl = new String(data.fundingVo.funding_thumb);
				fundingImgUrl[0].setAttribute("src",ImgUrl);
					
				var fundingTitle = newFundingListBox.getElementsByClassName("funding_title");
				var title = new String(data.fundingVo.funding_title);
				fundingTitle[0].innerText = title;
				
				var progressBar = newFundingListBox.getElementsByClassName("progress-bar");
				var percent = new String(data.percent);
				progressBar[0].setAttribute("style","width :"+percent+"%");
				progressBar[0].setAttribute("aria-valuenow",percent);
				progressBar[0].innerText = percent+"%";
			
				var addBar = newFundingListBox.getElementsByClassName("funding_add");
				var addUrl = new String(data.fundingVo.funding_open_no); 
				addBar[0].setAttribute("href","${pageContext.request.contextPath}/funding/read_funding_page.do?funding_open_no="+addUrl);
			
			
				newFundingListBox.removeAttribute("id");
				containerBox.appendChild(newFundingListBox);
				}	
		}
		
	};
	
	xmlhttp.open("get","${pageContext.request.contextPath}/funding/funding_list.do", true);
	xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xmlhttp.send();
	
}	


</script>

</head>
<body onload="freshList()">
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp"/>
<jsp:include page="/WEB-INF/views/commons/funding_nav.jsp"/>
<main>
<div class="row mt-2">
  <div class="col-2"></div>
  <div class="col">	
  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <ol class="carousel-indicators">
      <li data-bs-target="#myCarousel" data-bs-slide-to="0" aria-label="Slide 1"></li>
      <li data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></li>
      <li data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3" class="active"></li>
    </ol>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="bd-placeholder-img" width="100%" height="350px" src="${pageContext.request.contextPath }/resources/image/CFAbErPUMAALKmu.png" aria-hidden="true" focusable="false">
			<div class="carousel-caption d-none d-md-block slo" >
		       <!--  <h5>BBQ사이트에 오신 걸 환영합니다.</h5>
		        <p>저희 사이트는 영화를 사랑하시는 분들이 자유롭게 활동하길 바라며 만든 사이트입니다.</p> -->
		    </div>
      </div>
      <div class="carousel-item">
        <img class="bd-placeholder-img" width="100%" height="350px" src="${pageContext.request.contextPath }/resources/image/CFAbL-oUgAAq3zq.png" aria-hidden="true" focusable="false">
			<div class="carousel-caption d-none d-md-block crb" style="color: black;"> 
		        <!--<h1>당신만의 영화. 펀딩으로 만들어보세요</h1>
		        <p>상업영화에 비해 많은 주목을 받지 못하는 독립영화를 위한 펀딩을 직접 설계하고 참여할 수 있는 공간이 마련되어 있습니다.</p> -->
		    </div>
      </div>
      <div class="carousel-item">
        <img class="bd-placeholder-img" width="100%" height="350px" src="${pageContext.request.contextPath }/resources/image/CFAbL_EUgAALeYH.png" aria-hidden="true" focusable="false">
			<div class="carousel-caption d-none d-md-block slo">
		        <!--<h5>BBQ사이트에 오신 걸 환영합니다.</h5>
		        <p>영화를 사랑하는 회원분들!사용안하시는 포스터와 티켓등 영화 관련 물건들에 대한 중고 가격을 제시해주세요.  회원들간의 중고거래가 가능한 공간이 마련되어 있습니다.</p> -->
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
  </div>
  <div class="col-2"></div>
</div>
<div class="row">
<div class="container mt-1">
		
		<div class="row">
			<div class="col"></div>
			<div class="col-10">
				<div class="container" >
				    <h3 class="h3"></h3>
				    
				    
				    <div class="row" id="container_box">
				    
				    <!-- 값을 넣자 -->

				    </div>
				    
					<hr>
				    <div class="row mt-3"><!-- 페이징/글쓰기 버튼 -->
				    	<div class="col-3"></div>
						<div class="col">
							<nav aria-label="Page navigation example">
								<ul class="pagination mb-0 pagination justify-content-center">
									<li class="page-item<c:if test="${currentPage == 1 }"> disabled</c:if>"><a href="${pageContext.request.contextPath}/funding/funding_main_page.do?page_num=1" class="page-link">&lt;&lt;</a></li>
									<li class="page-item<c:if test="${beginPage <= 1 }"> disabled</c:if>"><a href="${pageContext.request.contextPath}/funding/funding_main_page.do?page_num=${beginPage-1 }" class="page-link">&lt;</a></li>
									<c:forEach begin="${beginPage}" end="${endPage }" var="i">
										<li class="page-item<c:if test="${i == currentPage }"> active</c:if>"><a href="${pageContext.request.contextPath}/funding/funding_main_page.do?page_num=${i }" class="page-link">${i }</a></li>
									</c:forEach>
									<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a href="${pageContext.request.contextPath}/funding/funding_main_page.do?page_num=${endPage+1 }" class="page-link">&gt;</a></li>
									<li class="page-item<c:if test="${currentPage == pageCount }"> disabled</c:if>"><a href="${pageContext.request.contextPath}/funding/funding_main_page.do?page_num=${pageCount }" class="page-link">&gt;&gt;</a></li>
								</ul>
							</nav>
						</div>
						<div class="col-4">
							<form action="${pageContext.request.contextPath }/funding/funding_main_page.do" method="get">
							<div class="row" style="margin-bottom: 20px"><!-- 검색... -->
								<div class="col-3">
									<select name="search_type" class="form-control">
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="writer">작성자</option>
									</select>
								</div>
								<div class="col-7">
									<input name="search_word" type="text" class="form-control">
								</div>
								<div class="col-2 d-grid gap-2">
									<input type="submit" value="검색" class="btn btn-secondary">
								</div>
							</div>
							</form>
						</div>	
					</div>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>
	</div>
</main>


		<!-- templete -->
					<div class="funding-main-box d-none" id="funding_list_box">
				        <div class="col-md-3 col-sm-6" id="funding_grid_box">
				            <div class="funding-grid">
				                <div class="funding-image">
				                    <a href="${pageContext.request.contextPath}/funding/read_funding_page.do?funding_open_no=..." class="funding_img_url">
				                        <img class="pic" src="..." height="150">
				                    </a>
				                </div>
				                <div class="funding-content">
				                    <h3 class="funding_title" id="funding_title">...</h3>
					                    <div class="progress" id="count_percent" style="height: 20px;">
									  		<div class="progress-bar" role="progressbar" style="width: ...%;" aria-valuenow="..." aria-valuemin="0" aria-valuemax="100">...%</div>
										</div>
				                </div>
				                <ul class="add">
				                    <li><a href="${pageContext.request.contextPath}/funding/read_funding_page.do?funding_open_no=${data.fundingVo.funding_open_no}" class="funding_add" data-tip="상세보기"><img width="25pt" height="25pt" src="${pageContext.request.contextPath}/resources/image/iconmonstr-search-thin-48.png"></a></li>
				                	
				                </ul>
				            </div>
				        </div>
				        
				    </div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>