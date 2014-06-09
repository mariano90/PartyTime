package com.partytime



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class QuickPartyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond QuickParty.list(params), model:[quickPartyInstanceCount: QuickParty.count()]
    }

    def show(QuickParty quickPartyInstance) {
        respond quickPartyInstance
    }

    def create() {
        respond new QuickParty(params)
    }

    @Transactional
    def save(QuickParty quickPartyInstance) {
        if (quickPartyInstance == null) {
            notFound()
            return
        }

        if (quickPartyInstance.hasErrors()) {
            respond quickPartyInstance.errors, view:'create'
            return
        }

        quickPartyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'quickParty.label', default: 'QuickParty'), quickPartyInstance.id])
                redirect quickPartyInstance
            }
            '*' { respond quickPartyInstance, [status: CREATED] }
        }
    }

    def edit(QuickParty quickPartyInstance) {
        respond quickPartyInstance
    }

    @Transactional
    def update(QuickParty quickPartyInstance) {
        if (quickPartyInstance == null) {
            notFound()
            return
        }

        if (quickPartyInstance.hasErrors()) {
            respond quickPartyInstance.errors, view:'edit'
            return
        }

        quickPartyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'QuickParty.label', default: 'QuickParty'), quickPartyInstance.id])
                redirect quickPartyInstance
            }
            '*'{ respond quickPartyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(QuickParty quickPartyInstance) {

        if (quickPartyInstance == null) {
            notFound()
            return
        }

        quickPartyInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'QuickParty.label', default: 'QuickParty'), quickPartyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'quickParty.label', default: 'QuickParty'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
