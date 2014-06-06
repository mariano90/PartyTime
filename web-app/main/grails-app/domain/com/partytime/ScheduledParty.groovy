package com.partytime

class ScheduledParty {
	Set drinks = []
	User dj
	User barman

	static hasMany = [ drinks: Drink ]

	static constraints = {
	}
}
