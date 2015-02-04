package com.partytime



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import com.partytime.User

@Transactional(readOnly = true)
class PartyController {

	def authenticationService
	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	/**
	 * Shows the list of the parties where the logged user is host.
	 */
	def mine(Integer max) {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())
		params.max = Math.min(max ?: 10, 100)
		User myself = User.getMyUser()
		def content = Party.findAllByHost(myself)
		respond content
	}
	
	/**
	 * Shows the list of the parties where the logged user is invited.
	 */
	def invited(Integer max) {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())

		User myself = User.getMyUser()
		def allParties = Party.list()
		def partiesImInvitedTo = []
		for (Party p in allParties) {
			def guests = p.getGuestsInvited()
			if (guests.contains(myself)) {
				partiesImInvitedTo.add(p)
			}
		} 
		respond partiesImInvitedTo
	}

	/**
	 * Allows the user to create a new party. It's not the same as the method
	 * create were the admin is the only one that can use it.
	 */
	def organize() {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())
	}

	/**
	 * Is executed when the user does hit the button for saving an instance of a party.
	 */
	def organizeNew(Party partyInstance) {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())
		// TODO not empty
		String title = params.partyTitle
		String description = params.partyDescription
		// TODO render Bars in textfield and autocmolpete feature
		// TODO Doublecheckear que Bar exista
		Bar bar = Bar.findByName("Groove")
		Date startDate = new Date()
		// TODO Checkear Start < Finish
		Date finishDate = new Date()
		// TODO Checkear que no tenga otras fiestas en esos dias, mostrar warning.
		User host = User.getMyUser()
		
		// TODO check errors
		
		Party newParty = new Party()
		newParty.setTitle(title)
		newParty.setDescription(description)
		newParty.setPlace(bar)
		newParty.setStartDateTime(startDate)
		newParty.setFinsishDateTime(finishDate)
		newParty.setHost(host)

		newParty.save flush:true
		redirect(controller:"party",action:"mine")
	}
	
	/**
	 * Shows details about a party.
	 */
	def details(Party partyInstance) {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User myself = User.getMyUser()
		if (partyInstance.getHost() == myself) {
			respond partyInstance
		} else if (partyInstance.isInvited(myself)) {
			respond partyInstance
		} else {
			redirect controller:"home", action:"forbidden"
		}
	}

	def accept(Party partyInstance) {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User myself = User.getMyUser()
		// TODO: check user in invited list
		partyInstance.markAccepted(myself)
		partyInstance.save(flush:true, failOnError: true)
		redirect controller:"party", action:"details", id: partyInstance.id
	}
	
	def reject(Party partyInstance) {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User myself = User.getMyUser()
		// TODO: check user in invited list
		partyInstance.markRejected(myself)
		partyInstance.save(flush:true, failOnError: true)
		redirect controller:"party", action:"details", id: partyInstance.id
	}
	
	def debug(Party partyInstance) {
		render partyInstance.guestsInvited
		render "<br/>"
		render partyInstance.guestsConfirmed
		render "<br/>"
		render partyInstance.guestsNotGoing
	}
	
	/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
	/* * *                  Methods used for maintenance                 * * */

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Party.list(params), model:[partyInstanceCount: Party.count()]
	}

	def show(Party partyInstance) {
		respond partyInstance
	}

	def create() {
		respond new Party(params)
	}

	@Transactional
	def save(Party partyInstance) {
		if (partyInstance == null) {
			notFound()
			return
		}
		if (partyInstance.hasErrors()) {
			respond partyInstance.errors, view:'create'
			return
		}
		partyInstance.save flush:true
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'party.label', default: 'Party'),
					partyInstance.id
				])
				redirect partyInstance
			}
			'*' { respond partyInstance, [status: CREATED] }
		}
	}

	def edit(Party partyInstance) {
		respond partyInstance
	}

	@Transactional
	def update(Party partyInstance) {
		if (partyInstance == null) {
			notFound()
			return
		}
		if (partyInstance.hasErrors()) {
			respond partyInstance.errors, view:'edit'
			return
		}
		partyInstance.save flush:true
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Party.label', default: 'Party'),
					partyInstance.id
				])
				redirect partyInstance
			}
			'*'{ respond partyInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Party partyInstance) {

		if (partyInstance == null) {
			notFound()
			return
		}

		partyInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Party.label', default: 'Party'),
					partyInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'party.label', default: 'Party'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
