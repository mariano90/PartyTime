package main

import com.partytime.User
import com.grailsrocks.authentication.AuthenticationUser

class HomeController {

	def authenticationService

	def index() {
		if (!authenticationService.isLoggedIn(request)) {
			redirect action:"login"
			return
		}
		AuthenticationUser authUser = authenticationService.getUserPrincipal()
		String login = authUser.getLogin()
		if (!User.existsUser(login)) {
			String email = authUser.getEmail()
			User newUser = new User(name: login,
			  bornDate: new Date(),
			  mail: email).save(failOnError: true)
		}
		User.activeMyUser(login)
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
