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

<script type="text/javascript">
	function formSubmit(){
		
		/*
		var inputTitle = document.getElementById("title");
		
		if(inputTitle.value = ""){
			alert("제목을 입력해주세요.");
			inputId.focus(); //커서
			return;
		}
		
		var inputRating = document.getElementById("rating");
		
		if(inputRating.value = ""){
			alert("연령을 선택해주세요.");
			inputId.focus(); //커서
			return;
		}
		
		var inputTargetPoint = document.getElementById("target_point");
		
		if(inputTargetPoint.value =""){
			alert("목표금액을 입력해주세요.");
			inputId.focus(); //커서
			return;
		}
		
		var inputMinPoint = document.getElementById("min_point");
		
		if(inputMinPoint.value =""){
			alert("최소금액을 입력해주세요.");
			inputId.focus(); //커서
			return;
		}
		
		var inputReleaseDate = document.getElementById("release-date");
		
		if(inputReleaseDate.value =""){
			alert("제작날짜를 입력해주세요.");
			inputId.focus(); //커서
			return;
		}
		*/
		var frm1 = document.getElementById("frm1");
		
		var funding_start_date = document.getElementById("funding-start-date");
		var funding_end_date = document.getElementById("funding-end-date");
		var release_date = document.getElementById("release-date");
		
		var value_start = funding_start_date.value.replaceAll("-","/");
		var value_end = funding_end_date.value.replaceAll("-","/");
		var value_release = release_date.value.replaceAll("-","/");

		var input_start = document.createElement("input");
		input_start.setAttribute("type","hidden");
		input_start.setAttribute("name","funding_start");
		input_start.setAttribute("value",value_start);
		frm1.appendChild(input_start);
		
		var input_end = document.createElement("input");
		input_end.setAttribute("type","hidden");
		input_end.setAttribute("name","funding_end");
		input_end.setAttribute("value",value_end);
		frm1.appendChild(input_end);
		
		var input_release = document.createElement("input");
		input_release.setAttribute("type","hidden");
		input_release.setAttribute("name","release_date");
		input_release.setAttribute("value",value_release);
		frm1.appendChild(input_release);
		
		frm1.submit();
		
	}


</script>


</head>
<body class="bg-light">	
	<div class="container mt-3">
		<div class="row">
			<div class="project_info">
				<main>
				    <div class="py-5 text-center">
				      <img class="d-block mx-auto mb-4" src="${pageContext.request.contextPath }/resources/image/bbq_logo.png" width="230" height="100">
				      <p class="lead fw-bolder text-secondary">당신의 꿈을 위해 다양한 사람들이 응원합니다.</p>
				      <p class="lead fw-bolder text-secondary">당신의 영화를 만들어서 다양한 사람들과 세계에 공유해보세요.</p>
				    </div>
				
				    <div class="row g-3">
				      <div class="col-md-5 col-lg-4 order-md-last">
				        <h4 class="d-flex justify-content-between align-items-center mb-3">
				          <span class="text-muted">${sessionUser.user_nick }님의 펀딩 프로젝트</span>
				        </h4>
				        <ul class="list-group mb-3">
				          <li class="list-group-item d-flex justify-content-between lh-sm">
				            <div>
				              <h6 class="my-0">환영합니다. ${sessionUser.user_nick }님</h6>
				              <div class="mt-3"></div>
				              <small class="text-muted">당신만의 멋진 프로젝트를 완성해보세요.</small>
				            </div>
				            <span class="text-muted"></span>
				          </li>
				        </ul>
				      </div>
				      <div class="col-md-7 col-lg-8">
				        <h4 class="mb-3">펀딩 작성하기</h4>
				        <hr class="my-4">
				        <form id="frm1" class="needs-validation" action="${pageContext.request.contextPath}/funding/create_funding_process.do" method="post" enctype="multipart/form-data">
				          <div class="row g-3">
				            <div class="col-md-5">
				              <label for="title" class="form-label">제목</label>
				              <input name="funding_title" type="text" class="form-control" id="funding-title" placeholder="제목을 입력해주세요">
				              <div class="invalid-feedback">
				               	 제목을 입력하지 않았습니다. 제목을 입력해주세요.
				              </div>
				            </div>
				            <div class="col-md"></div>
				            <div class="col-md-4">
				              <label for="rating" class="form-label">연령</label>
				              <select name="funding_rating" class="form-select" id="funding-rating">
				                <option value="전체">전체</option>
				                <option value="12세">12세</option>
				                <option value="15세">15세</option>
				                <option value="19세">19세</option>
				              </select>
				              <div class="invalid-feedback">
				                	연령을 선택해주세요.
				              </div>
				            </div>
				            <div class="col-12">
				              <label for="genre" class="form-label">장르</label>
				            </div>
				            <hr class="my-0">
					          <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
					            <input name="genre_no" type="checkbox" value="1" class="btn-check"  id="action" autocomplete="off">
					            <label class="btn btn-outline-secondary" for="action">액션</label>  
					            <input name="genre_no" type="checkbox" value="2" class="btn-check" id="war" autocomplete="off">
					            <label class="btn btn-outline-secondary" for="war">전쟁</label>
					          	<input name="genre_no" type="checkbox" value="3" class="btn-check" id="romance" autocomplete="off">
					            <label class="btn btn-outline-secondary" for="romance">로맨스</label>
					            <input name="genre_no" type="checkbox" value="4" class="btn-check" id="drama" autocomplete="off">
					            <label class="btn btn-outline-secondary" for="drama">드라마</label>
					            <input name="genre_no" type="checkbox" value="5" class="btn-check" id="SF" autocomplete="off">
					            <label class="btn btn-outline-secondary" for="SF">SF</label>
					          </div>
					        <hr class="mt-3">
				            <div class="col-md-5">
				              <label for="funding-start-date" class="form-label">펀딩 시작날짜</label>
				              <span class="input-group-text"><span class="far fa-calendar-alt"></span></span>
				              <input type="date" class="form-control" id="funding-start-date">
				              <div class="invalid-feedback">
				               	 날짜를 선택하지 않았습니다. 날짜를 선택해주세요.
				              </div>
				            </div>
				            <div class="col"></div>
				            <div class="col-md-5">
				              <label for="funding-end-date" class="form-label">펀딩 마감날짜</label>
				              <span class="input-group-text"><span class="far fa-calendar-alt"></span></span>
				              <input type="date" class="form-control" id="funding-end-date">
				              <div class="invalid-feedback">
				               	 날짜를 선택하지 않았습니다. 날짜를 선택해주세요.
				              </div>
				            </div>
				          </div>
				          <hr class="my-4">
				          <div class="row gy-3">
				            <div class="col-md-5">
				              <label for="cc-name" class="form-label">목표 금액</label>
				              <input name="funding_target_point" type="number" class="form-control" id="funding-target-point" placeholder="목표 금액을 입력해주세요">
				              <div class="invalid-feedback">
				               	 목표금액이 입력되지 않았습니다. 금액을 설정해주세요.
				              </div>
				            </div>
				            <div class="col-md-2"></div>
				            <div class="col-md-5">
				              <label for="cc-number" class="form-label">펀딩 최소 금액</label>
				              <input name="funding_min_point" type="number" class="form-control" id="funding-min-point" placeholder="최소 금액을 입력해주세요">
				              <small class="text-muted">최소 금액을 지정하시면 최소 금액 이하는 펀딩되지 않습니다.</small>
				              <div class="invalid-feedback">
				                	최소금액이 입력되지 않았습니다. 금액을 설정해주세요.
				              </div>
				            </div>
				            <div class="col-md-5">
				              <label for="release-date" class="form-label">영화 제작 날짜</label>
				              <span class="input-group-text"><span class="far fa-calendar-alt"></span></span>
				              <input type="date" class="form-control" id="release-date">
				              <div class="invalid-feedback">
				               	영화제작 날짜를 선택하지 않았습니다. 날짜를 선택해주세요.
				              </div>
				            </div>
				            <div class="col"></div>
				            <div class="col-md-5">
				              <label for="cc-number" class="form-label">펀딩 이후 구매 금액</label>
				              <input name="release_price" type="number" class="form-control" id="release-price" placeholder="최소 금액을 입력해주세요">
				              <div class="invalid-feedback">
				                	구매금액이 입력되지 않았습니다. 금액을 설정해주세요.
				              </div>
				            </div>
				          </div>
				          <hr class="my-4">
					      <div class="row gy-3">
					       		<div class="col-12-mb-4">
					       		<label for="thumb" class="form-label">대표 이미지 설정</label>
					       	</div>
					       	<div class="col-12-mb-4">
					       		<input name="thumbnail_file" type="file" id="thumbnail-file" accept="image/*" multiple="multiple">
					       	</div>
					      </div>
				          <hr class="my-4">
				          <div class="row gy-3">
				          	<div class="col-12-mb-4">
				              <label for="datail" class="form-label">상세 내용</label>
				              <textarea name="funding_detail" class="form-control" id="funding-detail" placeholder="상세내용을 입력해주세요" rows="7"></textarea>
				              <div class="invalid-feedback">
				               	 상세내용을 입력하지 않았습니다. 상세내용을 입력해주세요.
				              </div>
				              <hr class="my-4">
				          <div class="row gy-3">
				          	<div class="col-12-mb-4">
				          	<label for="detail_image" class="form-label">이미지</label>
				          	<div class="select_img"><img src=""/></div>
				          	</div>
				          	<div class="col-12-mb-4">
				          	<input name="funding_images_link" type="file" id="funding-images-link" accept="image/*" multiple="multiple">
				          	</div>
				          </div>
				            </div>
				          </div>  
				          <hr class="my-4">
				          <div class="d-grid gap-2 col-4 mx-auto">
				          <button class="w-100 btn btn-outline-primary btn-lg" type="button" onclick="formSubmit()">작성 완료</button>
				          </div>
				        </form>
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