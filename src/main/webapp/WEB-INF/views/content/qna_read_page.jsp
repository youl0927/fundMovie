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
<body>
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />

<div class="album py-5 bg-light">
<div class="container mt-3">
	<div class="row">
		<div class="col-1"></div>
		<div class="col">
			<div class="row">
				<div class="col-6"></div>
				<div class="col-6">
				</div>
			</div>
			<div class="row">
				<div class="col">
					<p style="font-size:30px">${qnaResult.qnaVo.qna_title }</p>
				</div>
			</div>
			<div class="row">
				<div class="col-10" style="color:gray; font-size:20px">${qnaResult.memberVo.user_nick } | <fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qnaResult.qnaVo.qna_writedate }"/></div>
				<div class="col-2"  style="color:gray; font-size:20px">조회수 : ${qnaResult.qnaVo.qna_readcount} </div>
			</div>
			<div class="row">
				<div class="col"><hr></div>
			</div>

			<div class="row">
				<div class="col">
					${qnaResult.qnaVo.qna_content }
					<br>
					<br>
					<br>
					
				</div>
			</div>

			<div class="row mt-5">
				<div class="col text-center">				
					<form action="${pageContext.request.contextPath}/content/qna_like_process.do?qna_no=${qnaResult.qnaVo.qna_no }">
						<div class="row">
						<div class="col">
							<c:choose>
								<c:when test="${likeCount == 0 }">
									<a href="${pageContext.request.contextPath}/content/qna_like_process.do?qna_no=${qnaResult.qnaVo.qna_no }" ><img width="60" height="60" class="img-fluid" src="${pageContext.request.contextPath }/resources/image/empty_heart.png" ></a>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/content/qna_like_process.do?qna_no=${qnaResult.qnaVo.qna_no }" ><img width="60" height="60" class="img-fluid" src="${pageContext.request.contextPath }/resources/image/red_heart.png" ></a>
								</c:otherwise>
							</c:choose>
							&nbsp;${likePageCount }
						</div>
						</div>
					</form>
				</div>
	
			</div>

			<div class="row mt-2">
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<!-- 글쓴이 만 수정가능 -->
					<c:if test="${!empty sessionUser && sessionUser.user_no == qnaResult.qnaVo.user_no }">
						<a class="btn btn-secondary" href="${pageContext.request.contextPath}/content/qna_update_page.do?qna_no=${qnaResult.qnaVo.qna_no}">수정</a>
						<a class="btn btn-danger" href="${pageContext.request.contextPath}/content/qna_delete_process.do?qna_no=${qnaResultList.qnaVo.qna_no}">삭제</a>
					</c:if>
				</div>
			</div>
			<hr>
		
		
			<c:if test="${!empty qnaResult.qnaVo.qna_reply }">
			<div class="row mt-5">
				
				<div class="col text-center">
						<table class="table text-center">
								<thead>
									<tr>
										<td><span class="badge bg-dark">관리자</span></td>
										<td>작성일 </td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${qnaResult.qnaVo.qna_reply }</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qnaResult.qnaVo.qna_writedate }"/></td>
									</tr>
								</tbody>
						</table>
					</div>
					
				</div>
			</c:if>
		

			</div>
	
		<div class="col-1"></div>
	</div>
</div>
</div>
<footer class="text-muted py-5">
 	<jsp:include page="/WEB-INF/views/commons/footer_nav.jsp" />
</footer>

<%--
<div class="container mt-5">
	<div class="row mt-3">
		<div class="col-2"></div>
		<div class="col">
			<div class="row mt-5">
				<div class="col-2"></div>
				<div class="col text-center"><h1>QnA</h1></div>
				<div class="col-2"></div>
			</div>
			
			<div class="row mt-3">
				<div class="col border border border-secondary">
					<div class="row">
						<div class="py-3 col-2 bg-secondary bg-gradient text-light">제목</div>
						<div class="col py-3 bg-gradient bg-light">${qnaResult.qnaVo.qna_title }</div>
					</div>
					<div class="row">
						<div class="py-3 col-2 bg-secondary bg-gradient text-light">글쓴이</div>
						<div class="col py-3">${qnaResult.memberVo.user_nick }</div>
					</div>
					<div class="row">
						<div class="py-2 col-2 bg-secondary bg-gradient text-light">문의일</div>
						<div class="col py-2"><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qnaResult.qnaVo.qna_writedate }"/></div>
					</div>
					<div class="row">
						<div class="py-4 col-2 bg-secondary bg-gradient text-light">내용</div>
						<div class="col py-4">${qnaResult.qnaVo.qna_content }</div>
					</div>
					
					
					<form action="${pageContext.request.contextPath}/content/qna_like_process.do?qna_no=${qnaResult.qnaVo.qna_no }">
						<div class="row">
						<div class="py-4 col-2 bg-secondary bg-gradient text-light">추천</div>
						<div class="col py-4">
							<c:choose>
								<c:when test="${likeCount == 0 }">
									<a href="${pageContext.request.contextPath}/content/qna_like_process.do?qna_no=${qnaResult.qnaVo.qna_no }" ><img width="30" height="30" class="img-fluid" src="${pageContext.request.contextPath }/resources/image/empty.png" ></a>
								</c:when>
								<c:otherwise>
									<a href="${pageContext.request.contextPath}/content/qna_like_process.do?qna_no=${qnaResult.qnaVo.qna_no }" ><img width="30" height="30" class="img-fluid" src="${pageContext.request.contextPath }/resources/image/full.png" ></a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="col py-4">${likePageCount }</div>
						</div>
					</form>
				</div>
				</div>
			</div>
			<div class="row mt-2">
				<div class="d-grid gap-2 d-md-flex justify-content-md-end">
					<!-- 글쓴이 만 수정가능 -->
					<c:if test="${!empty sessionUser && sessionUser.user_no == qnaResult.qnaVo.user_no }">
						<a class="btn btn-secondary" href="${pageContext.request.contextPath}/content/qna_update_page.do?qna_no=${qnaResult.qnaVo.qna_no}">수정</a>
						<a class="btn btn-danger" href="${pageContext.request.contextPath}/content/qna_delete_process.do?qna_no=${qnaResult.qnaeVo.qna_no}">삭제</a>
					</c:if>
				</div>
			</div>
			<c:if test="${!empty qnaResult.qnaVo.qna_reply }">
			<div class="row mt-5">
				<div class="col-2"></div>
				<div class="col-10"></div>
						<table class="table text-center" border="1">
								<thead>
									<tr>
										<td><span class="badge bg-dark">관리자</span></td>
										<td>작성일 </td>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${qnaResult.qnaVo.qna_reply }</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm" value="${qnaResult.qnaVo.qna_writedate }"/></td>
									</tr>
								</tbody>
						</table>
					<div class="col-2"></div>
				</div>
			</c:if>
		</div>
		<div class="col-2"></div>
	</div>
</div>
 --%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>