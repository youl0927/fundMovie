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

.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('${pageContext.request.contextPath}/resources/image/grade_img.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
.star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}

.star-input1>.input1,
.star-input1>.input1>label:hover,
.star-input1>.input1>input:focus+label,
.star-input1>.input1>input:checked+label{display: inline-block;vertical-align:middle;background:url('${pageContext.request.contextPath}/resources/image/grade_img.png');}
.star-input1{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input1>.input1{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input1>.input1>input{position:absolute;width:1px;height:1px;opacity:0;}
.star-input1>.input1.focus{outline:1px dotted #ddd;}
.star-input1>.input1>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input1>.input1>label:hover,
.star-input1>.input1>input:focus+label,
.star-input1>.input1>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input1>.input1>label:hover~label{background-image: url('${pageContext.request.contextPath}/resources/image/grade_img.png');}
.star-input1>.input1>label[for="p1"]{width:30px;z-index:5;}
.star-input1>.input1>label[for="p2"]{width:60px;z-index:4;}
.star-input1>.input1>label[for="p3"]{width:90px;z-index:3;}
.star-input1>.input1>label[for="p4"]{width:120px;z-index:2;}
.star-input1>.input1>label[for="p5"]{width:150px;z-index:1;}
.star-input1>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}

</style>

<script type="text/javascript">

	//구매
	function purchaseFundMovie(){
	
	var fundingNo = ${result.fundingOpenVo.funding_open_no};
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

	xmlhttp.open("post","${pageContext.request.contextPath}/funding/purcahse_funding_movie_process.do");
	xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	xmlhttp.send("funding_open_no=" + fundingNo + "&purchase_point=" + purchasePoint + "&funding_user_no=" + purchaseUserNo + "&funding_user_point=" + purchasePoint);
}

	function refreshPurchaseFundMovie(){
	
	var xmlhttp = new XMLHttpRequest();
	
	var fundingOpenNo = ${result.fundingOpenVo.funding_open_no};
	
	xmlhttp.onreadystatechange = function (){
		
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){

			var fundobj = JSON.parse(xmlhttp.responseText);
			var inputGroup = document.getElementById("input_group");
			inputGroup.setAttribute("class", "btn-funding mt-5");
			
			var childCount = inputGroup.childNodes.length;
	
			for(var i = 0; i<childCount; i++){
				inputGroup.childNodes[0].remove();
			}
			
			if(fundobj.myFundCount==0){
					
				var priceBox = document.createElement("strong");
				priceBox.innerText = "구매 금액  : ";
				
				var priceInput = document.createElement("input");	
				priceInput.setAttribute("id", "purchase_point");
				priceInput.setAttribute("name", "funding_point");
				priceInput.setAttribute("type", "number");
				priceInput.setAttribute("value", "${result.fundingOpenVo.release_price }");
				priceInput.setAttribute("readonly", "readonly");
				
				var fundBox = document.createElement("div");
				fundBox.setAttribute("class", "fundBox mt-3");
				
				var Box1 = document.createElement("div");
				Box1.setAttribute("class", "mt-3");
				
				var btnBox = document.createElement("button");
				btnBox.setAttribute("id", "fundingProcess");
				btnBox.setAttribute("class", "w-100 btn btn-outline-light");
				btnBox.setAttribute("onclick", "purchaseFundMovie()");
				btnBox.setAttribute("style", "padding:10px; background:rgb(11, 11, 97)");
				
				var btnInBox = document.createElement("strong");
				btnInBox.innerText = "구매 하기";
				
				btnBox.append(btnInBox);
		        Box1.append(btnBox);
		        fundBox.append(Box1);
		        
		        inputGroup.append(priceBox);
		        inputGroup.append(priceInput);
		        inputGroup.append(fundBox);
		        
			
			}else{
		        
		        var fundBox = document.createElement("div");
		        fundBox.setAttribute("class", "fundBox mt-3");
		        
				var movieBox = document.createElement("div");
				movieBox.setAttribute("class", "mt-3");
				
				var hrefBox = document.createElement("a");
				hrefBox.setAttribute("href", "${pageContext.request.contextPath}/funding/watch_upload_movie_page.do?funding_open_no=${result.fundingOpenVo.funding_open_no}");
				
				var moviebtn = document.createElement("button");
				moviebtn.setAttribute("class", "w-100 btn btn-outline-light");
				moviebtn.setAttribute("type", "button");
				moviebtn.setAttribute("style", "padding:10px; background:rgb(11, 11, 97)");
		
				var stBox = document.createElement("strong");
				stBox.innerText = "영화보기";
			
				fundBox.append(movieBox);
				movieBox.append(hrefBox);
				hrefBox.append(moviebtn);
				moviebtn.append(stBox);
				inputGroup.append(fundBox);
				
				
			}
				 
		}
			
		
	};
	
	xmlhttp.open("get","${pageContext.request.contextPath}/funding/count_myfunding_process.do?funding_open_no=${result.fundingOpenVo.funding_open_no }");
	xmlhttp.send();
	
	
}
	
	function writeComment(){
		
		var commentContent = document.getElementById("funding_comment_content").value;
		var fundingOpenNo = ${result.fundingOpenVo.funding_open_no};
		var writeUserNo = ${sessionUser.user_no};
		var xmlhttp = new XMLHttpRequest();
		var starBox = $(':radio[name="star-input"]:checked').val();
		
		
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
					
				refresh();
			}
			
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/funding/write_funding_movie_comment_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("funding_open_no=" + fundingOpenNo + "&fund_movie_comment=" + commentContent + "&fund_movie_star=" + starBox + "&user_no=" + writeUserNo);

		document.getElementById("funding_comment_content").value="";
	}	
	
	function refreshComment(){
		
		$("input[name='star-input1']").attr('disabled',true);
		
		var xmlhttp = new XMLHttpRequest();
		var starBox = $(':radio[name="star-input"]:checked').val();
		var fundingOpenNo = ${result.fundingOpenVo.funding_open_no};
		
		xmlhttp.onreadystatechange = function (){
			
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
				
				var obj = JSON.parse(xmlhttp.responseText);
				var commentListBox = document.getElementById("comment_list_box");
				
				var childCount = commentListBox.childNodes.length;
				
				for(var i = 0; i<childCount; i++){
					commentListBox.childNodes[0].remove();
				}
				
				for(commentData of obj){
					
					var starBox1 = document.createElement("div");
					starBox1.setAttribute("class", "review");
					
					var spanBox = document.createElement("span");
					spanBox.setAttribute("class", "star-input1");
					
					var spanBox1 = document.createElement("span");
					spanBox1.setAttribute("class", "input1");
										
					var starInputBox = document.createElement("input");
					starInputBox.setAttribute("type", "radio");
					starInputBox.setAttribute("name", "star-input1");
					starInputBox.setAttribute("value", ""+commentData.fundMovieCommentVo.fund_movie_star+"");
					starInputBox.setAttribute("id", "p"+commentData.fundMovieCommentVo.fund_movie_star+"");
					starInputBox.setAttribute("checked", "checked");
					
					var outBox = document.createElement("output");
					outBox.setAttribute("for", "star-input1");
					
					var bBox = document.createElement("b");
					bBox.innerText=commentData.fundMovieCommentVo.fund_movie_star+"점";
					
					var labelBox = document.createElement("label");
					labelBox.setAttribute("for", "p"+commentData.fundMovieCommentVo.fund_movie_star+"");
					labelBox.innerText=commentData.fundMovieCommentVo.fund_movie_star;
					
					starBox1.append(spanBox);
	
					spanBox.append(spanBox1);
					spanBox.append(outBox);
					outBox.append(bBox);
					
					spanBox1.append(starInputBox);
					spanBox1.append(labelBox);
					
					commentListBox.append(starBox1);
				
					
					var rowBox = document.createElement("div");
					rowBox.setAttribute("class", "row mt-1");
					
					var contentBox = document.createElement("div");
					contentBox.setAttribute("class", "col-7");
					contentBox.setAttribute("style", "margin-left: 40px; margin-top: 10px;");
					contentBox.innerText = commentData.fundMovieCommentVo.fund_movie_comment;
					
					var nickBox = document.createElement("div");
					nickBox.setAttribute("class", "col-1");
					nickBox.innerText = commentData.memberVo.user_nick;
					
					var dateBox = document.createElement("div");
					dateBox.setAttribute("class", "col");
					
					var d = new Date(commentData.fundMovieCommentVo.fund_movie_comment_writedate);
					var strDate = d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate();
					
					dateBox.innerText = strDate;
				
					rowBox.append(contentBox);
					rowBox.append(nickBox);
					rowBox.append(dateBox);
				
					commentListBox.append(rowBox);
					
				}
				
				
			}
			
		};
		
		xmlhttp.open("get","${pageContext.request.contextPath}/funding/get_funding_fundmovie_comment_list.do?funding_open_no=" + fundingOpenNo);
		xmlhttp.send();
		
	}
	
	function refresh(){
		refreshPurchaseFundMovie();
		refreshComment();
	}	
	
	var starRating = function(){
		var $star = $(".star-input"),
		    $result = $star.find("output>b");
			
		  	$(document)
			.on("focusin", ".star-input>.input", 
				function(){
		   		 $(this).addClass("focus");
		 	})
				 
		   	.on("focusout", ".star-input>.input", function(){
		    	var $this = $(this);
		    	setTimeout(function(){
		      		if($this.find(":focus").length === 0){
		       			$this.removeClass("focus");
		     	 	}
		   		}, 100);
		 	 })
		  
		    .on("change", ".star-input :radio", function(){
		    	$result.text($(this).next().text());
		  	})
		    .on("mouseover", ".star-input label", function(){
		    	$result.text($(this).text());
		    })
		    .on("mouseleave", ".star-input>.input", function(){
		    	var $checked = $star.find(":checked");
		    		if($checked.length === 0){
		     	 		$result.text("0");
		   		 	} else {
		     	 		$result.text($checked.next().text());
		    		}
		  	});
		};

		starRating();	
		
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
					</div>
					<hr class="mt-2" style="border-width:20px; color:rgb(11, 11, 97) ">
				    <div class="row g-3">
				    	<div class="col-md-5 col-lg-4 order-md-last">
				    		<div class="mt-4">
					        <h4 class="d-flex justify-content-between align-items-center mb-3">
					        <span class="text-muted"><strong>${result.fundingOpenVo.funding_title }</strong></span>
					        </h4>
					        </div>
					        <hr class="mt-3" style=" border-width:20px; color:rgb(11, 11, 97) ">				        
					        <div class="btn-funding mt-5" id="input_group">
					        	 
					        	<strong>구매 금액  : </strong><input id="purchase_point" name="funding_point" type="number" value="${result.fundingOpenVo.release_price }" readonly="readonly">
						        <div class="fundBox">
							        <div class="mt-5">
						       				<button id="fundingProcess" class="w-100 btn btn-outline-light" onclick="purchaseFundMovie()" style="padding:10px; background:rgb(11, 11, 97)"><strong>구매하기</strong></button>
						       		</div>
					            	<div class="mt-3">
					            	<!-- 
							            <c:choose>
								        <c:when test="${!empty result.fundingUserListVo.funding_user_no }">
								        	<a href="${pageContext.request.contextPath}/funding/watch_upload_movie_page.do?funding_open_no=${result.fundingOpenVo.funding_open_no}"><button class="w-100 btn btn-outline-light" type="button" style="padding:10px; background:rgb(0, 187, 161, 0.4)"><strong>영화보기</strong></button></a>
								        </c:when>
								        <c:otherwise>
								        </c:otherwise>
								        </c:choose>
								     -->    
						        	</div>
						        </div>
						       
					        </div>
					        
				      </div>
				      <div class="col-md-7 clo-lg-8">
				      	<div class="funding-grid">
					    	<h4 class="mb-3"></h4>
					      		<div class="funding-thumb">
					      			<div class="row" style="margin-left: 30px;">
					      				<div class="col" style="text-align: center;">
					      				<img class="funding-thumb" style="height: 300px;width: auto; overflow: hidden;" src="${result.fundingOpenVo.funding_thumb }">
					      				</div>
					      				
					      				<div class="col"><strong class="detail">상세 정보 : ${result.fundingOpenVo.funding_detail }</strong></div>
					      				
					      			</div>
					      		</div>
					      </div>
				    	</div>
				    </div>
				    <hr class="my-4" style=" border-width:20px; color:rgb(11, 11, 97) ">
				    <img src="">
				    <div class="row">
				    	<div class="comment_container" id="comment_container">
				    		<div class="review">
						    <span class="star-input">
								<span class="input" id="star_container">
							    	<input type="radio" name="star-input" value="1" id="p1">
							    	<label for="p1">1</label>
							    	<input type="radio" name="star-input" value="2" id="p2">
							    	<label for="p2">2</label>
							    	<input type="radio" name="star-input" value="3" id="p3">
							    	<label for="p3">3</label>
							    	<input type="radio" name="star-input" value="4" id="p4">
							    	<label for="p4">4</label>
							    	<input type="radio" name="star-input" value="5" id="p5">
							    	<label for="p5">5</label>
							  	</span>
							  	<output for="star-input"><b></b></output>						
							</span>
						    </div>
						    
						    
				    		<div class="mt-3">	
				    			<textarea id="funding_comment_content" rows="3" cols="60" style="margin-left: 20px; margin-right: 20px;"></textarea>
						    	<input  type="button" class="btn btn-secondary" onclick="writeComment()" style="background:rgb(11, 11, 97, 0.5); width: 100;" value="리뷰 작성">
						    	
						    </div>
				    	</div>
				    </div>	
				    <div class="row">
				    	<div class="col-6" id="comment_list_box">	
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