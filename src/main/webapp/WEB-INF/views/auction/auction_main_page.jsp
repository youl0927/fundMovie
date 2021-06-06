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
<style type="text/css">
 
  @import url('https://fonts.googleapis.com/css?family=Nanum+Gothic:400');
  @import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);

	.jm { 
	 font-family: 'Jeju Myeongjo', serif;
	}
	.sf {
  	font-family: 'Noto Serif KR', serif;
	} 
	
	.ng {
  	font-family: 'Nanum Gothic', serif;
	} 
	
	
    </style>

<script type="text/javascript">

	function auctionJoinProcess(eventBox , auction_no){
		
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
		
		xmlhttp.open("post","${pageContext.request.contextPath}/auction/join_auction_process.do");
		xmlhttp.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		xmlhttp.send("auction_no=" + auction_no);
		
	}

	function refreshMyList(){
		
		
		//AJAX 호출.....
		var xmlhttp = new XMLHttpRequest();
		
		//호출 후 값을 받았을때... 처리 로직....
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status == 200){
				//console.log(xmlhttp.responseText);
				
				var result = JSON.parse(xmlhttp.responseText);
				
				var myAuctionBox = document.getElementById("my_auction_box");
				
					myAuctionBox.innerHTML = "";
				
				for(data of result){
					
					var myAuctionTemplete = document.getElementById("myAuction_templete");
					var myNewAuction = myAuctionTemplete.cloneNode(true);
					myNewAuction.setAttribute("class","auc_temp_box");
					
					var img_thumb = myNewAuction.getElementsByClassName("img_myThumb");
					var img_tlink = new String(data.auctionImagesVoList[0].auction_main_img);
						img_thumb[0].setAttribute("src", img_tlink);

					var auct_title = myNewAuction.getElementsByClassName("auc_title_box");
					var title = new String(data.myAuctionVo.auction_title);
						auct_title[0].innerText = title;
					
						
					var img_my_stat = myNewAuction.getElementsByClassName("img_my_stat");
					var bidder_no = new String(data.max_bidderVo.user_no);
					var me = ${sessionUser.user_no };
					
					if(bidder_no != me){
						img_my_stat[0].setAttribute("src", "${pageContext.request.contextPath }/resources/image/lose.png");
					}else{
						img_my_stat[0].setAttribute("src", "${pageContext.request.contextPath }/resources/image/win.png");
					}
						
					var auc_time_box = myNewAuction.getElementsByClassName("auc_time_box");
					
					auc_time_box[0].setAttribute("closing",data.myAuctionVo.closing_date);
					
					var startValue = parseInt(auc_time_box[0].getAttribute("closing"));
					var remainTime = startValue - (new Date().getTime());
					remainTime = parseInt(remainTime / 1000);
					
					var remainHour = parseInt(remainTime/3600);
					remainHour += "시간" + parseInt((remainTime%3600)/60);
					remainHour += "분" + remainTime%60;	
					
					
					if (remainTime < 60){
						auc_time_box[0].style.fontSize  = 50+"px";
					}else{
						auc_time_box[0].innerText = remainHour + "초 남음";
					}
					
					myNewAuction.removeAttribute("id");
					myAuctionBox.appendChild(myNewAuction);
					
				}
				
				console.log(result);
			}
		};
		
		xmlhttp.open("get","./get_my_auction_list.do" , true);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.send();		
		
	}
	

	function refreshList(){
		
		
		//AJAX 호출.....
		var xmlhttp = new XMLHttpRequest();
		
		//호출 후 값을 받았을때... 처리 로직....
		xmlhttp.onreadystatechange = function(){
			if(xmlhttp.readyState==4 && xmlhttp.status == 200){
				//console.log(xmlhttp.responseText);
				
				var result = JSON.parse(xmlhttp.responseText);
				
				var auctionBoxBody = document.getElementById("auction_box_body");
				
				auctionBoxBody.innerHTML = "";
				
				for(data of result){
					
					var auctionTemplete = document.getElementById("auction_templete");
					var newAuction = auctionTemplete.cloneNode(true);
					newAuction.setAttribute("class","auction_main_box");
					
					
					var img_thumbnail = newAuction.getElementsByClassName("img_thumbnail");
					var img_link = new String(data.auctionImagesVoList[0].auction_main_img);
						img_thumbnail[0].setAttribute("src", img_link);
					
					
					var auction_title = newAuction.getElementsByClassName("auction_title");
					var title = new String(data.auctionVo.auction_title);
						auction_title[0].innerText = title;
					
					var maker_box = newAuction.getElementsByClassName("maker_box");
					var maker = new String(data.auctionVo.maker);
						maker_box[0].innerText = maker;
					
					var auction_detail_box = newAuction.getElementsByClassName("auction_detail_box");
					var auction_detail = new String(data.auctionVo.auction_detail);
						auction_detail_box[0].innerText = auction_detail;
						
					var low_high_price_box = newAuction.getElementsByClassName("low_high_price_box");
					var low_price = new Number(data.low_price);
					var high_price = new Number(data.high_price);
						low_high_price_box[0].innerText = low_price +" ~ "+ high_price +" point";
						
						
					
					var call_price_box = newAuction.getElementsByClassName("call_price_box");
					var call_price = new Number(data.call_price);
						call_price_box[0].innerText = call_price +" point";	
					
					var current_price_box = newAuction.getElementsByClassName("current_price_box");
					var current_price = new String(data.auctionVo.current_price);
						current_price_box[0].innerText = current_price;	
					
					var status_img = newAuction.getElementsByClassName("status_img");
					var status = new String(data.auctionVo.auction_status);
						if(data.auctionVo.auction_status == 'new'){
							status_img[0].setAttribute("src","${pageContext.request.contextPath }/resources/image/new.png");	
						}
						
					
						
					var remain_time_box = newAuction.getElementsByClassName("remain_time_box");
					
					remain_time_box[0].setAttribute("closing",data.auctionVo.closing_date);
					
					var startValue = parseInt(remain_time_box[0].getAttribute("closing"));
					var remainTime = startValue - (new Date().getTime());
					remainTime = parseInt(remainTime / 1000);
					
					var remainHour = parseInt(remainTime/3600);
					remainHour += "시간" + parseInt((remainTime%3600)/60);
					remainHour += "분" + remainTime%60;	
					
					
					if (remainTime < 60){
						remain_time_box[0].style.fontSize  = 50+"px";
						status_img[0].setAttribute("src","${pageContext.request.contextPath }/resources/image/timer.gif");
						status_img[0].setAttribute("height","100");
						status_img[0].setAttribute("width","80");
						
						
					}else{
					remain_time_box[0].innerText = remainHour + "초 남음";
					
					
					}
					
					
					
					var crown_img = newAuction.getElementsByClassName("crown_img");
						crown_img[0].setAttribute("src","${pageContext.request.contextPath }/resources/image/crown.png");	
						
					var bidder_nick_box = newAuction.getElementsByClassName("bidder_nick_box");
					var bidder_nick = new String(data.max_bidderVo.user_nick);
						bidder_nick_box[0].innerText = bidder_nick;	
						
					
						
					var mine_img = newAuction.getElementsByClassName("mine_img");
					mine_img[0].setAttribute("src","${pageContext.request.contextPath }/resources/image/heart.svg");	
					
					var join_img = newAuction.getElementsByClassName("join_img");
					join_img[0].setAttribute("src","${pageContext.request.contextPath }/resources/image/bell.svg");
					
					var me = ${sessionUser.user_no };
					var max_bidder = new Number(data.max_bidderVo.user_no);
					
					var mine_link = newAuction.getElementsByClassName("mine_link");
					var auction_no = new Number(data.auctionVo.auction_no);
					mine_link[0].setAttribute("href","${pageContext.request.contextPath }/auction/delete_auction_inform_process.do?auction_no="+auction_no);
					
					
					var join_link = newAuction.getElementsByClassName("join_link");
					var join_btn = newAuction.getElementsByClassName("join_btn");

					
					if(me == max_bidder){
						join_btn[0].removeAttribute("onclick");
						join_img[0].setAttribute("src","${pageContext.request.contextPath }/resources/image/1st.png");
						join_link[0].innerText = "지금 1등!";
					}else{
						join_btn[0].setAttribute("onclick","auctionJoinProcess(this, "+auction_no+");");
					}
					
					
					newAuction.removeAttribute("id");
					auctionBoxBody.appendChild(newAuction);
					
				}
				
				
				console.log(result);
			}
		};
		
		xmlhttp.open("get","./get_auction_list.do" , true);
		xmlhttp.setRequestHeader("Content-type",
		"application/x-www-form-urlencoded");
		xmlhttp.send();		
		
	}
	
	function descentCount(){
		
		var remain_time_boxes = document.getElementsByClassName("remain_time_box");
		
		for(remain_time_box of remain_time_boxes){
			
			var startValue = parseInt(remain_time_box.getAttribute("closing"));
			
			var remainTime = startValue - (new Date().getTime());
			remainLimit = remainTime;
			remainSec =  parseInt(remainTime / 10);
			remainTime = parseInt(remainTime / 1000);
			
			var auction_main_box = remain_time_box.closest(".auction_main_box");
			var remain_time_boxes = auction_main_box.getElementsByClassName("remain_time_box");
			
			if(remainLimit>=0){
				if(remainTime < 60){
					var remainHour = remainTime%60;
					remainHour += "."+remainSec%100;
					
					remain_time_boxes[0].innerText = remainHour+"";
					remain_time_boxes[0].style.color = "red";
					remain_time_boxes[0].style.fontSize  = 50+"px";

				}
			}
		}
		
	}	
	
	
	setInterval(refreshList,1000);
	setInterval(refreshMyList,1000);
	setInterval(descentCount,10);
	
	
</script>

</head>
<body onload="refreshList()">
<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />
<jsp:include page="/WEB-INF/views/commons/auction_nav.jsp" />


<div class="row mt-0" style="padding: 0px; margin: 0px;"><img alt="" src="${pageContext.request.contextPath }/resources/image/auction.jpg" style="width: 100%; height: 350px; object-fit: cover; padding: 0px; margin: 0px;"></div>
<div class="row">
	<div class="col-1"></div>
	<div class="col mt-2">
		<div class="row">
		<span class="sub jm" style="font-size: 40px; padding-left: 50px;">영화속에서 일어날 수 있는 모든 즐거움과 짜릿함을 소유하세요.</span>
		</div><div class="row">
		<span class="sub mt-2 jm" style="font-size: 30px; padding-left: 800px;">주인공들과 어깨를 나란히 하고, 사랑과 모험을 즐기세요.</span>
		</div><div class="row" style="text-align: center; ">
		<span class="head mt-3 jm" style="font-size: 70px; ">BBQ:경매장에서 이 모든 것이 가능합니다!</span>
		</div><div class="row">
		<span class="sub mt-3 jm" style="font-size: 35px; padding-left: 200px;">마지막 1분의 난투 속에서 여러분의 승리를 기원합니다.</span>
		</div>
		<div class="row">
		<span class="sub mt-2 jm" style="font-size: 40px; padding-left: 650px;">행운이 따르는 즐거운 시간 보내시기를 바랍니다.</span>
		</div>
	</div>
	<div class="col-1"></div>
</div>

<div class="row">
<div class="col"></div>	
	<div class="container mt-5">
		<div class="row mt-5" >
			<div class="col-2"></div>	
			<div class="col">
			 	<div class="row" style="border-top: 1px solid grey;"></div>
				<div id="auction_box_body">
				
				</div>
			</div>	
			<div class="col-2">
				<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar sticky-top d-none">
			      <div class="position-sticky">
			        <ul class="nav flex-column">
			          <li class="nav-item">
			            <div id="my_auction_box">
			            
			            </div>
			          </li>
			        </ul>
			      </div>
			    </nav> 

			</div>
		</div>	
	</div>
<div class="col"></div>	
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>


<!-- auction templete -->
	<div id="auction_templete" class="auction_main_box d-none">
		<div class="container">
		<div class="row mt-5" >
			<div class="col-4">
				<div class="row" style="padding-left: 50px; padding-right: 30px">
						<img src="..." style="height: 300px; width: 300px; " class="img_thumbnail"><br>
				</div>
			</div>
			<div class="col-5">
				<div class="row">
					<div class="row jm" style="padding:0px; "><h2 class="auction_title" style="padding:0px;">...</h2></div>										
				</div>
				<div class="row mt-2">
					<div class="col" style="border-top: 1px solid grey; margin-right: 20px;">
					<div class="row jm">
					<div class="col" style="font-size: 20px;"> 제작: <span class="maker_box">...</span></div>
					
					</div>										
					</div>
				</div>
				<div class="row " >
					<div class="row jm" style="font-size: 20px; height: 150px; ">
					<div class="col" style="padding: 0px; padding-left: 12px;">설명: <span class="auction_detail_box" style="font-size: 18px;">...</span></div>
					</div>										
				</div>
				<div class="row jm mt-2 " style="border-top: 1px solid grey; margin-right: 10px; font-size: 15px;">예상 가격:
					<div class="row jm" style="font-size: 15px; padding-left: 20px;"> <span class="low_high_price_box">...</span></div>									
				</div>
				<div class="row jm mt-1 " style="border-top: 1px solid grey; margin-right: 10px; font-size: 15px;">단위 가격:
					<div class="row jm" style="font-size: 15px; padding-left: 20px;"> <span class="call_price_box">...</span></div>									
				</div>
			</div>
			
			<div class="col">
						<div class="row" >
							<div style="margin: 0px; margin-bottom: 20px; padding: 0px; line-height: 0px; ">
								<img src="..." class="status_img" height="50" width="50" style=" line-height: 0px;">
								 <span class="remain_time_box" style="margin: 0px; margin-bottom: 20px; vertical-align: text-bottom;" ></span>
							</div>										
						</div>
						<div class="row jm mt-1" style="padding-left: 20px; font-size: 25px; ">현재가<br>
							<div class="row" >
							<div class="col jm" style="font-size: 20px; text-align: right;"><span class="current_price_box">...</span> point</div>
							</div>										
						</div>
						<div class="row jm mt-1" style="padding-left: 20px; font-size: 15px;">
							<div class="row" style="padding-left: 30px; font-size: 16px;">최고 입찰자 
							<div class="col jm" style="font-size: 20px; text-align: right;"><img src="..." class="crown_img" height="70" width="50" > <span class="bidder_nick_box">...</span> 님</div>
							</div>										
						</div>
						<div class="row mt-1" >
							<div class="row" style="padding:0px; margin:0px;" ><a style="padding:0px; padding-top:10px; padding-bottom:10px; margin:0px;" class="btn btn-dark">View Details</a></div>										
						</div>
						<div class="row mt-5" style="text-align: center; ">
							<div class="row" style="padding:0px; margin:0px;" >
														
								<div class="col-6" style="padding:0px; margin:0px; padding-right:3px; " >
								<button class="mine_link btn btn-light btn-lg d-md-block" style="width: 100% ; border: solid 1px grey; font-size:15px;"><img src="..." class="mine_img" width="25" height="25" > 찜하기</button>
								</div>
								<div class="col-6" style="padding:0px; margin:0px; padding-left:3px; ">
								<button class="join_btn btn btn-light btn-lg d-md-block" style="width: 100%; border: solid 1px grey; font-size:15px;"><img src="..." class="join_img" width="25" height="25" ><span class="join_link"> 경매참여</span></button>
								
								</div>
								
							</div>										
						</div>
			</div>
		</div>
		</div>
		<div class="row mt-5" style="border-bottom: 1px solid grey">
		</div>
	</div>

<!-- my auction 템플릿 -->	
	<div id="myAuction_templete" class="auc_temp_box d-none" style="float:left;">
		 <div class="auc_thumb_box" style="float:left;">
		 <img src="..." style="height: 50px; width: 50px; float:left;" class="img_myThumb">
		 </div>
         <div class="auc_title_box" style="float:left;"></div>
         <div class="auc_stat_box" style="float:left;">
         		 <img src="..." style="height: 30px; width: 30px; " class="img_my_stat">
         </div>
         <div class="auc_time_box" style="float:left;"></div>
	 </div>
	 
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>


</html>