package com.partytime



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ScheduledPartyController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ScheduledParty.list(params), model:[scheduledPartyInstanceCount: ScheduledParty.count()]
    }

    def show(ScheduledParty scheduledPartyInstance) {
        respond scheduledPartyInstance
    }

    def create() {
        respond new ScheduledParty(params)
    }

    @Transactional
    def save(ScheduledParty scheduledPartyInstance) {
        if (scheduledPartyInstance == null) {
            notFound()
            return
        }

        if (scheduledPartyInstance.hasErrors()) {
            respond scheduledPartyInstance.errors, view:'create'
            return
        }

        scheduledPartyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'scheduledParty.label', default: 'ScheduledParty'), scheduledPartyInstance.id])
                redirect scheduledPartyInstance
            }
            '*' { respond scheduledPartyInstance, [status: CREATED] }
        }
    }

    def edit(ScheduledParty scheduledPartyInstance) {
        respond scheduledPartyInstance
    }

    @Transactional
    def update(ScheduledParty scheduledPartyInstance) {
        if (scheduledPartyInstance == null) {
            notFound()
            return
        }

        if (scheduledPartyInstance.hasErrors()) {
            respond scheduledPartyInstance.errors, view:'edit'
            return
        }

        scheduledPartyInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ScheduledParty.label', default: 'ScheduledParty'), scheduledPartyInstance.id])
                redirect scheduledPartyInstance
            }
            '*'{ respond scheduledPartyInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ScheduledParty scheduledPartyInstance) {

        if (scheduledPartyInstance == null) {
            notFound()
            return
        }

        scheduledPartyInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ScheduledParty.label', default: 'ScheduledParty'), scheduledPartyInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'scheduledParty.label', default: 'ScheduledParty'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
