
<%@ page import="prognosticdata.Especialidade_Medica" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'especialidade_Medica.label', default: 'Especialidade_Medica')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-especialidade_Medica" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-especialidade_Medica" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome_especialidade" title="${message(code: 'especialidade_Medica.nome_especialidade.label', default: 'Nomeespecialidade')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${especialidade_MedicaInstanceList}" status="i" var="especialidade_MedicaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${especialidade_MedicaInstance.id}">${fieldValue(bean: especialidade_MedicaInstance, field: "nome_especialidade")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${especialidade_MedicaInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
