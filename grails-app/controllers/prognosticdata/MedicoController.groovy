package prognosticdata



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MedicoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Medico.list(params), model:[medicoInstanceCount: Medico.count()]
    }

    def show(Medico medicoInstance) {
        respond medicoInstance
    }

    def create() {
        respond new Medico(params)
    }

    @Transactional
    def save(Medico medicoInstance) {
        if (medicoInstance == null) {
            notFound()
            return
        }

        if (medicoInstance.hasErrors()) {
            respond medicoInstance.errors, view:'create'
            return
        }

        medicoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'medico.label', default: 'Medico'), medicoInstance.id])
                redirect medicoInstance
            }
            '*' { respond medicoInstance, [status: CREATED] }
        }
    }

    def edit(Medico medicoInstance) {
        respond medicoInstance
    }

    @Transactional
    def update(Medico medicoInstance) {
        if (medicoInstance == null) {
            notFound()
            return
        }

        if (medicoInstance.hasErrors()) {
            respond medicoInstance.errors, view:'edit'
            return
        }

        medicoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Medico.label', default: 'Medico'), medicoInstance.id])
                redirect medicoInstance
            }
            '*'{ respond medicoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Medico medicoInstance) {

        if (medicoInstance == null) {
            notFound()
            return
        }

        medicoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Medico.label', default: 'Medico'), medicoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'medico.label', default: 'Medico'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
