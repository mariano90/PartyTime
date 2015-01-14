<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="home" />
<title>Welcome to Party Time</title>
<style type="text/css" media="screen">
#status {
	background-color: #eee;
	border: .2em solid #fff;
	margin: 2em 2em 1em;
	padding: 1em;
	width: 12em;
	float: left;
	-moz-box-shadow: 0px 0px 1.25em #ccc;
	-webkit-box-shadow: 0px 0px 1.25em #ccc;
	box-shadow: 0px 0px 1.25em #ccc;
	-moz-border-radius: 0.6em;
	-webkit-border-radius: 0.6em;
	border-radius: 0.6em;
}

#status ul {
	font-size: 0.9em;
	list-style-type: none;
	margin-bottom: 0.6em;
	padding: 0;
}

#status li {
	line-height: 1.3;
}

#status h1 {
	text-transform: uppercase;
	font-size: 1.1em;
	margin: 0 0 0.3em;
}

#page-body {
	margin: 2em 1em 1.25em 18em;
}

h2 {
	margin-top: 1em;
	margin-bottom: 0.3em;
	font-size: 1em;
}

p {
	line-height: 1.5;
	margin: 0.25em 0;
}

#controller-list ul {
	list-style-position: inside;
}

#controller-list li {
	line-height: 1.3;
	list-style-position: inside;
	margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
	#status {
		display: none;
	}
	#page-body {
		margin: 0 1em 1em;
	}
	#page-body h1 {
		margin-top: 0;
	}
}
</style>
</head>
<body>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/home/index')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" controller="Party" action="organize">
					<g:message code="New Party" />
				</g:link></li>
			<li><g:link class="list" controller="News" action="index">
					<g:message code="News" />
				</g:link></li>
			<li><g:link class="" controller="User" action="myinfo">
					<g:message code="Profile" />
				</g:link></li>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="Debug Tools" /></a></li>
		</ul>
	</div>
	<div id="page-body" role="main">
		<h1>Welcome to Party Time</h1>

		<br />
		<br /> TODO: mostrar las fiestas que estan por suceder manana o
		pasado manana a las cuales el usuario esta inscripto. <br />
		<br /> TODO: mostrar publicidad dirigida. <br /> <br /> TODO:
		mostrar las fiestas publicas a las cuales el usuario puede asistir sin
		estar invitado. <br /> <br /> TODO: mostrar nivel del usuario,
		permio a destrabar en el proximo nivel.
	</div>
</body>
</html>
