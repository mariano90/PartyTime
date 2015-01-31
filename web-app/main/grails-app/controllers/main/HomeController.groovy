package main

import com.partytime.User

class HomeController {

	def authenticationService

	def index() {
		if (!authenticationService.isLoggedIn(request)) {
			redirect action:"login"
			return
		}
		User.sync(authenticationService.getUserPrincipal())
		render view:"home.gsp"
	}
	
	def login() {
	}
	
	def loginError() {
	}
	
	def signup() {
	}
	
	def about() {
	}
	
	def logout() {
	}
	
	def error() {
	}
}
