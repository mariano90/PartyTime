package com.partytime

class Party {
    User host
	Place place
	String description
    Date startDateTime
	Date finsishDateTime
    List<User> guests
    // TODO: maybe split into confirmed, pending and not-going

    static constraints = {
        host nullable: false
		place nullable: false
		startDateTime nullable: false
		finsishDateTime nullable: false, min: startDateTime
    }
}
