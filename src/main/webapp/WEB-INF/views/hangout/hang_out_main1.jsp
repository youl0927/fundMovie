<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<link rel="apple-touch-icon" type="image/png" href="https://cpwebassets.codepen.io/assets/favicon/apple-touch-icon-5ae1a0698dcc2402e9712f7d01ed509a57814f994c660df9f7a952f3060705ee.png" />
<meta name="apple-mobile-web-app-title" content="CodePen">
<link rel="shortcut icon" type="image/x-icon" href="https://cpwebassets.codepen.io/assets/favicon/favicon-aec34940fbc1a6e787974dcd360f2c6b63348d4b1f4e06c77743096d55480f33.ico" />
<link rel="mask-icon" type="" href="https://cpwebassets.codepen.io/assets/favicon/logo-pin-8f3771b1072e3c38bd662872f6b673a722f4b3ca2421637d5596661b4e2132cc.svg" color="#111" />
  
<style>
@import url(https://fonts.googleapis.com/css?family=Monoton);
@import url(https://fonts.googleapis.com/css?family=Great+Vibes);
html, body {
  width: 100%;
  height: 100%;
  margin: 0;
  overflow: hidden;
}

main {
  position: absolute;
  left: 0;
  top: 50px;
  width: 100%;
  height: 100%;
}

.bg {
  background-image: url(https://raw.githubusercontent.com/interaminense/repository-codepen/master/neon-codepen/bg-neon.jpg);
  width: 100%;
  height: 100%;
  background-position: center;
  background-size: 100%;
  opacity: 0.3;
  position: absolute;
  left: 0;
  top: 0;
}

.wrapper {
  position: absolute;
  width: auto;
  height: 150px;
  left: 0;
  right: 0;
  top: 0;
  bottom: 0;
  margin: auto;
  text-align: center;
}

.wrapper h1 {
  font-size: 100px;
  margin: 0;
  font-weight: normal;
}

.wrapper h2 {
  font-size: 20px;
  margin: 0;
  font-weight: normal;
  line-height: 10px;
}

.font1 {
  font-family: "Monoton", cursive;
}

.font2 {
  font-family: "Great Vibes", cursive;
}

.input-text {
  position: absolute;
  left: 20px;
  top: 20px;
  width: 280px;
  padding: 5px 20px;
  border: none;
  background-color: rgba(0, 0, 0, 0.4);
  font-family: "Monoton", cursive;
  font-size: 35px;
  box-shadow: 15px 15px 23px rgba(0, 0, 0, 0.2);
  outline: none;
  z-index: 1;
}

.buttons {
  position: absolute;
  z-index: 1;
  right: 20px;
  top: 20px;
}

.buttons button {
  float: left;
  border: none;
  width: 16px;
  height: 16px;
  border-radius: 4px;
  margin-right: 10px;
  padding: 0;
  cursor: pointer;
}

button.btn-pink {
  background-color: #E91E63;
}

button.btn-yellow {
  background-color: #FFC107;
}

button.btn-green {
  background-color: #8BC34A;
}

button.btn-blue {
  background-color: #03A9F4;
}

main.pink {
  animation: bgNeon-1 3s infinite;
}
main.pink .input-text {
  color: #E91E63;
}
main.pink .wrapper h1 {
  animation: neon2-1 3s infinite;
}
main.pink .wrapper h2 {
  text-shadow: 0 0 10px #E91E63, 0 0 30px #e91ec9;
  color: #E91E63;
}
@keyframes neon2-1 {
  0% {
    color: #E91E63;
    text-shadow: 0 0 10px #E91E63, 1px 1px #f7a9c4, 0 0 280px #e91ec9;
  }
  80% {
    color: #E91E63;
    text-shadow: 0 0 10px #E91E63, 1px 1px #f7a9c4, 0 0 280px #e91ec9;
  }
  81% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  94% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  95% {
    color: #E91E63;
    text-shadow: 0 0 10px #E91E63, 1px 1px #f7a9c4, 0 0 280px #e91ec9;
  }
  96% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  97% {
    color: #E91E63;
    text-shadow: 0 0 10px #E91E63, 1px 1px #f7a9c4, 0 0 280px #e91ec9;
  }
  98% {
    color: #E91E63;
    text-shadow: 0 0 10px #E91E63, 1px 1px #f7a9c4, 0 0 280px #e91ec9;
  }
  99% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  100% {
    color: #E91E63;
    text-shadow: 0 0 10px #E91E63, 1px 1px #f7a9c4, 0 0 280px #e91ec9;
  }
}
@keyframes bgNeon-1 {
  0% {
    background-color: #36052e;
  }
  80% {
    background-color: #36052e;
  }
  81% {
    background-color: #111;
  }
  94% {
    background-color: #111;
  }
  95% {
    background-color: #36052e;
  }
  96% {
    background-color: #111;
  }
  97% {
    background-color: #36052e;
  }
  98% {
    background-color: #36052e;
  }
  99% {
    background-color: #111;
  }
  100% {
    background-color: #36052e;
  }
}

main.yellow {
  animation: bgNeon-2 3s infinite;
}
main.yellow .input-text {
  color: #FFC107;
}
main.yellow .wrapper h1 {
  animation: neon2-2 3s infinite;
}
main.yellow .wrapper h2 {
  text-shadow: 0 0 10px #FFC107, 0 0 30px #ff4507;
  color: #FFC107;
}
@keyframes neon2-2 {
  0% {
    color: #FFC107;
    text-shadow: 0 0 10px #FFC107, 1px 1px #ffe7a0, 0 0 280px #ff4507;
  }
  80% {
    color: #FFC107;
    text-shadow: 0 0 10px #FFC107, 1px 1px #ffe7a0, 0 0 280px #ff4507;
  }
  81% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  94% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  95% {
    color: #FFC107;
    text-shadow: 0 0 10px #FFC107, 1px 1px #ffe7a0, 0 0 280px #ff4507;
  }
  96% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  97% {
    color: #FFC107;
    text-shadow: 0 0 10px #FFC107, 1px 1px #ffe7a0, 0 0 280px #ff4507;
  }
  98% {
    color: #FFC107;
    text-shadow: 0 0 10px #FFC107, 1px 1px #ffe7a0, 0 0 280px #ff4507;
  }
  99% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  100% {
    color: #FFC107;
    text-shadow: 0 0 10px #FFC107, 1px 1px #ffe7a0, 0 0 280px #ff4507;
  }
}
@keyframes bgNeon-2 {
  0% {
    background-color: #3a0f00;
  }
  80% {
    background-color: #3a0f00;
  }
  81% {
    background-color: #111;
  }
  94% {
    background-color: #111;
  }
  95% {
    background-color: #3a0f00;
  }
  96% {
    background-color: #111;
  }
  97% {
    background-color: #3a0f00;
  }
  98% {
    background-color: #3a0f00;
  }
  99% {
    background-color: #111;
  }
  100% {
    background-color: #3a0f00;
  }
}

main.green {
  animation: bgNeon-3 3s infinite;
}
main.green .input-text {
  color: #8BC34A;
}
main.green .wrapper h1 {
  animation: neon2-3 3s infinite;
}
main.green .wrapper h2 {
  text-shadow: 0 0 10px #8BC34A, 0 0 30px #c3bf4a;
  color: #8BC34A;
}
@keyframes neon2-3 {
  0% {
    color: #8BC34A;
    text-shadow: 0 0 10px #8BC34A, 1px 1px #d5e9bd, 0 0 280px #c3bf4a;
  }
  80% {
    color: #8BC34A;
    text-shadow: 0 0 10px #8BC34A, 1px 1px #d5e9bd, 0 0 280px #c3bf4a;
  }
  81% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  94% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  95% {
    color: #8BC34A;
    text-shadow: 0 0 10px #8BC34A, 1px 1px #d5e9bd, 0 0 280px #c3bf4a;
  }
  96% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  97% {
    color: #8BC34A;
    text-shadow: 0 0 10px #8BC34A, 1px 1px #d5e9bd, 0 0 280px #c3bf4a;
  }
  98% {
    color: #8BC34A;
    text-shadow: 0 0 10px #8BC34A, 1px 1px #d5e9bd, 0 0 280px #c3bf4a;
  }
  99% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  100% {
    color: #8BC34A;
    text-shadow: 0 0 10px #8BC34A, 1px 1px #d5e9bd, 0 0 280px #c3bf4a;
  }
}
@keyframes bgNeon-3 {
  0% {
    background-color: #313010;
  }
  80% {
    background-color: #313010;
  }
  81% {
    background-color: #111;
  }
  94% {
    background-color: #111;
  }
  95% {
    background-color: #313010;
  }
  96% {
    background-color: #111;
  }
  97% {
    background-color: #313010;
  }
  98% {
    background-color: #313010;
  }
  99% {
    background-color: #111;
  }
  100% {
    background-color: #313010;
  }
}

main.blue {
  animation: bgNeon-4 3s infinite;
}
main.blue .input-text {
  color: #03A9F4;
}
main.blue .wrapper h1 {
  animation: neon2-4 3s infinite;
}
main.blue .wrapper h2 {
  text-shadow: 0 0 10px #03A9F4, 0 0 30px #03f4c7;
  color: #03A9F4;
}
@keyframes neon2-4 {
  0% {
    color: #03A9F4;
    text-shadow: 0 0 10px #03A9F4, 1px 1px #92dcfe, 0 0 280px #03f4c7;
  }
  80% {
    color: #03A9F4;
    text-shadow: 0 0 10px #03A9F4, 1px 1px #92dcfe, 0 0 280px #03f4c7;
  }
  81% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  94% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  95% {
    color: #03A9F4;
    text-shadow: 0 0 10px #03A9F4, 1px 1px #92dcfe, 0 0 280px #03f4c7;
  }
  96% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  97% {
    color: #03A9F4;
    text-shadow: 0 0 10px #03A9F4, 1px 1px #92dcfe, 0 0 280px #03f4c7;
  }
  98% {
    color: #03A9F4;
    text-shadow: 0 0 10px #03A9F4, 1px 1px #92dcfe, 0 0 280px #03f4c7;
  }
  99% {
    color: #222;
    text-shadow: 0 0 10px #000, 1px 1px #634a52, -2px 0px 4px #29121A;
  }
  100% {
    color: #03A9F4;
    text-shadow: 0 0 10px #03A9F4, 1px 1px #92dcfe, 0 0 280px #03f4c7;
  }
}
@keyframes bgNeon-4 {
  0% {
    background-color: #012a23;
  }
  80% {
    background-color: #012a23;
  }
  81% {
    background-color: #111;
  }
  94% {
    background-color: #111;
  }
  95% {
    background-color: #012a23;
  }
  96% {
    background-color: #111;
  }
  97% {
    background-color: #012a23;
  }
  98% {
    background-color: #012a23;
  }
  99% {
    background-color: #111;
  }
  100% {
    background-color: #012a23;
  }
}
</style>
<script>
  window.console = window.console || function(t) {};
</script>
<script>
  if (document.location.search.match(/type=embed/gi)) {
    window.parent.postMessage("resize", "*");
  }
</script>
</head>

<body >
	<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />
	  <main class="{{color}}" ng-app="app" ng-controller="neon">
	  <div class="bg"></div>
	  
	  
	  <div class="buttons">
	    <button class="btn-pink" ng-click="getColor('pink')"></button>
	    <button class="btn-yellow" ng-click="getColor('yellow')"></button>
	    <button class="btn-green" ng-click="getColor('green')"></button>
	    <button class="btn-blue" ng-click="getColor('blue')"></button>
	  </div>
	  
	  <div class="wrapper">
	    <h1 class="font1">
	      <span ng-bind="user.name()"></span>
	      <h2 > 영화 같이 보러 갈사람~</h2>
	    </h1>
	  </div>
	  </main>
<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.0/angular.min.js'></script>

<script id="rendered-js" >
var app = angular.module('app', []);

app.controller('neon', function ($scope, $element) {
  var _name = 'Lets See the Movie';
  $scope.user = {
    name: function (newName) {
      return arguments.length ? _name = newName : _name;
    } };

  $scope.getColor = function (color) {
    $scope.color = color;
  };
  var _color = ['pink', 'yellow', 'green', 'blue'];
  $scope.getColor(_color[Math.floor(Math.random() * 3 + 1)]);
});
//# sourceURL=pen.js
    </script>

  

<script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-bb9a2ba1f03f6147732cb3cd52ac86c6b24524aa87a05ed0b726f11e46d7e277.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>

</html>
 
