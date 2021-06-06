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
	
	var sessionNo = null;
	<c:if test="${!empty sessionUser}">
	sessionNo = ${sessionUser.user_no};
	</c:if>
	
	
	//댓글 삭제...
	function deleteComment(tradeCommentNo){
		
		var tradeNo = ${tradeResult.tradeVo.trade_no};
		var xmlhttp = new XMLHttpRequest();
		
		//여기가 비동기식 
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				refresh(); //얘를 비동기식 밖에다 빼면..?! = 동작의 순서가 확실하지 않음..
						   //여기에다 넣는 이유 .. 진행은 동기식으로(코드진행순서) 반응은 비동기식
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/trade/delete_comment_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("trade_no=" + tradeNo + "&trade_comment_no=" + tradeCommentNo);
	}
	
	//댓쓰기
	function tradeCommentWrite(){
	
		if(sessionNo == null){
			alert("로그인이 필요합니다.");
			location.href="${pageContext.request.contextPath }/member/login_page.do";
			return ;
		}
		
		
		var tradeComment = document.getElementById("trade_comment").value;
		//document.getElementById()<-(여기 안에 문자열 => 유일해야함.. 밑에 jsp에서 id로 해당 값 사용할 것)
		var tradeNo = ${tradeResult.tradeVo.trade_no};
		//얘는 새로 받아오는게 아니라 원래 있던 글번호를 받아 와야 하므로.. id따로 지정해주지 않는다.
		
		//ajax 호출함수
		var xmlhttp = new XMLHttpRequest();
		//xmlHttpRequest : 전체 페이지의 새로고침없이도 URL로부터 데이터를 받아올 수 있음
		//onreadystatechange내부의 if문이 바로 실행되는 것이 아니라 해당 function의 내용이 다 수행된 다음에
		//마지막으로 실행된다.
		xmlhttp.onreadystatechange = function(){
			//onreadystatechange : readyState 어트리뷰트가 변경될때마다 호출되는 EventHandler
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//readyState(xmlhttp의 상태를 유지)의 4번 : 요청완료 및 응답완료 
				//xmlhttp.status가 200번 : 응답상태 OK
				refresh();
			}
		};
		xmlhttp.open("post","${pageContext.request.contextPath }/trade/write_comment_process.do");
		//요청을 초기화..
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		//HTTP 요청 헤더의 값을 설정함 
		xmlhttp.send("trade_no=" + tradeNo + "&trade_comment=" + tradeComment);
		//요청을 보냄. 요청이 비동기(기본값)인 경우, 이 메소드는 요청이 보내진 즉시 반환됨.
		document.getElementById("trade_comment").value = "";
	}
	
	//댓 보여주기
	function refreshComment(){
		
		//var tradeNo = ${tradeResult.tradeNo.trade_no};
		
		var tradeNo = ${tradeResult.tradeVo.trade_no };
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){

				var obj = JSON.parse(xmlhttp.responseText);
				//JSON(JavaScriptObjectNotation):데이터를 저장하고 교환하는 구문
				//JSON은 자바스크립트 객체 표기법으로 작성된 텍스트.
				//responseText : response data를 string으로 반환
				/*
				var commentListBox = document.getElementById("comment_list_box");
				
				var childCount = commentListBox.childNodes.length;
				//☆★☆★☆잘 모르겠음 자식 노드에 접근
				for(var i = 0; i < childCount; i++){
					commentListBox.childNodes[0].remove();
				}
				
				commentListBox.innerHTML = "";
				*/
				
				//1.새로 만들 html태그
				var comment_table_body = document.getElementById("comment_table_body");
				comment_table_body.innerHTML = "";
				
				//제이쿼리 : $("#comment_table_body").HTML(""); -> 1.새로 만들 html태그랑 똑같음..
				
				
					for(commentData of obj){
						
						var trBox = document.createElement("tr");
						//var ttt = $("<tr></tr>");
						
						
						var nickTdBox = document.createElement("td");
						nickTdBox.innerText = commentData.memberVo.user_nick;
						//2.글을 넣겠다
						var commentTdBox = document.createElement("td");
						commentTdBox.innerText = commentData.tradeCommentVo.trade_comment;
						
						var dateTdBox = document.createElement("td");
							
						var d = new Date(commentData.tradeCommentVo.trade_comment_writedate);
						var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
						
						dateTdBox.innerText = strDate;
			
						var deleteBox = document.createElement("td");
						
						if(commentData.memberVo.user_no == sessionNo){
							var imgBox = document.createElement("img");
							
							imgBox.setAttribute("src","${pageContext.request.contextPath }/resources/image/delete.png");
							imgBox.setAttribute("width","20");
							imgBox.setAttribute("onclick","deleteComment("+commentData.tradeCommentVo.trade_comment_no+")");
							deleteBox.append(imgBox);
						}
						
						trBox.append(nickTdBox);
						trBox.append(commentTdBox);
						trBox.append(dateTdBox);
						trBox.append(deleteBox);
						
						
						comment_table_body.append(trBox);
					}	
			}
		};
		xmlhttp.open("get","${pageContext.request.contextPath }/trade/get_comment_list.do?trade_no=" + tradeNo);
		xmlhttp.send();
	}

	
	/* 좋아요 버튼 눌렀을떄 */
	 function tradeLike(){ 
		 
		if(sessionNo == null){
			alert("로그인이 필요합니다.");
			location.href="${pageContext.request.contextPath }/member/login_page.do";
			return ;
		}
		
		
		
		var tradeNo = ${tradeResult.tradeVo.trade_no};
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				refreshLike();
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/trade/like_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("trade_no=" + tradeNo);
			
	 }

	//좋아요 버튼 눌렀을 때 일어날 일(refresh)
	function refreshLike(){
		
		var tradeNo = ${tradeResult.tradeVo.trade_no};
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				//alert(xmlhttp.responseText);
				var obj = JSON.parse(xmlhttp.responseText);
				//hashmap 이나 arraylist를 json에 맞게 parse해준다.. (일반 에서 자바스크립트용 hashmap이나 arraylist로 바꿔준다는 뜻)
				
				//페이지 전체갯수 표시됨(누를 때마다  + 1씩 늘어남)
				var likePageCountBox = document.getElementById("likePageCount");
				likePageCountBox.innerText = obj.totalLikeCount;
				
				var trade_likeBox = document.getElementById("trade_like");
				
				if(obj.myLikeCount == 0){
					trade_likeBox.setAttribute("src" , "${pageContext.request.contextPath }/resources/image/empty_heart.png" );
				}else{
					trade_likeBox.setAttribute("src" , "${pageContext.request.contextPath }/resources/image/red_heart.png" );
				}
				
				
				
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath }/trade/getLikeState.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("trade_no=" + tradeNo);		
		
	}
	
	/////////////////////////
	function refresh(){
		refreshComment();
		
	}

	
</script>
</head>
<body onload="refresh()">
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />
<div class="album py-5 bg-light">
<div class="container mt-2">
	<div class="row">
		<div class="col-1"></div>
		<div class="col">
			<div class="row">
				<div class="col-6">
					<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
						 <div class="carousel-inner">
							<c:forEach items="${tradeResult.imageVoList }" var="imageVo" varStatus="status">
								<c:choose>
									<c:when test="${status.index == 0 }">
										<div class="carousel-item active">
										   <div class="col"><img width="300" height="300" class="d-block w-100" src="${imageVo.trade_image_link }"></div>
										</div>
									</c:when>
									<c:otherwise>
										<div class="carousel-item">
										  <div class="col"><img width="300" height="300" class="d-block w-100" src="${imageVo.trade_image_link }"></div>
										</div>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						 </div>
							<a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Previous</span>
							</a>
							<a class="carousel-control-next" href="#carouselExampleControls" role="button" data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden">Next</span>
							</a>
					</div>
				</div>
				<div class="col-6">
					<div class="row mt-1">
						<div class="col"><h4><b>${tradeResult.tradeVo.trade_title }</b></h4></div>
						
					</div>
					<div class="row mt-2">
						<div class="text-muted">[${tradeResult.tradeHeadlineVo.trade_headline }]</div>
					</div>
					<div class="row mt-2">
						<div class="col">
							<div class="h2"><b>${tradeResult.tradeVo.trade_money }&nbsp;원</b></div>
						</div>
					</div>
					<hr>
					<div class="row mt-2">
						<div class="col">
							<img width="20" height="20" class="img-fluid" src="${pageContext.request.contextPath }/resources/image/full-heart.png" style=" margin-right: 10px" ><span id="likePageCount" style=" margin-right: 12px" >${likePageCount }</span>|
							<img class="img-fluid" width="20" height="20" src="${pageContext.request.contextPath }/resources/image/eye.png"  style=" margin-left: 10px; margin-right: 10px" ><span style=" margin-right: 12px" >${tradeResult.tradeVo.trade_readcount }</span>|
							<img class="img-fluid" width="20" height="20" src="${pageContext.request.contextPath }/resources/image/clock.png" style="margin-left: 10px; margin-right: 10px"><fmt:formatDate pattern="yyyy-MM-dd" value="${tradeResult.tradeVo.trade_writedate }"/>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-6">
							<p class="text-muted">판매자&nbsp;:&nbsp;<span style="color:#000000"><b>${tradeResult.memberVo.user_nick }&nbsp;회원님</b></span></p>
							<p class="text-muted">교환여부&nbsp;:&nbsp;&nbsp;<span style="color:#0000FF">교환불가능</span></p>
							<p class="text-muted">배송비&nbsp;:&nbsp;&nbsp;<span style="color:#0000FF">배송비 별도</span></p>	
						</div>
						<div class="col-6">
						<!-- 찜하기 자리  -->
							<div class="row mt-2">
								<div class="col-7">				
									<c:choose>
										<c:when test="${likeCount == 0 }">
											<img onclick="tradeLike()" id="trade_like" width="80" height="80" class="img-fluid" src="${pageContext.request.contextPath }/resources/image/empty_heart.png" >
										</c:when>
										<c:otherwise>
											<img onclick="tradeLike()" id="trade_like" width="80" height="80" class="img-fluid" src="${pageContext.request.contextPath }/resources/image/red_heart.png" >
										</c:otherwise>
									</c:choose>
								</div>
								<div class="col-5">
									<c:if test="${!empty sessionUser && sessionUser.user_no == tradeResult.tradeVo.user_no }">
										<a href="${pageContext.request.contextPath}/trade/trade_complete_process.do?trade_no=${tradeResult.tradeVo.trade_no}">
											<img width="80" height="80" src="${pageContext.request.contextPath }/resources/image/complete.png">
										</a>
									</c:if>
								</div>
							</div>
								</div>
							</div>

				</div>
				<div class="row mt-3"></div>
				<div class="row mt-5">	
					<div class="col">
						<nav>
						  	<div class="nav nav-tabs" id="nav-tab" role="tablist">
							    <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">상품정보</button>
						  	</div>
						</nav>
						<div class="tab-content" id="nav-tabContent">
						  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab"><br>&nbsp;&nbsp;&nbsp;${tradeResult.tradeVo.trade_content }</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row mt-2">
			<!-- 글쓴이 만 수정가능 -->
				<c:if test="${!empty sessionUser && sessionUser.user_no == tradeResult.tradeVo.user_no }">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end">
						<a class="btn btn-light" href="${pageContext.request.contextPath}/trade/trade_update_page.do?trade_no=${tradeResult.tradeVo.trade_no}">수정</a>
						<a class="btn btn-danger" href="${pageContext.request.contextPath}/trade/trade_delete_process.do?trade_no=${tradeResult.tradeVo.trade_no}">삭제</a>
					</div>
				</c:if>
			</div>
		<%--
		<div class="row mt-2">
			<div class="d-grid gap-2 d-md-flex justify-content-md-end">
				<a class="btn btn-light" href="${pageContext.request.contextPath}/trade/trade_page.do">목록으로</a>
			</div>
		</div>
		 --%>
		 
		 <%--  댓글 달기&삭제 : ajax  --%>
		
			<div class="row mt-4">
				<div class="col">
					<textarea placeholder="댓글" class="form-control" id="trade_comment" rows="3" cols="60"></textarea>
				</div>
			</div>
			<div class="row mt-2">
				<div class="col d-grid gap-2 d-md-flex justify-content-md-end">
					<input onclick="tradeCommentWrite()" class="btn btn-light" type="button" value="댓글 작성">
				</div>
			</div>
			<div class="row mt-4">
				<div class="col">
					<table class="table table-hover">
						<tbody id="comment_table_body">
							<%--
							<c:forEach items="${tradeCommentResult}" var="comment">
								<tr>
									<td>${comment.memberVo.user_nick }</td>
									<td>${comment.tradeCommentVo.trade_comment }</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${comment.tradeCommentVo.trade_comment_writedate }"/></td>
									<td>
									<c:if test="${sessionUser.user_no == comment.tradeCommentVo.user_no }">
										<a href="${pageContext.request.contextPath }/trade/trade_comment_delete_process.do?trade_comment_no=${comment.tradeCommentVo.trade_comment_no }&trade_no=${comment.tradeCommentVo.trade_no }"><img width="30" height="30" class="img-fluid" src="${pageContext.request.contextPath }/resources/image/delete.png" ></a>
									</c:if>
											 
									</td>
								</tr>
							</c:forEach>
							<a href="${pageContext.request.contextPath }/trade/trade_comment_delete_process.do?trade_comment_no=${comment.tradeCommentVo.trade_comment_no }&trade_no=${comment.tradeCommentVo.trade_no }"><img width="30" height="30" class="img-fluid" src="${pageContext.request.contextPath }/resources/image/delete.png" ></a>
						  --%>
						</tbody>
					</table>
				</div>
			</div>
		
		<%--  댓글 달기&삭제 : ajax  --%>
		
	</div>	
	<div class="col-1"></div>
</div>
</div>			
</div>
<jsp:include page="/WEB-INF/views/commons/footer_nav.jsp" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>