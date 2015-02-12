package com.partytime

import com.grailsrocks.authentication.AuthenticationUser

class User {
	String name
	String displayName
	Date bornDate
	String gender
	Set preferedMusicStyles = []
	Set preferedDrinks = []
	String mail
	Set favoriteBars = []

	static hasMany = [preferedMusicStyles: MusicStyle,
		preferedDrinks: Drink,
		favoriteBars: Bar]

	static constraints = {
		name blank: false, nullable: false, unique: true
		displayName blank: true, nullable: true
		mail blank: false, nullable: false, email: true
		gender blank: true, nullable: true
	}

	String toString(){
		return displayName ? displayName : name
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
	
	boolean hasFavoritedBar(Bar bar) {
		return this.favoriteBars.contains(bar);
	}
	
	String getProfilePicture() {
		return this.name + ".jpg"
	}
	
	int getAge() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(this.bornDate);
		int bornYear = cal.get(Calendar.YEAR);
		cal.setTime(new Date());
		int currentYear = cal.get(Calendar.YEAR); 
		return currentYear - bornYear
	}
}
