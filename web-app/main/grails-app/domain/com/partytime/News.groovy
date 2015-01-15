package com.partytime

class News {
	String title
	String description
	String date
	String imageUrl

	static constraints = {
		title blank: false, nullable: false
		description blank: false, nullable: false
		imageUrl blank: false, nullable: false
	}

	String toString(){
		return "${title}"
	}
}
