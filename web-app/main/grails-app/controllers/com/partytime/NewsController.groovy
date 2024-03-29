package com.partytime

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NewsController {

	def authenticationService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	/**
	 * Shows the list of whole news.
	 */
	def all() {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())
		params.max = 100
		respond News.list(params), model:[newsInstanceCount: News.count()]
	}
	
	/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
	/* * *                  Methods used for maintenance                 * * */

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond News.list(params), model:[newsInstanceCount: News.count()]
    }

    def show(News newsInstance) {
        respond newsInstance
    }

    def create() {
        respond new News(params)
    }

    @Transactional
    def save(News newsInstance) {
        if (newsInstance == null) {
            notFound()
            return
        }

        if (newsInstance.hasErrors()) {
            respond newsInstance.errors, view:'create'
            return
        }

        newsInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'news.label', default: 'News'), newsInstance.id])
                redirect newsInstance
            }
            '*' { respond newsInstance, [status: CREATED] }
        }
    }

    def edit(News newsInstance) {
        respond newsInstance
    }

    @Transactional
    def update(News newsInstance) {
        if (newsInstance == null) {
            notFound()
            return
        }
        if (newsInstance.hasErrors()) {
            respond newsInstance.errors, view:'edit'
            return
        }
        newsInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'News.label', default: 'News'), newsInstance.id])
                redirect newsInstance
            }
            '*'{ respond newsInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(News newsInstance) {
        if (newsInstance == null) {
            notFound()
            return
        }
        newsInstance.delete flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'News.label', default: 'News'), newsInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'news.label', default: 'News'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
