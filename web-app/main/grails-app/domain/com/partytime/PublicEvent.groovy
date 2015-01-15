package com.partytime

import java.util.Date;

class PublicEvent {
	String title
	String description
	String lineup
	int minimumAge
	Date startDateTime
	String externalUrl
	String address

	static constraints = {
		title blank: false, nullable: false
		description blank: true, nullable: true
		lineup blank: true, nullable: true
		startDateTime nullable: false
		externalUrl blank: true, nullable: true
		address blank: false, nullable: false
	}

	String toString(){
		return "${title}"
	}
}
