
<%@ page import="com.partytime.User" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home">
    <g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
  </head>
  <body>
    <div id="show-user" class="content scaffold-show" role="main">
      <h2>
        <strong>${userInstance?.encodeAsHTML()}</strong>
      </h2>
      <h1>
        <img src="${resource(dir: 'images/profile/big', file: userInstance?.getProfilePicture())}"
          alt="Profile" />
      </h1>
      <g:if test="${flash.message}">
        <div class="message" role="status">
          ${flash.message}
        </div>
      </g:if>

        <g:if test="${userInstance?.bornDate}">
          <li class="fieldcontain">
            <span id="bornDate-label" style="font-weight: bold;color:black">
              <g:message  code="user.bornDate.label" default="Birth date:" />
            </span>
            <span style="color:black" aria-labelledby="bornDate-label">
              <g:formatDate format="yyyy-MM-dd" date="${userInstance?.bornDate}" />
            </span>
          </li>
        </g:if>
        <g:if test="${userInstance?.getAge()}">
          <li class="fieldcontain">
            <span id="age-label" style="font-weight: bold;color:black">
              Age: 
            </span>
            <span style="color:black" aria-labelledby="age-label">
            	${userInstance?.getAge()}
            </span>
          </li>
        </g:if>
&nbsp;&nbsp;
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" >
        	<g:if test="${userInstance?.preferedDrinks}">
	  			<div class="panel panel-default">
	    			<div class="panel-heading" role="tab" id="headingOne">
	     				<h4 class="panel-title" style="font-weight: bold;color:black">
	        				<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
	          					Favorite Drinks
	        				</a>
	     				</h4>
   					</div>
					<div id="collapseOne" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingOne">
				      <div class="panel-body" style="font-weight: bold;color:black">

			            <g:each in="${userInstance.preferedDrinks.sort {it.name} }" var="d" >
			                <g:link controller="drink" action="details" id="${d.id}">
				                  ${d?.encodeAsHTML()}
			                </g:link>
				                &nbsp;
			            </g:each>
			           </div>
				    </div>
				  </div>
        	</g:if>
        	<g:if test="${userInstance?.preferedMusicStyles}">
	  			<div class="panel panel-default">
	    			<div class="panel-heading" role="tab" id="headingTwo">
	     				<h4 class="panel-title" style="font-weight: bold;color:black">
	        				<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
	          					Favorite Music Styles
	        				</a>
	     				</h4>
   					</div>
					<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
				      <div class="panel-body" style="font-weight: bold;color:black">
				        <g:each in="${userInstance.preferedMusicStyles.sort {it.name} }" var="ms" >
			                <g:link controller="bar" action="musicStyle" id="${ms.id}">
			                  ${ms.encodeAsHTML()}
			                </g:link>
			                &nbsp;
			            </g:each>     
			           </div>
				    </div>
				  </div> 	
	        </g:if>
        	<g:if test="${userInstance?.favoriteBars.sort {it.name} }">
	  			<div class="panel panel-default">
	    			<div class="panel-heading" role="tab" id="headingThree">
	     				<h4 class="panel-title" style="font-weight: bold;color:black">
	        				<a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
	          					Favorite Bars
	        				</a>
	     				</h4>
   					</div>
					<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
				      <div class="panel-body" style="font-weight: bold;color:black">         
			             <g:each in="${userInstance.favoriteBars}" var="b">
			                <g:link controller="bar" action="details" id="${b.id}">
			                  ${b.encodeAsHTML()}
			                </g:link>
			                &nbsp;
			            </g:each>         
  			           </div>
				    </div>
				  </div> 	
	        </g:if>        
		</div>

    </div>
  </body>
</html>
