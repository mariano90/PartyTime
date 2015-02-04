package com.partytime

import com.partytime.User

class Party {
	User host
	Bar place
	String title
	String description
	Date startDateTime
	Date finsishDateTime
	Set guestsInvited = []
	Set guestsConfirmed = []
	Set guestsNotGoing = []

	static hasMany = [guestsInvited: User,
		guestsConfirmed: User,
		guestsNotGoing: User]

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
	
	boolean isInvited(User user) {
		return this.guestsInvited.contains(user)
	}
	
	String getStatus(User user) {
		if (this.guestsConfirmed.contains(user)) {
			return "Going"
		} else if (this.guestsNotGoing.contains(user)) {
			return "Not going"
		} else {
			return "Pending reply"
		}
	}

	void sendInvitations() {
//		for (User x in this.guestsInvited) {
//			x.partiesInvited.add(this)
//		}
	}
}
