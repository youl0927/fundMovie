<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

	function formSubmit(){
		//유효성 검사 
		//실질적으로 서버에서 INSERT... 이전에 데이터의 무결성을 확인...
		
		
		//console.log("안녕하세요");
		//alert("안녕하세요");
		/*
		var inputId = document.getElementById("input_id");
		
		//정규 표현식(이메일)
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if(!regExp.test(inputId.value)){
			alert("아이디는 이메일의 형식이여야 합니다.");
			inputId.focus(); //커서...
			return;
		}
		*/
		var inputPw = document.getElementById("input_pw");
		
		var regExp = /^(?=.*\d)(?=.*[a-zA-Z])[0-9a-zA-Z]{8,10}$/; //  8 ~ 10자 영문, 숫자 조합
		
		if(!regExp.test(inputPw.value)){
			alert("비밀번호는 8~10자여야되고,영문 대소문자 숫자로 이루어 져야 됩니다.");
			inputPw.value = "";
			inputPw.focus();
			return;
		}
		
		
		/*
		if(isConfirmId == false){
			alert("아이디 존재 여부를 확인해 주세요");
			return;
		}
		*/
		
		var inputNick = document.getElementById("input_nick");
		
		if(inputNick.value == ""){
			alert("닉네임을 입력해주세요.");
			inputNick.focus(); //커서...
			return;
		}
		
		
		var inputRrn = document.getElementById("input_rrn");
		
		var rrnLength = inputRrn.value.length;
			
		if(rrnLength != 7){
			alert("주민등록번호는 앞에서부터 7자리를 입력해주세요 . ex)861101-1******");
			inputRrn.value = "";
			inputRrn.focus();
			return;
		}
		
		
		var inputAddress = document.getElementById("input_address");
		
		if(inputAddress.value == ""){
			alert("주소를 입력해주세요.");
			inputAddress.focus(); //커서...
			return;
		}
		
		
		var inputEmail = document.getElementById("input_email");
		
		//정규 표현식(이메일)
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if(!regExp.test(inputEmail.value)){
			alert("이메일의 형식이 올바르지 않습니다.");
			inputEmail.focus(); //커서...
			return;
		}
		
		
		var inputZipcode = document.getElementById("input_zipcode");
		
		var zipLength = inputZipcode.value.length;
		
		if(zipLength != 5){
			alert("Zip code는 다섯자리 숫자입니다.");
			inputZipcode.focus();
			return;
		}
		
		if(isConfirmId == false){
			alert("아이디 존재 여부를 확인해 주세요");
			inputId.focus();
			return;
		}
		
		var frmJoinMember = document.getElementById("frm_join_member");
		frmJoinMember.submit();
	}
	
	
	
	var isConfirmId = false;
	
	function confirmId(){
		
		isConfirmId = false;
		
		//바닐라 JS ...
		
		var inputId = document.getElementById("input_id");
		var id = inputId.value;
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//.....응답 데이터 받은 후 할일...!!!!!
				//아래처럼 하면 안됨!! JSON(XML)...
				
				if(xmlhttp.responseText == 'true'){
					//불가능
					isConfirmId = false;
					//alert("사용 불가능한 아이디 입니다.");
					
					//javascript로 동적으로 태그를 생성하고.. 컨트롤...
					
					
					var alertBox = document.createElement("div");
					alertBox.innerText = "이미 사용중인 아이디 입니다.";
					alertBox.style.color = "red";
					
					var positionBox = document.getElementById("confirm_alert_box_id");
					positionBox.innerHTML = "";
					positionBox.appendChild(alertBox);
					
					
				}else{
					//가능
					isConfirmId = true;
					//alert("사용 가능한 아이디 입니다.");
					
					var alertBox = document.createElement("div");
					alertBox.innerText = "사용 가능한 아이디 입니다.";
					alertBox.style.color = "green";
					
					var positionBox = document.getElementById("confirm_alert_box_id");
					positionBox.innerHTML = "";
					positionBox.appendChild(alertBox);
					
					
				}
			}
		};
	
		/* 
		//get 방식...
		xmlhttp.open("get","${pageContext.request.contextPath}/member/exist_id.do?id=" + id);
		xmlhttp.send();
		*/
		
		//post 방식...
		xmlhttp.open("post","${pageContext.request.contextPath}/member/exist_id.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("id=" + id);
	}
	
	
var isConfirmNick = false;
	
	function confirmNick(){
		
		isConfirmNick = false;
		
		//바닐라 JS ...
		
		var inputNick = document.getElementById("input_nick");
		var nick = inputNick.value;
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//.....응답 데이터 받은 후 할일...!!!!!
				//아래처럼 하면 안됨!! JSON(XML)...
				
				if(xmlhttp.responseText == 'true'){
					//불가능
					isConfirmNick = false;
					//alert("사용 불가능한 아이디 입니다.");
					
					//javascript로 동적으로 태그를 생성하고.. 컨트롤...
					
					
					var alertBox = document.createElement("div");
					alertBox.innerText = "이미 사용중인 닉네임 입니다.";
					alertBox.style.color = "red";
					
					var positionBox = document.getElementById("confirm_alert_box_nick");
					positionBox.innerHTML = "";
					positionBox.appendChild(alertBox);
					
					
				}else{
					//가능
					isConfirmNick = true;
					
					var alertBox = document.createElement("div");
					alertBox.innerText = "사용 가능한 닉네임 입니다.";
					alertBox.style.color = "green";
					
					var positionBox = document.getElementById("confirm_alert_box_nick");
					positionBox.innerHTML = "";
					positionBox.appendChild(alertBox);
					
					
				}
			}
		};
	
		
		
		//post 방식...
		xmlhttp.open("post","${pageContext.request.contextPath}/member/exist_nick.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("nick=" + nick);
	}
	

</script>



<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
</head>
<body>
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />
<form id="frm_join_member" action="${pageContext.request.contextPath}/member/join_member_process.do" method="post">
	<div class="container mt-5">
		<div class="row mt-5 bg-light">
			<div class="col"></div>
			<div class="col-4 text-center ">
				<div class="row mt-5">
					
					<div class="col text-center"><h3><b>회원가입</b></h3></div>
					
				</div>
				<div class="row mt-4">
					<div class="col">
						 <input type="text" onblur="confirmId()" class="form-control" id="input_id" name="user_id" placeholder="ID를 입력해주세요">
						 <div id="confirm_alert_box_id"></div>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						<input type="password" class="form-control" id="input_pw" name="user_pw" placeholder="PW를 입력해주세요">
						<div id="confirm_alert_box_pw"></div>
					</div>
				</div>
				<!-- 
				<div class="row mt-2">
					<div class="col-10">
						<input type="hidden" class="form-control" name="user_pw_check" placeholder="PW CHECK">
					</div>
				</div>
				 -->
				<div class="row mt-2">
					<div class="col">
						 <input type="text" onblur="confirmNick()" class="form-control" id="input_nick" name="user_nick" placeholder="닉네임을 입력해주세요">
						 <div id="confirm_alert_box_nick"></div>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
					  	<input type="text" name="user_rrn" class="form-control" id="input_rrn" placeholder="주민번호 6자리를 입력해주세요">
						<div id="confirm_alert_box_rrn"></div>
					</div>
				</div>
				<div class="row mt-2">
					<div class=col>
						<input type="text" name="user_email" class="form-control" id="input_email" placeholder="이메일을 입력해주세요">
						<div id="confirm_alert_box_email"></div>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						<input type="text" class="form-control" id="input_address" name="user_address" placeholder="주소를 입력해주세요">
						<div id="confirm_alert_box_address"></div>
					</div>
				</div>
				<div class="row mt-2">
					<div class="col">
						<input type="text" class="form-control" id="input_zipcode" name="user_zipcode" placeholder="우편번호를 입력해주세요">
						<div id="confirm_alert_box_zipcode"></div>
					</div>
				</div>
				<div class="row mt-4">
					<div class="col d-grid">
						<input onclick="formSubmit()" class="btn btn-primary" type="button" value="회원가입">
					
					
					</div>
				</div>
			</div>
			<div class="col"></div>	
			<div class="row mt-4"></div>
		</div>
	</div>
</form>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>