<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&display=swap" rel="stylesheet">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	
<script type="text/javascript">
	
   		function likeUpdate() {
   			var contentNo = ${result.freeboardVo.freeboard_no};
   						
   			var xmlhttp= new XMLHttpRequest();
   			xmlhttp.onreadystatechange = function(){
	   			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
	   				refresh();			
	   			}			
	   		};

   			xmlhttp.open("post","${pageContext.request.contextPath}/freeboard/freeboard_like_process.do");
   			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
   			xmlhttp.send("freeboard_no=" + contentNo);
    	}

    	function UnlikeUpdate() {
    		//alert('싫어요 들어옴');
   			var contentNo = ${result.freeboardVo.freeboard_no};
   			
   			
   			var xmlhttp= new XMLHttpRequest();
   			xmlhttp.onreadystatechange = function(){
	   			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
	   				refresh();			
	   			}			
	   		};
   			xmlhttp.open("post","${pageContext.request.contextPath}/freeboard/freeboard_like_update.do");
   			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
   			xmlhttp.send("freeboard_no=" + contentNo );
    	}
    	
	
	
	function refreshLike(){
		var contentNo = ${result.freeboardVo.freeboard_no};
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				var obj = JSON.parse(xmlhttp.responseText);
				var likeTotalBox =document.getElementById("like_total_box");
				likeTotalBox.innerText = obj.total;
				
				
				var likeBtn = document.getElementById("likeBtn");
				if(obj.myCount == 0){
					//likeBtn.value = "좋아요";
					likeBtn.src="${pageContext.request.contextPath}/resources/image/btn_icon_heart_blank.png";
					likeBtn.setAttribute("onclick" , "likeUpdate()");
					likeBtn.setAttribute("width", 30);
					likeBtn.setAttribute("height", 30);
					
				}else{
					//likeBtn.value = "싫어요";
					likeBtn.src="${pageContext.request.contextPath}/resources/image/btn_icon_heart_filled.png";
					likeBtn.setAttribute("onclick" , "UnlikeUpdate()");
				}
				
				
				
			}
		}
		xmlhttp.open("get","${pageContext.request.contextPath}/freeboard/freeboard_total_like.do?freeboard_no=" + contentNo);
		xmlhttp.send();
	}
	
	function writeReple(){
		
		var repleContent = document.getElementById("reple_freeboard").value;
		
		var contentNo = ${result.freeboardVo.freeboard_no};
	
		var xmlhttp = new XMLHttpRequest();
	
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//...
				refresh();
			}			
		};
		xmlhttp.open("post","${pageContext.request.contextPath}/freeboard/write_reple_freeboard_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("freeboard_no=" + contentNo + "&reple_freeboard=" + repleContent);
	
		document.getElementById("reple_freeboard").value = "";
	}
	

	
	function refreshReple(){
		var contentNo = ${result.freeboardVo.freeboard_no};
		
		var xmlhttp = new XMLHttpRequest();
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			
				var obj = JSON.parse(xmlhttp.responseText);
				
				var repleListBox = document.getElementById("reple_list_box");
				
				var childCount = repleListBox.childNodes.length;
				
				
				repleListBox.innerHTML = "";
				
				/*
				for(var i = 0 ; i < childCount ; i++){
					repleListBox.childNodes[0].remove();
				}
				*/
				
				
				
				for(repleData of obj){
					
					var rowBox1 = document.createElement("div");
					rowBox1.setAttribute("class", "row");
					
					var nickBox = document.createElement("div");
					nickBox.setAttribute("class","col");
					nickBox.innerText = repleData.memberVo.user_nick;
					
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class","row");
						
					var contentBox = document.createElement("div");
					contentBox.setAttribute("class","col-9");
					contentBox.innerText = repleData.freeboardRepleVo.reple_freeboard;
										
					var dateBox = document.createElement("div");
					dateBox.setAttribute("class","col-2");
					
					var d = new Date(repleData.freeboardRepleVo.freeboard_reple_writedate);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate(); 
					
					dateBox.innerText = strDate;
					
					
					var deleteBox = document.createElement("div");
					deleteBox.setAttribute("class","col-1");
					//deleteBox.innerText = "삭제";
			
					//alert(${sessionUser.user_no});
					
					if(${sessionUser.user_no} == repleData.freeboardRepleVo.user_no){
						deleteBox.setAttribute("class","col-1");
						//deleteBox.setAttribute("onclick","alert("+repleData.freeboardRepleVo.freeboard_reple_no +")");
						var reple_no = repleData.freeboardRepleVo.freeboard_reple_no;
						deleteBox.setAttribute("onclick", "deleteReple("+ contentNo +","+reple_no+")");
						
						var imageTest = document.createElement("img");
						imageTest.setAttribute("src","${pageContext.request.contextPath}/resources/image/delete.png");
						imageTest.setAttribute("width",15);
						imageTest.setAttribute("height",15);
						
						deleteBox.append(imageTest);
						//deleteBox.innerText = "삭제";
						
					}
					
					var rowBox2 = document.createElement("div");
					rowBox1.setAttribute("class", "row");
					
					var colBox = document.createElement("hr");
					
					
					rowBox1.append(nickBox);
					rowBox.append(contentBox);					
					rowBox.append(dateBox);
					rowBox.append(deleteBox);
					rowBox2.append(colBox);
					
					repleListBox.append(rowBox1);
					repleListBox.append(rowBox);
					repleListBox.append(rowBox2);
					
				}
				
			}	
			
	
		};
		
		xmlhttp.open("get","${pageContext.request.contextPath}/freeboard/get_freeboard_reple_list.do?freeboard_no=" + contentNo);
		xmlhttp.send();
		
	}		
		
	
	function deleteReple(contentNo,reple_no){
		//alert('댓글 삭제 들어옴');
		var xmlhttp = new XMLHttpRequest();
	
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				//...
				refresh();
			}			
		};
	
		xmlhttp.open("post","${pageContext.request.contextPath}/freeboard/delete_reple_freeobard_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("freeboard_no=" + contentNo + "&freeboard_reple_no=" + reple_no);
	
	}
	
	
	function refresh(){
		refreshReple();
		refreshLike();
	}
	
	setInterval(refresh,6000);
	
</script>
<style>

p{
	font-family: 'Black Han Sans', sans-serif;
}

.my-box { 
	border:1px solid; 
	width:100px;
	height:45px;
	padding:10px; 
	}
</style>

</head>
<body onload="refresh()">
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />

<img class="img-fluid" src="${pageContext.request.contextPath }/resources/image/freeboardMain.png" style="display: block; margin: 0 auto; height:300px; width:1950px; overflow:hidden;">
<div class="container mt-1">
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8">
			<div class="row">
				<div class="col-6"></div>
				<div class="col-6">
					<nav aria-label="breadcrumb">
						<ol class="breadcrumb" style="float:right;">
							<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/content/main_page.do">Home</a></li>
							<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/freeboard/freeboard_page.do">Freeboard</a></li>
							<li class="breadcrumb-item active" aria-current="page">Freeboard read</li>
						</ol>
					</nav>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<p style="font-size:30px">${result.freeboardVo.freeboard_title}</p>
				</div>
			</div>
			<div class="row">
				<div class="col-10" style="color:gray; font-size:14px">${result.memberVo.user_nick } | <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${result.freeboardVo.freeboard_writedate }"/></div>
				<div class="col-2"  style="color:gray; font-size:14px">조회수 :${result.freeboardVo.freeboard_readcount} </div>
			</div>
			<div class="row">
				<div class="col"><hr></div>
			</div>
			<div class="row">				
				<c:forEach items="${result.imageVoList }" var="imageVo">
					<div class="col mt-2">
						<img src="${imageVo.image_link }" style="height:300px; width:500px; overflow:hidden; float:center;"><br>
					</div>
				</c:forEach>				
			</div>
			<div class="row">
				<div class="col">
					${result.freeboardVo.freeboard_content }
					<br>
					<br>
					<br>
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col">
					<br>
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col-6">				
					<c:if test="${!empty sessionUser }">	
						<c:choose>
							<c:when test="${countMyLike  ==0}">
								<!-- <form action="${pageContext.request.contextPath }/freeboard/freeboard_like_process.do" method="post">					
								<input type="hidden" name= "freeboard_no" value="${result.freeboardVo.freeboard_no }">
								<input type="submit" value="좋아요" style="float:left;">												
								</form> -->	
								<!-- <input id="likeBtn" type="button" value="좋아요" onclick="likeUpdate()" style="float:left;">  -->
					   			<input id="likeBtn" type="image" onclick="likeUpdate()" style = "float:right; width:30px; height:30px;" src="${pageContext.request.contextPath}/resources/image/btn_icon_heart_blank.png">	
							</c:when>
							<c:otherwise>												
						 		<!-- <form action="${pageContext.request.contextPath }/freeboard/freeboard_like_update.do" method="post">
								<input type="hidden" name= "freeboard_no" value="${result.freeboardVo.freeboard_no }">
								<input type="hidden" name= "user_no" value="${sessionUser.user_no }">			
								<input type="submit" value="좋지 않아요" style="float:left;">	
								</form> -->
								<!--<input id="likeBtn" type="button" value="싫어요" onclick="UnlikeUpdate()" style="float:left;">  -->
						  		<input id="likeBtn" type="image" onclick="UnlikeUpdate()" style="float:right; width:30px; height:30px;" src="${pageContext.request.contextPath}/resources/image/btn_icon_heart_filled.png">
							</c:otherwise>
						</c:choose>
					</c:if>
				</div>
				<div class="col-1" id="like_total_box"> 
					<!-- : ${countLikeTotal } -->
				</div>	
			</div>
			<div class="row">
				<div class="col">
					<br>
					<br>
					<hr>
				</div>
			</div>
			<div class="row">
				<div class="col" id="reple_list_box"></div>
			</div>
			<div class="row">
				<c:if test="${!empty sessionUser }">
					<div class="col"> 			
						댓글 쓰기 : <br> 
						<textarea id="reple_freeboard" rows="3" cols="118"></textarea>
						<br>
						<input onclick="writeReple()" type="button" value="댓글 작성">	
					</div>
				</c:if>
			</div>
	
			<div class="row">
				<div class="col-8"></div>							
				<c:if test="${!empty sessionUser && sessionUser.user_no == result.freeboardVo.user_no }">
					<div class="col-1"><a href = "${pageContext.request.contextPath}/freeboard/delete_freeboard_process.do?freeboard_no=${result.freeboardVo.freeboard_no }" style="float:center;"> 삭제</a></div>
					<div class="col-1"><a href = "${pageContext.request.contextPath}/freeboard/update_freeboard_page.do?freeboard_no=${result.freeboardVo.freeboard_no }" style="float:left;">수정</a></div>
				</c:if>
				<div class="col-2"><a href="${pageContext.request.contextPath}/freeboard/freeboard_page.do" style="float:left;">목록으로</a></div>
			</div>

			</div>
	
		<div class="col-2"></div>
	</div>
</div>
<br>
<br>


<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
		crossorigin="anonymous"></script>
</body>
</html>