package prognosticdata



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AtendimentoController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Atendimento.list(params), model:[atendimentoInstanceCount: Atendimento.count()]
    }

    def show(Atendimento atendimentoInstance) {
        respond atendimentoInstance
    }

    def create() {
        respond new Atendimento(params)
    }

    @Transactional
    def save(Atendimento atendimentoInstance) {
        if (atendimentoInstance == null) {
            notFound()
            return
        }

        if (atendimentoInstance.hasErrors()) {
            respond atendimentoInstance.errors, view:'create'
            return
        }

        atendimentoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'atendimento.label', default: 'Atendimento'), atendimentoInstance.id])
                redirect atendimentoInstance
            }
            '*' { respond atendimentoInstance, [status: CREATED] }
        }
    }

    def edit(Atendimento atendimentoInstance) {
        respond atendimentoInstance
    }

    @Transactional
    def update(Atendimento atendimentoInstance) {
        if (atendimentoInstance == null) {
            notFound()
            return
        }

        if (atendimentoInstance.hasErrors()) {
            respond atendimentoInstance.errors, view:'edit'
            return
        }

        atendimentoInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Atendimento.label', default: 'Atendimento'), atendimentoInstance.id])
                redirect atendimentoInstance
            }
            '*'{ respond atendimentoInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Atendimento atendimentoInstance) {

        if (atendimentoInstance == null) {
            notFound()
            return
        }

        atendimentoInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Atendimento.label', default: 'Atendimento'), atendimentoInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'atendimento.label', default: 'Atendimento'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
