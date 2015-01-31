package com.partytime



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import com.partytime.User

@Transactional(readOnly = true)
class UserController {

	def authenticationService
	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	/**
	 * Allows the user to define his personal info.
	 */
	def settings(){
		if (!authenticationService.isLoggedIn(request)) {
			redirect action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())
		respond User.getMyUser()
	}
	
	/**
	 * Shows details about the selected user.
	 */
	def details(User userInstance) {
		if (!authenticationService.isLoggedIn(request)) {
			redirect action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())
		respond userInstance
	}
	
	/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
	/* * *                  Methods used for maintenance                 * * */

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond User.list(params), model:[userInstanceCount: User.count()]
	}

	def show(User userInstance) {
		respond userInstance
	}

	def create() {
		respond new User(params)
	}
	
	def addDrink() {
		User host = User.getMyUser()
		Drink drink = Drink.findByName(params.drinkSelected)
		host.preferedDrinks.add(drink)
		host.save flush:true
		redirect(controller:"drink",action:"mine")
	}

	@Transactional
	def save(User userInstance) {
		if (userInstance == null) {
			notFound()
			return
		}
		if (userInstance.hasErrors()) {
			respond userInstance.errors, view:'create'
			return
		}
		userInstance.save flush:true
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'user.label', default: 'User'),
					userInstance.id
				])
				redirect userInstance
			}
			'*' { respond userInstance, [status: CREATED] }
		}
	}

	def edit(User userInstance) {
		respond userInstance
	}

	@Transactional
	def update(User userInstance) {
		if (userInstance == null) {
			notFound()
			return
		}
		if (userInstance.hasErrors()) {
			respond userInstance.errors, view:'edit'
			return
		}
		userInstance.save flush:true
		redirect(controller:"home",action:"index")
	}

	@Transactional
	def delete(User userInstance) {
		if (userInstance == null) {
			notFound()
			return
		}
		userInstance.delete flush:true
		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'User.label', default: 'User'),
					userInstance.id
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
					message(code: 'user.label', default: 'User'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
