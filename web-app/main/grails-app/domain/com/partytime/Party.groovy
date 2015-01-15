package com.partytime

class Party {
	User host
	Bar place
	String title
	String description
	Date startDateTime
	Date finsishDateTime
	Set guests = []
	// TODO: maybe split into confirmed, pending and not-going

	static hasMany = [guests: User]

	static mapping = { tablePerHierarchy false }

	static constraints = {
		host nullable: false
		place nullable: false
		title blank:false, nullable: false
		startDateTime nullable: false
		finsishDateTime nullable: true
	}

	String toString(){
		return "${title} @ ${place} el ${startDateTime} por ${host}"
	}
}
