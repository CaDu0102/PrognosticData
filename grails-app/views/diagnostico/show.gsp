
<%@ page import="prognosticdata.Diagnostico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'diagnostico.label', default: 'Diagnostico')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-diagnostico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-diagnostico" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list diagnostico">
			
				<g:if test="${diagnosticoInstance?.nome_doenca}">
				<li class="fieldcontain">
					<span id="nome_doenca-label" class="property-label"><g:message code="diagnostico.nome_doenca.label" default="Nomedoenca" /></span>
					
						<span class="property-value" aria-labelledby="nome_doenca-label"><g:fieldValue bean="${diagnosticoInstance}" field="nome_doenca"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${diagnosticoInstance?.sintomas}">
				<li class="fieldcontain">
					<span id="sintomas-label" class="property-label"><g:message code="diagnostico.sintomas.label" default="Sintomas" /></span>
					
						<span class="property-value" aria-labelledby="sintomas-label"><g:fieldValue bean="${diagnosticoInstance}" field="sintomas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${diagnosticoInstance?.tratamento}">
				<li class="fieldcontain">
					<span id="tratamento-label" class="property-label"><g:message code="diagnostico.tratamento.label" default="Tratamento" /></span>
					
						<span class="property-value" aria-labelledby="tratamento-label"><g:fieldValue bean="${diagnosticoInstance}" field="tratamento"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${diagnosticoInstance?.causas}">
				<li class="fieldcontain">
					<span id="causas-label" class="property-label"><g:message code="diagnostico.causas.label" default="Causas" /></span>
					
						<span class="property-value" aria-labelledby="causas-label"><g:fieldValue bean="${diagnosticoInstance}" field="causas"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${diagnosticoInstance?.diagnostico}">
				<li class="fieldcontain">
					<span id="diagnostico-label" class="property-label"><g:message code="diagnostico.diagnostico.label" default="Diagnostico" /></span>
					
						<span class="property-value" aria-labelledby="diagnostico-label"><g:fieldValue bean="${diagnosticoInstance}" field="diagnostico"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${diagnosticoInstance?.gravidade}">
				<li class="fieldcontain">
					<span id="gravidade-label" class="property-label"><g:message code="diagnostico.gravidade.label" default="Gravidade" /></span>
					
						<span class="property-value" aria-labelledby="gravidade-label"><g:fieldValue bean="${diagnosticoInstance}" field="gravidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${diagnosticoInstance?.complicacoes}">
				<li class="fieldcontain">
					<span id="complicacoes-label" class="property-label"><g:message code="diagnostico.complicacoes.label" default="Complicacoes" /></span>
					
						<span class="property-value" aria-labelledby="complicacoes-label"><g:fieldValue bean="${diagnosticoInstance}" field="complicacoes"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${diagnosticoInstance?.atendiment}">
				<li class="fieldcontain">
					<span id="atendiment-label" class="property-label"><g:message code="diagnostico.atendiment.label" default="Atendiment" /></span>
					
						<g:each in="${diagnosticoInstance.atendiment}" var="a">
						<span class="property-value" aria-labelledby="atendiment-label"><g:link controller="atendimento" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:diagnosticoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${diagnosticoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
