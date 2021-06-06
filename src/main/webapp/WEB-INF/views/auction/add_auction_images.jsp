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
    <script type="text/javascript">
    function previewImage(targetObj, View_area) {
    	var preview = document.getElementById(View_area); //div id
    	var ua = window.navigator.userAgent;

      //ie일때(IE8 이하에서만 작동)
    	
    		var files = targetObj.files;
    		for ( var i = 0; i < files.length; i++) {
    			var file = files[i];
    			var imageType = /image.*/; //이미지 파일일경우만.. 뿌려준다.
    			if (!file.type.match(imageType))
    				continue;
    			
    			var prevImg = document.getElementById("prev_" + View_area); //이전에 미리보기가 있다면 삭제
    			if (prevImg) {
    				preview.removeChild(prevImg);
    			}
    			var img = document.createElement("img"); 
    			img.id = "prev_" + View_area;
    			img.classList.add("obj");
    			img.file = file;
    			img.style.width = '300px'; 
    			img.style.height = '300px';
    			preview.appendChild(img);
    			if (window.FileReader) { // FireFox, Chrome, Opera 확인.
    				var reader = new FileReader();
    				reader.onloadend = (function(aImg) {
    					return function(e) {
    						aImg.src = e.target.result;
    					};
    				})(img);
    				reader.readAsDataURL(file);
    			} else { // safari is not supported FileReader
    				//alert('not supported FileReader');
    				if (!document.getElementById("sfr_preview_error_"
    						+ View_area)) {
    					var info = document.createElement("p");
    					info.id = "sfr_preview_error_" + View_area;
    					info.innerHTML = "not supported FileReader";
    					preview.insertBefore(info, null);
    				}
    			}
    		
    	}
    }
    </script>
</head>
<body>
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />
<jsp:include page="/WEB-INF/views/commons/auction_nav.jsp" />

<form action="${pageContext.request.contextPath}/auction/add_auction_images_process.do" method="post" enctype="multipart/form-data">
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
								<img src="${pageContext.request.contextPath }/resources/image/fancy_line1.svg" width="" height="15" alt="...">
							</div>	
							<div class="col" >	
								<img src="${pageContext.request.contextPath }/resources/image/circle_3.svg" width="20" height="20" alt="...">
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
							<a style="font-weight: bold; font-size: 15px;">Step 3: 내용 확인 후 신청</a>
							</div>
						</div>
					</div>
					<div class="col"></div>
				</div>
				<br>
				<div class="row mt-3" style="text-align: center;">
				
					<div class="col" style="padding:6px;padding-left: 70px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 정면 사진 </h5></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 측면 사진 </h5></div>
					<div class="col" style="padding:6px;padding-right: 70px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 후면 사진 </h5></div>
					
					
				</div>
				<div class="row mt-3" >
					<div class="col"></div>
					<div class="col" style="padding-left: 60px;">
					</div>
					<div class="col" style="text-align: center;">
						<input type="file" name="file" id="profile_pt" onchange="previewImage(this,'View_area')">
						<div id='View_area' style='position:relative; width: 100px; height: 100px; color: black; border: 0px solid black; dispaly: inline; '></div>					
					</div>
					<div class="col" style="text-align: center;">
					</div>
					<div class="col"></div>
				</div>
				
				
				
				<div class="row mt-5"></div><br>
				<div class="row mt-5"></div>
				<div class="row mt-5"></div>
				<div class="row mt-5">
					<div class="col " style="text-align: center;">
						<button type="submit" class="btn btn-danger btn-lg " style="width: 200px; " >NEXT</button>
						<input type="hidden" name="auction_no" value="${auction_no }" >
					</div>
				</div>				
			</div>
			
			<div class="col"></div>	
			
			<div class="row mt-5">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ></div>
					<div class="col-5">
					</div>
					<div class="col"></div>
				</div>	
		</div>	
	</div>
</form>
<div class="row mt-5">
</div>
<br>
<br>
<br>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>