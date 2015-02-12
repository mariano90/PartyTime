
<%@ page import="com.partytime.Ad"%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home" />
    <title>
      Welcome to Party Time
    </title>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'home.css')}"
	  type="text/css" />
  </head>
  <body>
	<div id="page-body" role="main" style="height: 600px !important;">
      <h1>
        Welcome to Party Time
      </h1>
      <div class="side-by-side">
        <div class="left-side">
          <h2>
            Public events 
            <a href="http://localhost:8080/main/publicEvent/all">
              [see all]
            </a>
          </h2>
          <iframe src="http://localhost:8080/main/publicEvent/embed">
          </iframe>
        </div>
        <div class="right-side">
          <h2>
            Ads
          </h2>
          <% Ad ad = Ad.getSuitableAd()%>
          <a href="${ad.getDestinationURL() }"
              target="_blank">
            <img src="${resource(dir: 'images/ads', file: ad.getImageURL())}"
                alt="ads"/>
          </a>
        </div>
      </div>
      <div class="side-by-side">
        <div class="left-side">
          <h2>
            Upcoming parties
            <a href="http://localhost:8080/main/party/invited">
              [see all]
            </a>
          </h2>
          <iframe src="http://localhost:8080/main/party/embed">
          </iframe>
        </div>
        <div class="right-side">
          <h2>
            User lvl
          </h2>
          points, experience
          <br />
        </div>
      </div>
  </div>
  </body>
</html>
