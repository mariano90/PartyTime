package com.partytime



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class PublicEventController {

	def authenticationService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	/**
	 * Shows all available Public event, this view is prepared for been
	 * displayed as an iframe.
	 */
	def embed(Integer max) {
		if (!authenticationService.isLoggedIn(request)) {
			render "Not logged in"
			return
		}
		User.sync(authenticationService.getUserPrincipal())

		params.max = Math.min(max ?: 10, 100)
		Date today = new Date();
		def upcomingPublicEvents = []
		upcomingPublicEvents = PublicEvent.findAllByStartDateTimeGreaterThanEquals(today)
		respond upcomingPublicEvents
	}
	
	/**
	 * Shows all available public events.
	 */
	def all(Integer max) {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())

		params.max = Math.min(max ?: 10, 100)
		Date today = new Date();
		def upcomingPublicEvents = []
		upcomingPublicEvents = PublicEvent.findAllByStartDateTimeGreaterThanEquals(today)
		respond upcomingPublicEvents
	}
	
	/**
	 * Shows the detail of a Public Event.
	 */
	def details(PublicEvent publicEventInstance) {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())
		respond publicEventInstance
	}
	
	/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
	/* * *                  Methods used for maintenance                 * * */
	
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond PublicEvent.list(params), model:[publicEventInstanceCount: PublicEvent.count()]
    }

    def show(PublicEvent publicEventInstance) {
        respond publicEventInstance
    }

    def create() {
        respond new PublicEvent(params)
    }

    @Transactional
    def save(PublicEvent publicEventInstance) {
        if (publicEventInstance == null) {
            notFound()
            return
        }

        if (publicEventInstance.hasErrors()) {
            respond publicEventInstance.errors, view:'create'
            return
        }

        publicEventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'publicEvent.label', default: 'PublicEvent'), publicEventInstance.id])
                redirect publicEventInstance
            }
            '*' { respond publicEventInstance, [status: CREATED] }
        }
    }

    def edit(PublicEvent publicEventInstance) {
        respond publicEventInstance
    }

    @Transactional
    def update(PublicEvent publicEventInstance) {
        if (publicEventInstance == null) {
            notFound()
            return
        }

        if (publicEventInstance.hasErrors()) {
            respond publicEventInstance.errors, view:'edit'
            return
        }

        publicEventInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'PublicEvent.label', default: 'PublicEvent'), publicEventInstance.id])
                redirect publicEventInstance
            }
            '*'{ respond publicEventInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(PublicEvent publicEventInstance) {

        if (publicEventInstance == null) {
            notFound()
            return
        }

        publicEventInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'PublicEvent.label', default: 'PublicEvent'), publicEventInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'publicEvent.label', default: 'PublicEvent'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
