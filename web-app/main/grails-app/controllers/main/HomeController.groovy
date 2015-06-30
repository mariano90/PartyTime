package main

import com.partytime.User
import com.partytime.PublicEvent

class HomeController {

	def authenticationService

	/**
	 * Homepage of the app, dashboard is shown with general info.
	 */
	def index() {
		if (!authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())
		Date today = new Date();
		def upcomingPublicEvents = []
		upcomingPublicEvents = PublicEvent.findAllByStartDateTimeGreaterThanEquals(today)
		respond upcomingPublicEvents
	}
	
	def login() {
		if (authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"index"
			return
		}
	}

	def forbidden() {
	}

	def loginError() {
	}
	
	def signup() {
		if (authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"index"
			return
		}
	}
	
	def about() {
	}
	
	def logout() {
	}
	
	def error() {
	}
}
