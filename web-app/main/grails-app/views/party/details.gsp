
<%@ page import="com.partytime.Party"%>
<%@ page import="com.partytime.User"%>

<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home">
    <g:set var="entityName"
    value="${message(code: 'party.label', default: 'Party')}" />
  </head>
    <body>
      <div id="show-party" style="margin-left:2%">
        <h2><strong>
          <g:if test="${partyInstance?.title}">
            <g:fieldValue bean="${partyInstance}" field="title" />
          </g:if></strong>
        </h2>

        <%
		  User host = partyInstance.getHost()
		  User myself = User.getMyUser()
		  boolean hostingThisParty =  host == myself
		%>
		
		<g:if test="${!hostingThisParty}">
		<div style="font-weight: bold;color:black;">Go to this party? </div>
			<g:if test="${!partyInstance.isAccepted(myself)}">
				<g:link controller="party" action="accept" id="${partyInstance?.id}">
					<img src="${resource(dir: 'images', file: "like.png")}"/>
				</g:link>
			</g:if>
			<g:if test="${!partyInstance.isRejected(myself)}">
				<g:link style="padding-left:30px" controller="party" action="reject" id="${partyInstance?.id}">
					<img src="${resource(dir: 'images', file: "dislike.png")}"/>
				</g:link>
			</g:if>
		</g:if>

	        <table  cellspacing='0'>
		        <tbody>
			        <td>
			        	<span class="property-value" aria-labelledby="host-label">
			                <g:link controller="user" action="details" id="${partyInstance?.host?.id}">
			                  <img src="${resource(dir: 'images/profile', file: partyInstance?.host?.getProfilePicture())}"
			                    alt="Profile" />
			                  ${partyInstance?.host?.encodeAsHTML()}
			                </g:link>
			              </span>
				        <h1>
							${fieldValue(bean: partyInstance, field: "startDateTime").toString().substring(0,16)} - ${fieldValue(bean: partyInstance, field: "finsishDateTime").toString().substring(0,16)}
						</h1>
						<h2>
							${fieldValue(bean: partyInstance, field: "place")}
						</h2>
						<div style="text-align:center">
							<img src="${resource(dir: 'images/bar', file: partyInstance?.place?.getProfilePicture())}"
					                          alt="Profile" />
                         </div>
						${fieldValue(bean: partyInstance, field: "description")}
					</td>
				</tbody>
			</table>

			<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" >
	  			<div class="panel panel-default">
	    			<div class="panel-heading" role="tab" id="headingOne">
	     				<h4 class="panel-title" style="font-weight: bold;color:black">
	        				<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
	          					Guests
	        				</a>
	     				</h4>
   					</div>
					<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
				      <div class="panel-body" style="font-weight: bold;color:black">
						<g:if test="${partyInstance?.guestsInvited}">
				            <table>
				              <tbody>
				                <g:each in="${partyInstance.guestsInvited.sort {it.name} }" var="guest">
				                  <tr>
				                    <td>
				                      <g:link controller="user" action="details" id="${guest.id}">
				                        <img src="${resource(dir: 'images/profile', file: guest?.getProfilePicture())}"
				                          alt="Profile" />
				                        ${guest?.encodeAsHTML()}
				                      </g:link>
				                    </td>
				                    <td>
				                    	<img src="${resource(dir: 'images', file: partyInstance.getStatusImage(guest))}">
				                    </td>
				                  </tr>
				                </g:each>
				              </tbody>
				            </table>
				          </g:if>
	                      <g:if test="${hostingThisParty}">
				          	<g:link  action="invite" id="${partyInstance.id}" class="button">Invite people</g:link>
				          </g:if>
			           </div>
				    </div>
				  </div>
				  <g:if test="${hostingThisParty}">
					  <div class="panel panel-default">
		    			<div class="panel-heading" role="tab" id="headingTwo">
		     				<h4 class="panel-title" style="font-weight: bold;color:black">
		        				<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
		          					Suggested drinks
		        				</a>
		     				</h4>
	   					</div>
						<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
					      <div class="panel-body" style="font-weight: bold;color:black">
					        <g:each in="${partyInstance.getSuggestedDrinks()}" var="drink">
					            <li>
					              ${drink.toString()}
					            </li>
				            </g:each>    
				           </div>
					    </div>
					  </div>
				  </g:if>
        	</div>
      </div>
    </body>
</html>
