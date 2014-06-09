<%@ page import="com.partytime.Bar" %>



<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="bar.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="address" name="address.id" from="${com.partytime.Address.list()}" optionKey="id" required="" value="${barInstance?.address?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'minimumAge', 'error')} required">
	<label for="minimumAge">
		<g:message code="bar.minimumAge.label" default="Minimum Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="minimumAge" type="number" value="${barInstance.minimumAge}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'musicStyles', 'error')} ">
	<label for="musicStyles">
		<g:message code="bar.musicStyles.label" default="Music Styles" />
		
	</label>
	<g:select name="musicStyles" from="${com.partytime.MusicStyle.list()}" multiple="multiple" optionKey="id" size="5" value="${barInstance?.musicStyles*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="bar.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${barInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'openHours', 'error')} required">
	<label for="openHours">
		<g:message code="bar.openHours.label" default="Open Hours" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="openHours" required="" value="${barInstance?.openHours}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'promos', 'error')} required">
	<label for="promos">
		<g:message code="bar.promos.label" default="Promos" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="promos" required="" value="${barInstance?.promos}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'reviews', 'error')} ">
	<label for="reviews">
		<g:message code="bar.reviews.label" default="Reviews" />
		
	</label>
	<g:select name="reviews" from="${com.partytime.Review.list()}" multiple="multiple" optionKey="id" size="5" value="${barInstance?.reviews*.id}" class="many-to-many"/>

</div>

