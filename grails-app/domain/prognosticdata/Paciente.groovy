package prognosticdata

class Paciente {

    String nome
    String cpf
    Date data_nascimento
    char sexo
    String endereco
    String cidade
    Uf uf
    String telefone
    String email

    static hasMany = [atendimento:Atendimento]
    static belongsTo = [plano_saude2:Planode_Saude]

    static constraints = {

         nome               maxSize:100, blank: false, nullable: false
         cpf                maxSize:11, blank: false, nullable: false
         data_nascimento    blank: false, nullable: false
         sexo               maxSize:1, blank: false, nullable: false
         endereco           maxSize:100, blank: false, nullable: false
         cidade             maxSize:100, blank: false, nullable: false
         uf                 maxSize:2, blank: false, nullable: false
         telefone           maxSize:14, blank: false, nullable: false
         email              maxSize:60, blank: false, nullable: false

    }
}

enum Uf { // Siglas de Unidades Federativas
    AC, AL, AP, AM, BA, CE, DF, ES,
    GO, MA, MT, MS, MG, PR, PB, PA,
    PE, PI, RJ, RN, RS, RO, RR, SC,
    SE, SP, TO
}
