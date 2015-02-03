package com.partytime

import com.partytime.User

class Party {
	User host
	Bar place
	String title
	String description
	Date startDateTime
	Date finsishDateTime
	Set guests = []

	static hasMany = [guests: User]

	static mapping = { tablePerHierarchy false }

	static constraints = {
		title blank:false, nullable: false
		description blank:true, nullable: true
		place nullable: true
		host nullable: false
		startDateTime nullable: false
		description blank:true, nullable: true
		finsishDateTime nullable: true
	}

	String toString(){
		return "${title} @ ${place} el ${startDateTime} por ${host}"
	}
	
	void sendInvitations() {
		for (User x in this.guests) {
			x.partiesInvited.add(this)
		}
	}
}
