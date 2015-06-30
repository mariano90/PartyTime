package com.partytime

import static org.springframework.http.HttpStatus.*

import java.util.Set;

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
		def partiesImInvitedTo = []
		
		partiesImInvitedTo = Party.findAllByStartDateTimeGreaterThanEquals(today).findAll{
			party -> myself in party.guestsInvited
		}
		
	
		respond partiesImInvitedTo.take(max)
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
		def upcomingParties = []
		upcomingParties = Party.findAllByStartDateTimeGreaterThanEqualsAndHost(today, myself)
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
		def partiesImInvitedTo = []
		
		partiesImInvitedTo = Party.findAllByStartDateTimeGreaterThanEquals(today).findAll{
			party -> myself in party.guestsInvited
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
		String title = params.partyTitle
		String description = params.partyDescription
		Bar bar = Bar.get(params.partyPlace)

		def startDate = new Date().parse("yyyy/MM/dd HH:mm:ss", params.partyStart + ":00")
		def finishDate = new Date().parse("yyyy/MM/dd HH:mm:ss", params.partyEnd + ":00")
		
		User host = User.getMyUser()

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
	 * Shows the user list to invite people to a party.
	 */
	def invite(Party partyInstance) {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())

		respond partyInstance
	}

	/**
	 * Executed when the user press the button to invite a user.
	 * @return
	 */
	@Transactional // TODO esto deberia ahorrarme los save.
	def doInvite() {
		Party partyInstance = Party.get(params.party)
		User guest = User.get(params.user)
		// TODO: check that the entities are not null.
		// TODO: check that user is not the currently logged user.
		// TODO: check that logged user is the host of the party.
		partyInstance.guestsInvited.add(guest)
		partyInstance.save flush: true
		// TODO: send notification to Google App Engine
		redirect(controller:"party", action:"invite", id:partyInstance.id)
	}

	/**
	 * Executed when the user press the button to remove a user from the guest list.
	 */
	def doRemove() {
		Party partyInstance = Party.get(params.party)
		User guest = User.get(params.user)
		// TODO: check that the entities are not null.
		// TODO: check that user is not the currently logged user.
		// TODO: check that logged user is the host of the party.
		partyInstance.guestsInvited.remove(guest)
		partyInstance.guestsConfirmed.remove(guest)
		partyInstance.guestsNotGoing.remove(guest)
		partyInstance.save flush: true
		redirect(controller:"party", action:"invite", id:partyInstance.id)
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
		new Party(params)
		redirect controller:"home", action:"index"
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
