<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>

<jsp:include page="/WEB-INF/views/commons/admin_nav.jsp" />

<form action="${pageContext.request.contextPath}/admin/add_movie_inform_process.do" method="post" enctype="multipart/form-data">
	<div class="container mt-3">
		<div class="row">
			<div class="col"></div>
			<div class="col-10">
				<div class="row mt-5"  >
					<div class="col" style="background-color: ;"></div>
					<div class="col-3" style="background-color: ; text-align:center;"><h2>영화등록</h2></div>
					<div class="col" style="background-color: ;"></div>
				</div>
				<div class="row mt-5">
					<div class="col">
						<h5>영화 종류를 선택하세요</h5>
						<div class="container">
							<label class="radio-inline col-sm-2">
							  <input type="radio" name="movie_from" id="inlineRadio1" value="한국"> 한국영화
							</label>
							<label class="radio-inline ">
							  <input type="radio" name="movie_from" id="inlineRadio2" value="해외"> 해외영화
							</label>
						</div>
						<br>
					
						<h5>영화 장르를 선택하세요.</h5>
					   <div class="container">
							<label class="checkbox-inline  col-sm-2">
							  <input type="checkbox" name="genre_no" value="1"> 액션영화
							</label>
							<label class="checkbox-inline col-sm-2">
							  <input type="checkbox" name="genre_no" value="2"> SF 판타지
							</label>
							<label class="checkbox-inline col-sm-2">
							  <input type="checkbox" name="genre_no" value="3"> 호러 공포
							</label>
							<label class="checkbox-inline col-sm-2">
							  <input type="checkbox" name="genre_no" value="4"> 어드벤쳐 모험
							</label>
							<label class="checkbox-inline  col-sm-2">
							  <input type="checkbox" name="genre_no" value="5"> 스릴러 미스테리
							</label>
							<label class="checkbox-inline col-sm-1 ">
							  <input type="checkbox" name="genre_no" value="6"> 전쟁영화
							</label>
							<label class="checkbox-inline col-sm-2">
							  <input type="checkbox" name="genre_no" value="7"> 코미디영화
							</label>
							<label class="checkbox-inline col-sm-2">
							  <input type="checkbox" name="genre_no" value="8"> 로맨스 멜로
							</label>
							<label class="checkbox-inline col-sm-2">
							  <input type="checkbox" name="genre_no" value="9"> 드라마 가족
							</label>
						</div>						 
					</div>
				</div>
				<br>
				<h5>영화 제목</h5>
				<div class="row mt-2">
					<div class="col">
						<input type="text" class="form-control" name="movie_title" placeholder="영화제목을 입력하세요">
					</div>
				</div>
				<br>
				<h5>영화 등급을 선택하세요</h5>
						<div class="container">
							<label class="radio-inline col-sm-2">
							  <input type="radio" name="movie_rating" id="movie_rating1" value="전체관람가"> 전체관람가
							</label>
							<label class="radio-inline col-sm-2 ">
							  <input type="radio" name="movie_rating" id="movie_rating2" value="12세이상관람가"> 12세이상관람가
							</label>
							<label class="radio-inline col-sm-2 ">
							  <input type="radio" name="movie_rating" id="movie_rating3" value="15세이상관람가"> 15세이상관람가
							</label>
							<label class="radio-inline  col-sm-2">
							  <input type="radio" name="movie_rating" id="movie_rating4" value="청소년관람불가"> 청소년관람불가
							</label>
						</div>
						<br>
				<h5>개봉일</h5>
				<div class="row mt-2">
					<div class="col">
						<input type="text" class="form-control" name="movie_release_date" placeholder="개봉일을 입력하세요. ex)20210114">
					</div>
				</div>
				<br>
				<h5>시놉시스</h5>
				<div class="row mt-2">
					<div class="col">
						<input type="text" class="form-control" name="movie_synopsis" placeholder="시놉시스를 입력하세요.">
					</div>
				</div>
				<br>
				<h5>상영시간</h5>
				<div class="row mt-2">
					<div class="col">
						<input type="text" class="form-control" name="movie_runtime" placeholder="분단위로 상영시간을 입력하세요. ex)180">
					</div>
				</div>
				<br>
				
				<h5>감독 / 배우 정보</h5>
				<div class="row mt-2">
					<div class="col">
						<input type="text" class="form-control" name="movie_director" placeholder="감독이름을 입력하세요">
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						<input type="text" class="form-control" name="movie_actor" placeholder="배우이름을 입력하세요. 여러명인 경우 쉼표로 구분해주세요">
					</div>
				</div>
				<br>
				<h5>포스터/이미지</h5>
				<div class="row mt-2">
					<a>포스터/이미지를 업로드하세요.</a>
				
					<div class="col">
						<input name="file" type="file" accept="image/*"  ><br>
					</div>
				</div>
				<br>
				<div class="row mt-2">
					<a>스틸컷을 업로드하세요.</a>
					<div class="col">
						<input name="steelcuts" type="file" accept="image/*"  multiple><br>
					</div>
				</div>
				<br>
				
				<div class="row mt-5">
					<div class="col d-grid">
						<button type="submit" class="btn btn-outline-primary">등록 !</button>
					</div>
				</div>
			</div>
			<div class="col"></div>		
		</div>
	</div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>