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
	<div id="header" class="skel-panels-fixed">
		<div class="top">
			<nav id="nav">
				<ul>
					<li>
						<a href="http://localhost:8080/main/home/login" class="skel-panels-ignoreHref">
							<span class="fa fa-home">Login</span></a>
					</li>
					<li>
						<a href="http://localhost:8080/main/home/signup" class="skel-panels-ignoreHref">
							<span class="">Signup</span></a>
					</li>
					<li>
						<a href="http://localhost:8080/main/home/about" class="">
							<span class="fa fa-music">About</span></a>
					</li>
					<li>
						<a href="http://localhost:8080/main/" class="skel-panels-ignoreHref">
							<span class="fa fa-gear">Debug</span></a>
					</li>
					<li>
						<a href="http://localhost:8080/main/authentication/index" class="">
							<span class="">Old login</span></a>
					</li>
				</ul>
			</nav>
		</div>
	</div>

	<div id="main" style="background-color: #f7f7f7;">
		<g:layoutBody />
	</div>

	<div id="footer">
		<div class="copyright">
			<p>&copy; Open source.</p>
			<ul class="menu">
				<li>PARTY TIME, ENJOY IT!</li>
			</ul>
		</div>
	</div>
</body>
</html>
