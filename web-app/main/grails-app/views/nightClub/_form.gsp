<%@ page import="com.partytime.NightClub" %>



<div class="fieldcontain ${hasErrors(bean: nightClubInstance, field: 'address', 'error')} required">
	<label for="address">
		<g:message code="nightClub.address.label" default="Address" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="address" required="" value="${nightClubInstance?.address}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: nightClubInstance, field: 'minimumAge', 'error')} required">
	<label for="minimumAge">
		<g:message code="nightClub.minimumAge.label" default="Minimum Age" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="minimumAge" type="number" value="${nightClubInstance.minimumAge}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: nightClubInstance, field: 'musicStyles', 'error')} ">
	<label for="musicStyles">
		<g:message code="nightClub.musicStyles.label" default="Music Styles" />
		
	</label>
	<g:select name="musicStyles" from="${com.partytime.MusicStyle.list()}" multiple="multiple" optionKey="id" size="5" value="${nightClubInstance?.musicStyles*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: nightClubInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="nightClub.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${nightClubInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: nightClubInstance, field: 'openHours', 'error')} required">
	<label for="openHours">
		<g:message code="nightClub.openHours.label" default="Open Hours" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="openHours" required="" value="${nightClubInstance?.openHours}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: nightClubInstance, field: 'promos', 'error')} required">
	<label for="promos">
		<g:message code="nightClub.promos.label" default="Promos" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="promos" required="" value="${nightClubInstance?.promos}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: nightClubInstance, field: 'reviews', 'error')} ">
	<label for="reviews">
		<g:message code="nightClub.reviews.label" default="Reviews" />
		
	</label>
	<g:select name="reviews" from="${com.partytime.Review.list()}" multiple="multiple" optionKey="id" size="5" value="${nightClubInstance?.reviews*.id}" class="many-to-many"/>

</div>

