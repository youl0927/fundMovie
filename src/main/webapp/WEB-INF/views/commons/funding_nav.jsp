<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
	.navbar-brand > .img-fluid{width:100pt;height:40pt;}
	.ulist{list-style:none;}
</style>

		<div class="container" style="background-color: rgb(216, 216, 216, 0.2); height: 40px; border-radius: 20px 20px;">
			<ul class="nav justify-content-center" style="align-content: center;">
				<li class="nav-item"><a style="color: #0b0ba9;" class="nav-link" href="${pageContext.request.contextPath }/funding/funding_main_page.do"><strong>현재 펀딩</strong></a></li>
				<li class="nav-item"><a style="color: #0b0ba9;" class="nav-link active" href="${pageContext.request.contextPath }/funding/tobeopen_funding_main_page.do"><strong>오픈 예정</strong></a></li>
				<li class="nav-item"><a style="color: #0b0ba9;" class="nav-link active" href="${pageContext.request.contextPath }/funding/upload_movie_view_page.do"><strong>펀딩 영화보기</strong></a></li>
				
				<c:choose>
					<c:when test="${sessionUser.user_author eq '펀드유저'}">
						<li class="nav-item"><a style="color: #0b0ba9;" class="nav-link active" href="${pageContext.request.contextPath }/funding/create_funding_page.do"><strong>펀딩 신청</strong></a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a style="color: #0b0ba9;" class="nav-link active" href="${pageContext.request.contextPath }/mypage/mypage_main.do"><strong>펀드 유저 신청</strong></a></li>
					</c:otherwise>
				</c:choose>
				
			</ul>
		</div>