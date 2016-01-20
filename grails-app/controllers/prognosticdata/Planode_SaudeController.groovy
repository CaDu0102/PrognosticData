package prognosticdata



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class Planode_SaudeController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Planode_Saude.list(params), model:[planode_SaudeInstanceCount: Planode_Saude.count()]
    }

    def show(Planode_Saude planode_SaudeInstance) {
        respond planode_SaudeInstance
    }

    def create() {
        respond new Planode_Saude(params)
    }

    @Transactional
    def save(Planode_Saude planode_SaudeInstance) {
        if (planode_SaudeInstance == null) {
            notFound()
            return
        }

        if (planode_SaudeInstance.hasErrors()) {
            respond planode_SaudeInstance.errors, view:'create'
            return
        }

        planode_SaudeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'planode_Saude.label', default: 'Planode_Saude'), planode_SaudeInstance.id])
                redirect planode_SaudeInstance
            }
            '*' { respond planode_SaudeInstance, [status: CREATED] }
        }
    }

    def edit(Planode_Saude planode_SaudeInstance) {
        respond planode_SaudeInstance
    }

    @Transactional
    def update(Planode_Saude planode_SaudeInstance) {
        if (planode_SaudeInstance == null) {
            notFound()
            return
        }

        if (planode_SaudeInstance.hasErrors()) {
            respond planode_SaudeInstance.errors, view:'edit'
            return
        }

        planode_SaudeInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Planode_Saude.label', default: 'Planode_Saude'), planode_SaudeInstance.id])
                redirect planode_SaudeInstance
            }
            '*'{ respond planode_SaudeInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Planode_Saude planode_SaudeInstance) {

        if (planode_SaudeInstance == null) {
            notFound()
            return
        }

        planode_SaudeInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Planode_Saude.label', default: 'Planode_Saude'), planode_SaudeInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'planode_Saude.label', default: 'Planode_Saude'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
