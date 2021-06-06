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
	
	
	function hangOutJoinProcess(eventBox , movie_no){

		//var hangout_movie_no = eventBox.getAttribute("xxx");
		//AJAX 호출.....
		var xmlhttp = new XMLHttpRequest();
		
		//호출 후 값을 받았을때... 처리 로직....
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status == 200){
				//console.log(xmlhttp.responseText);
				
				refreshList();
			}			
		};
		
		xmlhttp.open("post","${pageContext.request.contextPath}/hangout/hangOut_join_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("hangout_movie_no=" + movie_no);
		
		
	}

	function refreshList(){
		
		//AJAX 호출.....
		var xmlhttp = new XMLHttpRequest();
		
		//호출 후 값을 받았을때... 처리 로직....
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status == 200){
				//console.log(xmlhttp.responseText);
				
				var result = JSON.parse(xmlhttp.responseText);
				
				var cardBoxBody = document.getElementById("card_box_body");
				
				cardBoxBody.innerHTML = "";
				
				for(data of result){
					
					var cardTemplete = document.getElementById("card_templete");
					var newCard = cardTemplete.cloneNode(true);
					newCard.setAttribute("class","card_main_box card");
					
					
					var genre_img = newCard.getElementsByClassName("genre_img");
					
					if(data.hangOutVo.movie_genre == '액션'){
						genre_img[0].setAttribute("src","${pageContext.request.contextPath }/resources/image/action2.gif");
					}else if(data.hangOutVo.movie_genre == 'SF'){
						genre_img[0].setAttribute("src","${pageContext.request.contextPath }/resources/image/sf.gif");
					}else if(data.hangOutVo.movie_genre == '호러'){
						genre_img[0].setAttribute("src","${pageContext.request.contextPath }/resources/image/horror.gif");
					}else if(data.hangOutVo.movie_genre == '멜로'){
						genre_img[0].setAttribute("src","${pageContext.request.contextPath }/resources/image/melo.gif");
					}else{
						genre_img[0].setAttribute("src","${pageContext.request.contextPath }/resources/image/family.gif");
					}
					
					var card_title = newCard.getElementsByClassName("card-title");
					var title = new String(data.hangOutVo.movie_title);
					
					card_title[0].innerText = title;
					

					var start_date_box = newCard.getElementsByClassName("start_date_box");
					
					
					var date = new Date(data.hangOutVo.deadLine_date);
					var strDate = "";
					strDate += date.getFullYear();
					strDate += "-" + (date.getMonth()+1);
					strDate += "-" + date.getDate();
					
					start_date_box[0].innerText = strDate;
					start_date_box[0].setAttribute("xxx",data.hangOutVo.movie_start_date);
					
					
					var btn_btn_light = newCard.getElementsByClassName("btn btn-light");
					var movie_no = new Number(data.hangOutVo.hangout_movie_no);
					
					
					console.log(data.hangOutVo.hangout_movie_no);
					console.log(data.joinMember);
					//btn_btn_light[0].setAttribute("href", "javascript:;");
					
					if(data.joinMember != 0){
					btn_btn_light[0].setAttribute("xxx" , data.hangOutVo.hangout_movie_no);
					btn_btn_light[0].removeAttribute("onclick");	
					btn_btn_light[0].innerText = "참여중";
					}else{
					
					btn_btn_light[0].setAttribute("xxx" , data.hangOutVo.hangout_movie_no);
					btn_btn_light[0].setAttribute("onclick", "hangOutJoinProcess(this , "+ movie_no +");");
					}
					
					
									
					var startValue = parseInt(start_date_box[0].getAttribute("xxx"));
					
					var remainTime = startValue - (new Date().getTime());
					remainTime = parseInt(remainTime / 1000);
					
					var remainHour = parseInt(remainTime/3600);
					remainHour += "시간" + parseInt((remainTime%3600)/60);
					remainHour += "분" + remainTime%60;
					
					
					var card_main_box = start_date_box;
					var remain_time_boxes = newCard.getElementsByClassName("remain_time_box");
					var	btn_btn_light = newCard.getElementsByClassName("btn");			
					
					
					
					var member_status_box = newCard.getElementsByClassName("member_status_box");

					var member_count = new Number(data.hangOutVo.member_count);
					var member_join_open = new Number(data.hangoutCount);
					
					member_status_box[0].innerText = member_join_open + " / "+ member_count;
					
					var price_box = newCard.getElementsByClassName("price_box");
					var ticket_price = new Number(data.hangOutVo.hangout_price);
					
					
					if(remainTime <=0){
						remain_time_boxes[0].innerText = "마감되었습니다.";
						remain_time_boxes[0].style.color = "silver";
						price_box[0].innerText = 0+" 포인트";
						btn_btn_light[0].innerText = "다음에 봐요";
						btn_btn_light[0].removeAttribute("onclick");
					}else if(member_count-member_join_open <=0){
						remain_time_boxes[0].innerText = "마감되었습니다.";
						remain_time_boxes[0].style.color = "silver";
						price_box[0].innerText = 0+" 포인트";

						btn_btn_light[0].innerText = "다음에 봐요";
						btn_btn_light[0].removeAttribute("onclick");
					
						
						
					}else {
					remain_time_boxes[0].innerText = remainHour + "초 남음";
					remain_time_boxes[0].style.color = "red";
					price_box[0].innerText = Math.ceil(ticket_price/(member_join_open+1))+" 포인트";
					}
					
					
					newCard.removeAttribute("id");
					cardBoxBody.appendChild(newCard);
					
					
					/*					
					var cardBox = document.createElement("div");
					cardBox.setAttribute("class","card");
					cardBox.setAttribute("style","width: 18rem; padding: 0px;");

					var imgBox = document.createElement("img");
					if(data.hangOutVo.movie_genre == '액션'){
						imgBox.setAttribute("src","${pageContext.request.contextPath }/resources/image/action2.gif");
					}else if(data.hangOutVo.movie_genre == 'SF'){
						imgBox.setAttribute("src","${pageContext.request.contextPath }/resources/image/sf.gif");
					}else{
						imgBox.setAttribute("src","${pageContext.request.contextPath }/resources/image/action2.gif");
					}
					
					cardBox.appendChild(imgBox);
					
					cardBoxBody.appendChild(cardBox);
					*/
				}
				
				
				console.log(result);
			}
		};
		
		xmlhttp.open("get","./get_hangOut_list.do" , true);
		xmlhttp.setRequestHeader("Content-type",
		"application/x-www-form-urlencoded");
		xmlhttp.send();		
		
	}

	
	function descentCount(){
		//remain_time_box
		var start_date_boxes = document.getElementsByClassName("start_date_box");
		
		for(start_date_box of start_date_boxes){
			
			var startValue = parseInt(start_date_box.getAttribute("xxx"));
			
			var remainTime = startValue - (new Date().getTime());
			remainTime = parseInt(remainTime / 1000);
			
			var remainHour = parseInt(remainTime/3600);
			remainHour += "시간" + parseInt((remainTime%3600)/60);
			remainHour += "분" + remainTime%60;
			
			var card_main_box = start_date_box.closest(".card_main_box");
			var remain_time_boxes = card_main_box.getElementsByClassName("remain_time_box");
			var	btn_btn_light = card_main_box.getElementsByClassName("btn");			
			
			if(remainTime <=0){
				remain_time_boxes[0].innerText = "마감되었습니다.";
				remain_time_boxes[0].style.color = "silver";
				btn_btn_light[0].innerText = "다음에 봐요";
				btn_btn_light[0].removeAttribute("onclick");
			}else {
			remain_time_boxes[0].innerText = remainHour + "초 남음";
			remain_time_boxes[0].style.color = "red";
			}
			
			
			
			
		}
		
	}
	
	//setInterval(descentCount,1000);
	
	setInterval(refreshList,1000);

</script>

</head>
<body onload="refreshList()">
	<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />
	<div class="container mt-5">
		<div class="row" >
			<div class="col">
				<div style="padding-left:1100px;"><a href="${pageContext.request.contextPath }/hangout/hangOut_open.do" class="btn btn-dark" role="button" >제안하기</a></div>
				<div id="card_box_body" class="row mt-2" style="padding-left: 70px;">
<%--				
					<c:forEach items="${resultList }" var="data">
						<div class="card" style="width: 18rem; padding: 0px;">
						  <c:choose>
						  <c:when test="${data.hangOutVo.movie_genre eq '액션' }">
						  <img src="${pageContext.request.contextPath }/resources/image/action2.gif" height="150"class="card-img-top" alt="...">
						  </c:when>
						  <c:when test="${data.hangOutVo.movie_genre eq 'SF' }">
						  <img src="${pageContext.request.contextPath }/resources/image/sf.gif" height="150" class="card-img-top" alt="...">
						  </c:when>
						  <c:when test="${data.hangOutVo.movie_genre eq '호러' }">
						  <img src="${pageContext.request.contextPath }/resources/image/horror.gif" height="150" class="card-img-top" alt="...">
						  </c:when>
						  <c:when test="${data.hangOutVo.movie_genre eq '멜로' }">
						  <img src="${pageContext.request.contextPath }/resources/image/melo.gif" height="150" class="card-img-top" alt="...">
						  </c:when>
						  <c:when test="${data.hangOutVo.movie_genre eq '가족' }">
						  <img src="${pageContext.request.contextPath }/resources/image/family.gif" height="150" class="card-img-top" alt="...">
						  </c:when>
						  </c:choose>
						  
						  
						  <div class="card-body">
						    <h5 class="card-title">${data.hangOutVo.movie_title }</h5>
						    <p class="card-text">
						    	상영날짜: <fmt:formatDate value="${data.hangOutVo.movie_start_date }" pattern="yyyy.MM.dd HH:mm:ss" /><br>
							    
						    
						    
						    </p>
						    <a href="hangOut_join_process.do?hangout_movie_no=${data.hangOutVo.hangout_movie_no }" class="btn btn-light">같이 볼래♡</a> 현황 0/${data.hangOutVo.member_count }
						  </div>
						</div>
					
					</c:forEach>
 --%>					
				</div>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
	
	
	
<!-- card templete -->
	<div id="card_templete" class="card_main_box card d-none" style="width: 18rem; padding: 0px;">
	  <img src="..." height="150" class="genre_img card-img-top" alt="...">
	  <div class="card-body">
	    <h5 class="card-title">...</h5>
	    <p class="card-text">
	    	상영날짜: <span class="start_date_box">...</span><br>
	    	참여가격: <span class="price_box">...</span><br>
	    	
	    </p>
	    <div>남은 시간 : <span class="remain_time_box"></span></div>
	    <span class="btn btn-light">같이 볼래♡</span>
	    현황 : <span class="member_status_box">...</span>
	  </div>
	</div>

	

	
</body>
</html>