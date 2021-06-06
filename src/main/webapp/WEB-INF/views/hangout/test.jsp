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

html,
body,
div,
span,
applet,
object,
iframe,
h1,
h2,
h3,
h4,
h5,
h6,
p,
blockquote,
pre,
a,
abbr,
acronym,
address,
big,
cite,
code,
del,
dfn,
em,
img,
ins,
kbd,
q,
s,
samp,
small,
strike,
strong,
sub,
sup,
tt,
var,
b,
u,
i,
center,
dl,
dt,
dd,
ol,
ul,
li,
fieldset,
form,
label,
legend,
table,
caption,
tbody,
tfoot,
thead,
tr,
th,
td,
article,
aside,
canvas,
details,
embed,
figure,
figcaption,
footer,
header,
hgroup,
menu,
nav,
output,
ruby,
section,
summary,
time,
mark,
audio,
video {
    margin: 0;
    padding: 0;
    border: 0;
    font-size: 100%;  
}



body {
    line-height: 1
}

ol,
ul {
    list-style: none
}

blockquote,
q {
    quotes: none
}

blockquote:before,
blockquote:after,
q:before,
q:after {
    content: '';
    content: none
}

table {
    border-collapse: collapse;
    border-spacing: 0
}
html {height:100%;width:100%;}
body {
    background: rgba(44, 62, 80, 0.92);
    color: #fff;
    font-size: 14px;
    font-family: 'Open Sans', sans-serif, 'trebuhet ms', HelveticaNeue, arial;
    height: 100%;
    line-height: 20px
}

* {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    -o-box-sizing: border-box;
    -ms-box-sizing: border-box;
    box-sizing: border-box
}

p {
    line-height: 2.0em
}

h1 {
    font-size: 3.0em;
    line-height: 40px
}

a {
    text-decoration: none;
    color: rgba(74, 92, 110, 0.92)
}

a:hover {
    color: #fff
}

img {
    max-width: 100%
}

.pull-right {
    float: right
}

.pull-left {
    float: left
}

header {
    padding: 30px 20px;
    background: rgba(64, 82, 100, 0.92);
    color: #ffffff;
    margin-bottom: 20px
}

.btn-download {
    background: rgba(24, 42, 60, 0.92);
    color: rgba(124, 142, 160, 0.92);
    padding: 20px 50px;
    display: inline-block;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    -o-border-radius: 5px;
    -ms-border-radius: 5px;
    border-radius: 5px
}

.btn-download:hover {
    background: rgba(94, 112, 130, 0.92)
}

.wrapper {
    max-width: 1000px;
    margin: 0 auto
}

.wrapper:before,
.wrapper:after {
    content: '';
    display: table;
    clear: both
}

footer {
    margin-top: 30px;
    background: rgba(24, 42, 60, 0.92);
    color: rgba(124, 142, 160, 0.92);
    padding: 20px 0;
    text-align: left;
    font-size: 0.9em
}

@keyframes anima {
    from {
        margin-top: -50px;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
        filter: alpha(opacity=0);
        -moz-opacity: 0;
        -khtml-opacity: 0;
        opacity: 0
    }
    to {
        margin: auto;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
        filter: alpha(opacity=100);
        -moz-opacity: 1;
        -khtml-opacity: 1;
        opacity: 1
    }
}

@-webkit-keyframes anima {
    from {
        margin-left: -20px;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
        filter: alpha(opacity=0);
        -moz-opacity: 0;
        -khtml-opacity: 0;
        opacity: 0
    }
    to {
        margin-left: 10px;
        -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
        filter: alpha(opacity=100);
        -moz-opacity: 1;
        -khtml-opacity: 1;
        opacity: 1
    }
}



.pic {
    max-width: 300px;
    max-height: 200px;
    position: relative;
    overflow: hidden;
    margin: 10px;
    display: inline-block;
    -webkit-animation: anima 2s;
    -moz-animation: anima 2s;
    -o-animation: anima 2s;
    -ms-animation: anima 2s;
    animation: anima 2s;
    -webkit-backface-visibility: hidden;
    -moz-backface-visibility: hidden;
    -o-backface-visibility: hidden;
    -ms-backface-visibility: hidden;
    backface-visibility: hidden;
  

}

.pic-3d {
    -webkit-perspective: 500;
    -moz-perspective: 500;
    -o-perspective: 500;
    -ms-perspective: 500;
    perspective: 500;
    -webkit-transform-style: preserve-3d;
    -moz-transform-style: preserve-3d;
    -o-transform-style: preserve-3d;
    -ms-transform-style: preserve-3d;
    transform-style: preserve-3d
}

.pic-caption {
    cursor: default;
    position: absolute;
    width: 100%;
    height: 100%;
    background: rgba(44, 62, 80, 0.92);
    padding: 10px;
    text-align: center;
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
    filter: alpha(opacity=0);
    -moz-opacity: 0;
    -khtml-opacity: 0;
    opacity: 0
}

.pic-image {
    -webkit-transform: scale(1.1);
    -moz-transform: scale(1.1);
    -o-transform: scale(1.1);
    -ms-transform: scale(1.1);
    transform: scale(1.1)
}

.pic:hover .pic-image {
    -webkit-transform: scale(1);
    -moz-transform: scale(1);
    -o-transform: scale(1);
    -ms-transform: scale(1);
    transform: scale(1)
}

.pic-title {
    font-size: 1.8em
}

a,
a:hover,
.pic .pic-image,
.pic-caption,
.pic:hover .pic-caption,
.pic:hover img {
    -webkit-transition: all 0.5s ease;
    -moz-transition: all 0.5s ease;
    -o-transition: all 0.5s ease;
    -ms-transition: all 0.5s ease;
    transition: all 0.5s ease
}

.pic:hover .bottom-to-top,
.pic:hover .top-to-bottom,
.pic:hover .left-to-right,
.pic:hover .right-to-left,
.pic:hover .rotate-in,
.pic:hover .rotate-out,
.pic:hover .open-up,
.pic:hover .open-down,
.pic:hover .open-left,
.pic:hover .open-right,
.pic:hover .come-left,
.pic:hover .come-right {
    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=($opacity * 100))";
    filter: alpha(opacity=100);
    -moz-opacity: 1;
    -khtml-opacity: 1;
    opacity: 1;
    -webkit-user-select: none;
    -moz-user-select: none;
    -o-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-touch-callout: none;
    -moz-touch-callout: none;
    -o-touch-callout: none;
    -ms-touch-callout: none;
    touch-callout: none;
    -webkit-tap-highlight-color: transparent;
    -moz-tap-highlight-color: transparent;
    -o-tap-highlight-color: transparent;
    -ms-tap-highlight-color: transparent;
    tap-highlight-color: transparent
}

.bottom-to-top {
    top: 50%;
    left: 0
}

.pic:hover .bottom-to-top {
    top: 0;
    left: 0
}

.top-to-bottom {
    bottom: 50%;
    left: 0
}

.pic:hover .top-to-bottom {
    left: 0;
    bottom: 0
}

.left-to-right {
    top: 0;
    right: 50%
}

.pic:hover .left-to-right {
    right: 0;
    top: 0
}

.right-to-left {
    top: 0;
    left: 50%
}

.pic:hover .right-to-left {
    left: 0;
    top: 0
}

.rotate-in {
    -webkit-transform: rotate(90deg) scale(0.1);
    -moz-transform: rotate(90deg) scale(0.1);
    -o-transform: rotate(90deg) scale(0.1);
    -ms-transform: rotate(90deg) scale(0.1);
    transform: rotate(90deg) scale(0.1);
    top: 0;
    left: 0
}

.pic:hover .rotate-in {
    -webkit-transform: rotate(360deg) scale(1);
    -moz-transform: rotate(360deg) scale(1);
    -o-transform: rotate(360deg) scale(1);
    -ms-transform: rotate(360deg) scale(1);
    transform: rotate(360deg) scale(1)
}

.rotate-out {
    -webkit-transform: rotate(90deg) scale(3);
    -moz-transform: rotate(90deg) scale(3);
    -o-transform: rotate(90deg) scale(3);
    -ms-transform: rotate(90deg) scale(3);
    transform: rotate(90deg) scale(3);
    top: 0;
    left: 0
}

.pic:hover .rotate-out {
    -webkit-transform: rotate(360deg) scale(1);
    -moz-transform: rotate(360deg) scale(1);
    -o-transform: rotate(360deg) scale(1);
    -ms-transform: rotate(360deg) scale(1);
    transform: rotate(360deg) scale(1)
}

.open-down {
    -webkit-transform: rotateX(-180deg);
    -moz-transform: rotateX(-180deg);
    -o-transform: rotateX(-180deg);
    -ms-transform: rotateX(-180deg);
    transform: rotateX(-180deg);
    top: 0;
    left: 0
}

.pic:hover .open-down {
    -webkit-transform: rotateX(0);
    -moz-transform: rotateX(0);
    -o-transform: rotateX(0);
    -ms-transform: rotateX(0);
    transform: rotateX(0)
}

.open-up {
    -webkit-transform: rotateX(180deg);
    -moz-transform: rotateX(180deg);
    -o-transform: rotateX(180deg);
    -ms-transform: rotateX(180deg);
    transform: rotateX(180deg);
    top: 0;
    left: 0
}

.pic:hover .open-up {
    -webkit-transform: rotateX(0);
    -moz-transform: rotateX(0);
    -o-transform: rotateX(0);
    -ms-transform: rotateX(0);
    transform: rotateX(0)
}

.open-left {
    -webkit-transform: rotateY(180deg);
    -moz-transform: rotateY(180deg);
    -o-transform: rotateY(180deg);
    -ms-transform: rotateY(180deg);
    transform: rotateY(180deg);
    left: 0;
    top: 0
}

.pic:hover .open-left {
    -webkit-transform: rotateY(0deg);
    -moz-transform: rotateY(0deg);
    -o-transform: rotateY(0deg);
    -ms-transform: rotateY(0deg);
    transform: rotateY(0deg)
}

.open-right {
    -webkit-transform: rotateY(-180deg);
    -moz-transform: rotateY(-180deg);
    -o-transform: rotateY(-180deg);
    -ms-transform: rotateY(-180deg);
    transform: rotateY(-180deg);
    left: 0;
    top: 0
}

.pic:hover .open-right {
    -webkit-transform: rotateY(0deg);
    -moz-transform: rotateY(0deg);
    -o-transform: rotateY(0deg);
    -ms-transform: rotateY(0deg);
    transform: rotateY(0deg)
}

.come-left {
    -webkit-transform: rotateY(90deg) rotateX(90deg);
    -moz-transform: rotateY(90deg) rotateX(90deg);
    -o-transform: rotateY(90deg) rotateX(90deg);
    -ms-transform: rotateY(90deg) rotateX(90deg);
    transform: rotateY(90deg) rotateX(90deg);
    left: 0;
    top: 0
}

.pic:hover .come-left {
    -webkit-transform: rotateY(0) rotateX(0);
    -moz-transform: rotateY(0) rotateX(0);
    -o-transform: rotateY(0) rotateX(0);
    -ms-transform: rotateY(0) rotateX(0);
    transform: rotateY(0) rotateX(0)
}

.come-right {
    -webkit-transform: rotateY(-90deg) rotateX(-90deg);
    -moz-transform: rotateY(-90deg) rotateX(-90deg);
    -o-transform: rotateY(-90deg) rotateX(-90deg);
    -ms-transform: rotateY(-90deg) rotateX(-90deg);
    transform: rotateY(-90deg) rotateX(-90deg);
    left: 0;
    top: 0
}

.pic:hover .come-right {
    -webkit-transform: rotateY(0) rotateX(0);
    -moz-transform: rotateY(0) rotateX(0);
    -o-transform: rotateY(0) rotateX(0);
    -ms-transform: rotateY(0) rotateX(0);
    transform: rotateY(0) rotateX(0)
}

@media screen and (max-width: 560px) {
    .pic {
        max-width: 400px;
        max-height: 300px;
        display: block;
        -webkit-animation: none;
        -moz-animation: none;
        -o-animation: none;
        -ms-animation: none;
        animation: none;
        margin: 10px auto
    }
}
</style>
<script>

</script>


</head>

<body >
	<jsp:include page="/WEB-INF/views/commons/global_nav.jsp" />
	  <article class="htmleaf-container">
        <section class="wrapper cl">
            <!--Effect: Bottom to Top -->
            <div class="pic">
                <img src="https://unsplash.it/300/200?image=931" class="pic-image" alt="Pic">
                <span class="pic-caption bottom-to-top">
            <h1 class="pic-title">Bottom to Top</h1>
            <p>Hi, this is a simple example =D</p>
        </span>
            </div>
            <!--Effect: Top to Bottom -->
            <div class="pic">
                <img src="https://unsplash.it/300/200?image=902" class="pic-image" alt="Pic">
                <span class="pic-caption top-to-bottom">
            <h1 class="pic-title">Top to Bottom</h1>
            <p>Hi, this is a simple example =D</p>
        </span>
            </div>
            <!--Effect: Left to Right -->
            <div class="pic">
                <img src="https://unsplash.it/300/200?image=903" class="pic-image" alt="Pic">
                <span class="pic-caption left-to-right">
            <h1 class="pic-title">Left to Right</h1>
            <p>Hi, this is a simple example =D</p>
        </span>
            </div>
            <!--Effect: Right to Left -->
            <div class="pic">
                <img src="https://unsplash.it/300/200?image=904" class="pic-image" alt="Pic">
                <span class="pic-caption right-to-left">
            <h1 class="pic-title">Right to Left</h1>
            <p>Hi, this is a simple example =D</p>
        </span>
            </div>
            <!--Effect: Rotate More -->
            <div class="pic">
                <img src="https://unsplash.it/300/200?image=910" class="pic-image" alt="Pic">
                <span class="pic-caption rotate-in">
            <h1 class="pic-title">Rotate In</h1>
            <p>Hi, this is a simple example =D</p>
        </span>
            </div>
            <!--Effect: Rotate LESS -->
            <div class="pic">
                <img src="https://unsplash.it/300/200?image=912" class="pic-image" alt="Pic">
                <span class="pic-caption rotate-out">
            <h1 class="pic-title">Rotate Out</h1>
            <p>Hi, this is a simple example =D</p>
        </span>
            </div>
            <!--Effect: Open Up -->
            <div class="pic pic-3d">
                <img src="https://unsplash.it/300/200?image=913" class="pic-image" alt="Pic">
                <span class="pic-caption open-up">
            <h1 class="pic-title">Open Up</h1>
            <p>Hi, this is a simple example =D</p>
        </span>
            </div>
            <!--Effect: Open Down -->
            <div class="pic pic-3d">
                <img src="https://unsplash.it/300/200?image=914" class="pic-image" alt="Pic">
                <span class="pic-caption open-down">
            <h1 class="pic-title">Open Down</h1>
            <p>Hi, this is a simple example =D</p>
        </span>
            </div>
            <!--Effect: Open Left -->
            <div class="pic pic-3d">
                <img src="https://unsplash.it/300/200?image=905" class="pic-image" alt="Pic">
                <span class="pic-caption open-left">
            <h1 class="pic-title">Open Left</h1>
            <p>Hi, this is a simple example =D</p>
        </span>
            </div>
            <!--Effect: Open Right -->
            <div class="pic pic-3d">
                <img src="https://unsplash.it/300/200?image=918" class="pic-image" alt="Pic">
                <span class="pic-caption open-right">
            <h1 class="pic-title">Open Right</h1>
            <p>Hi, this is a simple example =D</p>
        </span>
            </div>
            <!--Effect: Come Left -->
            <div class="pic pic-3d">
                <img src="https://unsplash.it/300/200?image=919" class="pic-image" alt="Pic">
                <span class="pic-caption come-left">
            <h1 class="pic-title">Come Left</h1>
            <p>Hi, this is a simple example =D</p>
        </span>
            </div>
            <!--Effect: Come Right -->
            <div class="pic pic-3d">
                <img src="https://unsplash.it/300/200?image=932" class="pic-image" alt="Pic">
                <span class="pic-caption come-right">
            <h1 class="pic-title">Come Right</h1>
            <p>Hi, this is a simple example =D</p>
        </span>
            </div>
        </section>
       
      
    </article>
<script src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-157cd5b220a5c80d4ff8e0e70ac069bffd87a61252088146915e8726e5d9f147.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/angular.js/1.5.0/angular.min.js'></script>


<script src="https://cpwebassets.codepen.io/assets/editor/iframe/iframeRefreshCSS-bb9a2ba1f03f6147732cb3cd52ac86c6b24524aa87a05ed0b726f11e46d7e277.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>

</html>
 
