package prognosticdata



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DiagnosticoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Diagnostico.list(params), model:[diagnosticoInstanceCount: Diagnostico.count()]
    }

    def show(Diagnostico diagnosticoInstance) {
        respond diagnosticoInstance
    }

    def create() {
        respond new Diagnostico(params)
    }

    @Transactional
    def save(Diagnostico diagnosticoInstance) {
        if (diagnosticoInstance == null) {
            notFound()
            return
        }

        if (diagnosticoInstance.hasErrors()) {
            respond diagnosticoInstance.errors, view:'create'
            return
        }

        diagnosticoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'diagnostico.label', default: 'Diagnostico'), diagnosticoInstance.id])
                redirect diagnosticoInstance
            }
            '*' { respond diagnosticoInstance, [status: CREATED] }
        }
    }

    def edit(Diagnostico diagnosticoInstance) {
        respond diagnosticoInstance
    }

    @Transactional
    def update(Diagnostico diagnosticoInstance) {
        if (diagnosticoInstance == null) {
            notFound()
            return
        }

        if (diagnosticoInstance.hasErrors()) {
            respond diagnosticoInstance.errors, view:'edit'
            return
        }

        diagnosticoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Diagnostico.label', default: 'Diagnostico'), diagnosticoInstance.id])
                redirect diagnosticoInstance
            }
            '*'{ respond diagnosticoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Diagnostico diagnosticoInstance) {

        if (diagnosticoInstance == null) {
            notFound()
            return
        }

        diagnosticoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Diagnostico.label', default: 'Diagnostico'), diagnosticoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'diagnostico.label', default: 'Diagnostico'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
