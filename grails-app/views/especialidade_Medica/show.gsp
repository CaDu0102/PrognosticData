
<%@ page import="prognosticdata.Especialidade_Medica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'especialidade_Medica.label', default: 'Especialidade_Medica')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-especialidade_Medica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-especialidade_Medica" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list especialidade_Medica">
			
				<g:if test="${especialidade_MedicaInstance?.nome_especialidade}">
				<li class="fieldcontain">
					<span id="nome_especialidade-label" class="property-label"><g:message code="especialidade_Medica.nome_especialidade.label" default="Nomeespecialidade" /></span>
					
						<span class="property-value" aria-labelledby="nome_especialidade-label"><g:fieldValue bean="${especialidade_MedicaInstance}" field="nome_especialidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${especialidade_MedicaInstance?.medico}">
				<li class="fieldcontain">
					<span id="medico-label" class="property-label"><g:message code="especialidade_Medica.medico.label" default="Medico" /></span>
					
						<g:each in="${especialidade_MedicaInstance.medico}" var="m">
						<span class="property-value" aria-labelledby="medico-label"><g:link controller="medico" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:especialidade_MedicaInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${especialidade_MedicaInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
