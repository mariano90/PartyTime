<%@ page import="com.partytime.Address" %>



<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'street', 'error')} required">
	<label for="street">
		<g:message code="address.street.label" default="Street" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="street" required="" value="${addressInstance?.street}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'number', 'error')} required">
	<label for="number">
		<g:message code="address.number.label" default="Number" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="number" type="number" value="${addressInstance.number}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'city', 'error')} required">
	<label for="city">
		<g:message code="address.city.label" default="City" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="city" required="" value="${addressInstance?.city}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'province', 'error')} required">
	<label for="province">
		<g:message code="address.province.label" default="Province" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="province" required="" value="${addressInstance?.province}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'country', 'error')} required">
	<label for="country">
		<g:message code="address.country.label" default="Country" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="country" required="" value="${addressInstance?.country}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'apartment', 'error')} required">
	<label for="apartment">
		<g:message code="address.apartment.label" default="Apartment" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="apartment" required="" value="${addressInstance?.apartment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: addressInstance, field: 'floor', 'error')} required">
	<label for="floor">
		<g:message code="address.floor.label" default="Floor" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="floor" required="" value="${addressInstance?.floor}"/>

</div>

