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
<style type="text/css">
h3.h3{text-align:center;margin:1em;text-transform:capitalize;font-size:1.7em;}
.carousel-inner{width:100%; height:200pt;}

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
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp"/>
<jsp:include page="/WEB-INF/views/commons/funding_nav.jsp"/>
	<div class="container mt-1">
		<div class="row">
			
		</div>
		<div class="row">
			<div class="col"></div>
			<div class="col-10">
				<div class="container">
				    <h3 class="h3"></h3>
				    <div class="row">
				        <c:forEach items="${resultList }" var="data">
				        <div class="col-md-3 col-sm-6">
				            <div class="funding-grid">
				                <div class="funding-image">
				                    <a href="${pageContext.request.contextPath}/funding/read_upload_movie_page.do?funding_open_no=${data.fundingOpenVo.funding_open_no}">
				                        <img class="pic" src="${data.fundingOpenVo.funding_thumb}" height="150">
				                    </a>
				                </div>
				                <div class="funding-content">
				                    <h3 class="title">${data.fundingOpenVo.funding_title }</h3>
				                </div>
				                <ul class="add">
				                    <li><a href="${pageContext.request.contextPath}/funding/read_upload_movie_page.do?funding_open_no=${data.fundingOpenVo.funding_open_no}" data-tip="영화보기"><img width="25pt" height="25pt" src="${pageContext.request.contextPath}/resources/image/iconmonstr-search-thin-48.png"></a></li>
				                </ul>
				            </div>
				        </div>
				        </c:forEach> 
				    </div>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>
</body>
</html>