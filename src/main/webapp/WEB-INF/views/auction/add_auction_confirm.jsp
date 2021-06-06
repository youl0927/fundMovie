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
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@500&display=swap" rel="stylesheet">

 <style type="text/css">
 
  @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400');
  @import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);

	.jm { 
	 font-family: 'Jeju Myeongjo', serif;
	}
	.sf {
  	font-family: 'Noto Serif KR', serif;
	} 
	
	.ng {
  	font-family: 'Nanum Gothic', serif;
	} 
	
	
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    
</head>
<body>

<jsp:include page="/WEB-INF/views/commons/auction_nav.jsp" />

	<div class="container mt-3">
	
		<div class="row ">
			<div class="col"></div>
			<div class="col-10 p-3 mb-2 bg-light text-dark">
				<div class="row mt-5"  >
					<div class="col" style="background-color: ;"></div>
					<div class="col-5 sf" style="background-color: ; text-align:center; 'Noto Serif KR', sans-serif; font-size: 40px;"><a>경매 물품 등록 및 신청</a></div>
					<div class="col" style="background-color: ;"></div>
				</div><br><br>
				<div class="row mt-5" style="text-align: center;">
					<div class="col"></div>
					<div class="col-12" >
						<div class="row" style="text-align: center;">
							<div class="col-2" ></div>
							<div class="col" >
								<img src="${pageContext.request.contextPath }/resources/image/circle_1_red.svg" width="20" height="20" alt="...">
							</div>	
							<div class="col" >	
								<img src="${pageContext.request.contextPath }/resources/image/fancy_line1_red.svg" width="" height="15" alt="...">
							</div>	
							<div class="col" >	
								<img src="${pageContext.request.contextPath }/resources/image/circle_2_red.svg" width="20" height="20" alt="...">
							</div>	
							<div class="col" >	
								<img src="${pageContext.request.contextPath }/resources/image/fancy_line1_red.svg" width="" height="15" alt="...">
							</div>	
							<div class="col" >	
								<img src="${pageContext.request.contextPath }/resources/image/circle_3_red.svg" width="20" height="20" alt="...">
							</div>
							<div class="col-2" ></div>
						</div>
						<div class="row mt-3">
							<div class="col" style="padding: 0px; padding-left: 70px;">
							<a style="font-weight: bold; font-size: 15px; color: #B30900;">Step 1: 물품 정보 입력</a>
							</div>
							<div class="col" >
							<a style="font-weight: bold; font-size: 15px; color: #B30900;">Step 2: 사진 및 관련 문서 업로드</a>
							</div>
							<div class="col" style="padding: 0px; padding-right: 70px;">
							<a style="font-weight: bold; font-size: 15px; color: #B30900;">Step 3: 내용 확인 후 신청</a>
							</div>
						</div>
					</div>
					<div class="col"></div>
				</div>
				<br>
				<div class="row mt-5">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 경매물품명</h5></div>
					<div class="col-5 jm" style="padding:6px; font-size: 18px; border-style: ridge; " >
						${auctionResult.auctionVo.auction_title }
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-3">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 물품 설명</h5></div>
					<div class="col-5 jm" style="padding:6px; border-style: ridge;" >
						${auctionResult.auctionVo.auction_detail }
											
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-3">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 제작사/제작자</h5></div>
					<div class="col-5 jm" style="padding:6px; border-style: ridge;" >
						${auctionResult.auctionVo.maker }
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-3">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 제작연대</h5></div>
					<div class="col-5 jm" style="padding:6px; border-style: ridge;" >
						${auctionResult.auctionVo.production_date }
					</div>
					<div class="col"></div>
				</div>
				
				<div class="row mt-3">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 경매 시작일</h5></div>
					<div class="col-5 jm" style="padding:6px; border-style: ridge;" >
						<fmt:formatDate value="${auctionResult.auctionVo.opening_date }" pattern="yyyy.MM.dd" />
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-1">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 경매 종료일</h5></div>
					<div class="col-5 jm" style="padding:6px; border-style: ridge;" >
						<fmt:formatDate value="${auctionResult.auctionVo.closing_date }" pattern="yyyy.MM.dd" />
					</div>
					<div class="col"></div>
				</div>
				
				<div class="row mt-3">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 경매 예상가</h5></div>
					<div class="col-5 jm" style="padding:6px; border-style: ridge;" >
					
				         ${auctionResult.auctionVo.estimate_price } 포인트
					</div>
					<div class="col"></div>
				</div>
				
				<div class="row mt-3">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 물품 이미지 </h5></div>
					<div class="col-5" style="padding:30px; padding-left:6px;" >

					<c:forEach items="${auctionResult.auctionImagesVoList }" var="auctionImagesVo">
					<img src="${auctionImagesVo.auction_main_img }" style="height: 200px; width:; " class="img-thumbnail"><br>
					</c:forEach>					
					
					</div>
					<div class="col"></div>
				</div>
				
				<div class="row mt-5">
					<div class="col " style="text-align: center;">
					
						<a role="button" class="btn btn-danger btn-lg " style="width: 200px; " href="${pageContext.request.contextPath }/auction/delete_auction_inform_process.do?auction_no=${auctionResult.auctionVo.auction_no }">Cancel</a>
						<a role="button" class="btn btn-success btn-lg " style="width: 200px; " href="${pageContext.request.contextPath }/auction/confirm_auction_inform_process.do?auction_no=${auctionResult.auctionVo.auction_no }">Confirm</a>
						
					</div>
				</div>	
				<div class="row mt-5">
					<div class="col " style="text-align: center;">
					
						
						
					</div>
				</div>						
			</div>
			
			<div class="col"></div>		
		</div>	
	</div>
<div class="row mt-5">
</div>
<br>
<br>
<br>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>