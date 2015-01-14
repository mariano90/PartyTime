<%@ page import="com.partytime.User" %>



<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="user.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'bornDate', 'error')} required">
	<label for="bornDate">
		<g:message code="user.bornDate.label" default="Born Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="bornDate" precision="day"  value="${userInstance?.bornDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'preferedDrinks', 'error')} ">
	<label for="preferedDrinks">
		<g:message code="user.preferedDrinks.label" default="Prefered Drinks" />
		
	</label>
	<g:select name="preferedDrinks" from="${com.partytime.Drink.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.preferedDrinks*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userInstance, field: 'preferedMusicStyles', 'error')} ">
	<label for="preferedMusicStyles">
		<g:message code="user.preferedMusicStyles.label" default="Prefered Music Styles" />
		
	</label>
	<g:select name="preferedMusicStyles" from="${com.partytime.MusicStyle.list()}" multiple="multiple" optionKey="id" size="5" value="${userInstance?.preferedMusicStyles*.id}" class="many-to-many"/>

</div>

