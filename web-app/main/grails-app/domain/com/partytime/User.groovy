package com.partytime

class User {
	String name
	Date bornDate
	Set preferedMusicStyles = []
	Set preferedDrinks = []

	static hasMany = [preferedMusicStyles: MusicStyle, preferedDrinks: Drink]

	static constraints = {
		name blank: false, nullable: false
	}
}
