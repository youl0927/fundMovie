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
<script type="text/javascript">
	function formSubmit(){
		
		var frm1 = document.getElementById("frm1");
		
		var movie_date = document.getElementById("movie-date");
		var movie_start = document.getElementById("movie-start");
		var deadLine_date = document.getElementById("deadLine-date");
		var deadLine_time = document.getElementById("deadLine-time");
		
		var value_mdate = movie_date.value.replaceAll("-","/");
		var value_mstart = movie_start.value;
		var value_ddate = deadLine_date.value.replaceAll("-","/");
		var value_dtime = deadLine_time.value;
		
		value_mdate += " " + value_mstart;
		value_ddate += " " + value_dtime;
		
		
		var input_mdate = document.createElement("input");
		input_mdate.setAttribute("type","hidden");
		input_mdate.setAttribute("name","movie_start_date");
		input_mdate.setAttribute("value",value_mdate);
		frm1.appendChild(input_mdate);
		
		var input_ddate = document.createElement("input");
		input_ddate.setAttribute("type","hidden");
		input_ddate.setAttribute("name","deadLine_date");
		input_ddate.setAttribute("value",value_ddate);
		frm1.appendChild(input_ddate);
		
		frm1.submit();
	}


</script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />

<div class="container mt-5">
	<div class="row">
	<div class="col">
	</div>
	
	
	<div class="col-8">
		<div class="row" >
			<div class="col-2"></div>
			<div class="col">
				<form id="frm1" class="needs-validation"  action="${pageContext.request.contextPath}/hangout/hangOut_open_process.do" method="post">
				?????????: ${sessionUser.user_nick} <br>
				<div class="container" style="padding-left: 0px;">????????????: 
							<label class="radio-inline col-sm-2">
							  <input type="radio" name="movie_genre" id="inlineRadio1" value="??????"> ??????
							</label>
							<label class="radio-inline col-sm-2 ">
							  <input type="radio" name="movie_genre" id="inlineRadio2" value="SF">  SF
							</label>
							<label class="radio-inline col-sm-2 ">
							  <input type="radio" name="movie_genre" id="inlineRadio3" value="??????"> ??????
							</label>
							<label class="radio-inline col-sm-2 ">
							  <input type="radio" name="movie_genre" id="inlineRadio4" value="??????"> ??????
							</label>
							<label class="radio-inline col-sm-2 ">
							  <input type="radio" name="movie_genre" id="inlineRadio5" value="??????"> ??????
							</label>
							
						</div>
				????????????: <input type="text" size="60" name="movie_title"  placeholder="?????? ????????? ????????????"><br>
				?????????: <input type="date" size="60"  id="movie-date" placeholder="??????????????? ????????????"><br>
				????????????: <input type="time" size="60" id="movie-start" placeholder="?????? ??????????????? ????????????"><br>
				?????????: <input type="text" size="60" name="member_count"  placeholder="?????? ??? ???????????? ????????????"><br>
				?????????: <input type="text" size="60" name="hangout_price" placeholder="?????? ????????? ????????????"><br>
				????????????: <input type="date" size="60"  id="deadLine-date" placeholder="?????? ??????????????? ????????????">
				        <input type="time" size="60"  id="deadLine-time" placeholder="?????? ??????????????? ????????????">
						<br><br>
						<div class="col d-grid gap-2 d-md-block" align="center">
						<input type="button" class="btn btn-dark" onclick="formSubmit()" value="????????????!">
						</div>
						</form>
			</div>	
		</div>
	</div>
	<div class="col">
	</div>
	</div>	
</div>	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>