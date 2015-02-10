package com.partytime

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

import com.partytime.User

@Transactional(readOnly = true)
class PartyController {

	def authenticationService
	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
	
	/**
	 * Shows all parties the logged user is invited, this view is prepared for been
	 * displayed as an iframe.
	 */
	def embed(Integer max) {
		if (!authenticationService.isLoggedIn(request)) {
			render "Not logged in"
			return
		}
		User.sync(authenticationService.getUserPrincipal())

		User myself = User.getMyUser()
		Date today = new Date();
		// TODO: there is a functional programming way to do this.
		def allParties = Party.list()
		def partiesImInvitedTo = []
		for (Party p in allParties) {
			if (p.getStartDateTime().getTime() < today.getTime()){
				continue
			}
			def guests = p.getGuestsInvited()
			if (guests.contains(myself)) {
				partiesImInvitedTo.add(p)
			}
		}
		respond partiesImInvitedTo
	}

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
		Date today = new Date();
		def allParties = Party.findAllByHost(myself)
		def upcomingParties = []
		for (Party p in allParties) {
			if (p.getStartDateTime().getTime() < today.getTime()){
				continue
			}
			upcomingParties.add(p)
		}
		respond upcomingParties
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
		Date today = new Date();
		// TODO: there is a functional programming way to do this.
		def allParties = Party.list()
		def partiesImInvitedTo = []
		for (Party p in allParties) {
			if (p.getStartDateTime().getTime() < today.getTime()){
				continue
			}
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
		Bar bar = Bar.get(params.partyPlace)

		def startDate = new GregorianCalendar(params.partyStart_year.toInteger(),
			params.partyStart_month.toInteger() - 1,
			params.partyStart_day.toInteger(),
			0, 0, 0).time
		Date finishDate = new GregorianCalendar(params.partyEnd_year.toInteger(),
			params.partyEnd_month.toInteger() - 1,
			params.partyEnd_day.toInteger(),
			0, 0, 0).time

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
		// TODO Checkear que no tenga otras fiestas en esos dias, mostrar warning.
		// TODO mostrar link para action de invitar gente
		User myself = User.getMyUser()
		if (partyInstance.getHost() == myself) {
			respond partyInstance
		} else if (partyInstance.isInvited(myself)) {
			respond partyInstance
		} else {
			redirect controller:"home", action:"forbidden"
		}
	}

	/**
	 * Action of a user saying that is going to the party.
	 */
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
	
	/**
	 * Action of a user saying that is not going to the party.
	 */
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
	
	/**
	 * Shows a list of what to buy for the suggested drinks.
	 */
	def grocery(Party partyInstance) {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User myself = User.getMyUser()
		if (partyInstance.getHost() == myself) {
			respond partyInstance
		} else {
			redirect controller:"home", action:"forbidden"
		}
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
