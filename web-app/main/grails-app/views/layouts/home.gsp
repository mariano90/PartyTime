
<%@ page import="com.partytime.User"%>

<!DOCTYPE HTML>
<html lang="en">
  <head>
    <title>
      <g:layoutTitle default="Party Time" />
    </title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <link href="http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,300,400,600"
        rel="stylesheet" type="text/css" />
    	
    <script type="text/javascript" src="${resource(dir:'js', file:'jquery-1.11.0.js')}" ></script>
    <script type="text/javascript" src="${resource(dir:'js', file:'jquery-ui-1.10.4.custom.js')}" ></script>
    <script type="text/javascript" src="${resource(dir:'js', file:'jquery.datetimepicker.js')}" ></script>
    <script type="text/javascript" src="${resource(dir:'js', file:'skel.min.js')}" ></script>	
    <script type="text/javascript" src="${resource(dir:'js', file:'skel-panels.min.js')}" ></script>
	<script type="text/javascript" src="${resource(dir:'js', file:'init.js')}" ></script>
	<script type="text/javascript" src="${resource(dir:'js', file:'bootstrap.js')}" ></script>
    <noscript>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'skel-noscript.css')}" type="text/css"/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css"/>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style-wide.css')}" type="text/css"/>
		
	</noscript>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery-ui-1.10.4.custom.css')}" type="text/css"/>
	<link rel="stylesheet" href="${resource(dir: 'css', file: 'jquery.datetimepicker.css')}" type="text/css"/>
<%--	<link rel="stylesheet" href="${resource(dir: 'css', file: 'bootstrap.css')}" type="text/css"/>--%>
    <g:layoutHead />
    </head>
    <body>
      <div id="header" class="skel-panels-fixed">
        <div class="top">
          <div id="logo">
            <% def myself = User.getMyUser()%>
            <span class="image avatar48">
              <img src="${resource(dir: 'images/profile', file: myself.getProfilePicture())}"
                alt="Profile" />
            </span>
            <h1 id="title">
              <g:link style="padding-left:50px" controller="user" action="details" id="${myself.id}">
                ${myself.toString()}
              </g:link>
            </h1>
            <form action="/main/authentication/logout" method="post">
              <input type="hidden" name="success_controller"
                value="home" id="success_controller">
              <input type="hidden" name="success_action"
                value="index" id="success_action">
              <input type="hidden" name="error_controller"
                value="home" id="error_controller">
              <input type="hidden" name="error_action"
                value="error" id="error_action">
              <input type="submit" name="_action_Log out" value="Log out" class="buttonsmall">
            </form>
          </div>
            
            <nav id="nav">
              <ul>
                <li>
                  <a href="http://localhost:8080/main/home/index"
                      id="home-link" class="skel-panels-ignoreHref">
                    <span class="fa fa-home">
                      Home
                    </span>
                  </a>
                </li>
                <li>
                  <a href="http://localhost:8080/main/party/organize"
                      id="my-parties-link" class="skel-panels-ignoreHref">
                    <span class="fa fa-music">
                      New party
                    </span>
                  </a>
                </li>
                <li>
                  <a href="http://localhost:8080/main/party/mine"
                  id="my-parties-link" class="skel-panels-ignoreHref">
                    <span class="fa fa-user">
                      My parties
                    </span>
                  </a>
                </li>
                <li>
                  <a href="http://localhost:8080/main/party/invited"
                  id="my-parties-link" class="skel-panels-ignoreHref">
                    <span
                    class="fa fa-bookmark">
                      My invitations
                    </span>
                  </a>
                </li>
                <li>
                  <a href="http://localhost:8080/main/drink/mine"
                  id="my-drinks-link" class="skel-panels-ignoreHref">
                    <span
                    class="fa fa-beer">
                      My Drinks
                    </span>
                  </a>
                </li>
                <li>
                  <a href="http://localhost:8080/main/bar/byName"
                  id="bar-search-link" class="skel-panels-ignoreHref">
                    <span
                    class="fa fa-search">
                      Bar Search
                    </span>
                  </a>
                </li>
                <li>
                  <a href="http://localhost:8080/main/news/all"
                    id="bar-search-link" class="skel-panels-ignoreHref">
                    <span
                    class="fa fa-list-alt">
                      News
                    </span>
                  </a>
                </li>
                <li>
                  <a href="http://localhost:8080/main/user/settings"
                  id="settings-link" class="skel-panels-ignoreHref">
                    <span
                    class="fa fa-gear">
                      Settings
                    </span>
                  </a>
                </li>
              </ul>
            </nav>
          </div>
        </div>
        
        <div id="main" style="background-color: #f7f7f7; min-height: 450px;">
        	
        	<g:layoutBody />
        	
        </div>
        
        <div id="footer">
          <div class="copyright">
            <p>
              &copy; Open source.
            </p>
            <ul class="menu">
              <li>
                PARTY TIME, ENJOY IT!
              </li>
            </ul>
          </div>
        </div>
  </body>
  </html>
    