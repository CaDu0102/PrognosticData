package prognosticdata

class Usuario {

    String nome
    String usuario
    String senha
    Cargo cargo

    static constraints = {

         nome      maxSize:20, blank: false, nullable: false
         usuario   maxSize:20, blank: false, nullable: false
         senha     maxSize:20, blank: false, nullable: false
         cargo     maxSize:20, blank: false, nullable: false

    }
}

enum Cargo {

    Atendente,Medico,Enfermeiro

}