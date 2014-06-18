package com.partytime

class ScheduledParty extends Party {
	Set drinks = []
	User dj
	User barman

	static hasMany = [ drinks: Drink ]

	static constraints = {
		drinks nullable: true
		dj nullable: true
		barman nullable: true
	}

	String toString(){
		return "ScheduledParty ${host} el ${startDate} (${dj} ${barman})"
	}
}
