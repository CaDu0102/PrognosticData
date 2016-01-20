package prognosticdata

class Medico {

    String nome
    String matricula
    String crm
    Date data_admissao

    static belongsTo = [especialidade_medica:Especialidade_Medica]
    static hasMany = [atendimento:Atendimento]


    static constraints = {

         nome               maxSize:100, blank: false, nullable: false
         matricula          maxSize:20, blank: false, nullable: false
         crm                maxSize:20, blank: false, nullable: false
         data_admissao      blank: false, nullable: false

    }
}
