
<%@ page import="prognosticdata.Planode_Saude" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'planode_Saude.label', default: 'Planode_Saude')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-planode_Saude" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-planode_Saude" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="nome_empresa" title="${message(code: 'planode_Saude.nome_empresa.label', default: 'Nomeempresa')}" />
					
						<g:sortableColumn property="tipo_plano" title="${message(code: 'planode_Saude.tipo_plano.label', default: 'Tipoplano')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${planode_SaudeInstanceList}" status="i" var="planode_SaudeInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${planode_SaudeInstance.id}">${fieldValue(bean: planode_SaudeInstance, field: "nome_empresa")}</g:link></td>
					
						<td>${fieldValue(bean: planode_SaudeInstance, field: "tipo_plano")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${planode_SaudeInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
