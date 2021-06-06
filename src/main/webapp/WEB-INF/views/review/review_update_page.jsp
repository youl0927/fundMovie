<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
</head>

<style>
table.table2 {
	border-collapse: separate;
	border-spacing: 1px;
	text-align: left;
	line-height: 1.5;
	border-top: 1px solid #ccc;
	margin: 20px 10px;
}

table.table2 tr {
	width: 50px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}

table.table2 td {
	width: 100px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>

<body>
	<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />
<img class="img-fluid" src="${pageContext.request.contextPath }/resources/image/review_main.jpg" style="height:300px; width:1950px; overflow:hidden;">
	
<form action="${pageContext.request.contextPath }/review/update_review_process.do" method="post">
		<table style="padding-top: 50px" align=center width=700 border=0
			cellpadding=2>
			<br>
			<tr>
				<td height=20 align=center bgcolor=#ccc><font color=white>리뷰 수정</font></td>
			</tr>
			<tr>
				<td bgcolor=white>
					<table class="table2">
						<tr>
							<td>이름</td>
							<td>${reviewMap.memberVo.user_nick }</td>
						</tr>
						<tr>
							<td>영화</td>
							<td><select name="movie_no">
									<c:forEach items="${reviewMovieList }" var="data">
										<option value="${data.contentVo.movie_no}" selected>${data.contentVo.movie_title }</option>
									</c:forEach>
								 </select>
							</td>
						</tr>
						<tr>
							<td>평점</td>
							<td>
								<select name="movie_review_rating">
									<option value="1">1 점</option>
									<option value="2">2 점</option>
									<option value="3">3 점</option>
									<option value="4">4 점</option>
									<option value="5">5 점</option>
								</select>
							</td>
						</tr>

						<tr>
							<td>제목</td>
							<td><input type="text" name="movie_review_title" value="${reviewMap.reviewVo.movie_review_title}"  size=60></td>
						</tr>

						<tr>
							<td>내용</td>
							<td><textarea name="movie_review_content" cols=85 rows=15>${reviewMap.reviewVo.movie_review_content }</textarea>
								<input type="hidden" name= "movie_review_no" value="${reviewMap.reviewVo.movie_review_no }"></td>
						</tr>

					</table>

					<center>
						<input type="submit" value="작성">
					</center>
				</td>
			</tr>
		</table>
	</form>
</body>



	
	
	
	
	
	
	
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
</body>
</html>