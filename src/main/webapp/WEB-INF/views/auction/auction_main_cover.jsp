<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


body { padding: 0px; margin: 0px; }

</style>
<script type="text/javascript">

		
	function pageTurner1(){
		location.href="${pageContext.request.contextPath}/auction/auction_main.do"
	}
	setTimeout(pageTurner1, 5000);
	
</script>


</head>

<body onload="pageTurner()">
<div>
      <img src="${pageContext.request.contextPath }/resources/image/auction_intro.png" onclick="pageTurner1()"
      style="width: auto; height: auto; overflow: hidden; margin: 0px auto; position: fixed; 
      min-width: 100%;   background-position: center;
    background-size: cover;"
      >

</div>

</body>

</html>
 
