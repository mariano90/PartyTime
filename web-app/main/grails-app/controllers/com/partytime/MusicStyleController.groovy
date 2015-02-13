package com.partytime

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MusicStyleController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
	/* * *                  Methods used for maintenance                 * * */

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MusicStyle.list(params), model:[musicStyleInstanceCount: MusicStyle.count()]
    }

    def show(MusicStyle musicStyleInstance) {
        respond musicStyleInstance
    }

    def create() {
        respond new MusicStyle(params)
    }

    @Transactional
    def save(MusicStyle musicStyleInstance) {
        if (musicStyleInstance == null) {
            notFound()
            return
        }

        if (musicStyleInstance.hasErrors()) {
            respond musicStyleInstance.errors, view:'create'
            return
        }

        musicStyleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'musicStyle.label', default: 'MusicStyle'), musicStyleInstance.id])
                redirect musicStyleInstance
            }
            '*' { respond musicStyleInstance, [status: CREATED] }
        }
    }

    def edit(MusicStyle musicStyleInstance) {
        respond musicStyleInstance
    }

    @Transactional
    def update(MusicStyle musicStyleInstance) {
        if (musicStyleInstance == null) {
            notFound()
            return
        }

        if (musicStyleInstance.hasErrors()) {
            respond musicStyleInstance.errors, view:'edit'
            return
        }

        musicStyleInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MusicStyle.label', default: 'MusicStyle'), musicStyleInstance.id])
                redirect musicStyleInstance
            }
            '*'{ respond musicStyleInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MusicStyle musicStyleInstance) {

        if (musicStyleInstance == null) {
            notFound()
            return
        }

        musicStyleInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MusicStyle.label', default: 'MusicStyle'), musicStyleInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'musicStyle.label', default: 'MusicStyle'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
