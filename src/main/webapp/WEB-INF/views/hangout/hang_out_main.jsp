<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

#video {
    
      width: auto; height: auto; overflow: hidden; margin: 0px auto; position: fixed; 
      min-width: 100%;   background-position: center;
    background-size: cover;
}
body { padding: 0px; margin: 0px; }

</style>
<script type="text/javascript">

	function pageTurner(){
		var xmlhttp = new XMLHttpRequest();
		xmlhttp.onreadystatechange = function(){
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200){
			console.log(xmlhttp.responseText);
			alert("test");
		};
		xmlhttp.open("get","${pageContext.request.contextPath}/hangout/hangOut_list.do");
		xmlhttp.send();
		}
		
	}
	
	function pageTurner1(){
		location.href="${pageContext.request.contextPath}/hangout/hangOut_list.do"
	}
	setTimeout(pageTurner1, 2500);
	
</script>


</head>

<body onload="pageTurner()">
<video id="video" preload="auto" autoplay="true" loop="loop" muted="muted" volume="0" onclick="pageTurner1()">
      <source src="${pageContext.request.contextPath }/resources/clip/hangout.mp4">

</video>

</body>

</html>
 
