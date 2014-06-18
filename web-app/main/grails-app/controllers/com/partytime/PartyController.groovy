package com.partytime

class PartyController {

	def index() {
	}

	def create() {
		render "new party was saved"
	}

	def all() {
		user = User.findByName("Fabricio")
		render user
	}
}
