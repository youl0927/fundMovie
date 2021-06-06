<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
 <style>
      .jb-xx-small { font-size: xx-small; }
      .jb-x-small { font-size: x-small; }
      .jb-small { font-size: small; }
      .jb-medium { font-size: medium; }
      .jb-large { font-size: large; }
      .jb-x-large { font-size: x-large; }
      .jb-xx-large { font-size: xx-large; }
    </style>

</head>
<body>
<!-- 
	<div class="container mt-3">
		<div class="row">
			<div class="col"></div>
			<div class="col">
				<div class="row mt-5">
					<div class="col">
						<h1>!JOIN COMPLETE!</h1>
					</div>
				</div>
					<div class="row mt-5">
					<div class="col">
						<a href="${pageContext.request.contextPath }/member/login_page.do"><button type="submit" class="btn btn-primary">Login</a>
					</div>
				</div>
			</div>
			<div class="col"></div>
		</div>
	</div>
 -->
 <div class="container">
 	<div class="row">
 		<div class="col"></div>
 		<div class="col">
 			<div class="row">
 				<div class="col"><br>
 				<br>
 				<br>
 				<br>
 				<br>
 				<br>
 				</div>
 			</div>
 			<div class="row">
 				<div class="col" style="text-align: center;"><a href="${pageContext.request.contextPath }/content/main_page.do"><img src="${pageContext.request.contextPath}/resources/image/bbq_logo.png" style="width:450px; height:200px;"/></a></div>
 			</div>
 				<div class="row"><div class="col"><br></div></div>
 			<div class="row">
 				<div class="col"></div>
 			</div>
 			<div class="row">
 				<div class="col" style="text-align:center"><p class="jb-xx-large"><b>환영합니다.</b></p></div>
 			</div>
 			<div class="row">
 				<div class="col" style="text-align:center"><p class="jb-x-large"><b>회원가입을 축하합니다.</b></p></div>
 			</div>
 
 			<div class="row">
 				<div class="col"  style="text-align:center"><b>BBQ의 새로운 아이디는 "${memberVo.user_id }" 입니다.</b></div>
 			</div>
 			<div class="row"><div class="col"><br></div></div>
 			<div class="row"><div class="col"  style="text-align:center">소중한 BBQ 아이디를 안전하게 지켜드립니다.</div></div>
 			
 			<div class="row"><div class="col"><br></div></div>
 			<div class="row">
 				<div class="col">
					<a href="${pageContext.request.contextPath }/member/login_page.do"><img src="/fundmovie/resources/image/start.png" style="width:500px; height:70px;"></a>
 				</div>
 			</div>
 		</div>
 		<div class="col"></div>
 	</div>
 </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>