package com.partytime

class News {
	String title
	String description
	Date date
	String imageUrl

	static constraints = {
		title blank: false, nullable: false
		description blank: false, nullable: false
		date blank: false, nullable: false
		imageUrl blank: true, nullable: true
	}

	String toString(){
		return "${title}"
	}
}
