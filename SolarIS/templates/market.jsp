<!DOCTYPE HTML>
<!--
	Industrious by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
    $( document ).ready( function() {
        $.ajax ({
            type : "GET",                     // GET 또는 POST
            url : '/get_product_list',          // 서버측에서 가져올 페이지
            timeout : 5000,                  // 응답대기시간
            dataType : 'html',               // html , javascript, text, xml, jsonp 등이 있다
            success : function(data) {     // 정상적으로 완료되었을 경우에 실행된다
                $(".deal-list").append(data);
            },
            error : function(request, status, error ) {   // 오류가 발생했을 때 호출된다.
                console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
            },
            complete : function () {   // 정상이든 비정상인든 실행이 완료될 경우 실행될 함수
            }
        });
    } );
</script>

<html>
<head>
	<title>Industrious by TEMPLATED</title>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
	<meta name="description" content="" />
	<meta name="keywords" content="" />
	<link rel="stylesheet" href="static/css/market.css" />
	<style type="text/css">
    li div a {
        color:#222222;
    }
    li div.areas{
        margin : 10px;
        height: 100px;
    }

    li div.title{
        margin : 0px 5px 0px 5px;
    }

    .prices {
        font-size : 20pt; text-align : right;
    }
    ul.deal-list {
    	list-style: none;
    	margin: 0px;
    	padding: 0px;
    	width: 100%;
    }
    ul.deal-list li {
		display: inline-block;
		padding: 0px;
    	margin: 10px;
    	border: 2px solid #888888;
    	cursor: pointer;
    	width: 350px;
    	height: 550px;
    	overflow : hidden;
    }
    div.deal-inner div.img {
    	text-align:center;
    }
    div.deal-inner div.img img {
    	width: 95%;
    	margin: 1px;

    }
    div.btns .order_bt{
        width: $('ul.deal-list li').width;
        margin : 10px 10px 10px 15px;
    }
    div.prices span.left {
        float:left;
        text-align : left;
        font-size : 10pt;
    }
	</style>
</head>
<body class="is-preload">

<!-- Header -->
<header id="header">
	<a class="logo" href="index.html">Industrious</a>
	<nav>
		<a href="#menu">Menu</a>
	</nav>
</header>

<!-- Header -->
			<header id="header">
				<a class="logo" href="home"><img src="static/images/solar.png" alt="" width="130" height="70"></a>
				<a class="logo" href="LocationRating">사업부지 입지등급·참고자료 </a>
				<a class="logo" href="simulation">수익성·발전량 시뮬레이션</a>
				<a class="logo" href="market">장비 구축 및 판매 업체 연계</a>
				<a class="logo" href="login">웹 모니터링</a>
				<nav>
					<a href="#menu">Menu</a>
				</nav>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="LocationRating">사업부지 입지등급·참고자료</a></li>
					<li><a href="simulation">수익성·발전량 시뮬레이션</a></li>
					<li><a href="market">장비 구축 및 판매 업체</a></li>
					<li><a href="login">웹 모니터링(사업자)</a></li>
				</ul>
			</nav>

<!-- Heading -->
<div id="heading" >
	<h1>MARKET</h1>
</div>

<!-- Market List-->
<ul class="deal-list" id="dealListDiv">

</ul>
<<<<<<< HEAD
<!-- Footer -->
         <footer id="footer">
            <div class="inner">
               <div class="content">
                  <section>
                     <h3>(주)좋아해컴퍼니</h3>
                     <p>대표이사: 심민기<br>경기도 성남시 분당구 성남대로 343번길 9</p>
                     <p>© 2019 (주)좋아해컴퍼니 All rights reserved</p>
                  </section>
                  <section>
					  <h3> <br> </h3>
					  <p>사업자 등록번호 774-05-01254<br>Tech Center:02-3333-2222</p>
                  </section>
				   <section>

				   </section>
                  <section>
                     <ul class="plain">
						 <br>
                        <li><i class="icon fa-facebook">&nbsp;</i>Facebook</li>
                        <li><i class="icon fa-instagram">&nbsp;</i>Instagram</li>
                        <li><i class="icon fa-github">&nbsp;</i>Github</li>
                     </ul>
                  </section>
               </div>
            </div>
         </footer>


<!-- Scripts -->
<script src="static/js/jquery.min.js"></script>
<script src="static/js/browser.min.js"></script>
<script src="static/js/breakpoints.min.js"></script>
<script src="static/js/util.js"></script>
<script src="static/js/main.js"></script>

</body>
</html>


