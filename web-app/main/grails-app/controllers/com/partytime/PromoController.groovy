package com.partytime

class PromoController {
	
    static scaffold = true
	def authenticationService
	
	/**
	 * Shows the detail of a Promo.
	 */
	def details(Promo promoInstance) {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())
		respond promoInstance
	}
}
