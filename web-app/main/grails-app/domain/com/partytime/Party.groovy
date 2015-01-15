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
		title blank:false, nullable: false
		place nullable: true
		host nullable: false
		startDateTime nullable: false
		description blank:true, nullable: true
		finsishDateTime nullable: true
	}

	String toString(){
		return "${title} @ ${place} el ${startDateTime} por ${host}"
	}
}
