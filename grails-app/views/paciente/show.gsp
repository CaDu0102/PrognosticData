
<%@ page import="prognosticdata.Paciente" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'paciente.label', default: 'Paciente')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-paciente" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-paciente" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list paciente">
			
				<g:if test="${pacienteInstance?.nome}">
				<li class="fieldcontain">
					<span id="nome-label" class="property-label"><g:message code="paciente.nome.label" default="Nome" /></span>
					
						<span class="property-value" aria-labelledby="nome-label"><g:fieldValue bean="${pacienteInstance}" field="nome"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pacienteInstance?.cpf}">
				<li class="fieldcontain">
					<span id="cpf-label" class="property-label"><g:message code="paciente.cpf.label" default="Cpf" /></span>
					
						<span class="property-value" aria-labelledby="cpf-label"><g:fieldValue bean="${pacienteInstance}" field="cpf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pacienteInstance?.data_nascimento}">
				<li class="fieldcontain">
					<span id="data_nascimento-label" class="property-label"><g:message code="paciente.data_nascimento.label" default="Datanascimento" /></span>
					
						<span class="property-value" aria-labelledby="data_nascimento-label"><g:formatDate date="${pacienteInstance?.data_nascimento}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${pacienteInstance?.sexo}">
				<li class="fieldcontain">
					<span id="sexo-label" class="property-label"><g:message code="paciente.sexo.label" default="Sexo" /></span>
					
						<span class="property-value" aria-labelledby="sexo-label"><g:fieldValue bean="${pacienteInstance}" field="sexo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pacienteInstance?.endereco}">
				<li class="fieldcontain">
					<span id="endereco-label" class="property-label"><g:message code="paciente.endereco.label" default="Endereco" /></span>
					
						<span class="property-value" aria-labelledby="endereco-label"><g:fieldValue bean="${pacienteInstance}" field="endereco"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pacienteInstance?.cidade}">
				<li class="fieldcontain">
					<span id="cidade-label" class="property-label"><g:message code="paciente.cidade.label" default="Cidade" /></span>
					
						<span class="property-value" aria-labelledby="cidade-label"><g:fieldValue bean="${pacienteInstance}" field="cidade"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pacienteInstance?.uf}">
				<li class="fieldcontain">
					<span id="uf-label" class="property-label"><g:message code="paciente.uf.label" default="Uf" /></span>
					
						<span class="property-value" aria-labelledby="uf-label"><g:fieldValue bean="${pacienteInstance}" field="uf"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pacienteInstance?.telefone}">
				<li class="fieldcontain">
					<span id="telefone-label" class="property-label"><g:message code="paciente.telefone.label" default="Telefone" /></span>
					
						<span class="property-value" aria-labelledby="telefone-label"><g:fieldValue bean="${pacienteInstance}" field="telefone"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pacienteInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="paciente.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${pacienteInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${pacienteInstance?.atendimento}">
				<li class="fieldcontain">
					<span id="atendimento-label" class="property-label"><g:message code="paciente.atendimento.label" default="Atendimento" /></span>
					
						<g:each in="${pacienteInstance.atendimento}" var="a">
						<span class="property-value" aria-labelledby="atendimento-label"><g:link controller="atendimento" action="show" id="${a.id}">${a?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${pacienteInstance?.plano_saude2}">
				<li class="fieldcontain">
					<span id="plano_saude2-label" class="property-label"><g:message code="paciente.plano_saude2.label" default="Planosaude2" /></span>
					
						<span class="property-value" aria-labelledby="plano_saude2-label"><g:link controller="planode_Saude" action="show" id="${pacienteInstance?.plano_saude2?.id}">${pacienteInstance?.plano_saude2?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:pacienteInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${pacienteInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
