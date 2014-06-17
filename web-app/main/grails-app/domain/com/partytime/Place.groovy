package com.partytime

import java.util.Set;

//abstract class Place {
class Place {
	String name
	String openHours
	String promos
	Set reviews = []
	int minimumAge
	Set musicStyles = []

	String street
	int number
	String floor
	String apartment
	String city
	String province
	String country

	static constraints = {
		name blank: false, nullable: false, unique: true
		openHours blank: true, nullable: true
		street blank: false, nullable: false
		number blank: false, nullable: false
		floor blank: true, nullable: true
		apartment blank: true, nullable: true
		city blank: false, nullable: false
		province blank: true, nullable: true
		country blank: true, nullable: true
		promos blank: true, nullable: true
	}

	//static mapping = { tablePerHierarchy false }

	static hasMany = [ musicStyles: MusicStyle, reviews: Review]


	String toString(){
		return "${name} @ ${street} ${number}, ${city}"
	}
}
