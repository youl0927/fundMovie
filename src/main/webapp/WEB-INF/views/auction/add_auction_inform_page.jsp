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
<script type="text/javascript">
	function formSubmit(){
		
		var frm1 = document.getElementById("frm1");
		
		var opening_date = document.getElementById("opening_date");
		var closing_date = document.getElementById("closing_date");
		var cloding_time = document.getElementById("closing_time");
		
		var open_date = opening_date.value.replaceAll("-","/");
		var close_date = closing_date.value.replaceAll("-","/");
		
		var value_start = "12:00";
		var value_ctime = cloding_time.value;

		open_date += " " + value_start;
		close_date += " " + value_ctime;
		
		var input_open_date = document.createElement("input");
		input_open_date.setAttribute("type","hidden");
		input_open_date.setAttribute("name","opening_date");
		input_open_date.setAttribute("value",open_date);
		frm1.appendChild(input_open_date);
		
		var input_close_date = document.createElement("input");
		input_close_date.setAttribute("type","hidden");
		input_close_date.setAttribute("name","closing_date");
		input_close_date.setAttribute("value",close_date);
		frm1.appendChild(input_close_date);
		
		frm1.submit();
	}
</script>


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

<form id="frm1" action="${pageContext.request.contextPath}/auction/add_auction_inform_process.do" method="post">
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
								<img src="${pageContext.request.contextPath }/resources/image/fancy_line1.svg" width="" height="15" alt="...">
							</div>	
							<div class="col" >	
								<img src="${pageContext.request.contextPath }/resources/image/circle_2.svg" width="20" height="20" alt="...">
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
							<a style="font-weight: bold; font-size: 15px;">Step 2: 사진 및 관련 문서 업로드</a>
							</div>
							<div class="col" style="padding: 0px; padding-right: 70px;">
							<a style="font-weight: bold; font-size: 15px;">Step 3: 내용 확인 후 신청</a>
							</div>
						</div>
					</div>
					<div class="col"></div>
				</div>
				<br>
				<div class="row mt-5">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 경매물품명</h5></div>
					<div class="col-5">
						<input type="text" class="form-control" name="auction_title" placeholder="물품이름을 입력하세요" >
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-3">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 물품 설명</h5></div>
					<div class="col-5">
						<textarea name="auction_detail" placeholder="물품에 대한 설명을 입력하세요" rows="5" cols="60"></textarea>
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-3">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 제작사/제작자</h5></div>
					<div class="col-5">
						<input type="text" class="form-control" name="maker" placeholder="제작사 또는 제작자를 입력하세요">
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-3">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 제작연대</h5></div>
					<div class="col-5">
							<label class="radio-inline col-sm-2">
							  <input type="radio" name="production_date" id="production_date1" value="1980s"> ~1980s
							</label>
							<label class="radio-inline col-sm-2 ">
							  <input type="radio" name="production_date" id="production_date2" value="1990s"> 1990s
							</label>
							<label class="radio-inline col-sm-2 ">
							  <input type="radio" name="production_date" id="production_date3" value="2000s"> 2000s
							</label>
							<label class="radio-inline  col-sm-2">
							  <input type="radio" name="production_date" id="production_date4" value="최근"> 최근
							</label>
					</div>
					<div class="col"></div>
				</div>
				
				<div class="row mt-3">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 경매 시작일</h5></div>
					<div class="col-5">
				         <input type="date" class="form-control" id="opening_date">
					</div>
					<div class="col"></div>
				</div>
				<div class="row mt-1">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 경매 종료일</h5></div>
					<div class="col-5">
				         <input type="date" class="form-control" id="closing_date">
				         <input type="time" id="closing_time">
					</div>
					<div class="col"></div>
				</div>
				
				<div class="row mt-3">
					<div class="col"></div>
					<div class="col" style="padding:6px;" ><h5 class="sf" style="margin:0px; 'Noto Serif KR', sans-serif;"> 경매 예상가</h5></div>
					<div class="col-5">
				         <input name="estimate_price" type="number" class="form-control" placeholder="경매는 예상가의 30%부터 시작됩니다. (단위: 포인트)">
					</div>
					<div class="col"></div>
				</div>
				
				<div class="row mt-5">
					<div class="col " style="text-align: center;">
						<button type="button" class="btn btn-danger btn-lg " style="width: 200px; " onclick="formSubmit()">NEXT</button>
					</div>
				</div>				
			</div>
			
			<div class="col"></div>		
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