package com.partytime

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DrinkController {

	def authenticationService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

	/**
	 * Shows the list of favorite drinks of the current logged in user.
	 */
	def mine() {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())

		def myDrinks = User.getMyUser().getPreferedDrinks().sort{it.getName()}
		[myDrinks: myDrinks]
	}

	/**
	 * Removes a drink from the favorites of the user.
	 */
	def remove(Drink drinkInstance) {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())

		User myself = User.getMyUser()
		myself.preferedDrinks.remove(drinkInstance)
		myself.save flush:true
		redirect controller: "drink", action: "mine"
	}

	/**
	 * Shows the details of a drink, in order for users to learn how to prepare it.
	 */
	def details(Drink drinkInstance) {
		respond drinkInstance
	}
	
	/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
	/* * *                  Methods used for maintenance                 * * */

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Drink.list(params), model:[drinkInstanceCount: Drink.count()]
    }

    def show(Drink drinkInstance) {
        respond drinkInstance
    }

    def create() {
        respond new Drink(params)
    }
	
    @Transactional
    def save(Drink drinkInstance) {
        if (drinkInstance == null) {
            notFound()
            return
        }
        if (drinkInstance.hasErrors()) {
            respond drinkInstance.errors, view:'create'
            return
        }
        drinkInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'drink.label', default: 'Drink'), drinkInstance.id])
                redirect drinkInstance
            }
            '*' { respond drinkInstance, [status: CREATED] }
        }
    }

    def edit(Drink drinkInstance) {
        respond drinkInstance
    }

    @Transactional
    def update(Drink drinkInstance) {
        if (drinkInstance == null) {
            notFound()
            return
        }
        if (drinkInstance.hasErrors()) {
            respond drinkInstance.errors, view:'edit'
            return
        }
        drinkInstance.save flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Drink.label', default: 'Drink'), drinkInstance.id])
                redirect drinkInstance
            }
            '*'{ respond drinkInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Drink drinkInstance) {
        if (drinkInstance == null) {
            notFound()
            return
        }
        drinkInstance.delete flush:true
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Drink.label', default: 'Drink'), drinkInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'drink.label', default: 'Drink'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
