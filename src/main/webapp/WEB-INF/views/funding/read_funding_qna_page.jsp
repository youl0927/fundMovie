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
	function writeComment(){
		
		var CommentContent = document.getElementById("funding_qna_comment").value;
		var fundingQnANo = ${result.fundingQnAVo.funding_qna_no};
		
		//바닐라 JS
		var xmlhttp = new XMLHttpRequest();
	
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				refresh();
			}
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/funding/write_funding_qna_comment_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("funding_qna_no=" + fundingQnANo + "&funding_qna_comment=" + CommentContent);
		
		//댓글창 초기화
		document.getElementById("funding_qna_comment").value="";
	}
	
	function refreshComment(){
		
		var xmlhttp = new XMLHttpRequest();
		
		var fundingQnANo = ${result.fundingQnAVo.funding_qna_no};
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				
				var commentListBox = document.getElementById("comment_list_box");
				
				var childCount = commentListBox.childNodes.length;
				
				for(var i = 0 ; i < childCount ; i++){
					commentListBox.childNodes[0].remove();
				}
				
				for(commentData of obj){
					
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class", "row");
					
					var nickBox = document.createElement("div");
					nickBox.setAttribute("class", "col-sm");
					nickBox.innerText = commentData.memberVo.user_nick;
					
					var contentBox = document.createElement("div");
					contentBox.setAttribute("class", "col-sm-8");
					contentBox.innerText = commentData.fundingCommentVo.funding_qna_comment;
					
					var dateBox = document.createElement("div");
					dateBox.setAttribute("class", "col-sm");
				
					var d = new Date(commentData.fundingCommentVo.funding_qna_comment_writedate);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
					
					dateBox.innerText = strDate;
					
					rowBox.append(contentBox);
					rowBox.append(nickBox);
					rowBox.append(dateBox);
				
					commentListBox.append(rowBox);
				}
				
				
			}
		
	};
	
		xmlhttp.open("get","${pageContext.request.contextPath}/funding/get_funding_qna_comment_list.do?funding_qna_no=" + fundingQnANo);
		xmlhttp.send();
	}
	
	function refresh(){
		refreshComment();
	}
	
</script>

</head>
<body  onload="refresh()">
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp"/>
<jsp:include page="/WEB-INF/views/commons/funding_nav.jsp"/>

<div class="container mt-5">
	<div class="row mt-3">
		<div class="col-2"></div>
		<div class="col">
			<div class="row mt-3">
				<div class="col border border border-secondary">
					<div class="row">
						<div class="py-3 col-2 bg-secondary bg-gradient text-light">펀딩명</div>
						<div class="col py-3">${result.fundingOpenVo.funding_title }</div>
					</div>
					<div class="row">
						<div class="py-3 col-2 bg-secondary bg-gradient text-light">문의 제목</div>
						<div class="col py-3 bg-gradient bg-light">${result.fundingQnAVo.funding_qna_title }</div>
					</div>
					<div class="row">
						<div class="py-3 col-2 bg-secondary bg-gradient text-light">글쓴이</div>
						<div class="col py-3">${result.memberVo.user_nick }</div>
					</div>
					<div class="row">
						<div class="py-2 col-2 bg-secondary bg-gradient text-light">문의일</div>
						<div class="col py-2"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${result.fundingQnAVo.funding_qna_writedate }"/></div>
					</div>
					<div class="row">
						<div class="py-4 col-2 bg-secondary bg-gradient text-light">문의 내용</div>
						<div class="col py-4">${result.fundingQnAVo.funding_qna_content }</div>
					</div>
				</div>
				</div>			
			<div class="row mt-2">
				<div class="col-9"></div>
				<div class="col d-grid p-0">
					<c:if test="${!empty sessionUser && sessionUser.user_no == result.fundingQnAVo.user_no }">
						<a class="btn btn-dark" href="${pageContext.request.contextPath}/funding/update_funding_qna_page.do?funding_qna_no=${result.fundingQnAVo.funding_qna_no}">수정하기</a>
						<a class="btn btn-dark" href="${pageContext.request.contextPath}/funding/delete_funding_qna_process.do?funding_qna_no=${result.fundingQnAVo.funding_qna_no}">삭제하기</a>
					</c:if>
				</div>
			</div>	
			<c:if test="${!empty sessionUser }">
			<div>
				<textarea id="funding_qna_comment" rows="3" cols="60"></textarea>
				<input onclick="writeComment()" type="button" value="댓글 작성">
			</div>
			</c:if>
			<div class="container" id="comment_list_box">
			
			</div>
			
		</div>	
		<div class="col-2"></div>
	</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>