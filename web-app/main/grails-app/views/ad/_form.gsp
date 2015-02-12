<%@ page import="com.partytime.Ad" %>



<div class="fieldcontain ${hasErrors(bean: adInstance, field: 'imageURL', 'error')} required">
	<label for="imageURL">
		<g:message code="ad.imageURL.label" default="Image URL" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="imageURL" required="" value="${adInstance?.imageURL}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adInstance, field: 'destinationURL', 'error')} required">
	<label for="destinationURL">
		<g:message code="ad.destinationURL.label" default="Destination URL" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="destinationURL" required="" value="${adInstance?.destinationURL}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adInstance, field: 'ageTarget', 'error')} required">
	<label for="ageTarget">
		<g:message code="ad.ageTarget.label" default="Age Target" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="ageTarget" required="" value="${adInstance?.ageTarget}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adInstance, field: 'genderTarget', 'error')} required">
	<label for="genderTarget">
		<g:message code="ad.genderTarget.label" default="Gender Target" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="genderTarget" required="" value="${adInstance?.genderTarget}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: adInstance, field: 'musicStyleTarget', 'error')} required">
	<label for="musicStyleTarget">
		<g:message code="ad.musicStyleTarget.label" default="Music Style Target" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="musicStyleTarget" name="musicStyleTarget.id" from="${com.partytime.MusicStyle.list()}" optionKey="id" required="" value="${adInstance?.musicStyleTarget?.id}" class="many-to-one"/>

</div>

