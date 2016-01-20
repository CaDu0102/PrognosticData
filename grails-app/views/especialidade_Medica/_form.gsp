<%@ page import="prognosticdata.Especialidade_Medica" %>



<div class="fieldcontain ${hasErrors(bean: especialidade_MedicaInstance, field: 'nome_especialidade', 'error')} required">
	<label for="nome_especialidade">
		<g:message code="especialidade_Medica.nome_especialidade.label" default="Nomeespecialidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome_especialidade" maxlength="100" required="" value="${especialidade_MedicaInstance?.nome_especialidade}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: especialidade_MedicaInstance, field: 'medico', 'error')} ">
	<label for="medico">
		<g:message code="especialidade_Medica.medico.label" default="Medico" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${especialidade_MedicaInstance?.medico?}" var="m">
    <li><g:link controller="medico" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="medico" action="create" params="['especialidade_Medica.id': especialidade_MedicaInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'medico.label', default: 'Medico')])}</g:link>
</li>
</ul>


</div>

