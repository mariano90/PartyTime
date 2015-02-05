
<%@ page import="com.partytime.Promo"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="home">
<g:set var="entityName"
	value="${message(code: 'promo.label', default: 'Promo')}" />
<title>
<g:message code="default.promo.label" default="Promo" />
<g:if test="${promoInstance?.title}">
	- <g:fieldValue bean="${promoInstance}" field="title" />
</g:if>
</title>
</head>
<body>
	<div id="show-promo" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.promo.details" default="Promo" />
		</h1>
		<ol class="property-list promo">
			<g:if test="${promoInstance?.title}">
				<li class="fieldcontain">
					<span class="property-value" aria-labelledby="title-label">
						<g:fieldValue bean="${promoInstance}" field="title" />
					</span>
				</li>
			</g:if>

			<g:if test="${promoInstance?.description}">
				<li class="fieldcontain">
					<span class="property-value" aria-labelledby="description-label">
						<g:fieldValue bean="${promoInstance}" field="description" />
					</span>
				</li>
			</g:if>

			<g:if test="${promoInstance?.validFrom}">
				<li class="fieldcontain">
				<span id="validFrom-label" class="property-label">
					<g:message code="promo.validFrom.label" default="Date" />
				</span>
				<span class="property-value" aria-labelledby="validFrom-label">
					<g:formatDate format="yyyy-MM-dd HH:mm" date="${promoInstance?.validFrom}" />
				</span>
				</li>
			</g:if>
		</ol>
	</div>
</body>
</html>
