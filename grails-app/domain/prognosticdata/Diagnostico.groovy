package prognosticdata

class Diagnostico {

    String nome_doenca
    String sintomas
    String tratamento
    String causas
    String diagnostico
    String gravidade
    String complicacoes

    static hasMany = [atendiment:Atendimento]

    static constraints = {

         nome_doenca       maxSize:100, blank: false, nullable: false
         sintomas          maxSize:100, blank: false, nullable: false
         tratamento        maxSize:100, blank: false, nullable: false
         causas            maxSize:100, blank: false, nullable: false
         diagnostico       maxSize:100, blank: false, nullable: false
         gravidade         maxSize:100, blank: false, nullable: false
         complicacoes      maxSize:100, blank: false, nullable: false

    }
}
