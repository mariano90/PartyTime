package com.partytime

class MusicStyle {
	String name

	static constraints = {
		name(inList: [
			"Rock",
			"Electro",
			"Reggaeton",
			"Cumbia",
			"Under",
			"80's"
		])
	}

	String toString(){
		return "${name}"
	}
}
