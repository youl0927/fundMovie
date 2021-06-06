<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>게시글 수정</h1>
	<form action="${pageContext.request.contextPath}/admin/update_movie_process.do" method="post">
		작성자 : ${result.memberVo.user_nick }<br>
		제목 : <input type="text" name="movie_title" value="${result.contentVo.movie_title }"><br>
		내용 : <br>
		<textarea name="movie_synopsis" rows="10" cols="60">${result.contentVo.movie_synopsis }</textarea>
		<input type="hidden" name="movie_no" value="${result.contentVo.movie_no }">
		<br>
		<input type="submit" value="수정">
	</form>
</body>
</html>