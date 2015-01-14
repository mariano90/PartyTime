<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title><g:layoutTitle default="Party Time" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link
	href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600"
	rel="stylesheet" type="text/css" />

<link rel="shortcut icon"
	href="${resource(dir: 'images', file: 'favicon.ico')}"
	type="image/x-icon">
<link rel="apple-touch-icon"
	href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
<link rel="apple-touch-icon" sizes="114x114"
	href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">

<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}"
	type="text/css">
<link rel="stylesheet"
	href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">

<!-- New CSSs -->
<noscript>
	<link rel="stylesheet"
		href="${resource(dir: 'css', file: 'skel-noscript.css')}"
		type="text/css" />
	<link rel="stylesheet"
		href="${resource(dir: 'css', file: 'style.css')}" type="text/css" />
	<link rel="stylesheet"
		href="${resource(dir: 'css', file: 'style-wide.css')}" type="text/css" />
</noscript>

<g:layoutHead />
<g:javascript library="application" />
<r:layoutResources />
</head>
<body>

	<div id="header" class="skel-panels-fixed">
		<div class="top">
			<div id="logo">
				<span class="image avatar48"><img src="images/avatar.jpg"
					alt="" /></span>
				<h1 id="title">Usuario</h1>
			</div>
			<nav id="nav">
				<ul>
					<li><a href="http://localhost:8080/main/home/index"
						class="skel-panels-ignoreHref"><span class="fa fa-home">Home</span></a></li>
					<li><a href="http://localhost:8080/main/party/organize"
						class="skel-panels-ignoreHref"><span class="fa fa-group">New
								party </span></a></li>

					<li><a href="#" class="skel-panels-ignoreHref"><span
							class="fa fa-glass">My Parties</span></a></li>
					<li><a href="#" class="skel-panels-ignoreHref"><span
							class="fa fa-search">Bar Search</span></a></li>
					<li><a href="http://localhost:8080/main/news/index"
						class="skel-panels-ignoreHref"><span class="fa fa-glass">News</span></a></li>
					<li><a href="http://localhost:8080/main/user/myinfo"
						class="skel-panels-ignoreHref"><span class="fa fa-gear">Settings</span></a></li>
				</ul>
			</nav>
		</div>
	</div>

	<div id="grailsLogo" role="banner">
		<a href="http://grails.org"><img
			src="${resource(dir: 'images', file: 'grails_logo.png')}"
			alt="Grails" /></a>
	</div>

	<div id="main">
		<g:layoutBody />
	</div>

	<div id="spinner" class="spinner" style="display: none;">
		<g:message code="spinner.alt" default="Loading&hellip;" />
	</div>

	<r:layoutResources />

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
