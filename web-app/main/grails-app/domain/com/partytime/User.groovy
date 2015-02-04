package com.partytime

import com.grailsrocks.authentication.AuthenticationUser

class User {
	String name
	Date bornDate
	Set preferedMusicStyles = []
	Set preferedDrinks = []
	String mail

	static hasMany = [preferedMusicStyles: MusicStyle,
		preferedDrinks: Drink]

	static constraints = {
		name blank: false, nullable: false, unique: true
		mail blank: false, nullable: false, email: true
	}

	String toString(){
		return "${name}"
	}
	
	static sync(AuthenticationUser authUser) {
		String login = authUser.getLogin()
		if (!User.existsUser(login)) {
			String email = authUser.getEmail()
			User newUser = new User(name: login,
			  bornDate: new Date(),
			  mail: email).save(failOnError: true)
		}
		User.activeMyUser(login)
	}
	
	static activeLogin = ""

	static existsUser(String login){
		return User.findByName(login) != null
	}

	static activeMyUser(String login) {
		activeLogin = login
    }

	static getMyUser() {
		return User.findByName(activeLogin)
	}
}
