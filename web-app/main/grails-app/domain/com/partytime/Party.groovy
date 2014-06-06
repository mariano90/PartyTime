package com.partytime

class Party {
	User host
	Place place
	String description
	Date startDateTime
	Date finsishDateTime
	Set guests = []
	// TODO: maybe split into confirmed, pending and not-going

	static hasMany = [guests: User]

	static constraints = {
		host nullable: false
		place nullable: false
		startDateTime nullable: false
		finsishDateTime nullable: false
	}
}
