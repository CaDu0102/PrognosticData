<%@ page import="prognosticdata.Medico" %>



<div class="fieldcontain ${hasErrors(bean: medicoInstance, field: 'nome', 'error')} required">
	<label for="nome">
		<g:message code="medico.nome.label" default="Nome" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome" maxlength="100" required="" value="${medicoInstance?.nome}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: medicoInstance, field: 'matricula', 'error')} required">
	<label for="matricula">
		<g:message code="medico.matricula.label" default="Matricula" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="matricula" maxlength="20" required="" value="${medicoInstance?.matricula}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: medicoInstance, field: 'crm', 'error')} required">
	<label for="crm">
		<g:message code="medico.crm.label" default="Crm" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="crm" maxlength="20" required="" value="${medicoInstance?.crm}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: medicoInstance, field: 'data_admissao', 'error')} required">
	<label for="data_admissao">
		<g:message code="medico.data_admissao.label" default="Dataadmissao" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data_admissao" precision="day"  value="${medicoInstance?.data_admissao}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: medicoInstance, field: 'atendimento', 'error')} ">
	<label for="atendimento">
		<g:message code="medico.atendimento.label" default="Atendimento" />
		
	</label>
	<g:select name="atendimento" from="${prognosticdata.Atendimento.list()}" multiple="multiple" optionKey="id" size="5" value="${medicoInstance?.atendimento*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: medicoInstance, field: 'especialidade_medica', 'error')} required">
	<label for="especialidade_medica">
		<g:message code="medico.especialidade_medica.label" default="Especialidademedica" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="especialidade_medica" name="especialidade_medica.id" from="${prognosticdata.Especialidade_Medica.list()}" optionKey="id" required="" value="${medicoInstance?.especialidade_medica?.id}" class="many-to-one"/>

</div>

