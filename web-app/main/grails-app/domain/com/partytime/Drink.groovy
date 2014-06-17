package com.partytime

class Drink {
	String name
	Set components = []
	String preparation // A description of how you prepare this drink.

	static hasMany = [components: Component]

	static constraints = {
	}
	
	String toString(){
		return "${name} (${components})"
	}
}
