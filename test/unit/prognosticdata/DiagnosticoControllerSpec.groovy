package prognosticdata


import grails.test.mixin.*
import spock.lang.*

@TestFor(DiagnosticoController)
@Mock(Diagnostico)
class DiagnosticoControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when: "The index action is executed"
        controller.index()

        then: "The model is correct"
        !model.diagnosticoInstanceList
        model.diagnosticoInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when: "The create action is executed"
        controller.create()

        then: "The model is correctly created"
        model.diagnosticoInstance != null
    }

    void "Test the save action correctly persists an instance"() {

        when: "The save action is executed with an invalid instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'POST'
        def diagnostico = new Diagnostico()
        diagnostico.validate()
        controller.save(diagnostico)

        then: "The create view is rendered again with the correct model"
        model.diagnosticoInstance != null
        view == 'create'

        when: "The save action is executed with a valid instance"
        response.reset()
        populateValidParams(params)
        diagnostico = new Diagnostico(params)

        controller.save(diagnostico)

        then: "A redirect is issued to the show action"
        response.redirectedUrl == '/diagnostico/show/1'
        controller.flash.message != null
        Diagnostico.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when: "The show action is executed with a null domain"
        controller.show(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the show action"
        populateValidParams(params)
        def diagnostico = new Diagnostico(params)
        controller.show(diagnostico)

        then: "A model is populated containing the domain instance"
        model.diagnosticoInstance == diagnostico
    }

    void "Test that the edit action returns the correct model"() {
        when: "The edit action is executed with a null domain"
        controller.edit(null)

        then: "A 404 error is returned"
        response.status == 404

        when: "A domain instance is passed to the edit action"
        populateValidParams(params)
        def diagnostico = new Diagnostico(params)
        controller.edit(diagnostico)

        then: "A model is populated containing the domain instance"
        model.diagnosticoInstance == diagnostico
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when: "Update is called for a domain instance that doesn't exist"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'PUT'
        controller.update(null)

        then: "A 404 error is returned"
        response.redirectedUrl == '/diagnostico/index'
        flash.message != null


        when: "An invalid domain instance is passed to the update action"
        response.reset()
        def diagnostico = new Diagnostico()
        diagnostico.validate()
        controller.update(diagnostico)

        then: "The edit view is rendered again with the invalid instance"
        view == 'edit'
        model.diagnosticoInstance == diagnostico

        when: "A valid domain instance is passed to the update action"
        response.reset()
        populateValidParams(params)
        diagnostico = new Diagnostico(params).save(flush: true)
        controller.update(diagnostico)

        then: "A redirect is issues to the show action"
        response.redirectedUrl == "/diagnostico/show/$diagnostico.id"
        flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when: "The delete action is called for a null instance"
        request.contentType = FORM_CONTENT_TYPE
        request.method = 'DELETE'
        controller.delete(null)

        then: "A 404 is returned"
        response.redirectedUrl == '/diagnostico/index'
        flash.message != null

        when: "A domain instance is created"
        response.reset()
        populateValidParams(params)
        def diagnostico = new Diagnostico(params).save(flush: true)

        then: "It exists"
        Diagnostico.count() == 1

        when: "The domain instance is passed to the delete action"
        controller.delete(diagnostico)

        then: "The instance is deleted"
        Diagnostico.count() == 0
        response.redirectedUrl == '/diagnostico/index'
        flash.message != null
    }
}
