<%@ page import="com.partytime.Bar" %>



<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="bar.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${barInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'openHours', 'error')} ">
	<label for="openHours">
		<g:message code="bar.openHours.label" default="Open Hours" />
		
	</label>
	<g:textField name="openHours" value="${barInstance?.openHours}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'street', 'error')} required">
	<label for="street">
		<g:message code="bar.street.label" default="Street" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="street" required="" value="${barInstance?.street}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="bar.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="number" type="number" value="${barInstance.number}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'floor', 'error')} ">
	<label for="floor">
		<g:message code="bar.floor.label" default="Floor" />
		
	</label>
	<g:textField name="floor" value="${barInstance?.floor}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'apartment', 'error')} ">
	<label for="apartment">
		<g:message code="bar.apartment.label" default="Apartment" />
		
	</label>
	<g:textField name="apartment" value="${barInstance?.apartment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="bar.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${barInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'province', 'error')} ">
	<label for="province">
		<g:message code="bar.province.label" default="Province" />
		
	</label>
	<g:textField name="province" value="${barInstance?.province}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'country', 'error')} ">
	<label for="country">
		<g:message code="bar.country.label" default="Country" />
		
	</label>
	<g:textField name="country" value="${barInstance?.country}"/>

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

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'promos', 'error')} ">
	<label for="promos">
		<g:message code="bar.promos.label" default="Promos" />
		
	</label>
	<g:select name="promos" from="${com.partytime.Promo.list()}" multiple="multiple" optionKey="id" size="5" value="${barInstance?.promos*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: barInstance, field: 'reviews', 'error')} ">
	<label for="reviews">
		<g:message code="bar.reviews.label" default="Reviews" />
		
	</label>
	<g:select name="reviews" from="${com.partytime.Review.list()}" multiple="multiple" optionKey="id" size="5" value="${barInstance?.reviews*.id}" class="many-to-many"/>

</div>

