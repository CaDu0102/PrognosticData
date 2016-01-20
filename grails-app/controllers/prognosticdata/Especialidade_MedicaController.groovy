package prognosticdata



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Especialidade_MedicaController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Especialidade_Medica.list(params), model:[especialidade_MedicaInstanceCount: Especialidade_Medica.count()]
    }

    def show(Especialidade_Medica especialidade_MedicaInstance) {
        respond especialidade_MedicaInstance
    }

    def create() {
        respond new Especialidade_Medica(params)
    }

    @Transactional
    def save(Especialidade_Medica especialidade_MedicaInstance) {
        if (especialidade_MedicaInstance == null) {
            notFound()
            return
        }

        if (especialidade_MedicaInstance.hasErrors()) {
            respond especialidade_MedicaInstance.errors, view:'create'
            return
        }

        especialidade_MedicaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'especialidade_Medica.label', default: 'Especialidade_Medica'), especialidade_MedicaInstance.id])
                redirect especialidade_MedicaInstance
            }
            '*' { respond especialidade_MedicaInstance, [status: CREATED] }
        }
    }

    def edit(Especialidade_Medica especialidade_MedicaInstance) {
        respond especialidade_MedicaInstance
    }

    @Transactional
    def update(Especialidade_Medica especialidade_MedicaInstance) {
        if (especialidade_MedicaInstance == null) {
            notFound()
            return
        }

        if (especialidade_MedicaInstance.hasErrors()) {
            respond especialidade_MedicaInstance.errors, view:'edit'
            return
        }

        especialidade_MedicaInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Especialidade_Medica.label', default: 'Especialidade_Medica'), especialidade_MedicaInstance.id])
                redirect especialidade_MedicaInstance
            }
            '*'{ respond especialidade_MedicaInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Especialidade_Medica especialidade_MedicaInstance) {

        if (especialidade_MedicaInstance == null) {
            notFound()
            return
        }

        especialidade_MedicaInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Especialidade_Medica.label', default: 'Especialidade_Medica'), especialidade_MedicaInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'especialidade_Medica.label', default: 'Especialidade_Medica'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
