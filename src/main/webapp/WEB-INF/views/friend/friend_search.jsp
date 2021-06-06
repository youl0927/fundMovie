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

<script>
	function addFriend1(no){
		alert("!!!!" + no);
	}
	
	function addFriend(friend_user_no){
		
		//var friendUserNo = document.getElementById(friend_user_no);
		//console.log("here friendUserNo: "+ friendUserNo);
		
		
		//var userNo = document.getElementById(user_no);
		//var activeUserId = document.getElementById(active_user_id);
		//var passiveUserId = document.getElementById(passive_user_id);
		
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				loadFriend();

				}
		};
		
		
		xmlhttp.open("post","${pageContext.request.contextPath }/friend/addFriendProcess.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("friend_user_no="+friend_user_no);
		
			
		
	}
	
	
	function loadFriend(){
		
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
			
				var loadFriendBox = document.getElementById("load_friend_box");
				
				var childCount = loadFriendBox.childNodes.length;
				for(var i = 0 ; i < childCount ; i++){
					loadFriendBox.childNodes[0].remove();
				}
				
				for(searchList of obj){
					
					var friend_user_no = searchList.memberVo1.user_no;
					friend_user_no.id= "friend_user_no";
					var user_no = ${sessionUser.user_no };
					user_no.id= "user_no";
					var active_user_id = ${sessionUser.user_id };
					active_user_id.id= "active_user_id";
					var passive_user_id = searchList.memberVo1.user_id;
					passive_user_id.id= "passive_user_id";
					
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class","row"); 
					
					var colBox1 = document.createElement("div");
					colBox1.setAttribute("class","col-1 ");
					
					var nickBox = document.createElement("div");
					nickBox.setAttribute("class","col-1 ");
					nickBox.innerText = searchList.memberVo1.user_nick;
					
					var levelBox = document.createElement("div");
					levelBox.setAttribute("class","col-1 ");
					levelBox.innerText = searchList.memberVo1.user_level;
					
					var idBox = document.createElement("div");
					idBox.setAttribute("class","col-1 ");
					idBox.innerText = searchList.memberVo1.user_id;
					
					var emailBox = document.createElement("div");
					emailBox.setAttribute("class","col-3 ");
					emailBox.innerText = searchList.memberVo1.user_email;
					
					var colBox2 = document.createElement("div");
					colBox2.setAttribute("class","col-1 ");
					var colBox2Text = document.createTextNode( 'hahaha' );
					colBox2.appendChild( colBox2Text );
					document.body.appendChild( colBox2 );
					
					var colBox3 = document.createElement("div");
					colBox3.setAttribute("class","col-1 ");
					var addFriend = document.createElement("img");
					addFriend.setAttribute("src","../resources/image/emoji-laughing.svg");
					addFriend.setAttribute('width', 20);
					addFriend.setAttribute('height', 20);
					
					console.log("friend_user_no1: "+friend_user_no);
					console.log("active_user_id1: "+active_user_id);
					console.log("passive_user_id1: "+passive_user_id);
					console.log("user_no1: "+user_no);
					console.log("friend_user_no.id: "+friend_user_no.id);

					
					
					addFriend.setAttribute('onclick', "addFriend("+friend_user_no+")");
					
					
					colBox3.appendChild( addFriend );
					document.body.appendChild( colBox3 );
					
					var colBox4 = document.createElement("div");
					colBox4.setAttribute("class","col-1 ");
					var cancel = document.createElement("img");
					cancel.setAttribute("src","../resources/image/emoji-dizzy.svg");
					cancel.setAttribute('width', 20);
					cancel.setAttribute('height', 20);
					cancel.setAttribute('onclick', "location.href='${pageContext.request.contextPath}/friend/delete_friend_process.do?friend_user_no="+friend_user_no+"&user_no=${sessionUser.user_no }'")
					colBox4.innerText = friend_user_no;

					colBox4.appendChild( cancel );
					document.body.appendChild( colBox4 );

					
					
					rowBox.append(colBox1);
					rowBox.append(nickBox);
					rowBox.append(levelBox);
					rowBox.append(idBox);
					rowBox.append(emailBox);
					rowBox.append(colBox2);
					rowBox.append(colBox3);
					rowBox.append(colBox4);
					
					loadFriendBox.append(rowBox);
		
				}
			}
		}
		
		xmlhttp.open("post","${pageContext.request.contextPath}/friend/friend_search1.do");
		xmlhttp.send();
		
		
	}
	
	
	
	
</script>

</head>
<body onload="loadFriend()">
	<jsp:include page="/WEB-INF/views/commons/mypage_nav.jsp" />

	<div class="container-fluid">
		<div class="row mt-5">
			<jsp:include page="/WEB-INF/views/commons/mypage_sidebar.jsp" />
			<div class="col-1"></div>
			<div class="col-8 bg-light">
				<div class="row mt-5">
					<div class="h3 text-center">
						<b>
						<img width="45" height="45" src="${pageContext.request.contextPath}/resources/image/friends_2.png">
						친구 등록
						</b>
					</div>
				</div>
			<form action="${pageContext.request.contextPath }/friend/friend_search.do" method="get">
				<div class="row mt-4"><!-- 검색... -->
					<div class="col-2">
						<select name="search_type" class="form-select">
							<option value="user_nick">닉네임</option>
							<option value="user_id">ID</option>
							<option value="user_email">E-mail</option>
						</select>
					</div>
					<div class="col-8">
						<input name="search_word" type="text" class="form-control">
					</div>
					<div class="col-2 d-grid gap-2">
						<input type="submit" value="검색" class="btn btn-dark">
					</div>
					
				</div>
				</form>
			<div class="row mt-4">
			<div class="col">
						<table class="table table-hover">
							<thead>
								<tr>
									<th class="text-center" width="150">닉네임</th>
									<th class="text-center" width="150">Lv.</th>
									<th class="text-center" width="200">ID.</th>
									<th class="text-center" width="200">E-mail.</th>
									<th class="text-center" width="50">추가</th>
									<th class="text-center" width="50">삭제</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${searchList }" var="data">
									<tr>
										<td class="text-center">${data.memberVo.user_nick }</td>
										<td class="text-center">${data.memberVo.user_level }</td>
										<td class="text-center">${data.memberVo.user_id }</td>
										<td class="text-center">${data.memberVo.user_email }</td>
										<td class="text-center">
											<form action="${pageContext.request.contextPath }/friend/addFriendProcess.do" method="post">
												<input type="hidden" name="user_no" value="${sessionUser.user_no }">
												<input type="hidden" name="friend_user_no" value="${data.memberVo.user_no }">
												<input type="hidden" name="active_user_id" value="${sessionUser.user_id }">
												<input type="hidden" name="passive_user_id" value="${data.memberVo.user_id }"> 
												
												
												<input type="image" src="${pageContext.request.contextPath }/resources/image/emoji-laughing.svg" alt="Submit" width="20" height="20">
												
												
												 <%--<img onclick="addFriend(${data.memberVo.user_no })" src="${pageContext.request.contextPath }/resources/image/emoji-laughing.svg" width="20" height="20">
												  --%>
											</form>
										</td>
										<td class="text-center"><a href="${pageContext.request.contextPath}/friend/delete_friend_process.do?friend_user_no=${data.memberVo.user_no }&user_no=${sessionUser.user_no }"><img src="${pageContext.request.contextPath }/resources/image/emoji-dizzy.svg" width="20" height="20" class="d-block w-100" alt="..."></a></td>										
																				
									</tr>
								</c:forEach>
							</tbody>
	
							
						</table>
						
					</div>
			</div>
				
				
				
				
							<div class="container" id="load_friend_box">
				
			</div>
			</div>
			
			<div class="col-1"></div>
		</div>	
		<div class="row mt-3">
		
		</div>
			
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
</body>
</html>