package com.partytime

class User {
	String name
	Date bornDate
	Set preferedMusicStyles = []
	Set preferedDrinks = []
	String mail

	static hasMany = [preferedMusicStyles: MusicStyle, preferedDrinks: Drink]

	static constraints = {
		name blank: false, nullable: false, unique: true
		mail blank: false, nullable: false, email: true
	}

	String toString(){
		return "${name}"
	}

	static getMyUser(){
		return User.findByName("mariano")
	}
}
