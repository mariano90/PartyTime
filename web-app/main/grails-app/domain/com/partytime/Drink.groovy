package com.partytime

class Drink {
	String name
	Set components = []
	String preparation // A description of how you prepare this drink.

	static hasMany = [components: Component]

	static constraints = {
		name unique: true
		preparation blank: true, nullable: true
	}
	
	String toString(){
		return "${name}"
	}
}
