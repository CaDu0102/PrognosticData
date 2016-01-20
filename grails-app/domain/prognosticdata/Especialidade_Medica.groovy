package prognosticdata

class Especialidade_Medica {

    String nome_especialidade

    static hasMany = [medico:Medico]

    static constraints = {

         nome_especialidade     maxSize:100, blank: false, nullable: false

    }
}
