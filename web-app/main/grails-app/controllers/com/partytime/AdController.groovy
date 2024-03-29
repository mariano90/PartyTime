package com.partytime



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class AdController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
	/* * *                  Methods used for maintenance                 * * */
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Ad.list(params), model:[adInstanceCount: Ad.count()]
    }

    def show(Ad adInstance) {
        respond adInstance
    }

    def create() {
        respond new Ad(params)
    }

    @Transactional
    def save(Ad adInstance) {
        if (adInstance == null) {
            notFound()
            return
        }

        if (adInstance.hasErrors()) {
            respond adInstance.errors, view:'create'
            return
        }

        adInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'ad.label', default: 'Ad'), adInstance.id])
                redirect adInstance
            }
            '*' { respond adInstance, [status: CREATED] }
        }
    }

    def edit(Ad adInstance) {
        respond adInstance
    }

    @Transactional
    def update(Ad adInstance) {
        if (adInstance == null) {
            notFound()
            return
        }

        if (adInstance.hasErrors()) {
            respond adInstance.errors, view:'edit'
            return
        }

        adInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Ad.label', default: 'Ad'), adInstance.id])
                redirect adInstance
            }
            '*'{ respond adInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Ad adInstance) {

        if (adInstance == null) {
            notFound()
            return
        }

        adInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Ad.label', default: 'Ad'), adInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'ad.label', default: 'Ad'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
