<%@ page import="prognosticdata.Planode_Saude" %>



<div class="fieldcontain ${hasErrors(bean: planode_SaudeInstance, field: 'nome_empresa', 'error')} required">
	<label for="nome_empresa">
		<g:message code="planode_Saude.nome_empresa.label" default="Nomeempresa" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome_empresa" maxlength="100" required="" value="${planode_SaudeInstance?.nome_empresa}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: planode_SaudeInstance, field: 'tipo_plano', 'error')} required">
	<label for="tipo_plano">
		<g:message code="planode_Saude.tipo_plano.label" default="Tipoplano" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="tipo_plano" from="${prognosticdata.Tipo?.values()}" keys="${prognosticdata.Tipo.values()*.name()}" required="" value="${planode_SaudeInstance?.tipo_plano?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: planode_SaudeInstance, field: 'pacientes', 'error')} ">
	<label for="pacientes">
		<g:message code="planode_Saude.pacientes.label" default="Pacientes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${planode_SaudeInstance?.pacientes?}" var="p">
    <li><g:link controller="paciente" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="paciente" action="create" params="['planode_Saude.id': planode_SaudeInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'paciente.label', default: 'Paciente')])}</g:link>
</li>
</ul>


</div>

