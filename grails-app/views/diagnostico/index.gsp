
<%@ page import="prognosticdata.Diagnostico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'diagnostico.label', default: 'Diagnostico')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-diagnostico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-diagnostico" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome_doenca" title="${message(code: 'diagnostico.nome_doenca.label', default: 'Nomedoenca')}" />
					
						<g:sortableColumn property="sintomas" title="${message(code: 'diagnostico.sintomas.label', default: 'Sintomas')}" />
					
						<g:sortableColumn property="tratamento" title="${message(code: 'diagnostico.tratamento.label', default: 'Tratamento')}" />
					
						<g:sortableColumn property="causas" title="${message(code: 'diagnostico.causas.label', default: 'Causas')}" />
					
						<g:sortableColumn property="diagnostico" title="${message(code: 'diagnostico.diagnostico.label', default: 'Diagnostico')}" />
					
						<g:sortableColumn property="gravidade" title="${message(code: 'diagnostico.gravidade.label', default: 'Gravidade')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${diagnosticoInstanceList}" status="i" var="diagnosticoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${diagnosticoInstance.id}">${fieldValue(bean: diagnosticoInstance, field: "nome_doenca")}</g:link></td>
					
						<td>${fieldValue(bean: diagnosticoInstance, field: "sintomas")}</td>
					
						<td>${fieldValue(bean: diagnosticoInstance, field: "tratamento")}</td>
					
						<td>${fieldValue(bean: diagnosticoInstance, field: "causas")}</td>
					
						<td>${fieldValue(bean: diagnosticoInstance, field: "diagnostico")}</td>
					
						<td>${fieldValue(bean: diagnosticoInstance, field: "gravidade")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${diagnosticoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
