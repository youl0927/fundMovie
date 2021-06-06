<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	.jm * { 
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
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />

<jsp:include page="/WEB-INF/views/commons/auction_nav.jsp" />

<form action="${pageContext.request.contextPath}/admin/add_movie_inform_process.do" method="post" enctype="multipart/form-data">
	<div class="container mt-3">
		<div class="row ">
			<div class="col"></div>
			<div class="col-10">
				<div class="row mt-5"  >
					<div class="col" style="background-color: ;"></div>
					<div class="col-5 sf" style="background-color: ; text-align:center; 'Noto Serif KR', sans-serif; font-size: 40px;"><a>경매 물품 등록 및 신청</a></div>
					<div class="col" style="background-color: ;"></div>
				</div><br><br>
				<div class="row mt-5" style="text-align: center;">
					<div class="col"></div>
					<div class="col-12" >
						<div class="row">
							<div class="col" >
								<img src="${pageContext.request.contextPath }/resources/image/computer.gif" width="100" height="100"  alt="...">
							</div>
							<div class="col" >
								<img src="${pageContext.request.contextPath }/resources/image/camera1.gif" width="100" height="100" alt="...">
							</div>
							<div class="col" >
								<img src="${pageContext.request.contextPath }/resources/image/tick1.gif" width="100" height="100" alt="...">
							</div>
						</div>
						<div class="row mt-5">
							<div class="col" >
							<a style="font-weight: bold; font-size: 18px;">Step 1: 물품 정보 입력</a>
							</div>
							<div class="col" >
							<a style="font-weight: bold; font-size: 18px;">Step 2: 사진 및 관련 문서 업로드</a>
							</div>
							<div class="col" >
							<a style="font-weight: bold; font-size: 18px;">Step 3: 내용 확인 후 신청</a>
							</div>
						</div>
						<div class="row mt-3">
							<div class="col" >
							<a style="font-size: 15px;">경매 물품에 대한 양식을 작성해주세요.</a>
							</div>
							<div class="col" >
							<a style="font-size: 15px;">관련 문서가 있는 경우 함께 올려주세요.<br> 사진은 반드시 필요합니다.</a>
							</div>
							<div class="col" >
							<a style="font-size: 15px;">입력한 내용을 확인하고 신청 버튼을 눌러주세요.</a>
							</div>
						</div>
						<div class="row mt-5">
						<div class="col mt-5">
							<a type="button" class="btn btn-danger btn-lg " style="width: 250px; text-align: center;" href="${pageContext.request.contextPath}/auction/add_auction_inform.do">시작하기</a>
						</div>
						</div>
						
					</div>
					<div class="col"></div>
				</div>
				<br>
				
				
				
				
				
				
				
			</div>
			<div class="col"></div>		
		</div>	
	</div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>