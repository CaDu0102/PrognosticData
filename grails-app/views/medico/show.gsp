
<%@ page import="prognosticdata.Medico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medico.label', default: 'Medico')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-medico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-medico" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list medico">
			
				<g:if test="${medicoInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="medico.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${medicoInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicoInstance?.matricula}">
				<li class="fieldcontain">
					<span id="matricula-label" class="property-label"><g:message code="medico.matricula.label" default="Matricula" /></span>
					
						<span class="property-value" aria-labelledby="matricula-label"><g:fieldValue bean="${medicoInstance}" field="matricula"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicoInstance?.crm}">
				<li class="fieldcontain">
					<span id="crm-label" class="property-label"><g:message code="medico.crm.label" default="Crm" /></span>
					
						<span class="property-value" aria-labelledby="crm-label"><g:fieldValue bean="${medicoInstance}" field="crm"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicoInstance?.data_admissao}">
				<li class="fieldcontain">
					<span id="data_admissao-label" class="property-label"><g:message code="medico.data_admissao.label" default="Dataadmissao" /></span>
					
						<span class="property-value" aria-labelledby="data_admissao-label"><g:formatDate date="${medicoInstance?.data_admissao}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${medicoInstance?.atendimento}">
				<li class="fieldcontain">
					<span id="atendimento-label" class="property-label"><g:message code="medico.atendimento.label" default="Atendimento" /></span>
					
						<g:each in="${medicoInstance.atendimento}" var="a">
						<span class="property-value" aria-labelledby="atendimento-label"><g:link controller="atendimento" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${medicoInstance?.especialidade_medica}">
				<li class="fieldcontain">
					<span id="especialidade_medica-label" class="property-label"><g:message code="medico.especialidade_medica.label" default="Especialidademedica" /></span>
					
						<span class="property-value" aria-labelledby="especialidade_medica-label"><g:link controller="especialidade_Medica" action="show" id="${medicoInstance?.especialidade_medica?.id}">${medicoInstance?.especialidade_medica?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:medicoInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${medicoInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
