
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
      <div id="show-party" class="content scaffold-show" role="main">
        <h2><strong>
          <g:link action="details" id="${partyInstance.id}">
            ${partyInstance.title}
          </g:link></strong>
        </h2>

      <%
		  User host = partyInstance.getHost()
		  User myself = User.getMyUser()
		  boolean hostingThisParty =  host == myself
		%>
		
		<g:if test="${!hostingThisParty}">
		<output>Mark as: </output>
			<g:if test="${!partyInstance.isAccepted(myself)}">
				<g:link controller="party" action="accept" id="${partyInstance?.id}">
					Going
				</g:link>
			</g:if>
			<g:if test="${!partyInstance.isRejected(myself)}">
				<g:link controller="party" action="reject" id="${partyInstance?.id}">
					Not going
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
						${fieldValue(bean: partyInstance, field: "description")}
					</td>
				</tbody>
			</table>

      <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" >
  			<div class="panel panel-default">
    			<div class="panel-heading" role="tab" id="headingOne">
     				<h4 class="panel-title" style="font-weight: bold;color:black">
        				<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          					Not invited
        				</a>
     				</h4>
  					</div>
				<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
			      <div class="panel-body" style="font-weight: bold;color:black">
					<table cellspacing="0" style="width:50%">
			          <tbody>
			            <g:each in="${partyInstance?.getNotInvitedGuests().sort{it.name} }" var="guest">
			              <% if (guest.name == User.getMyUser().name) {
							  continue
						  }%>
			              <tr>
			                <td width="315">
			                  <g:link controller="user" action="details" id="${guest.id}">
			                    <img src="${resource(dir: 'images/profile', file: guest?.getProfilePicture())}"
			                      alt="Profile" />
			                    ${guest?.encodeAsHTML()}
			                  </g:link>
			                </td>
			                <td>
			                  <g:link controller="party" action="doInvite"
			                      params="${[party:partyInstance.id,user:guest.id]}"
			                      class="button">
			                    Add
			                  </g:link>
			                </td>
			              </tr>
			            </g:each>
			          </tbody>
			        </table>
		           </div>
			    </div>
			  </div>
  			<div class="panel panel-default">
    			<div class="panel-heading" role="tab" id="headingTwo">
     				<h4 class="panel-title" style="font-weight: bold;color:black">
        				<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          					Already invited
        				</a>
     				</h4>
  					</div>
				<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
			      <div class="panel-body" style="font-weight: bold;color:black">
					<table cellspacing="0" style="width:50%">
		              <tbody>
		                <g:each in="${partyInstance.guestsInvited.sort{it.name} }" var="guest">
		                  <tr>
		                    <td width="300">
		                      <g:link controller="user" action="details" id="${guest.id}">
		                        <img src="${resource(dir: 'images/profile', file: guest?.getProfilePicture())}"
		                          alt="Profile" />
		                        ${guest?.encodeAsHTML()}
		                      </g:link>
		                    </td>
		                    <td>
		                    <g:link controller="party" action="doRemove"
		                        params="${[party:partyInstance.id,user:guest.id]}"
		                        class="buttondelete">
		                      Remove
		                    </g:link>
		                    </td>
		                  </tr>
		                </g:each>
		              </tbody>
		            </table>  
		           </div>
			    </div>
			  </div> 	
			</div>
       </div>
    </body>
</html>
