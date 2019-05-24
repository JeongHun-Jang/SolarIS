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
    	padding: 10px;
    	margin-bottom: 5px;
    	border: 2px solid #888888;
    	cursor: pointer;
    	width: 24%;
    	height: 100%;
    }
    div.deal-inner div.img img {
    	width: 100%;
    	border: 4px solid #888888;
    }
    div.btns .order_bt{
        width: $('ul.deal-list li').width;
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
	<a class="logo" href="home">Home</a>
    <a class="logo" href="LocationRating">사업부지 입지등급</a>
    <a class="logo" href="LocationRating">지역별 기후 및 참고자료</a>
    <a class="logo" href="market">장비 구축 및 판매 업체 연계</a>
    <a class="logo" href="simulation">수익성·발전량 시뮬레이션</a>
    <a class="logo" href="login">웹 모니터링</a>
	<nav>
		<a href="#menu">Menu</a>
	</nav>
</header>
<!-- Nav -->
<nav id="menu">
	<ul class="links">
		<li><a href="LocationRating">사업부지 및 입지등급</a></li>
        <li><a href="LocationRating">지역별 기후 및 참고자료</a></li>
        <li><a href="market">장비 구축 및 판매 업체</a></li>
        <li><a href="simulation">수익성·발전량 시뮬레이션</a></li>
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
<!-- Footer -->
<footer id="footer">
	<div class="inner">
		<div class="content">
			<section>
				<h3>Accumsan montes viverra</h3>
				<p>Nunc lacinia ante nunc ac lobortis. Interdum adipiscing gravida odio porttitor sem non mi integer non faucibus ornare mi ut ante amet placerat aliquet. Volutpat eu sed ante lacinia sapien lorem accumsan varius montes viverra nibh in adipiscing. Lorem ipsum dolor vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing sed feugiat eu faucibus. Integer ac sed amet praesent. Nunc lacinia ante nunc ac gravida.</p>
			</section>
			<section>
				<h4>Sem turpis amet semper</h4>
				<ul class="alt">
					<li><a href="#">Dolor pulvinar sed etiam.</a></li>
					<li><a href="#">Etiam vel lorem sed amet.</a></li>
					<li><a href="#">Felis enim feugiat viverra.</a></li>
					<li><a href="#">Dolor pulvinar magna etiam.</a></li>
				</ul>
			</section>
			<section>
				<h4>Magna sed ipsum</h4>
				<ul class="plain">
					<li><a href="#"><i class="icon fa-twitter">&nbsp;</i>Twitter</a></li>
					<li><a href="#"><i class="icon fa-facebook">&nbsp;</i>Facebook</a></li>
					<li><a href="#"><i class="icon fa-instagram">&nbsp;</i>Instagram</a></li>
					<li><a href="#"><i class="icon fa-github">&nbsp;</i>Github</a></li>
				</ul>
			</section>
		</div>
		<div class="copyright">
			&copy; Untitled. Photos <a href="https://unsplash.co">Unsplash</a>, Video <a href="https://coverr.co">Coverr</a>.
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


