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
</head>
<body class="text-center">
<jsp:include page="/WEB-INF/views/commons/admin_nav.jsp" />
	
<form action="${pageContext.request.contextPath }/admin/add_qna_reply_process.do" method="post">
<div class="album py-5 bg-light">
<div class="container mt-3">
	<div class="row">
		<div class="col-1"></div>
		<div class="col">
			<div class="row">
				<div class="col text-start">
					<p style="font-size:30px">${qnaAdminResult.qnaVo.qna_title }</p>
				</div>
			</div>
			<div class="row">
				<div class="col text-start" style="color:gray; font-size:15px">${qnaAdminResult.memberVo.user_nick }</div>
				<div class="col text-end"  style="color:gray; font-size:15px"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qnaAdminResult.qnaVo.qna_writedate }"/></div>
			</div>
			<div class="row">
				<div class="col"><hr></div>
			</div>

			<div class="row">
				<div class="col text-start" style="font-size:20px">
					${qnaAdminResult.qnaVo.qna_content }					
				</div>
			</div>
			
			

		
		
		
			<div class="row mt-4">
				<div class="col">
					<textarea name="qna_reply" rows="5" cols="1000" class="form-control" placeholder="답변을 달아주세요" required></textarea>
				</div>
			</div>
			<div class="row mt-2">
				<div class="col d-grid justify-content-md-end">									
					<button type="submit" class="btn btn-secondary">관리자전용댓글</button>
					<input type="hidden"  name="qna_no" value="${qnaAdminResult.qnaVo.qna_no }" >
				</div>
			</div>	
			
			<c:if test="${!empty qnaAdminResult.qnaVo.qna_reply }">					
			<div class="row mt-5">
				<div class="col-2"></div>
				<div class="col-10"></div>
						<table class="table text-center">
								<thead>
									<tr>
										<td><span class="badge bg-dark">관리자</span></td>
										<td>작성일 </td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${qnaAdminResult.qnaVo.qna_reply }</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qnaAdminResult.qnaVo.qna_writedate }"/></td>
									</tr>
								</tbody>
						</table>
					<div class="col-2"></div>
				</div>
			</c:if>

		</div>
		<div class="col-1"></div>
	</div>
</div>
</div>
</form>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>