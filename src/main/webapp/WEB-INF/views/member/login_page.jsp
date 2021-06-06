<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1">
<title>무비펀드</title>

<script>

	function formSubmit(){
		//정규표현식 아이디-이메일
		var inputId = document.getElementById("input_id");
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if(!regExp.text(inputId.value)){
			alert("id는 email형식으로 입력해주세요.");
			inputId.value = "";
			inputId.focus();
			return;
		}
		//정규표현식 비번
		var inputPw = document.getElementById("input_pw");
		var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/;	// 8 ~ 10자 영문, 숫자 조합
	
		if(!regExp.test(inputId.value)){
			alert("pw는 8~10자 대소문자의 영문과 숫자의 조합으로 입력해주세요.");
			inputPw.value = "";
			inputPw.focus();
			return;
		}
		
		//form 객체 리턴
		var frmLoginMember = document.getElementById("frm_login_member");
		frmLoginMember.submit();
	}
</script>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
<main>
		<div class="container mt-5">
			<div class="row mt-5">
				<div class="col"></div>
				<div class="col-4">
					<div class="row mt-5"></div>
					<div class="row mt-5">
						<div class="text-center"><a href="${pageContext.request.contextPath }/content/main_page.do"><img class="img-fluid" width="200" height="200" src="${pageContext.request.contextPath }/resources/image/bbq_logo.png"></a></div>
					</div>
				<form id="frm_login_member" action="${pageContext.request.contextPath}/member/login_process.do" method="post">
					<div class="row">
						<div class="col">
							<div class="row mt-2"><div class="col"><input type="text" class="form-control" id="input_id" name="user_id" placeholder="ID"></div></div>
							<div class="row"><div class="col"><input type="password" class="form-control" id="input_pw" name="user_pw" placeholder="PW"></div></div>
							<div class="row mt-2">
								<div class="col d-grid gap-2">
									
									<button type="submit" class="btn btn-primary btn-lg">로그인</button>
									
								</div>
							</div>
							<div class="row mt-2"><div class="col d-grid gap-2"><a class="btn btn-outline-primary btn-lg" href="${pageContext.request.contextPath}/member/join_member_page.do">회원가입</a></div></div>
						</div>
					</div>
				</form>
				</div>
			<div class="col"></div>	
		</div>
	</div>

</main>
<%--<input onclick="formSubmit()" type="button" value="로그인" class="btn btn-primary btn-lg"> 
	<input type="hidden" name="redirect_url" value="${referer }">
--%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>