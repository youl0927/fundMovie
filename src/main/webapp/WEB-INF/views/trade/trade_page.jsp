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
	
	
	<!--중앙 안내 문구..-->
<main>

  <section class="py-3 text-center container">
    <div class="row py-lg-5">
      <div class="col-lg-6 col-md-8 mx-auto">
      	
        <h1 class="fw-light">중고거래를 해보세요</h1>
        <p class="lead text-muted">영화를 사랑하시는 회원님들이 소장하고 계신 포스터,굿즈 등의 제품들을 자유롭게 판매해보세요.</p>
        <p>
       <c:choose>
			<c:when test="${!empty sessionUser }">
				<a href="${pageContext.request.contextPath}/trade/trade_write_page.do" class="btn btn-secondary my-2">판매하러 가기</a>
			</c:when>
			<c:otherwise>
				<a href="${pageContext.request.contextPath}/member/login_page.do" class="btn btn-secondary my-2">로그인하러 가기</a>
			</c:otherwise>					
		</c:choose>
        </p>
      </div>
    </div>
  </section>
  
  
  
   <div class="album  bg-light">
    <div class="container">
	      <form action="${pageContext.request.contextPath }/trade/trade_page.do" method="get">
				<div class="row mb-3">
					<div class="col">
						<select name="search_type" class="form-select">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>	
						</select>
					</div>
					<div class="col-8">
						<input type="text" name="search_word" class="form-control">
					</div>
					<div class="col-2 d-grid gap-2">
						<input type="submit" value="검색" class="btn btn-secondary"> 
					</div>
				</div>
			</form>
      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">	
      <c:forEach items="${tradeResultList }" var="data">
        <div class="col-3 mt-3">
          <div class="card shadow-sm">
        	<c:choose>
				<c:when test="${empty data.tradeImageVoList }">
					<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="${pageContext.request.contextPath }/resources/image/no_image.png" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#55595c"/>
				</c:when>
				<c:otherwise>
					<img class="bd-placeholder-img card-img-top" width="100%" height="225" src="${data.tradeImageVoList[0].trade_image_link }" role="img" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#55595c"/>
				</c:otherwise>					
			</c:choose>
            <div class="card-body" style="text-align:center">
            <h5 class="card-title"><b>${data.tradeVo.trade_title }</b></h5>
              		<p class="text-muted">${data.memberVo.user_nick }&nbsp;회원님</p>
					<p class="card-text"><b>${data.tradeVo.trade_money }&nbsp;원</b></p>              
              <div class="d-flex justify-content-between align-items-center">
                <div class="btn-group">
               		<c:choose>
						<c:when test="${data.tradeVo.trade_complete == 'Y' }">
							<a href="${pageContext.request.contextPath }/trade/trade_read_page.do?trade_no=${data.tradeVo.trade_no}" class="btn btn-outline-secondary">판매완료</a>
						</c:when>
						<c:otherwise>
							<a href="${pageContext.request.contextPath }/trade/trade_read_page.do?trade_no=${data.tradeVo.trade_no}" class="btn btn-secondary">구경하기</a>
						</c:otherwise>
					</c:choose>
                </div>
                <small class="text-muted"><fmt:formatDate pattern="yyyy-MM-dd" value="${data.tradeVo.trade_writedate }"/></small>
              </div>
            </div>
          </div>
        </div>
         </c:forEach>
        </div>  
    </div>
  </div>
</main>


<jsp:include page="/WEB-INF/views/commons/footer_nav.jsp" />
	
	
		
<%--
	<div class="container mt-3">
		<div class="row">
			<div class="text-center"><img class="img-fluid" width="300" height="300" src="${pageContext.request.contextPath }/resources/image/trade1.png"></div>
		</div>
		<div id="card_body" class="row">
			<c:forEach items="${tradeResultList }" var="data">
				<div class="col-3 mt-3">
					<div class="card" >
					<c:choose>
						<c:when test="${empty data.tradeImageVoList }">
							<img style="height : 150px" src="${pageContext.request.contextPath }/resources/image/no_image.png"  class="card-img-top img-thumbnail">
						</c:when>
						<c:otherwise>
							<img style="height : 150px" src="${data.tradeImageVoList[0].trade_image_link }"  class="card-img-top img-thumbnail">
						</c:otherwise>					
					</c:choose>
				  	
				  	<div class="card-body" style="text-align:center">
				  		<h5 class="card-title"><b>${data.tradeVo.trade_title }</b></h5>
				  		<p class="card-text">${data.memberVo.user_nick }&nbsp;회원님</p>
					    <p class="card-text">${data.tradeVo.trade_money }&nbsp;원</p>
					    <c:choose>
							<c:when test="${data.tradeVo.trade_complete == 'Y' }">
								<a href="${pageContext.request.contextPath }/trade/trade_read_page.do?trade_no=${data.tradeVo.trade_no}" class="btn btn-light">구매완료</a>
							</c:when>
							<c:otherwise>
								<a href="${pageContext.request.contextPath }/trade/trade_read_page.do?trade_no=${data.tradeVo.trade_no}" class="btn btn-primary">구매가능</a>
							</c:otherwise>
						</c:choose>
					 </div>
					</div>
				</div>
			</c:forEach>

		</div>
		<hr>		
 				<div class="row mt-2">
					<div class="col d-grid">
						<c:if test="${!empty sessionUser }">
							<a class="btn btn-light" href="${pageContext.request.contextPath}/trade/trade_write_page.do">Write</a>
						</c:if>					
					</div>
				</div>

		
					
				    <div class="row mt-3"><!-- 페이징/글쓰기 버튼 -->
						<div class="col">
							<nav aria-label="Page navigation example">
								<ul class="pagination mb-0 pagination justify-content-center">
									<li class="page-item<c:if test="${currentPage == 1}"> disabled</c:if>"><a href="${pageContext.request.contextPath }/trade/trade_page.do?page_num=1" class="page-link">&lt;&lt;</a></li>
									<li class="page-item<c:if test="${beginPage <= 1}"> disabled</c:if>"><a href="${pageContext.request.contextPath }/trade/trade_page.do?page_num=${beginPage-1 }" class="page-link">&lt;</a></li>
									<c:forEach begin="${beginPage }" end="${endPage }" var="i">
										<li class="page-item<c:if test="${i == currentPage }"> active</c:if>"><a href="${pageContext.request.contextPath }/trade/trade_page.do?page_num=${i }" class="page-link">${i }</a></li>
									</c:forEach>
									<li class="page-item<c:if test="${endPage >= pageCount }"> disabled</c:if>"><a href="${pageContext.request.contextPath }/trade/trade_page.do?page_num=${endPage+1 }" class="page-link">&gt;</a></li>
									<li class="page-item<c:if test="${currentPage == pageCount}"> disabled</c:if>"><a href="${pageContext.request.contextPath }/trade/trade_page.do?page_num=${pageCount }" class="page-link">&gt;&gt;</a></li>
									
								</ul>
							</nav>						 
						</div>
					</div>
				<hr>
					<div class="container">
					  	<footer class="my-3 pt-2 text-muted text-center text-small">
					    	<p class="fs-6">Copyright &copy; 2020 All Rights Reserved<br>Explorer</p>
					  	</footer>
					</div>
				</div>				 
				 
--%>				 

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</body>
</html>