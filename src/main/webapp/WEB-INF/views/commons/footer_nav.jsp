<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

@import url('https://fonts.googleapis.com/css2?family=Righteous&display=swap');

.Rt { 
	font-family: 'Righteous', cursive;
	}
</style>
<div class="row mt-4" style="border-top: 0.1px solid #DCDCDC; margin:0px;"></div>

<footer class="site-footer">
	<div class="container mt-3" style="">
		<div class="row">
			<div class="col-2 mt-0" >
				<!-- <img width="150" height="150" class="img-fluid" src="${pageContext.request.contextPath}/resources/image/bbq_logo.png"> -->
				<span class="Rt" style="font-size: 50px; color: black;">BBQ</span>
			</div>
			<div class="col">
				<p class="text-justify" style="word-break:keep-all">
					BBQ(Be Beyond Question)은 영화를 사랑하는 회원님들을 위한 사이트입니다.<br>
					상업영화에 비해 많은 주목을 받지 못하는 독립영화를 위한 펀딩을 직접 설계하고 참여하실 수 있습니다.<br>
					구매하셨던 영화 관련 제품들을 판매와 구매, 경매를 하실 수 있습니다.<br>
					가입된 회원분들과 친구를 맺고 쪽지를 주고 받을 수 있습니다.<br>	
				</p>
			</div>
			<div class="col-3">
				<h4><b>SITEMAP</b></h4>
					<div>
					<img width="20" height="20" class="img-fluid" src="${pageContext.request.contextPath}/resources/image/dot.svg"> <a style="text-decoration:none;color:#000000" href="${pageContext.request.contextPath }/funding/funding_main_page.do">펀딩 /</a>
  					<a style="text-decoration:none;color:#000000" href="${pageContext.request.contextPath }/auction/auction_main.do">경매 /</a>
					<a style="text-decoration:none;color:#000000" href="${pageContext.request.contextPath }/trade/trade_page.do">중고</a></li>
					</div>
					<div>
					<img width="20" height="20" class="img-fluid" src="${pageContext.request.contextPath}/resources/image/dot.svg"> <a style="text-decoration:none;color:#000000" href="${pageContext.request.contextPath }/review/movie_review.do">리뷰 /</a></li>
					<a style="text-decoration:none;color:#000000" href="${pageContext.request.contextPath }/freeboard/freeboard_page.do">자유 /</a></li>
					<a style="text-decoration:none;color:#000000" href="${pageContext.request.contextPath }/content/qna_page.do">질문</a></li>
					</div>
			</div>
			<div class="col-1">
				
				<div class="text-center position-sticky d-flex justify-content-end">
				   <div class="row">
				      <div class="round hollow text-center">
				      
						<a href="#" class="link-secondary"><img width="80" height="80" class="img-fluid" src="${pageContext.request.contextPath}/resources/image/arrow-up-circle.svg"></a>
				      </div>
				   </div>
				</div>
			</div>
			
		</div>
		<hr>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-6 col-xs-12">
				<p class="copyright-text">
					Copyright &copy; 2021 BBQ Project <br>Explorer
				</p>
			</div>
		</div>
	</div>
</footer>