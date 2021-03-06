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
				      <p class="lead fw-bolder text-secondary">????????? ?????? ?????? ????????? ???????????? ???????????????.</p>
				      <p class="lead fw-bolder text-secondary">????????? ????????? ???????????? ????????? ???????????? ????????? ??????????????????.</p>
				    </div>
				
				    <div class="row g-3">
				      <div class="col-md-5 col-lg-4 order-md-last">
				        <h4 class="d-flex justify-content-between align-items-center mb-3">
				          <span class="text-muted">${sessionUser.user_nick }?????? ?????? ????????????</span>
				        </h4>
				        <ul class="list-group mb-3">
				          <li class="list-group-item d-flex justify-content-between lh-sm">
				            <div>
				              <h6 class="my-0">???????????????. ${sessionUser.user_nick }???</h6>
				              <div class="mt-3"></div>
				              <small class="text-muted">???????????? ?????? ??????????????? ??????????????????.</small>
				            </div>
				            <span class="text-muted"></span>
				          </li>
				        </ul>
				      </div>
				      <div class="col-md-7 col-lg-8">
				        <h4 class="mb-3">?????? ????????????</h4>
				        <hr class="my-4">
				        <form id="frm1" class="needs-validation" action="${pageContext.request.contextPath}/funding/update_funding_process.do" method="post" enctype="multipart/form-data">
				          <div class="row g-3">
				            <div class="col-md-5">
				              <label for="title" class="form-label">??????</label>
				              <input name="funding_title" type="text" class="form-control" id="title" placeholder="${result.fundingVo.funding_title }">
				              <div class="invalid-feedback">
				               	 ????????? ???????????? ???????????????. ????????? ??????????????????.
				              </div>
				            </div>
				            <div class="col-md"></div>
				            <div class="col-md-4">
				              <label for="rating" class="form-label">??????</label>
				              <select name="funding_rating" class="form-select" id="rating">
				              	<option value="" selected="selected" disabled>${result.fundingVo.funding_rating }</option>
				                <option value="??????">??????</option>
				                <option value="12???">12???</option>
				                <option value="15???">15???</option>
				                <option value="19???">19???</option>
				              </select>
				              <div class="invalid-feedback">
				                	????????? ??????????????????.
				              </div>
				            </div>
				            <div class="col-12">
				              <label for="genre" class="form-label">??????</label>
				            </div>
				            <hr class="my-0">
					          <div class="btn-group" role="group" aria-label="Basic checkbox toggle button group">
					            <input name="genre_no" type="checkbox" value="1" class="btn-check"  id="action" autocomplete="off">
					            <label class="btn btn-outline-secondary" for="action">??????</label>  
					            <input name="genre_no" type="checkbox" value="2" class="btn-check" id="war" autocomplete="off">
					            <label class="btn btn-outline-secondary" for="war">??????</label>
					          	<input name="genre_no" type="checkbox" value="3" class="btn-check" id="romance" autocomplete="off">
					            <label class="btn btn-outline-secondary" for="romance">?????????</label>
					            <input name="genre_no" type="checkbox" value="4" class="btn-check" id="drama" autocomplete="off">
					            <label class="btn btn-outline-secondary" for="drama">?????????</label>
					            <input name="genre_no" type="checkbox" value="5" class="btn-check" id="SF" autocomplete="off">
					            <label class="btn btn-outline-secondary" for="SF">SF</label>
					          </div>
					        <hr class="mt-3">
				            <div class="col-md-5">
				              <label for="funding-start-date" class="form-label">?????? ????????????</label>
				              <span class="input-group-text"><span class="far fa-calendar-alt"></span></span>
				              <input type="date" class="form-control" id="funding-start-date" placeholder="${result.fundingVo.funding_start }">
				              <div class="invalid-feedback">
				               	 ????????? ???????????? ???????????????. ????????? ??????????????????.
				              </div>
				            </div>
				            <div class="col"></div>
				            <div class="col-md-5">
				              <label for="funding-end-date" class="form-label">?????? ????????????</label>
				              <span class="input-group-text"><span class="far fa-calendar-alt"></span></span>
				              <input type="date" class="form-control" id="funding-end-date" placeholder="${result.fundingVo.funding_end }">
				              <div class="invalid-feedback">
				               	 ????????? ???????????? ???????????????. ????????? ??????????????????.
				              </div>
				            </div>
				          </div>
				          <hr class="my-4">
				          <div class="row gy-3">
				            <div class="col-md-5">
				              <label for="cc-name" class="form-label">?????? ??????</label>
				              <input name="funding_target_point" type="number" class="form-control" id="cc-name" placeholder="${result.fundingVo.funding_target_point }">
				              <div class="invalid-feedback">
				               	 ??????????????? ???????????? ???????????????. ????????? ??????????????????.
				              </div>
				            </div>
				            <div class="col-md-2"></div>
				            <div class="col-md-5">
				              <label for="cc-number" class="form-label">?????? ?????? ??????</label>
				              <input name="funding_min_point" type="number" class="form-control" id="cc-number" placeholder="${result.fundingVo.funding_min_point }">
				              <small class="text-muted">?????? ????????? ??????????????? ?????? ?????? ????????? ???????????? ????????????.</small>
				              <div class="invalid-feedback">
				                	??????????????? ???????????? ???????????????. ????????? ??????????????????.
				              </div>
				            </div>
				            <div class="col-md-5">
				              <label for="release-date" class="form-label">?????? ?????? ??????</label>
				              <span class="input-group-text"><span class="far fa-calendar-alt"></span></span>
				              <input type="date" class="form-control" id="release-date" placeholder="${result.fundingVo.release_date }">
				              <div class="invalid-feedback">
				               	???????????? ????????? ???????????? ???????????????. ????????? ??????????????????.
				              </div>
				            </div>
				            <div class="col"></div>
				            <div class="col-md-5">
				              <label for="cc-number" class="form-label">?????? ?????? ?????? ??????</label>
				              <input name="release_price" type="number" class="form-control" id="cc-number" placeholder="${result.fundingVo.release_price }">
				              <div class="invalid-feedback">
				                	??????????????? ???????????? ???????????????. ????????? ??????????????????.
				              </div>
				            </div>
				          </div>
				          <hr class="my-4">
					      <div class="row gy-3">
					       		<div class="col-12-mb-4">
					       		<div class="funding-thumb mt-3"><p><img class="funding-thumb" width="450" src="${result.fundingVo.funding_thumb }"></p></div>
					       		<div class="mt-3"><label for="thumb" class="form-label">?????? ????????? ??????</label></div>
					       	</div>
					       	<div class="col-12-mb-4">
					       		<input name="thumbnail_file" type="file" id="thumb" accept="image/*" multiple="multiple">
					       	</div>
					      </div>
				          <hr class="my-4">
				          <div class="row gy-3">
				          	<div class="col-12-mb-4">
				              <label for="datail" class="form-label">?????? ??????</label>
				              <textarea name="funding_detail" class="form-control" id="datail" placeholder="${result.fundingVo.funding_detail }" rows="7"></textarea>
				              <div class="invalid-feedback">
				               		??????????????? ???????????? ???????????????. ??????????????? ??????????????????.
				              </div>
				              <hr class="my-4">
				          <div class="row gy-3">
				          	<div class="col-12-mb-4">
				          	<label for="detail_image" class="form-label">?????????</label>
				          		<div class="funding-image"><p>
						      		<c:forEach items="${result.fundingImageVoList }" var="imageVo">
										<div class="mt-3">
										<img width="480" src="${imageVo.funding_image_link }">
										</div>
									</c:forEach>
						      	</p></div>
				          	</div>
				          	<div class="col-12-mb-4">
				          	<input name="funding_images_link" type="file" id="detail_image" accept="image/*" multiple="multiple">
				          	</div>
				          </div>
				            </div>
				          </div>  
				          <hr class="my-4">
				          <div class="d-grid gap-2 col-4 mx-auto">
				          <input type="hidden" name="funding_open_no" value="${result.fundingVo.funding_open_no }">
				          <button class="w-100 btn btn-outline-primary btn-lg" type="button" onclick="formSubmit()">?????? ??????</button>
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
    <p class="mb-1">?? BBQ</p>
  	</footer>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>	
</body>
</html>