package com.partytime



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NightClubController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond NightClub.list(params), model:[nightClubInstanceCount: NightClub.count()]
    }

    def show(NightClub nightClubInstance) {
        respond nightClubInstance
    }

    def create() {
        respond new NightClub(params)
    }

    @Transactional
    def save(NightClub nightClubInstance) {
        if (nightClubInstance == null) {
            notFound()
            return
        }

        if (nightClubInstance.hasErrors()) {
            respond nightClubInstance.errors, view:'create'
            return
        }

        nightClubInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'nightClub.label', default: 'NightClub'), nightClubInstance.id])
                redirect nightClubInstance
            }
            '*' { respond nightClubInstance, [status: CREATED] }
        }
    }

    def edit(NightClub nightClubInstance) {
        respond nightClubInstance
    }

    @Transactional
    def update(NightClub nightClubInstance) {
        if (nightClubInstance == null) {
            notFound()
            return
        }

        if (nightClubInstance.hasErrors()) {
            respond nightClubInstance.errors, view:'edit'
            return
        }

        nightClubInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'NightClub.label', default: 'NightClub'), nightClubInstance.id])
                redirect nightClubInstance
            }
            '*'{ respond nightClubInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(NightClub nightClubInstance) {

        if (nightClubInstance == null) {
            notFound()
            return
        }

        nightClubInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'NightClub.label', default: 'NightClub'), nightClubInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'nightClub.label', default: 'NightClub'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
