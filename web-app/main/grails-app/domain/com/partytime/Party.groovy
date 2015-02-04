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
	
	String getStatus() {
		User myself = User.getMyUser();
		if (this.guestsConfirmed.contains(myself)) {
			return "Going"
		} else if (this.guestsNotGoing.contains(myself)) {
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
