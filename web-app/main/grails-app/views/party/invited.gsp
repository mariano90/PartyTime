
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
	<div class="nav" role="navigation"></div>
	<div id="list-party" class="content scaffold-list" role="main">
		<h2>
			<strong>My Invitations</strong>
		</h2>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table  cellspacing='0'>
			<thead>
				<tr>
					<g:sortableColumn style="font-weight: bold;color:black;font-size: 16pt; " property="title" title="${message(code: 'party.title.label', default: 'Title')}" />
					<th style="font-weight: bold;color:black;font-size: 16pt; "><g:message code="party.place.label" default="Place"/></th>
					<g:sortableColumn style="font-weight: bold;color:black;font-size: 16pt; " property="startDateTime" title="${message(code: 'party.startDateTime.label', default: 'When')}" />
					<th style="font-weight: bold;color:black;font-size: 16pt; "><g:message code="party.status.label" default="Status"/></th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<g:each in="${partyInstanceList}" status="i" var="partyInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
						<td>
							${fieldValue(bean: partyInstance, field: "title")}
						</td>
						<td>
						<img src="${resource(dir: 'images/bar', file: partyInstance?.place?.getProfilePicture())}"
				                          alt="Profile" />
							<g:link controller="bar" action="details" id="${partyInstance?.place?.id}">
                              ${partyInstance?.place?.encodeAsHTML()}
                            </g:link>
						</td>
						<td>
							<g:formatDate format="yyyy-MM-dd" date="${partyInstance.startDateTime}" />
						</td>
						<td>
						  <%User myself = User.getMyUser()
							print partyInstance.getStatus(myself)
						  %>
						</td>
						<td>
							<g:link action="details" id="${partyInstance.id}" class="button">
								Details
							</g:link>
						</td>
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${partyInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
