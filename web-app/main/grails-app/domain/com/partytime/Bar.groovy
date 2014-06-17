package com.partytime

class Bar extends Place{
	String name
	String openHours
	String promos
	Set reviews = []
	Set musicStyles = []
	int minimumAge

	static hasMany = [ musicStyles: MusicStyle, reviews: Review]

	static constraints = {
	}
	
	String toString(){
		return "${name} Bar"
	}
}
