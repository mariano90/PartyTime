<%@ page import="com.partytime.ScheduledParty" %>



<div class="fieldcontain ${hasErrors(bean: scheduledPartyInstance, field: 'drinks', 'error')} ">
	<label for="drinks">
		<g:message code="scheduledParty.drinks.label" default="Drinks" />
		
	</label>
	<g:select name="drinks" from="${com.partytime.Drink.list()}" multiple="multiple" optionKey="id" size="5" value="${scheduledPartyInstance?.drinks*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: scheduledPartyInstance, field: 'dj', 'error')} ">
	<label for="dj">
		<g:message code="scheduledParty.dj.label" default="Dj" />
		
	</label>
	<g:select id="dj" name="dj.id" from="${com.partytime.User.list()}" optionKey="id" value="${scheduledPartyInstance?.dj?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: scheduledPartyInstance, field: 'barman', 'error')} ">
	<label for="barman">
		<g:message code="scheduledParty.barman.label" default="Barman" />
		
	</label>
	<g:select id="barman" name="barman.id" from="${com.partytime.User.list()}" optionKey="id" value="${scheduledPartyInstance?.barman?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

