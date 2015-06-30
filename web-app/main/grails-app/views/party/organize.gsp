<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="home">
    <g:set var="entityName"
	value="${message(code: 'party.label', default: 'Party')}" />
	<script type="text/javascript">
        $(document).ready(function()
        {
          $("#datepicker1").datetimepicker();
          $("#datepicker2").datetimepicker();
        })
	</script>
  </head>
  <body>
	<div id="create-party" class="content scaffold-create" role="main">
      <h2>
        <strong>New Party =)</strong>
      </h2>
      <g:if test="${flash.message}">
        <div class="message" role="status">
          ${flash.message}
        </div>
      </g:if>
      <g:hasErrors bean="${partyInstance}">
        <ul class="errors" role="alert">
          <g:eachError bean="${partyInstance}" var="error">
            <li
            <g:if test="${error in org.springframework.validation.FieldError}">
              data-field-id="${error.field}"
            </g:if>
          >
          <g:message
          error="${error}" />
          </li>
          </g:eachError>
        </ul>
      </g:hasErrors>

      <g:form controller="party" action="organizeNew" style="margin-top:5%">
      	<div class="row 50%">
      		<div class="6u"><g:textField class="textField" placeholder="Title" name="partyTitle"/></div>
      		<div class="6u"><g:select
      			placeholder="Place"
                name="partyPlace"
                from="${com.partytime.Bar.list()}"
                value="${bar?.name}"
                optionKey="id"
                style="width: 350px;"/></div>
      	</div>
      	<g:textField class="textField" style="margin-top:2%" placeholder="Description" name="partyDescription"/>
		<div class="row 50%" style="margin-top:2%">
			<div class="6u">
	            Starts at:
	            <input type="text" id="datepicker1" name="partyStart">
			</div>
			<div class="6u">
            	Until:
            	<input type="text" id="datepicker2" name="partyEnd">
			</div>
		</div>
      <fieldset class="buttons">
        <g:submitButton id="create_party_button" name="create" class="button scrolly" style="margin-top:2%; margin-left: 90%"
          value="${message(code: 'default.button.create.label', default: 'Create')}" />
      </fieldset>
      </g:form>
    </div>
  </body>
</html>
