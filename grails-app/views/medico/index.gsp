
<%@ page import="prognosticdata.Medico" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'medico.label', default: 'Medico')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-medico" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-medico" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome" title="${message(code: 'medico.nome.label', default: 'Nome')}" />
					
						<g:sortableColumn property="matricula" title="${message(code: 'medico.matricula.label', default: 'Matricula')}" />
					
						<g:sortableColumn property="crm" title="${message(code: 'medico.crm.label', default: 'Crm')}" />
					
						<g:sortableColumn property="data_admissao" title="${message(code: 'medico.data_admissao.label', default: 'Dataadmissao')}" />
					
						<th><g:message code="medico.especialidade_medica.label" default="Especialidademedica" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${medicoInstanceList}" status="i" var="medicoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${medicoInstance.id}">${fieldValue(bean: medicoInstance, field: "nome")}</g:link></td>
					
						<td>${fieldValue(bean: medicoInstance, field: "matricula")}</td>
					
						<td>${fieldValue(bean: medicoInstance, field: "crm")}</td>
					
						<td><g:formatDate date="${medicoInstance.data_admissao}" /></td>
					
						<td>${fieldValue(bean: medicoInstance, field: "especialidade_medica")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${medicoInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
