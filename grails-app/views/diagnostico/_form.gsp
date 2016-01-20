<%@ page import="prognosticdata.Diagnostico" %>



<div class="fieldcontain ${hasErrors(bean: diagnosticoInstance, field: 'nome_doenca', 'error')} required">
	<label for="nome_doenca">
		<g:message code="diagnostico.nome_doenca.label" default="Nomedoenca" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nome_doenca" maxlength="100" required="" value="${diagnosticoInstance?.nome_doenca}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diagnosticoInstance, field: 'sintomas', 'error')} required">
	<label for="sintomas">
		<g:message code="diagnostico.sintomas.label" default="Sintomas" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sintomas" maxlength="100" required="" value="${diagnosticoInstance?.sintomas}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diagnosticoInstance, field: 'tratamento', 'error')} required">
	<label for="tratamento">
		<g:message code="diagnostico.tratamento.label" default="Tratamento" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tratamento" maxlength="100" required="" value="${diagnosticoInstance?.tratamento}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diagnosticoInstance, field: 'causas', 'error')} required">
	<label for="causas">
		<g:message code="diagnostico.causas.label" default="Causas" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="causas" maxlength="100" required="" value="${diagnosticoInstance?.causas}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diagnosticoInstance, field: 'diagnostico', 'error')} required">
	<label for="diagnostico">
		<g:message code="diagnostico.diagnostico.label" default="Diagnostico" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="diagnostico" maxlength="100" required="" value="${diagnosticoInstance?.diagnostico}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diagnosticoInstance, field: 'gravidade', 'error')} required">
	<label for="gravidade">
		<g:message code="diagnostico.gravidade.label" default="Gravidade" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="gravidade" maxlength="100" required="" value="${diagnosticoInstance?.gravidade}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diagnosticoInstance, field: 'complicacoes', 'error')} required">
	<label for="complicacoes">
		<g:message code="diagnostico.complicacoes.label" default="Complicacoes" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="complicacoes" maxlength="100" required="" value="${diagnosticoInstance?.complicacoes}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: diagnosticoInstance, field: 'atendiment', 'error')} ">
	<label for="atendiment">
		<g:message code="diagnostico.atendiment.label" default="Atendiment" />
		
	</label>
	<g:select name="atendiment" from="${prognosticdata.Atendimento.list()}" multiple="multiple" optionKey="id" size="5" value="${diagnosticoInstance?.atendiment*.id}" class="many-to-many"/>

</div>

