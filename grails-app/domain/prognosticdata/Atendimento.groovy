package prognosticdata

class Atendimento {

    Date data

    static belongsTo = Paciente,Medico,Diagnostico

    static constraints = {

        data blank: false, nullable: false

    }
}
