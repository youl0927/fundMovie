<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
    <link href="https://fonts.googleapis.com/css?family=Sunflower:500" rel="stylesheet" type='text/css'>    
    <link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">
    <style type="text/css">
    
	.sf {
  	font-family: 'Noto Serif KR', serif;
	} 
    
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    
    </head>
	<div class="collapse" id="navbarToggleExternalContent">
	  <div class="bg-dark p-4">
	    <h5 class="text-white h4">Collapsed content</h5>
	    <span class="text-muted">Toggleable via the navbar brand.</span>
	  </div>
	</div>
	
	<nav class="navbar navbar-inverse navbar-expand-lg navbar-light" style="background-color: #F6F6F6; padding-bottom: 0px; padding-top: 0px;">
		
		<div class="container-fluid header" style="margin: 0px; padding: 8px; padding-left:100px; border-bottom: 1px solid #D2DCE0;">
			<a class="navbar-brand sf" style="'Noto Serif KR', sans-serif; font-size:20px; margin-left: 20px; padding: 8px; padding-right: 0px;width: 160px; text-align: center;" href="${pageContext.request.contextPath }/content/main_page.do">HOME</a>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item"><a class="nav-link active sf" style="'Noto Serif KR', sans-serif; font-size: 18px; width: 180px; text-align: center;" href="${pageContext.request.contextPath }/auction/auction_main.do">Auctions</a></li>
				<li class="nav-item"><a class="nav-link sf" style="'Noto Serif KR', sans-serif; font-size: 18px; width: 180px; text-align: center;" href="">Buy Now</a></li>
				<li class="nav-item"><a class="nav-link sf" style="'Noto Serif KR', sans-serif; font-size: 18px; width: 180px; text-align: center;" href="${pageContext.request.contextPath}/auction/add_auction.do">Sell</a></li>
				<li class="nav-item"><a class="nav-link sf" style="'Noto Serif KR', sans-serif; font-size: 18px; width: 180px; text-align: center;" href="">Services</a></li>
				
			</ul>
			
			  <form class="form-inline">
			    <input class="form-control mr-sm-2" style="width:70%; float: left; display: inline;" type="search" placeholder="경매 물품 찾기" aria-label="Search">
			    <button class="btn btn-outline-secondary my-2 my-sm-0" style="display: inline; " type="submit">Search</button>
			  </form>
			  <div style="padding-left:100px;"></div>
			  
			
			
		</div>
	</nav>    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    