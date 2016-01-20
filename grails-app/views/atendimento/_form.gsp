<%@ page import="prognosticdata.Atendimento" %>



<div class="fieldcontain ${hasErrors(bean: atendimentoInstance, field: 'data', 'error')} required">
	<label for="data">
		<g:message code="atendimento.data.label" default="Data" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="data" precision="day"  value="${atendimentoInstance?.data}"  />

</div>

