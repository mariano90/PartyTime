<!DOCTYPE HTML>

<html lang="en">
	<head>
		<title><g:layoutTitle default="Party Time"/></title>
		
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		
		<link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600" rel="stylesheet" type="text/css" />
		
<%--		<script type="text/javascript" src="${resource(dir:'js', file:'jquery.min.js')}" ></script>--%>
<%--		<script type="text/javascript" src="${resource(dir:'js', file:'skel.min.js')}" ></script>--%>
<%--		<script type="text/javascript" src="${resource(dir:'js', file:'skel-panels.min.js')}" ></script>--%>
<%--		<script type="text/javascript" src="${resource(dir:'js', file:'init.js')}" ></script>--%>
<%--		<script type="text/javascript" src="${resource(dir:'js', file:'menu_functions.js')}" ></script>--%>

		<%-- CSS DE GRAILS --%>
<%--		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">  --%>
<%--		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">--%>
			
			<link rel="stylesheet" href="${resource(dir: 'css', file: 'skel-noscript.css')}" type="text/css"/>
			<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css"/>
			<link rel="stylesheet" href="${resource(dir: 'css', file: 'style-wide.css')}" type="text/css"/>
		
		<g:layoutHead/>
	</head>
	
	<body>

		<!-- Header -->
			<div id="header" class="skel-panels-fixed">

				<div class="top">

					<!-- Logo -->
						<div id="logo">
							<span class="image avatar48"><img src="images/avatar.jpg" alt="" /></span>
							<h1 id="title">Mariano Sanchez</h1>
						</div>

					<!-- Nav -->
						<nav id="nav">
							<ul>
								<li><a href="http://localhost:8080/main/home/index" id="home-link" class="skel-panels-ignoreHref"><span class="fa fa-home">Home</span></a></li>
								<li><a href="http://localhost:8080/main/party/organize" id="my-parties-link" class="skel-panels-ignoreHref"><span class="fa fa-create">New party</span></a></li>
								<li><a href="http://localhost:8080/main/party/mine" id="my-parties-link" class="skel-panels-ignoreHref"><span class="fa fa-music">My Parties</span></a></li>
								<li><a href="http://localhost:8080/main/drink/mine" id="my-drinks-link" class="skel-panels-ignoreHref"><span class="fa fa-beer">My Drinks</span></a></li>
								<li><a href="http://localhost:8080/main/bar/search" id="bar-search-link" class="skel-panels-ignoreHref"><span class="fa fa-search">Bar Search</span></a></li>
								<li><a href="http://localhost:8080/main/news/all" id="bar-search-link" class="skel-panels-ignoreHref"><span class="fa fa-list-alt">News</span></a></li>
								<li><a href="http://localhost:8080/main/user/settings" id="settings-link" class="skel-panels-ignoreHref"><span class="fa fa-gear">Settings</span></a></li>
								<li><a href="http://localhost:8080/main/" class="skel-panels-ignoreHref"><span class="fa fa-gear">Debug</span></a></li>
							</ul>
						</nav>
						
				</div>
				
			
			</div>

		<!-- Main -->
			<div id="main" style="background-color: #f7f7f7;">
				
					<g:layoutBody/>
					
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
