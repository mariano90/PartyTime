<!DOCTYPE HTML>

<html lang="en">
<head>
<title><g:layoutTitle default="Party Time" /></title>

<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />

<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600"
	rel="stylesheet" type="text/css" />

<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'skel-noscript.css')}"
	type="text/css" />
<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}"
	type="text/css" />
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'style-wide.css')}" type="text/css" />

<g:layoutHead />
</head>

<body>

	<!-- Header -->
	<div id="header" class="skel-panels-fixed">

		<div class="top">

			<!-- Logo -->
			<div id="logo">
				<span class="image avatar48"><img src="images/avatar.jpg"
					alt="" /></span>
				<h1 id="title">Mariano Sanchez</h1>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="http://localhost:8080/main/home/login"
						class="skel-panels-ignoreHref"><span
							class="fa fa-home">Login</span></a></li>
					<li><a href="http://localhost:8080/main/home/signup"
						class="skel-panels-ignoreHref"><span
							class="">Signup</span></a></li>
					<li><a href="http://localhost:8080/main/home/about"
						class=""><span
							class="fa fa-music">About</span></a></li>
					<li><a href="http://localhost:8080/main/authentication/index"
						class=""><span
							class="fa fa-music">Old login</span></a></li>
				</ul>
			</nav>
		</div>
	</div>

	<!-- Main -->
	<div id="main" style="background-color: #f7f7f7;">
		<g:layoutBody />
	</div>

	<!--  Footer -->
	<div id="footer">

		<div class="copyright">
			<p>&copy; 2014 Mariano&Fabricio. All rights reserved.</p>
			<ul class="menu">
				<li>PARTY TIME, ENJOY IT!</li>
			</ul>
		</div>

	</div>
</body>
</html>
