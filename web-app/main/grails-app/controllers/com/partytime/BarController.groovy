package com.partytime

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import com.partytime.User
import com.partytime.MusicStyle

@Transactional(readOnly = true)
class BarController {
	
	def authenticationService
	static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	/**
	 * Feature for searching bars.
	 * @return
	 */
	def search() {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())
		params.max = 100
		respond Bar.list(params), model:[barInstanceCount: Bar.count()]
	}
	
	/**
	 * Shows details about a Bar.
	 */
	def details(Bar barInstance) {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())
		respond barInstance
	}

	def allMusicStyles() {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())
	}
	
	def musicStyle(MusicStyle musicStyleInstance) {
		respond musicStyleInstance
	}
	
	def removeFromFavorites(Bar barInstance) {
		User myself = User.getMyUser()
		if (myself.hasFavoritedBar(barInstance)) {
			myself.favoriteBars.remove(barInstance)
			myself.save flush:true
		}
		redirect controller:"bar", action:"details", id:barInstance.id
	}
	
	def addToFavorites(Bar barInstance) {
		User myself = User.getMyUser()
		if (!myself.hasFavoritedBar(barInstance)) {
			myself.favoriteBars.add(barInstance)
			myself.save flush:true
		}
		redirect controller:"bar", action:"details", id:barInstance.id
	}

	/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
	/* * *                  Methods used for maintenance                 * * */

	def index(Integer max) {
		params.max = Math.min(max ?: 10, 100)
		respond Bar.list(params), model:[barInstanceCount: Bar.count()]
	}

	def show(Bar barInstance) {
		respond barInstance
	}

	def create() {
		respond new Bar(params)
	}

	@Transactional
	def save(Bar barInstance) {
		if (barInstance == null) {
			notFound()
			return
		}

		if (barInstance.hasErrors()) {
			respond barInstance.errors, view:'create'
			return
		}

		barInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'bar.label', default: 'Bar'),
					barInstance.id
				])
				redirect barInstance
			}
			'*' { respond barInstance, [status: CREATED] }
		}
	}

	def edit(Bar barInstance) {
		respond barInstance
	}

	@Transactional
	def update(Bar barInstance) {
		if (barInstance == null) {
			notFound()
			return
		}

		if (barInstance.hasErrors()) {
			respond barInstance.errors, view:'edit'
			return
		}

		barInstance.save flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Bar.label', default: 'Bar'),
					barInstance.id
				])
				redirect barInstance
			}
			'*'{ respond barInstance, [status: OK] }
		}
	}

	@Transactional
	def delete(Bar barInstance) {

		if (barInstance == null) {
			notFound()
			return
		}

		barInstance.delete flush:true

		request.withFormat {
			form multipartForm {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Bar.label', default: 'Bar'),
					barInstance.id
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
					message(code: 'bar.label', default: 'Bar'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
