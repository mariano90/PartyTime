
<%@ page import="com.partytime.Ad"%>
<%@ page import="com.partytime.PublicEvent"%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home" />
  </head>
  <body onload="initLinks()">
  
  <div id="list-publicEvents">
		<h2>
			<strong>Welcome to Party Time!</strong>
		</h2>

		<div>
			<table  cellspacing='0'>
				<tbody>
					<g:each in="${publicEventInstanceList}" status="i" var="publicEventInstance">
						<td>
							<h1>
								${fieldValue(bean: publicEventInstance, field: "startDateTime").toString().substring(0,10)}
							</h1>
							<h2>
								${fieldValue(bean: publicEventInstance, field: "title")}
							</h2>
							 <p> ${fieldValue(bean: publicEventInstance, field: "description")}</p>
							 <p> Minimum age: ${fieldValue(bean: publicEventInstance, field: "minimumAge")}</p>
							<a href="${publicEventInstance.externalUrl}" target="_blank">${publicEventInstance.externalUrl}</a>
						</td>
						<tr>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${newsInstanceCount ?: 0}" />
			</div>
		</div>


	</div>
  
  
      <div style="text-align:center">
          <% Ad ad = Ad.getSuitableAd()%>
          <a href="${ad.getDestinationURL() }"
              target="_blank">
            <img src="${resource(dir: 'images/ads', file: ad.getImageURL())}"
                alt="ads"/>
          </a>
      </div>

  </body>
</html>