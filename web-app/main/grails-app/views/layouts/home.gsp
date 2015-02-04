
<%@ page import="com.partytime.User"%>

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

<%--	<script type="text/javascript" src="${resource(dir:'js', file:'jquery.min.js')}" ></script>--%>
<%--	<script type="text/javascript" src="${resource(dir:'js', file:'skel.min.js')}" ></script>--%>
<%--	<script type="text/javascript" src="${resource(dir:'js', file:'skel-panels.min.js')}" ></script>--%>
<%--	<script type="text/javascript" src="${resource(dir:'js', file:'init.js')}" ></script>--%>

<%-- CSS DE GRAILS --%>
<%--		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">  --%>
<%--		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">--%>

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
				<span class="image avatar48">
					<img src="images/${User.getMyUser().toString()}.jpg"
						alt=""/>
				</span>
				<h1 id="title">${User.getMyUser().toString()}</h1>
				<form action="/main/authentication/logout" method="post">
					<input type="hidden" name="success_controller"
						value="home" id="success_controller">
					<input type="hidden" name="success_action"
						value="index" id="success_action">
					<input type="hidden" name="error_controller"
						value="home" id="error_controller">
					<input type="hidden" name="error_action"
						value="error" id="error_action">
			    	<input type="submit" name="_action_Log out" value="Log out"> 
			</form>
			</div>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="http://localhost:8080/main/home/index"
						id="home-link" class="skel-panels-ignoreHref"><span
							class="fa fa-home">Home</span></a></li>
					<li><a href="http://localhost:8080/main/party/organize"
						id="my-parties-link" class="skel-panels-ignoreHref"><span
							class="fa fa-create">New party</span></a></li>
					<li><a href="http://localhost:8080/main/party/mine"
						id="my-parties-link" class="skel-panels-ignoreHref"><span
							class="fa fa-music">My parties</span></a></li>
							<li><a href="http://localhost:8080/main/party/invited"
						id="my-parties-link" class="skel-panels-ignoreHref"><span
							class="fa fa-music">My invitations</span></a></li>
					<li><a href="http://localhost:8080/main/drink/mine"
						id="my-drinks-link" class="skel-panels-ignoreHref"><span
							class="fa fa-beer">My Drinks</span></a></li>
					<li><a href="http://localhost:8080/main/bar/search"
						id="bar-search-link" class="skel-panels-ignoreHref"><span
							class="fa fa-search">Bar Search</span></a></li>
					<li><a href="http://localhost:8080/main/news/all"
						id="bar-search-link" class="skel-panels-ignoreHref"><span
							class="fa fa-list-alt">News</span></a></li>
					<li><a href="http://localhost:8080/main/user/settings"
						id="settings-link" class="skel-panels-ignoreHref"><span
							class="fa fa-gear">Settings</span></a></li>
					<li><a href="http://localhost:8080/main/" class="skel-panels-ignoreHref">
						<span class="fa fa-gear">Debug</span></a></li>
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
			<p>&copy; Open source.</p>
			<ul class="menu">
				<li>PARTY TIME, ENJOY IT!</li>
			</ul>
		</div>

	</div>
</body>
</html>
