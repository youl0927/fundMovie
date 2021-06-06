<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-2.1.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <!-- Bootstrap core CSS -->
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/checkout/">
<link rel="apple-touch-icon" href="/docs/5.0/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="mask-icon" href="/docs/5.0/assets/img/favicons/safari-pinned-tab.svg" color="#7952b3">
<link rel="icon" href="/docs/5.0/assets/img/favicons/favicon.ico">
<meta name="theme-color" content="#7952b3">

<style type="text/css">

.funding-grid .funding-thumb p{display:block}
.funding-grid .funding-thumb img{width:100%;height:auto;}
.funding-grid .funding-image p{display:block}
.funding-grid .funding-image img{width:100%;height:auto;}

.bg{
position: relative;
 background: url('${result.fundingVo.funding_thumb }');
 background-size: cover;
}
.bg::before{
content: "";
opacity: 0.5;
position: absolute;
top: 0px;
left: 0px;
right: 0px;
bottom: 0px;
background-color: #000;
}
.bg h2{
color: #fff;
text-align: center;  
position: relative;}
</style>

<script type="text/javascript">
		
	function writeCommunity(){
			
		var communityContent = document.getElementById("funding_community_content").value;
		var fundingOpenNo = ${result.fundingVo.funding_open_no};
		var writeUserNo = ${sessionUser.user_no};
		
		var xmlhttp = new XMLHttpRequest();
			
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					
				refresh();
			}
			
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/funding/write_funding_community_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("funding_open_no=" + fundingOpenNo + "&funding_community_content=" + communityContent + "&funding_user_no=" + writeUserNo);

		document.getElementById("funding_community_content").value="";
	}	
	
	function refreshCommunity(){
		
		var xmlhttp = new XMLHttpRequest();
		
		var fundingOpenNo = ${result.fundingVo.funding_open_no};
		
		xmlhttp.onreadystatechange = function (){
			
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				var communityListBox = document.getElementById("community_list_box");
				
				var childCount = communityListBox.childNodes.length;
				
				for(var i = 0; i<childCount; i++){
					communityListBox.childNodes[0].remove();
				}
				
				for(commentData of obj){
					
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class", "row mt-4");
					
					var nickBox = document.createElement("div");
					nickBox.setAttribute("class", "col-sm-2");
					nickBox.setAttribute("style", "padding-right: 0px");
					
					var pBox = document.createElement("strong");
					pBox.setAttribute("style", "font-size: 20px; margin-bottom: 0px;");
										
					pBox.innerText = commentData.memberVo.user_nick;
					
					var dateBox = document.createElement("div");
					dateBox.setAttribute("class", "col-sm-3");
					dateBox.setAttribute("style", "padding-left: 0px");
					
					var pBox1 = document.createElement("p");
					pBox1.setAttribute("style", "font-size: 16px; margin-bottom: 0px; color:gray");
					
					
					var d = new Date(commentData.fundingCommunityVo.funding_community_writedate);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
					
					pBox1.innerText = strDate;
					
					var rowBox1 = document.createElement("div");
					rowBox1.setAttribute("class", "row");
					
					var contentBox = document.createElement("div");
					contentBox.setAttribute("class", "col");
					contentBox.setAttribute("style", "padding-left: 30px");
					
					var pBox2 = document.createElement("p");
					pBox2.setAttribute("style", "font-size: 20px");
					pBox2.innerText = commentData.fundingCommunityVo.funding_community_content;
					
				
					rowBox1.append(contentBox);
					rowBox.append(nickBox);
					rowBox.append(dateBox);
					
					contentBox.append(pBox2);
					dateBox.append(pBox1);
					nickBox.append(pBox);
					
					communityListBox.append(rowBox);
					communityListBox.append(rowBox1);
					
				}
				
				
			}
			
		};
		
		xmlhttp.open("get","${pageContext.request.contextPath}/funding/get_funding_community_list.do?funding_open_no=" + fundingOpenNo);
		xmlhttp.send();
		
	}
	
	function like() {
		   
		   var fundingNo = ${result.fundingVo.funding_open_no};
		   
		   var userNo = 0;
		   <c:if test="${!empty sessionUser}">
		      var userNo = ${result.memberVo.user_no};
		   </c:if>
		   
		   var xmlhttp = new XMLHttpRequest();
		   
		   xmlhttp.onreadystatechange = function() {
		      
		      if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
		    	  refreshLike();
		    	  refreshMyLike(); 
		      }
		   };
		   
		   xmlhttp.open("post","${pageContext.request.contextPath}/funding/funding_like_process.do");
		   xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		   xmlhttp.send("funding_open_no=" + fundingNo + "&user_no=" + userNo);
		   
		}zs2

		function refreshLikeimg(){
			
		var xmlhttp = new XMLHttpRequest();
			
			var fundingOpenNo = ${result.fundingVo.funding_open_no};
			
			xmlhttp.onreadystatechange = function (){
				
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					
					var obj = JSON.parse(xmlhttp.responseText);
					var likeImgBox = document.getElementById("like_img_box");
					
					var childCount = likeImgBox.childNodes.length;
					
					for(var i = 0; i<childCount; i++){
						likeImgBox.childNodes[0].remove();
					}
					
					for(likeData of obj){
						
						var likeInput = document.createElement("input");
						likeInput.setAttribute("onclick", "like()");
						likeInput.setAttribute("type", "image");
						likeInput.setAttribute("style", "width: 30px; height: 30px");
						likeInput.setAttribute("src", "${pageContext.request.contextPath }/resources/image/btn_icon_heart_blank.png");
						
						likeImgBox.append(likeInput);
						
					}
					
					
				}
				
			};
			
			xmlhttp.open("get","${pageContext.request.contextPath}/funding/funding_like_process.do");
			xmlhttp.send();
			
			
			
			
			
		}


		//좋아요 갯수
		function refreshLike() {
		   
		   var fundingNo = ${result.fundingVo.funding_open_no};
		   
		   var xmlhttp = new XMLHttpRequest();
		   
		   xmlhttp.onreadystatechange = function(){
		      
		      if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
		         
		         var count = JSON.parse(xmlhttp.responseText);
		         
		         var likeCountBox = document.getElementById("likeCountBox");
		         
		         //박스 안 초기화
		         var childCount = likeCountBox.childNodes.length;
		         for(var i = 0; i < childCount; i++) {
		            likeCountBox.childNodes[0].remove();
		         }
		         
		         likeCountBox.innerText = count.count;
		      }
		   };
		   
		   xmlhttp.open("get","${pageContext.request.contextPath}/funding/count_funding_like_process.do?funding_open_no=" + fundingNo);
		   xmlhttp.send();
		}

		//내가 쓴 좋아요 갯수
		function refreshMyLike() {
		   
		   var fundingNo = ${result.fundingVo.funding_open_no};
		   
		   var xmlhttp = new XMLHttpRequest();
		   
		   xmlhttp.onreadystatechange = function(){
		      
		      if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
		         
		         var obj = JSON.parse(xmlhttp.responseText);
		         
		         var likeImgBox = document.getElementById("like_img_box");
					
				 var childCount = likeImgBox.childNodes.length;
					
					for(var i = 0; i<childCount; i++){
						likeImgBox.childNodes[0].remove();
					}
					
					
					if(obj.myCount==1){
						var likeInput = document.createElement("input");
						likeInput.setAttribute("onclick", "like()");
						likeInput.setAttribute("type", "image");
						likeInput.setAttribute("style", "width: 30px; height: 30px");
						likeInput.setAttribute("src", "${pageContext.request.contextPath }/resources/image/btn_icon_heart_filled.png");
						
					}else{
						var likeInput = document.createElement("input");
						likeInput.setAttribute("onclick", "like()");
						likeInput.setAttribute("type", "image");
						likeInput.setAttribute("style", "width: 30px; height: 30px");
						likeInput.setAttribute("src", "${pageContext.request.contextPath }/resources/image/btn_icon_heart_blank.png");
						
						
						
					}
						
						likeImgBox.append(likeInput);
						
					}
		         

		         	         
		      
		   };
		   
		   xmlhttp.open("get","${pageContext.request.contextPath}/funding/like_check_count_process.do?funding_open_no=" + fundingNo);
		   xmlhttp.send();
		}




			//구매
			function purchaseFund(){
			
			var fundingNo = ${result.fundingVo.funding_open_no};
			var userPoint = ${result.memberVo.user_point};
			var purchasePoint = document.getElementById("purchase_point").value;
			var purchaseUserNo = ${result.memberVo.user_no};
			
			var userNo = 0;
			   <c:if test="${!empty sessionUser}">
			      var userNo = ${result.memberVo.user_no};
			   </c:if>
			
			var xmlhttp = new XMLHttpRequest();
			
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
						
					refresh();
				}
				
			};

			xmlhttp.open("post","${pageContext.request.contextPath}/funding/run_funding_process.do");
			xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
			xmlhttp.send("funding_open_no=" + fundingNo + "&purchase_point=" + purchasePoint + "&funding_user_no=" + purchaseUserNo + "&funding_user_point=" + purchasePoint);
		}

			function refreshPurchaseFund(){
				
				var xmlhttp = new XMLHttpRequest();
				
				var fundingOpenNo = ${result.fundingVo.funding_open_no};
				
				xmlhttp.onreadystatechange = function (){
					
					if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
						
						var fundobj = JSON.parse(xmlhttp.responseText);
						var inputGroup = document.getElementById("input_group");
						inputGroup.setAttribute("class", "btn-funding mt-3");
						
						var childCount = inputGroup.childNodes.length;
				
						for(var i = 0; i<childCount; i++){
							inputGroup.childNodes[0].remove();
						}
						
						if(fundobj.myFundCount==0){
							
							var fundBox = document.createElement("div");
							fundBox.setAttribute("class", "input_group");
							
							var priceInput = document.createElement("input");	
							priceInput.setAttribute("name", "funding_user_point");
							priceInput.setAttribute("class", "fundingPriceBox");
							priceInput.setAttribute("id", "purchase_point");
							priceInput.setAttribute("type", "number");
							priceInput.setAttribute("placeholder", "최소 금액  : ${result.fundingVo.funding_min_point }");
							priceInput.setAttribute("style", "margin-right: 5px;");
							
							var fundBtn = document.createElement("button");
							fundBtn.setAttribute("id", "fundingProcess");
							fundBtn.setAttribute("onclick", "purchaseFund()");
							fundBtn.setAttribute("class", "btn btn-secondary");
							fundBtn.setAttribute("style", "background:rgb(11, 11, 97)");
							fundBtn.innerText = "펀딩하기";
									
							fundBox.append(priceInput);
							fundBox.append(fundBtn);
							
							inputGroup.append(fundBox);
						
						
						}else{
							var fundBtn = document.createElement("div");
							inputGroup.setAttribute("id", "fundingProcess");
							inputGroup.setAttribute("class", "btn btn-secondary");
							inputGroup.setAttribute("style", "background:rgb(11, 11, 97)");
							inputGroup.innerText = "이미 펀딩에 참여하셨습니다.";
						}
							
							fundBox.append(fundBtn);
										
						}
						
						
					
					
				};
				
				xmlhttp.open("get","${pageContext.request.contextPath}/funding/count_myfunding_process.do?funding_open_no=${result.fundingVo.funding_open_no }");
				xmlhttp.send();
				
				
			}
			
		function countPercent(){
				
				var xmlhttp = new XMLHttpRequest();
				
				var fundingOpenNo = ${result.fundingVo.funding_open_no};
				var targetPoint = ${result.fundingVo.funding_target_point};
				
				
				xmlhttp.onreadystatechange = function (){
					
					if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
						
						var percent = JSON.parse(xmlhttp.responseText);
						
						var countPercentBox = document.getElementById("count_percent");
						countPercentBox.setAttribute("class", "progress");
						countPercentBox.setAttribute("id", "count_percent");
						countPercentBox.setAttribute("style", "height: 20px;");
						
						var childCount = countPercentBox.childNodes.length;
						
						for(var i = 0; i<childCount; i++){
							countPercentBox.childNodes[0].remove();
						}
						
							var percetInputBox = document.createElement("div");
							percetInputBox.setAttribute("class", "progress-bar");
							percetInputBox.setAttribute("role", "progressbar");
							percetInputBox.setAttribute("style", "width: "+percent.percent+"%;");
							percetInputBox.setAttribute("aria-valuenow", percent.percent);
							percetInputBox.setAttribute("aria-valuemin", "0");
							percetInputBox.setAttribute("aria-valuemax", "100");
							percetInputBox.innerText = percent.percent+"%";
							
							
							countPercentBox.append(percetInputBox);
							
						
						
						
					}
					
				};
				
				xmlhttp.open("get","${pageContext.request.contextPath}/funding/count_percent_process.do?funding_open_no=${result.fundingVo.funding_open_no }");
				xmlhttp.send();
				
			}


		
	function refresh(){
		refreshPurchaseFund();
		refreshLike();
		refreshMyLike();
		refreshCommunity();
		countPercent();
	}
	
</script>


</head>
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp"/>
<jsp:include page="/WEB-INF/views/commons/funding_nav.jsp"/>
<body class="bg-white" onload="refresh()">	
	<div class="container mt-3">
		<div class="row">
			<div class="col">
				<main>
					<div class="py-1" >
						<div class="bg">
						<h2>
						${result.fundingVo.funding_title }
						</h2>
						</div>
					</div>
					<div class="container-fluid">
				        <ul class="nav justify-content-center" style="fon">
				          <li><a style="color: black;" class="nav-link active" href="${pageContext.request.contextPath}/funding/read_funding_page.do?funding_open_no=${result.fundingVo.funding_open_no}"><strong>상세정보</strong></a></li>
				          <li><a style="color: black;" class="nav-link" href="${pageContext.request.contextPath}/funding/funding_notice_page.do?funding_open_no=${result.fundingVo.funding_open_no}"><strong>공지사항</strong></a></li>
				          <li><a style="color: black;" class="nav-link" href="${pageContext.request.contextPath}/funding/funding_community_page.do?funding_open_no=${result.fundingVo.funding_open_no}"><strong>커뮤니티</strong></a></li>
				        </ul>
				    </div>
				    <hr class="mt-2" style="border-width:20px; color:rgb(11, 11, 97) ">
				    <div class="row g-3">
				    	<div class="col-md-5 col-lg-4 order-md-last" style="margin-left: 55px; margin-top: 20px">
					        <h4 class="d-flex justify-content-between align-items-center mb-3">
					        	<span class="text-muted"><strong>${getFundingRemainDate }</strong> 일 남음</span>
					        </h4>
					        <hr class="mt-2" style=" border-width:20px; color:rgb(11, 11, 97) ">
					        <div style="padding:20px; border-radius:20px 40px; background:rgb(216, 216, 216, 0.3)">
						     
						        <div class="mt-3" >
						        	<div class="progress" id="count_percent" style="height: 20px;" >
							       		<div class="progress-bar" role="progressbar" style="width: ${percent}%;" aria-valuenow="${percent1}" aria-valuemin="0" aria-valuemax="100">${percent1}%</div>
									</div>
								</div>
								
								 
								<div class="mt-3"><p><strong>목표 금액 : </strong>${result.fundingVo.funding_target_point }원</p></div>
						        <div class="mt-3"><p><strong>${getFundingSumPoint }</strong>원 달성</p></div>
						        <div class="mt-3"><p><strong>${getFundingUserCount }</strong>명 펀딩 중</p></div>
					        </div>
					        <div style="padding:20px; background:rgb(255, 255, 255, 0.4)">
						        <div class="btn-funding mt-3" id="input_group">
						           <div class="input_group">
						          	<input class="fundingPriceBox" name="funding_user_point" id="purchase_point" type="number" placeholder="최소 금액  : ${result.fundingVo.funding_min_point }">
						            <button id="fundingProcess" onclick="purchaseFund()" class="btn btn-secondary" style="background:rgb(11, 11, 97)">펀딩하기</button>
						          </div>
						        </div>
					        	<div class="btn-wrap share mt-3">
						        	<div class="row">
							        	<div class="col-2">	
							        		<div id="like_img_box">
							        	 <!-- 
							        	 <c:choose>
				                           <c:when test="${fundingLikeCheckCount == 0 }">
				                              <input onclick="like()" type="image" style="width: 30px; height: 30px" src="${pageContext.request.contextPath }/resources/image/btn_icon_heart_blank.png">
				                           </c:when>
				                           <c:when test="${fundingLikeCheckCount != 0 }">
				                              <input onclick="like()" type="image" style="width: 30px; height: 30px" src="${pageContext.request.contextPath }/resources/image/btn_icon_heart_filled.png">
				                           </c:when>
				                           <c:otherwise>
				                              <input onclick="failLike()" type="image" src="${pageContext.request.contextPath }/resources/image/btn_icon_heart_filled.png">
				                           </c:otherwise>
				                        </c:choose>
				                         -->
				                        	</div>
							        	</div>
							        	<div class="col-2" id="likeCountBox"></div>
							        	<div class="col">
								        	<button class="btn btn-secondary" onclick="location.href='${pageContext.request.contextPath}/funding/funding_qna_page.do?funding_open_no=${result.fundingVo.funding_open_no}'">
									        	 펀딩관련 문의
								        	</button>
							        	</div>
							        </div>
					        	</div>
					     	</div>
				      	</div>
				      
				     <div class="col-md-7 clo-lg-8">
				      	<div>
				      		<div style="margin-left: 20px;">
				      			<p style="font-size: 17px;"><strong style="color: navy;">${sessionUser.user_nick }님!</strong><br>처음 <strong>제작자의 열정과 가치에 공감</strong>해주셨듯, 마지막까지 <strong>제작자를 응원</strong>해주세요.</p>
				      		</div>
				      		<hr class="mt-4" style="border-width:20px; color:rgb(11, 11, 97) ">
				      		<div style="margin-left: 20px;">
					      		<div>
					      			<div><p style="font-size: 15px;"><strong>${result.fundingVo.funding_title } </strong>커뮤니티 <strong style="font-size: 14px; color: gray;">${getFundingSumCommunityContent }</strong></p></div>
					      		</div>
					      			<c:if test="${!empty sessionUser }">
						      		<div class="container">
						      			<div>
						      				<textarea id="funding_community_content" rows="3" cols="60" style="margin-left: 20px; margin-right: 20px;"></textarea>
						      				<input type="button" class="btn btn-secondary" onclick="writeCommunity()" style="background:rgb(11, 11, 97); width: 100;" value="글 남기기">
						      			</div>
						      		</div>
						      		</c:if>
					      		<div>
					      			<hr class="mt-4" style="border-width:20px; color:rgb(11, 11, 97) ">
					      			<div class="container mt-4" id="community_list_box">
					      			
					      			</div>
					      		</div>
				    		</div>
				    	</div>
				    </div>
				    </div>
		  		</main>
			</div>
		</div>
	</div>
	<div class="container">
  	<footer class="my-5 pt-5 text-muted text-center text-small">
    <p class="mb-1">© BBQ</p>
  	</footer>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>	
</body>
</html>