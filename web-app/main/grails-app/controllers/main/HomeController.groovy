package main

import com.partytime.User

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
		render view:"home.gsp"
	}
	
	def login() {
		if (authenticationService.isLoggedIn(request)) {
			redirect controller:"home", action:"index"
			return
		}
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
