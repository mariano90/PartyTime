package main

class HomeController {

	def authenticationService

	def index() {
//		if (!authenticationService.isLoggedIn(request)) {
//			redirect(controller:"authentication", action:"index")
//		}
		render view:"home.gsp"
	}
	
	def login() {
	}
	
	def signup() {
	}
	
	def about() {
	}
}
